import yaml
from yaml.constructor import ConstructorError
from yaml.nodes import MappingNode


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

loader = yaml.loader.Loader;
loader.construct_mapping = construct_mapping
f=open("try.yaml","r")
o=yaml.load(f, Loader=loader)
pass
