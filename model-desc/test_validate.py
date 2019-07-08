from MDFValidate.validator import MDFValidator

v = MDFValidator("mdf-schema.yaml", "icdc-model.yml","icdc-model-props.yml")

def test_model_valid():
  assert v.validate() == None


