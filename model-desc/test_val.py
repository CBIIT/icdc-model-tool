from sys import path
path.append('../bento-mdf/validators/mdf-validate')
from MDFValidate.validator import MDFValidator

v = MDFValidator('../bento-mdf/schema/mdf-schema.yaml',
                 'icdc-model.yml',
                 'icdc-model-props.yml'
                 )
def test():
  v.test_yaml_valid()
  v.test_model_valid()

