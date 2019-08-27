import sys
import os
import option_merge as om
from jsonschema import validate, ValidationError, SchemaError, RefResolutionError
from jsonschema import Draft6Validator as d6
import yaml
# from pdb import set_trace

class MDFValidator:
  def __init__(self, sch_filename="mdf-schema.yaml", *inst_filenames):
    self.schema = None
    self.instance = om.MergedOptions()
    try:
      sch_file = open(sch_filename,"r")
    except IOError:
      raise
    try:
      self.schema = yaml.load(sch_file, Loader=yaml.loader.Loader)
    except RuntimeError:
      print "YAML error in '{fn}':\n{e}".format(fn=sch_filename,e=e)
    except Exception:
      raise

    if (inst_filenames):
      for inst_filename in inst_filenames:
        try:
          inst_file = open(inst_filename,"r")
        except IOError as e:
          print "Can't open '{fn}' ({e}), skipping".format(fn=inst_filename,e=e)
        try:
          inst_yaml=yaml.load(inst_file, Loader=yaml.loader.Loader)
          self.instance.update(inst_yaml)
        except RuntimeError as e:
          print "YAML error in '{fn}':\n{e}".format(fn=inst_filename,e=e)
        except Exception:
          raise

  def validate(self):
    print "Checking schema ====="
    try:
      d6.check_schema(self.schema)
    except SchemaError as se:
      print se
      return se
    if (self.instance):
      print "Checking instance==="
      try:
        validate(instance=self.instance.as_dict(), schema=self.schema)
      except RefResolutionError as re:
        print re
        return re
      except ValidationError as ve:
        for e in d6(self.schema).iter_errors(self.instance.as_dict()):
          print e;
        return ve
    return None
