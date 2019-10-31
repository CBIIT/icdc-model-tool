import sys
import os
import option_merge as om
import yaml
from jsonschema import validate, ValidationError, SchemaError, RefResolutionError
from jsonschema import Draft6Validator as d6
from yaml.parser import ParserError
from yaml.constructor import ConstructorError
from yaml.nodes import MappingNode
# from pdb import set_trace
def construct_mapping(self, node, deep=False):
  if not isinstance(node, MappingNode):
    raise ConstructorError(None, None,
                             "expected a mapping node, but found %s" % node.id,
                             node.start_mark)
  mapping = {}

  for key_node, value_node in node.value:
    key = self.construct_object(key_node, deep=deep)
    try:
      hash(key)
    except TypeError, exc:
      raise ConstructorError("while constructing a mapping", node.start_mark,
                               "found unacceptable key (%s)" % exc, key_node.start_mark)
    value = self.construct_object(value_node, deep=deep)
    if key in mapping:
      raise ConstructorError("while constructing a mapping", node.start_mark,
                              "found duplicated key (%s)" % key, key_node.start_mark)
    mapping[key] = value
  return mapping

class MDFValidator:
  def __init__(self, sch_filename="mdf-schema.yaml", *inst_filenames):
    self.schema = None
    self.instance = om.MergedOptions()
    self.sch_filename = sch_filename
    self.inst_filenames = inst_filenames
    self.yloader = yaml.loader.Loader
    self.yaml_valid = False
    self.yloader.construct_mapping = construct_mapping # monkey patch to detect dup keys

  def yaml_validate(self):
    print "Checking schema YAML ====="
    try:
      sch_file = open(self.sch_filename,"r")
    except IOError:
      raise
    try:
      self.schema = yaml.load(sch_file, Loader=self.yloader)
    except ConstructorError as ce:
      print "YAML error in '{fn}':\n{e}".format(fn=self.sch_filename,e=ce)
      return ce
    except ParserError as e:
      print "YAML error in '{fn}':\n{e}".format(fn=self.sch_filename,e=e)
      return e
    except Exception:
      raise

    if (self.inst_filenames):
      print "Checking instance YAML ====="
      for inst_filename in self.inst_filenames:
        try:
          inst_file = open(inst_filename,"r")
        except IOError as e:
          print "Can't open '{fn}' ({e}), skipping".format(fn=inst_filename,e=e)
        try:
          inst_yaml=yaml.load(inst_file, Loader=self.yloader)
          self.instance.update(inst_yaml)
        except ConstructorError as ce:
          print "YAML error in '{fn}':\n{e}".format(fn=inst_filename,e=ce)
          return ce
        except ParserError as e:
          print "YAML error in '{fn}':\n{e}".format(fn=inst_filename,e=e)
          return e
        except Exception:
          raise
    self.yaml_valid = True
    return None
    
  def schema_validate(self):
    if not self.yaml_valid:
      print "YAML invalid - not checking schema"
      return "YAMLInvalid"
    print "Checking JSON schema ====="
    try:
      d6.check_schema(self.schema)
    except SchemaError as se:
      print se
      return se
    if (self.instance):
      print "Checking instance against schema ====="
      try:
        validate(instance=self.instance.as_dict(), schema=self.schema)
      except ConstructorError as ce:
        print ce
        return ce
      except RefResolutionError as re:
        print re
        return re
      except ValidationError as ve:
        for e in d6(self.schema).iter_errors(self.instance.as_dict()):
          print e;
        return ve
    return None

