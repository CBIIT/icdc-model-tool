from MDFValidate.validator import MDFValidator
import sys

test_me = ["mdf-schema.yaml", "icdc-model.yml","icdc-model-props.yml"]
# v = MDFValidator("mdf-schema.yaml", "icdc-model.yml","icdc-model-props.yml")
if len(sys.argv) > 1:
  test_me = sys.argv[1:]
  
v = MDFValidator(*test_me)

def test_model_valid():
  assert v.validate() == None


if __name__ == '__main__':
   v.validate()


