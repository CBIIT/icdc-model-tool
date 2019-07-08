import sys
import os
import option_merge as om
from jsonschema import validate, ValidationError, SchemaError
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
      print "Problem with '{fn}' ({e}), skipping".format(fn=sch_filename,e=e)
      raise
    if (inst_filenames):
      for inst_filename in inst_filenames:
        try:
          inst_file = open(inst_filename,"r")
        except IOError as e:
          print "Problem with '{fn}' ({e}), skipping".format(fn=inst_filename,e=e)
        try:
          self.instance.update(yaml.load(inst_file, Loader=yaml.loader.Loader))
        except RuntimeError as e:
          print "Problem with '{fn}' ({e}), skipping".format(fn=inst_filename,e=e)

  def validate(self):
    print "Checking schema ====="
    try:
      d6.check_schema(self.schema)
    except SchemaError as se:
      return se
    if (self.instance):
      print "Checking instance==="
      try:
        validate(instance=self.instance.as_dict(), schema=self.schema)
      except ValidationError as ve:
        return ve
    return None
