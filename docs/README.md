[Model artifacts](./model-desc)

# MakeModel and model-tool

## Overview

The MakeModel "framework" takes a convenient, human-readable
description of an overall graph model, laid out in one or two YAML
files, and uses these to create the node schemas required to specify
the model in the Gen3 system.

The command-line tool `model-tool` takes the schema description files
as input, and performs the following tasks

* Creates the node schema YAML files required for Gen3 ("schema YAMLs")
* Creates the JSON aggregation of all node YAML files (the "dictionary JSON")
* Creates an SVG graphical representation of the model as specified;
* Provides error checking and warnings relevant to model
  specification, e.g., identifying nodes that do not have any incoming
  or outgoing relationships ("edges").

## Installing `model-tool`

* MakeModel is written in Perl. If you don't have Perl,
[get it](https://www.perl.org/get.html). On Windows, I recommend
Strawberry Perl.

* Get [GraphViz](http://www.graphviz.org/) if you want to use the
graphic output feature.

* Clone this repo 

        git clone https://github.com/CBIIT/icdc-model-tools.git 

* Move to `make-model` directory 

        cd icdc-model-tools/make-model 

* Easy build:

  * Get the "cpanminus" tool:

        curl -L https://cpanmin.us | perl - App::cpanminus     # or
        wget -O - https://cpanmin.us | perl - App::cpanminus

  * Run cpanm to install

        cpanm .

    which will pull in all dependencies, run tests and install the
    script.

* Try it:

        model-tool

  and the Usage hints should display:

```
FATAL: Nothing to do!
 (2019/01/29 23:12:31 in main::)
Usage:
      model-tool [-g <graph-out-file>] [-s <output-dir>] [-j <json-out-file>] <input.yaml> [<input2.yaml> ...]
         [-d dir_to_search [-d another_dir...]]
      -g : create an SVG of model defined in input.yamls 
      -s : create schema node files for Gen3
      -j : create big json schema squirt
      -d : directory to search for native schema yamls for inclusion
      -a : output all nodes, including unlinked nodes
      -v : verbosity (-v little ... -vvvv lots)
      -W : show all warnings ( = -vvv )
      --dry-run : emit log msg, but no output files
```

## Graph Description Input YAML

The layout of nodes, relationships, node properties, and relationship
properties are specified in data structure expressed in YAML files.

The input format follows these general conventions:

* Special key names are capitalized; these are essentially directives
to ModelMaker;

* Custom names, such as names of nodes and properties, are all lower
case, with underscores replacing any spaces ("snakecase");

Input to `model-tool` can be a single YAML file, or multiple YAML
files. If multiple files are given, the data structures are merged, so
that, for example, nodes and relationships can be described in one
file, and property definitions can be provided in a separate file.

Collectively, the input YAMLs can be called "model description
files". These are distinct from Gen3 configuration YAML files output
by the tool, called "schema" or "dictionary" files.

### Nodes

The `Nodes` top-level key points to an object containing descriptions
of each node type in the model. Node descriptions look like:

    <nodename> :
        Category: <categoryname>
        UniqueKeys:
            - [ 'propnameA', 'propnameB', ... ]
            - [ ... ]
            - ...
        Props:
           - <propname1>
           - <propname2>
           - ...

A node type can have a defined category, or a default (which can be
configured) will be used in the final output.

The `UniqueKeys` key points to an array of arrays. Each bottom-level
array is a list (which can be of length 1) of node property
names. This specifies that nodes of this type that are created in the
system must be unique with respect to the set of values for the
properties indicated. For example, `['id']` here indicates that the
value for the property `id` must be unique for all nodes of the
type. `['project_id', 'submitter_id']` indicates that the submitter id
must be unique among all nodes having a given project_id value.

The `Props` key points to a simple array of property names given as
strings. The detailed definition of each property (e.g., value type or
enumeration, required status) are provided once, in a separate top-level
section, `PropDefinitions` ([see below](#Property Definitions)).

### Relationships

The `Relationships` top-level key points to an object of descriptions of
each relationship type. Relationship descriptions look like:

    <relname>:
         Props:
             - <propname>
         Req: [ true | false ]
         Mul: [ one_to_one | many_to_one | many_to_many | one_to_many ]
         Ends:
            - Src: <nodename1>
               Dst: <nodename2>
            - Src: <nodename...>
               ...

A named relationship can have properties defined, analogous to
nodes.

A named relationship can be specified as required with the `Req` key,
and its multiplicity (from source node type to destination node type)
with the `Mul` key.

A given named relationship can be formed between different source and
destination node type pairs. The `Ends` key points to an array of `{ Src, Dst }`
objects that describe the allowed pairs.

### Property Definitions

The `PropDefinitions` top-level key points to an object of
descriptions of each property. Property descriptions look like:

    <propname1>:
        Term: <term reference token>
        # e.g., for $ref: "_terms.yaml#/ajcc_clinical_m", 
        # use 'ajcc_clinical_m'
        Desc: "a description of the property"
        Type: <string|number> # or the following:
        Enum:
            - acceptable
            - values
            - for
            - property
            - go
            - here
        Nul: <true|false> # is property nullable?
        Src: <a string describing where the property came from - e.g.
                 a CRF.>


Either the `Type` or the `Enum` key should be present. If Enum key is
present, the `Type` key will be ignored.

`Src` is a note regarding the data source of the property. The value
is not used in any output; it is essentially a comment.

Where properties need to be applied to Nodes and Relationships, use a
list of propnames from those defined in PropDefinitions.

## model-tool Outputs

### Gen3 "Schema YAML"

`model-tool` uses MakeModel to create a set of Gen3 schema YAML files,
one for each defined node. The schema YAML files contain the
appropriate definitions of properties and links as required by the
Gen3 dictionary system, as well as "boilerplate" and default items
that are a nuisance to keep track of manually.

*Note*: Objects (i.e., key-value constructs) in the output schema YAML
documents will appear in the files in a pre-defined default order
(rather than in a sorted order or a random order). The default order
is the one that appears in Gen3 example documents. This order can be
customized in the `ICDC::MakeModel::Config` module (but not very
conveniently at the moment).

### Gen3 "Dictionary JSON"

`model-tool` will create a  JSON document containing all node schema
definitions in a single JSON object. This is required by the Gen3
system for configuration.

#### Including Gen3 configuration YAMLs

MakeModel has a feature to include "native" YAML files verbatim in the
production of the dictionary JSON file. *Note*: this feature allows
the verbatim inclusion of Gen3 model configuration files such as
"\_settings.yaml", "\_definitions.yaml", and "\_terms.yaml". It will
not add Gen3-defined node, properties or links to the model
(currently).

### Graphic representation of the input model

`model-tool` can produce an SVG rendering of the input data
model. This requires that [GraphViz](http://www.graphviz.org/) be
installed on your system.
