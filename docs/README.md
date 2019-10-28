<link rel='stylesheet' href="assets/style.css">
<link rel='stylesheet' href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"  src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"></script>
<script type="text/javascript" src="assets/actions.js"></script>

# Integrated Canine Data Commons data model

Zoom to Node: <select id="node_select">
  <option value="">Zoom to Node</option>
</select>
<div id="model"></div>

<a href="./model-desc/icdc-model.svg">SVG file (in view above)</a>
<a href="./model-desc">Additional model files</a>


## Overview

The MakeModel "framework" takes a convenient, human-readable
description of an overall graph model, laid out in one or two YAML
files, and uses these to perform various functions that enable
tasks related to the ICDC data system.

The command-line tool `model-tool` (or `model-tool-d` for the Docker
container version) takes the model description files (MDF)
as input, and performs the following tasks:

* Validates the content of the MDF for syntax and consistency
* Creates an SVG graphical representation of the model as specified; 
* Output a simple tab-delimited table of nodes and properties;
* _Coming Soon_: Outputs Cypher queries that can be used to create a representation
  of the model in a [Neo4j](https://neo4j.com) graph database.

## Running `model-tool` with Docker

To use model-tool without having to install Perl dependencies, you can
use a pre-built Docker image. The script
[`model-tool-d`](./make-model/bin/model-tool-d) should make this very
simple on Linux and MacOS:

* Get [Docker](https://docker.com)
* Clone this repo

        git clone https://github.com/CBIIT/icdc-model-tools.git

* Do following at command line:

        $ cd icdc-model-tools
        $ export MODELTOOL_DIR=$(pwd) # set MODELTOOL_DIR to absolute path to repo dir
        $ export PATH=$PATH:$MODELTOOL_DIR/make-model/bin # put the script in your path
        $ cd model-desc # go to where the model description files are
        $ model-tool-d -T icdc-model.txt icdc-model*.yml # try creating a node/property table


## Installing `model-tool` on your machine

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

        curl -L https://cpanmin.us | perl - App::cpanminus     # or wget -O - https://cpanmin.us | perl - App::cpanminus

  * Run cpanm to install

        cpanm .

    which will pull in all dependencies, run tests and install the script.

* Try it:

        model-tool

  and the Usage hints should display:

```
NCI-02133017-ML:icdc-model-tool jensenma$ make-model/bin/model-tool 
FATAL: Nothing to do!
 (2019/08/23 15:37:10 in main::)
Usage:
      model-tool [-g <graph-out-file>] [-s <output-dir>] [-j <json-out-file>] 
                 [-T <table-out-file>] <input.yaml> [<input2.yaml> ...]
         [-d dir_to_search [-d another_dir...]]
      -g : create an SVG of model defined in input.yamls
      -T : output a table of nodes and properties
      -a : output all nodes, including unlinked nodes
      -v : verbosity (-v little ... -vvvv lots)
      -W : show all warnings ( = -vvv )
      --dry-run : emit log msg, but no output files
```

## Model Description Files (MDF)

The layout of nodes, relationships, node properties, and relationship
properties are specified in data structure expressed in YAML-formatted
"model description files".

The input format follows these general conventions, which are enforced
by a [JSONSchema](https://json-schema.org/understanding-json-schema/) [schema](./model-desc/mdf-schema.yaml):

* Special key names are capitalized; these are essentially directives
to ModelMaker;

* Custom names, such as names of nodes and properties, are all lower
case, with underscores replacing any spaces ("snakecase");

Input to `model-tool` can be a single YAML file, or multiple YAML
files. If multiple files are given, the data structures are merged, so
that, for example, nodes and relationships can be described in one
file, and property definitions can be provided in a separate file.

Collectively, the input YAMLs are called "model description
files" (MDF). 

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
        Req: <true|false> # is property required?
        Src: <a string describing where the property came from - e.g.
                 a CRF.>


Either the `Type` or the `Enum` key should be present. If Enum key is
present, the `Type` key will be ignored.

`Src` is a note regarding the data source of the property. The value
is not used in any output; it is essentially a comment.

Where properties need to be applied to Nodes and Relationships, use a
list of propnames from those defined in PropDefinitions.

### Multiple input YAML files and "overlays"

`model-tool` allows multiple input YAML files. The structured
information in the files are merged together to produce one
input structure internally. This allows a user to, for example,
keep Node definitions in one file, Relationships in another, and
Property definitions in yet another. Each of these objects has
a separate top-level key, and will be merged into the single
internal object without any "collisions".

Merging YAML files into a single object occurs with specific
rules that allow the user to "overlay" specific changes onto a
base model file, without having to resort to multiple versions
of a base model. The first pair of files is merged, the next file
is merged into that result, and so on to the end of the input files.
For example:

    model-tool -g graph.svg icdc-model.yml temp-changes.yml

would create a graphic of nodes and edges defined in `icdc-model.yml`,
as modified by changes specified in `temp-changes.yml`.

#### Adding elements

As indicated above, if independent sets of keys at a given
level of the YAML structure are present in the input files,
the merged structure will possess all the keys and their
contents:

File 1:

    Nodes:
      original_node:
        Props:
	      - old_prop

File 2:

    Nodes:
      original_node:
        Props:
          - new_prop
      addtional_node:
        Props:
          - new_prop

yields

    Nodes:
      original_node:
        Props:
          - old_prop
          - new_prop
      additional_node:
        Props:
          - new_prop

Note that by default, the overlay keys and values are added;
original array elements are not replaced. Array elements remain
unique: if both files have an element named `foo`, only one
`foo` element will be present in the merged array.

#### Deleting/replacing elements

To indicate that an overlay should remove a key and its contents,
or an array element, that are present in an earlier file, prefix the
key/element with a forward slash `/`

File 1:

    Nodes:
      original_node:
        Props:
          - unwanted_prop
          - a_prop
      unwanted_node:
        Props:
          - a_prop

File 2:

    Nodes:
      original_node:
        Props:
          - /unwanted_prop
          - new_prop
      /unwanted_node:
        Props:
          - whatever_prop

yields

    Nodes:
      original_node:
        Props:
          - a_prop
      - new_prop

#### Tagging Entities

A `Tags` entry can be added to any object (thing that accepts
key:value pairs) in the MDF. This is a way to associate
metainformation with an entity that can be read later by a custom
parser. A `Tags` entry value is an array of strings, the tags.

For example, one may markup a set of nodes to be rendered in a certain
color:

    dog:
      Props:
        - breed
      Tags:
        - "color: red;"
    cat:
      Props:
        - breed
      Tags:
        - "color: blue;"


## model-tool Outputs

### Graphic representation of the input model

`model-tool` can produce an SVG rendering of the input data
model. This requires that [GraphViz](http://www.graphviz.org/) be
installed on your system.

### Table of nodes and associated properties

`model-tool` can produce a simple table of node names and property
names, suitable for Excel etc.

    $ model-tool --table t.txt icdc-model.yaml  # content of t.txt is...
    ...
    adverse_event   day_in_cycle
    adverse_event   dose_limiting_toxicity
    adverse_event   unexpected_adverse_event
    agent   document_number
    agent   medication
    agent_administration    comment
    agent_administration    crf_idp
    ...

<div id='graph' style='display:off;'>
<svg width="3217pt" height="2966pt"
 viewBox="0.00 0.00 3217.00 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 3213,-2962 3213,4 -4,4"/>
<!-- disease_extent -->
<g id="node1" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M983,-1877C983,-1877 1299,-1877 1299,-1877 1305,-1877 1311,-1883 1311,-1889 1311,-1889 1311,-2164 1311,-2164 1311,-2170 1305,-2176 1299,-2176 1299,-2176 983,-2176 983,-2176 977,-2176 971,-2170 971,-2164 971,-2164 971,-1889 971,-1889 971,-1883 977,-1877 983,-1877"/>
<text text-anchor="middle" x="1032.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="1094,-1877 1094,-2176 "/>
<text text-anchor="middle" x="1104.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1115,-1877 1115,-2176 "/>
<text text-anchor="middle" x="1202.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="1115,-2153 1290,-2153 "/>
<text text-anchor="middle" x="1202.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="1115,-2130 1290,-2130 "/>
<text text-anchor="middle" x="1202.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="1115,-2107 1290,-2107 "/>
<text text-anchor="middle" x="1202.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="1115,-2084 1290,-2084 "/>
<text text-anchor="middle" x="1202.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="1115,-2061 1290,-2061 "/>
<text text-anchor="middle" x="1202.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1115,-2038 1290,-2038 "/>
<text text-anchor="middle" x="1202.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="1115,-2015 1290,-2015 "/>
<text text-anchor="middle" x="1202.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="1115,-1992 1290,-1992 "/>
<text text-anchor="middle" x="1202.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="1115,-1969 1290,-1969 "/>
<text text-anchor="middle" x="1202.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="1115,-1946 1290,-1946 "/>
<text text-anchor="middle" x="1202.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="1115,-1923 1290,-1923 "/>
<text text-anchor="middle" x="1202.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="1115,-1900 1290,-1900 "/>
<text text-anchor="middle" x="1202.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="1290,-1877 1290,-2176 "/>
<text text-anchor="middle" x="1300.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit -->
<g id="node16" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M819.5,-1549C819.5,-1549 994.5,-1549 994.5,-1549 1000.5,-1549 1006.5,-1555 1006.5,-1561 1006.5,-1561 1006.5,-1583 1006.5,-1583 1006.5,-1589 1000.5,-1595 994.5,-1595 994.5,-1595 819.5,-1595 819.5,-1595 813.5,-1595 807.5,-1589 807.5,-1583 807.5,-1583 807.5,-1561 807.5,-1561 807.5,-1555 813.5,-1549 819.5,-1549"/>
<text text-anchor="middle" x="831" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="854.5,-1549 854.5,-1595 "/>
<text text-anchor="middle" x="865" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="875.5,-1549 875.5,-1595 "/>
<text text-anchor="middle" x="930.5" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="875.5,-1572 985.5,-1572 "/>
<text text-anchor="middle" x="930.5" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="985.5,-1549 985.5,-1595 "/>
<text text-anchor="middle" x="996" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge19" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1063.8934,-1876.7352C1013.792,-1779.423 952.6037,-1660.5765 923.6763,-1604.3905"/>
<polygon fill="#000000" stroke="#000000" points="926.6774,-1602.5734 918.9881,-1595.2846 920.4539,-1605.7776 926.6774,-1602.5734"/>
<text text-anchor="middle" x="1004" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- off_study -->
<g id="node2" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M919.5,-714.5C919.5,-714.5 1334.5,-714.5 1334.5,-714.5 1340.5,-714.5 1346.5,-720.5 1346.5,-726.5 1346.5,-726.5 1346.5,-909.5 1346.5,-909.5 1346.5,-915.5 1340.5,-921.5 1334.5,-921.5 1334.5,-921.5 919.5,-921.5 919.5,-921.5 913.5,-921.5 907.5,-915.5 907.5,-909.5 907.5,-909.5 907.5,-726.5 907.5,-726.5 907.5,-720.5 913.5,-714.5 919.5,-714.5"/>
<text text-anchor="middle" x="949" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="990.5,-714.5 990.5,-921.5 "/>
<text text-anchor="middle" x="1001" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1011.5,-714.5 1011.5,-921.5 "/>
<text text-anchor="middle" x="1168.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1011.5,-898.5 1325.5,-898.5 "/>
<text text-anchor="middle" x="1168.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1011.5,-875.5 1325.5,-875.5 "/>
<text text-anchor="middle" x="1168.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1011.5,-852.5 1325.5,-852.5 "/>
<text text-anchor="middle" x="1168.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1011.5,-829.5 1325.5,-829.5 "/>
<text text-anchor="middle" x="1168.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="1011.5,-806.5 1325.5,-806.5 "/>
<text text-anchor="middle" x="1168.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1011.5,-783.5 1325.5,-783.5 "/>
<text text-anchor="middle" x="1168.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1011.5,-760.5 1325.5,-760.5 "/>
<text text-anchor="middle" x="1168.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="1011.5,-737.5 1325.5,-737.5 "/>
<text text-anchor="middle" x="1168.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1325.5,-714.5 1325.5,-921.5 "/>
<text text-anchor="middle" x="1336" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam -->
<g id="node3" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1379,-1934.5C1379,-1934.5 1695,-1934.5 1695,-1934.5 1701,-1934.5 1707,-1940.5 1707,-1946.5 1707,-1946.5 1707,-2106.5 1707,-2106.5 1707,-2112.5 1701,-2118.5 1695,-2118.5 1695,-2118.5 1379,-2118.5 1379,-2118.5 1373,-2118.5 1367,-2112.5 1367,-2106.5 1367,-2106.5 1367,-1946.5 1367,-1946.5 1367,-1940.5 1373,-1934.5 1379,-1934.5"/>
<text text-anchor="middle" x="1428" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1489,-1934.5 1489,-2118.5 "/>
<text text-anchor="middle" x="1499.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1510,-1934.5 1510,-2118.5 "/>
<text text-anchor="middle" x="1598" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1510,-2095.5 1686,-2095.5 "/>
<text text-anchor="middle" x="1598" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1510,-2072.5 1686,-2072.5 "/>
<text text-anchor="middle" x="1598" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1510,-2049.5 1686,-2049.5 "/>
<text text-anchor="middle" x="1598" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1510,-2026.5 1686,-2026.5 "/>
<text text-anchor="middle" x="1598" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1510,-2003.5 1686,-2003.5 "/>
<text text-anchor="middle" x="1598" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1510,-1980.5 1686,-1980.5 "/>
<text text-anchor="middle" x="1598" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1510,-1957.5 1686,-1957.5 "/>
<text text-anchor="middle" x="1598" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1686,-1934.5 1686,-2118.5 "/>
<text text-anchor="middle" x="1696.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment -->
<g id="node5" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M2193.5,-1468.5C2193.5,-1468.5 2542.5,-1468.5 2542.5,-1468.5 2548.5,-1468.5 2554.5,-1474.5 2554.5,-1480.5 2554.5,-1480.5 2554.5,-1663.5 2554.5,-1663.5 2554.5,-1669.5 2548.5,-1675.5 2542.5,-1675.5 2542.5,-1675.5 2193.5,-1675.5 2193.5,-1675.5 2187.5,-1675.5 2181.5,-1669.5 2181.5,-1663.5 2181.5,-1663.5 2181.5,-1480.5 2181.5,-1480.5 2181.5,-1474.5 2187.5,-1468.5 2193.5,-1468.5"/>
<text text-anchor="middle" x="2229" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="2276.5,-1468.5 2276.5,-1675.5 "/>
<text text-anchor="middle" x="2287" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2297.5,-1468.5 2297.5,-1675.5 "/>
<text text-anchor="middle" x="2415.5" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2297.5,-1652.5 2533.5,-1652.5 "/>
<text text-anchor="middle" x="2415.5" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="2297.5,-1629.5 2533.5,-1629.5 "/>
<text text-anchor="middle" x="2415.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2297.5,-1606.5 2533.5,-1606.5 "/>
<text text-anchor="middle" x="2415.5" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="2297.5,-1583.5 2533.5,-1583.5 "/>
<text text-anchor="middle" x="2415.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="2297.5,-1560.5 2533.5,-1560.5 "/>
<text text-anchor="middle" x="2415.5" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="2297.5,-1537.5 2533.5,-1537.5 "/>
<text text-anchor="middle" x="2415.5" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="2297.5,-1514.5 2533.5,-1514.5 "/>
<text text-anchor="middle" x="2415.5" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2297.5,-1491.5 2533.5,-1491.5 "/>
<text text-anchor="middle" x="2415.5" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2533.5,-1468.5 2533.5,-1675.5 "/>
<text text-anchor="middle" x="2544" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge12" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1547.802,-1934.4813C1561.7914,-1858.2878 1593.677,-1753.2528 1666,-1694 1741.5412,-1632.1106 1990.9351,-1600.1551 2170.9965,-1584.7518"/>
<polygon fill="#000000" stroke="#000000" points="2171.463,-1588.2249 2181.133,-1583.8958 2170.8739,-1581.2497 2171.463,-1588.2249"/>
<text text-anchor="middle" x="1716" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge20" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1489.5659,-1934.4554C1451.5504,-1868.6888 1392.6353,-1782.3797 1320,-1727 1229.5993,-1658.0753 1105.182,-1616.9685 1016.5881,-1594.5929"/>
<polygon fill="#000000" stroke="#000000" points="1017.3284,-1591.1705 1006.7794,-1592.155 1015.6399,-1597.9638 1017.3284,-1591.1705"/>
<text text-anchor="middle" x="1318" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- off_treatment -->
<g id="node4" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1376.5,-726C1376.5,-726 1823.5,-726 1823.5,-726 1829.5,-726 1835.5,-732 1835.5,-738 1835.5,-738 1835.5,-898 1835.5,-898 1835.5,-904 1829.5,-910 1823.5,-910 1823.5,-910 1376.5,-910 1376.5,-910 1370.5,-910 1364.5,-904 1364.5,-898 1364.5,-898 1364.5,-738 1364.5,-738 1364.5,-732 1370.5,-726 1376.5,-726"/>
<text text-anchor="middle" x="1422" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1479.5,-726 1479.5,-910 "/>
<text text-anchor="middle" x="1490" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1500.5,-726 1500.5,-910 "/>
<text text-anchor="middle" x="1657.5" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1500.5,-887 1814.5,-887 "/>
<text text-anchor="middle" x="1657.5" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1500.5,-864 1814.5,-864 "/>
<text text-anchor="middle" x="1657.5" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1500.5,-841 1814.5,-841 "/>
<text text-anchor="middle" x="1657.5" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1500.5,-818 1814.5,-818 "/>
<text text-anchor="middle" x="1657.5" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1500.5,-795 1814.5,-795 "/>
<text text-anchor="middle" x="1657.5" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1500.5,-772 1814.5,-772 "/>
<text text-anchor="middle" x="1657.5" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1500.5,-749 1814.5,-749 "/>
<text text-anchor="middle" x="1657.5" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1814.5,-726 1814.5,-910 "/>
<text text-anchor="middle" x="1825" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node23" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1017.5,-1065.5C1017.5,-1065.5 1236.5,-1065.5 1236.5,-1065.5 1242.5,-1065.5 1248.5,-1071.5 1248.5,-1077.5 1248.5,-1077.5 1248.5,-1145.5 1248.5,-1145.5 1248.5,-1151.5 1242.5,-1157.5 1236.5,-1157.5 1236.5,-1157.5 1017.5,-1157.5 1017.5,-1157.5 1011.5,-1157.5 1005.5,-1151.5 1005.5,-1145.5 1005.5,-1145.5 1005.5,-1077.5 1005.5,-1077.5 1005.5,-1071.5 1011.5,-1065.5 1017.5,-1065.5"/>
<text text-anchor="middle" x="1030" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1054.5,-1065.5 1054.5,-1157.5 "/>
<text text-anchor="middle" x="1065" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1075.5,-1065.5 1075.5,-1157.5 "/>
<text text-anchor="middle" x="1151.5" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1075.5,-1134.5 1227.5,-1134.5 "/>
<text text-anchor="middle" x="1151.5" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1075.5,-1111.5 1227.5,-1111.5 "/>
<text text-anchor="middle" x="1151.5" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1075.5,-1088.5 1227.5,-1088.5 "/>
<text text-anchor="middle" x="1151.5" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1227.5,-1065.5 1227.5,-1157.5 "/>
<text text-anchor="middle" x="1238" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge35" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2287.3576,-1468.3163C2207.2351,-1373.8687 2075.1791,-1239.7119 1927,-1176 1867.3331,-1150.3453 1470.2332,-1127.8468 1258.859,-1117.5152"/>
<polygon fill="#000000" stroke="#000000" points="1258.7838,-1114.0075 1248.6256,-1117.0174 1258.4437,-1120.9992 1258.7838,-1114.0075"/>
<text text-anchor="middle" x="2265" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_arm -->
<g id="node6" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M885.5,-403.5C885.5,-403.5 1254.5,-403.5 1254.5,-403.5 1260.5,-403.5 1266.5,-409.5 1266.5,-415.5 1266.5,-415.5 1266.5,-460.5 1266.5,-460.5 1266.5,-466.5 1260.5,-472.5 1254.5,-472.5 1254.5,-472.5 885.5,-472.5 885.5,-472.5 879.5,-472.5 873.5,-466.5 873.5,-460.5 873.5,-460.5 873.5,-415.5 873.5,-415.5 873.5,-409.5 879.5,-403.5 885.5,-403.5"/>
<text text-anchor="middle" x="919.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="965.5,-403.5 965.5,-472.5 "/>
<text text-anchor="middle" x="976" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="986.5,-403.5 986.5,-472.5 "/>
<text text-anchor="middle" x="1116" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="986.5,-449.5 1245.5,-449.5 "/>
<text text-anchor="middle" x="1116" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="986.5,-426.5 1245.5,-426.5 "/>
<text text-anchor="middle" x="1116" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="1245.5,-403.5 1245.5,-472.5 "/>
<text text-anchor="middle" x="1256" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node12" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M363,-190.5C363,-190.5 643,-190.5 643,-190.5 649,-190.5 655,-196.5 655,-202.5 655,-202.5 655,-339.5 655,-339.5 655,-345.5 649,-351.5 643,-351.5 643,-351.5 363,-351.5 363,-351.5 357,-351.5 351,-345.5 351,-339.5 351,-339.5 351,-202.5 351,-202.5 351,-196.5 357,-190.5 363,-190.5"/>
<text text-anchor="middle" x="379" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="407,-190.5 407,-351.5 "/>
<text text-anchor="middle" x="417.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="428,-190.5 428,-351.5 "/>
<text text-anchor="middle" x="531" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="428,-328.5 634,-328.5 "/>
<text text-anchor="middle" x="531" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="428,-305.5 634,-305.5 "/>
<text text-anchor="middle" x="531" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="428,-282.5 634,-282.5 "/>
<text text-anchor="middle" x="531" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="428,-259.5 634,-259.5 "/>
<text text-anchor="middle" x="531" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="428,-236.5 634,-236.5 "/>
<text text-anchor="middle" x="531" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="428,-213.5 634,-213.5 "/>
<text text-anchor="middle" x="531" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="634,-190.5 634,-351.5 "/>
<text text-anchor="middle" x="644.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge42" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M952.8611,-403.4988C869.5516,-378.9614 756.5825,-345.6883 664.694,-318.6242"/>
<polygon fill="#000000" stroke="#000000" points="665.6013,-315.2428 655.0198,-315.7748 663.6235,-321.9576 665.6013,-315.2428"/>
<text text-anchor="middle" x="926.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- prior_surgery -->
<g id="node7" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M2253,-1946C2253,-1946 2599,-1946 2599,-1946 2605,-1946 2611,-1952 2611,-1958 2611,-1958 2611,-2095 2611,-2095 2611,-2101 2605,-2107 2599,-2107 2599,-2107 2253,-2107 2253,-2107 2247,-2107 2241,-2101 2241,-2095 2241,-2095 2241,-1958 2241,-1958 2241,-1952 2247,-1946 2253,-1946"/>
<text text-anchor="middle" x="2298.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="2356,-1946 2356,-2107 "/>
<text text-anchor="middle" x="2366.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2377,-1946 2377,-2107 "/>
<text text-anchor="middle" x="2483.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2377,-2084 2590,-2084 "/>
<text text-anchor="middle" x="2483.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="2377,-2061 2590,-2061 "/>
<text text-anchor="middle" x="2483.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="2377,-2038 2590,-2038 "/>
<text text-anchor="middle" x="2483.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2377,-2015 2590,-2015 "/>
<text text-anchor="middle" x="2483.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="2377,-1992 2590,-1992 "/>
<text text-anchor="middle" x="2483.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2377,-1969 2590,-1969 "/>
<text text-anchor="middle" x="2483.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="2590,-1946 2590,-2107 "/>
<text text-anchor="middle" x="2600.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge13" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2415.6976,-1945.7682C2406.4729,-1873.4814 2392.848,-1766.714 2382.5196,-1685.7784"/>
<polygon fill="#000000" stroke="#000000" points="2385.9508,-1685.0165 2381.213,-1675.5401 2379.0071,-1685.9027 2385.9508,-1685.0165"/>
<text text-anchor="middle" x="2435" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge2" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M2611.113,-2068.5585C2622.2907,-2058.5547 2629,-2044.5352 2629,-2026.5 2629,-2012.5509 2624.9865,-2001.004 2617.9962,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="2620.4806,-1989.3911 2611.113,-1984.4415 2615.3494,-1994.1525 2620.4806,-1989.3911"/>
<text text-anchor="middle" x="2645" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- diagnosis -->
<g id="node8" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M1172.5,-2344.5C1172.5,-2344.5 1515.5,-2344.5 1515.5,-2344.5 1521.5,-2344.5 1527.5,-2350.5 1527.5,-2356.5 1527.5,-2356.5 1527.5,-2631.5 1527.5,-2631.5 1527.5,-2637.5 1521.5,-2643.5 1515.5,-2643.5 1515.5,-2643.5 1172.5,-2643.5 1172.5,-2643.5 1166.5,-2643.5 1160.5,-2637.5 1160.5,-2631.5 1160.5,-2631.5 1160.5,-2356.5 1160.5,-2356.5 1160.5,-2350.5 1166.5,-2344.5 1172.5,-2344.5"/>
<text text-anchor="middle" x="1202.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="1244.5,-2344.5 1244.5,-2643.5 "/>
<text text-anchor="middle" x="1255" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1265.5,-2344.5 1265.5,-2643.5 "/>
<text text-anchor="middle" x="1386" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="1265.5,-2620.5 1506.5,-2620.5 "/>
<text text-anchor="middle" x="1386" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1265.5,-2597.5 1506.5,-2597.5 "/>
<text text-anchor="middle" x="1386" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="1265.5,-2574.5 1506.5,-2574.5 "/>
<text text-anchor="middle" x="1386" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="1265.5,-2551.5 1506.5,-2551.5 "/>
<text text-anchor="middle" x="1386" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="1265.5,-2528.5 1506.5,-2528.5 "/>
<text text-anchor="middle" x="1386" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="1265.5,-2505.5 1506.5,-2505.5 "/>
<text text-anchor="middle" x="1386" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="1265.5,-2482.5 1506.5,-2482.5 "/>
<text text-anchor="middle" x="1386" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="1265.5,-2459.5 1506.5,-2459.5 "/>
<text text-anchor="middle" x="1386" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="1265.5,-2436.5 1506.5,-2436.5 "/>
<text text-anchor="middle" x="1386" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="1265.5,-2413.5 1506.5,-2413.5 "/>
<text text-anchor="middle" x="1386" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="1265.5,-2390.5 1506.5,-2390.5 "/>
<text text-anchor="middle" x="1386" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="1265.5,-2367.5 1506.5,-2367.5 "/>
<text text-anchor="middle" x="1386" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="1506.5,-2344.5 1506.5,-2643.5 "/>
<text text-anchor="middle" x="1517" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge30" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1340.7589,-2344.4995C1338.8012,-2189.6921 1339.5677,-1940.9633 1358,-1727 1369.9663,-1588.0949 1395.3018,-1556.0085 1406,-1417 1413.0936,-1324.8281 1459.5102,-1284.3833 1406,-1209 1387.6023,-1183.0819 1321.6688,-1159.4149 1258.5178,-1141.8902"/>
<polygon fill="#000000" stroke="#000000" points="1259.39,-1138.5003 1248.821,-1139.2404 1257.5447,-1145.2527 1259.39,-1138.5003"/>
<text text-anchor="middle" x="1427" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- demographic -->
<g id="node9" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M315,-1232.5C315,-1232.5 651,-1232.5 651,-1232.5 657,-1232.5 663,-1238.5 663,-1244.5 663,-1244.5 663,-1381.5 663,-1381.5 663,-1387.5 657,-1393.5 651,-1393.5 651,-1393.5 315,-1393.5 315,-1393.5 309,-1393.5 303,-1387.5 303,-1381.5 303,-1381.5 303,-1244.5 303,-1244.5 303,-1238.5 309,-1232.5 315,-1232.5"/>
<text text-anchor="middle" x="358" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="413,-1232.5 413,-1393.5 "/>
<text text-anchor="middle" x="423.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="434,-1232.5 434,-1393.5 "/>
<text text-anchor="middle" x="538" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="434,-1370.5 642,-1370.5 "/>
<text text-anchor="middle" x="538" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="434,-1347.5 642,-1347.5 "/>
<text text-anchor="middle" x="538" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="434,-1324.5 642,-1324.5 "/>
<text text-anchor="middle" x="538" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="434,-1301.5 642,-1301.5 "/>
<text text-anchor="middle" x="538" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="434,-1278.5 642,-1278.5 "/>
<text text-anchor="middle" x="538" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="434,-1255.5 642,-1255.5 "/>
<text text-anchor="middle" x="538" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="642,-1232.5 642,-1393.5 "/>
<text text-anchor="middle" x="652.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge29" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M552.2335,-1232.47C575.1053,-1210.7334 602.1467,-1189.5155 631,-1176 693.686,-1146.6365 870.6702,-1128.8303 995.2734,-1119.5749"/>
<polygon fill="#000000" stroke="#000000" points="995.5607,-1123.0633 1005.2781,-1118.8417 995.049,-1116.0821 995.5607,-1123.0633"/>
<text text-anchor="middle" x="658" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample -->
<g id="node10" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M1737.5,-1796.5C1737.5,-1796.5 2160.5,-1796.5 2160.5,-1796.5 2166.5,-1796.5 2172.5,-1802.5 2172.5,-1808.5 2172.5,-1808.5 2172.5,-2244.5 2172.5,-2244.5 2172.5,-2250.5 2166.5,-2256.5 2160.5,-2256.5 2160.5,-2256.5 1737.5,-2256.5 1737.5,-2256.5 1731.5,-2256.5 1725.5,-2250.5 1725.5,-2244.5 1725.5,-2244.5 1725.5,-1808.5 1725.5,-1808.5 1725.5,-1802.5 1731.5,-1796.5 1737.5,-1796.5"/>
<text text-anchor="middle" x="1759.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="1793.5,-1796.5 1793.5,-2256.5 "/>
<text text-anchor="middle" x="1804" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1814.5,-1796.5 1814.5,-2256.5 "/>
<text text-anchor="middle" x="1983" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="1814.5,-2233.5 2151.5,-2233.5 "/>
<text text-anchor="middle" x="1983" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1814.5,-2210.5 2151.5,-2210.5 "/>
<text text-anchor="middle" x="1983" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1814.5,-2187.5 2151.5,-2187.5 "/>
<text text-anchor="middle" x="1983" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="1814.5,-2164.5 2151.5,-2164.5 "/>
<text text-anchor="middle" x="1983" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1814.5,-2141.5 2151.5,-2141.5 "/>
<text text-anchor="middle" x="1983" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1814.5,-2118.5 2151.5,-2118.5 "/>
<text text-anchor="middle" x="1983" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1814.5,-2095.5 2151.5,-2095.5 "/>
<text text-anchor="middle" x="1983" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1814.5,-2072.5 2151.5,-2072.5 "/>
<text text-anchor="middle" x="1983" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="1814.5,-2049.5 2151.5,-2049.5 "/>
<text text-anchor="middle" x="1983" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="1814.5,-2026.5 2151.5,-2026.5 "/>
<text text-anchor="middle" x="1983" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1814.5,-2003.5 2151.5,-2003.5 "/>
<text text-anchor="middle" x="1983" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1814.5,-1980.5 2151.5,-1980.5 "/>
<text text-anchor="middle" x="1983" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1814.5,-1957.5 2151.5,-1957.5 "/>
<text text-anchor="middle" x="1983" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1814.5,-1934.5 2151.5,-1934.5 "/>
<text text-anchor="middle" x="1983" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1814.5,-1911.5 2151.5,-1911.5 "/>
<text text-anchor="middle" x="1983" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="1814.5,-1888.5 2151.5,-1888.5 "/>
<text text-anchor="middle" x="1983" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="1814.5,-1865.5 2151.5,-1865.5 "/>
<text text-anchor="middle" x="1983" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1814.5,-1842.5 2151.5,-1842.5 "/>
<text text-anchor="middle" x="1983" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="1814.5,-1819.5 2151.5,-1819.5 "/>
<text text-anchor="middle" x="1983" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="2151.5,-1796.5 2151.5,-2256.5 "/>
<text text-anchor="middle" x="2162" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge5" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2172.5955,-2065.8333C2183.8572,-2056.0642 2190.5,-2042.9531 2190.5,-2026.5 2190.5,-2013.9031 2186.6061,-2003.2652 2179.7267,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="2182.0485,-1991.9513 2172.5955,-1987.1667 2177.0016,-1996.802 2182.0485,-1991.9513"/>
<text text-anchor="middle" x="2206.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge15" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1863.4815,-1796.4747C1838.1877,-1756.0203 1806.1628,-1718.941 1766,-1694 1727.1679,-1669.8854 1400.2888,-1682.1945 1355,-1676 1228.8046,-1658.7392 1085.9286,-1622.608 996.16,-1597.8258"/>
<polygon fill="#000000" stroke="#000000" points="996.8637,-1594.3889 986.292,-1595.0882 994.9924,-1601.1342 996.8637,-1594.3889"/>
<text text-anchor="middle" x="1810" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge33" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1886.618,-1796.3592C1873.7897,-1761.2263 1858.9325,-1726.0332 1842,-1694 1705.6872,-1436.1204 1686.6398,-1330.135 1439,-1176 1408.6705,-1157.1225 1329.511,-1140.8734 1258.5216,-1129.4066"/>
<polygon fill="#000000" stroke="#000000" points="1258.991,-1125.9373 1248.5649,-1127.8206 1257.8898,-1132.8502 1258.991,-1125.9373"/>
<text text-anchor="middle" x="1741" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_therapy -->
<g id="node11" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M2691,-1727.5C2691,-1727.5 3147,-1727.5 3147,-1727.5 3153,-1727.5 3159,-1733.5 3159,-1739.5 3159,-1739.5 3159,-2313.5 3159,-2313.5 3159,-2319.5 3153,-2325.5 3147,-2325.5 3147,-2325.5 2691,-2325.5 2691,-2325.5 2685,-2325.5 2679,-2319.5 2679,-2313.5 2679,-2313.5 2679,-1739.5 2679,-1739.5 2679,-1733.5 2685,-1727.5 2691,-1727.5"/>
<text text-anchor="middle" x="2736.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2794,-1727.5 2794,-2325.5 "/>
<text text-anchor="middle" x="2804.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2815,-1727.5 2815,-2325.5 "/>
<text text-anchor="middle" x="2976.5" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2815,-2302.5 3138,-2302.5 "/>
<text text-anchor="middle" x="2976.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="2815,-2279.5 3138,-2279.5 "/>
<text text-anchor="middle" x="2976.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2815,-2256.5 3138,-2256.5 "/>
<text text-anchor="middle" x="2976.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="2815,-2233.5 3138,-2233.5 "/>
<text text-anchor="middle" x="2976.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="2815,-2210.5 3138,-2210.5 "/>
<text text-anchor="middle" x="2976.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="2815,-2187.5 3138,-2187.5 "/>
<text text-anchor="middle" x="2976.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="2815,-2164.5 3138,-2164.5 "/>
<text text-anchor="middle" x="2976.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="2815,-2141.5 3138,-2141.5 "/>
<text text-anchor="middle" x="2976.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="2815,-2118.5 3138,-2118.5 "/>
<text text-anchor="middle" x="2976.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="2815,-2095.5 3138,-2095.5 "/>
<text text-anchor="middle" x="2976.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="2815,-2072.5 3138,-2072.5 "/>
<text text-anchor="middle" x="2976.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2815,-2049.5 3138,-2049.5 "/>
<text text-anchor="middle" x="2976.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="2815,-2026.5 3138,-2026.5 "/>
<text text-anchor="middle" x="2976.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="2815,-2003.5 3138,-2003.5 "/>
<text text-anchor="middle" x="2976.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="2815,-1980.5 3138,-1980.5 "/>
<text text-anchor="middle" x="2976.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="2815,-1957.5 3138,-1957.5 "/>
<text text-anchor="middle" x="2976.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="2815,-1934.5 3138,-1934.5 "/>
<text text-anchor="middle" x="2976.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2815,-1911.5 3138,-1911.5 "/>
<text text-anchor="middle" x="2976.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2815,-1888.5 3138,-1888.5 "/>
<text text-anchor="middle" x="2976.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2815,-1865.5 3138,-1865.5 "/>
<text text-anchor="middle" x="2976.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2815,-1842.5 3138,-1842.5 "/>
<text text-anchor="middle" x="2976.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="2815,-1819.5 3138,-1819.5 "/>
<text text-anchor="middle" x="2976.5" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="2815,-1796.5 3138,-1796.5 "/>
<text text-anchor="middle" x="2976.5" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="2815,-1773.5 3138,-1773.5 "/>
<text text-anchor="middle" x="2976.5" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2815,-1750.5 3138,-1750.5 "/>
<text text-anchor="middle" x="2976.5" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="3138,-1727.5 3138,-2325.5 "/>
<text text-anchor="middle" x="3148.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge14" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2678.6755,-1734.0904C2675.794,-1731.6904 2672.9019,-1729.3261 2670,-1727 2637.7526,-1701.1514 2600.5102,-1677.8332 2563.4292,-1657.5987"/>
<polygon fill="#000000" stroke="#000000" points="2564.9798,-1654.4584 2554.5168,-1652.7919 2561.6569,-1660.6194 2564.9798,-1654.4584"/>
<text text-anchor="middle" x="2690" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge3" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M3159.2384,-2064.6912C3170.4387,-2055.0507 3177,-2042.3203 3177,-2026.5 3177,-2014.3876 3173.1539,-2004.0864 3166.3244,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="3168.719,-1993.0385 3159.2384,-1988.3088 3163.7002,-1997.9183 3168.719,-1993.0385"/>
<text text-anchor="middle" x="3193" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- program -->
<g id="node17" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M349,-.5C349,-.5 657,-.5 657,-.5 663,-.5 669,-6.5 669,-12.5 669,-12.5 669,-126.5 669,-126.5 669,-132.5 663,-138.5 657,-138.5 657,-138.5 349,-138.5 349,-138.5 343,-138.5 337,-132.5 337,-126.5 337,-126.5 337,-12.5 337,-12.5 337,-6.5 343,-.5 349,-.5"/>
<text text-anchor="middle" x="376" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="415,-.5 415,-138.5 "/>
<text text-anchor="middle" x="425.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="436,-.5 436,-138.5 "/>
<text text-anchor="middle" x="542" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="436,-115.5 648,-115.5 "/>
<text text-anchor="middle" x="542" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="436,-92.5 648,-92.5 "/>
<text text-anchor="middle" x="542" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="436,-69.5 648,-69.5 "/>
<text text-anchor="middle" x="542" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="436,-46.5 648,-46.5 "/>
<text text-anchor="middle" x="542" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="436,-23.5 648,-23.5 "/>
<text text-anchor="middle" x="542" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="648,-.5 648,-138.5 "/>
<text text-anchor="middle" x="658.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge37" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M503,-190.4932C503,-176.7786 503,-162.5421 503,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="506.5001,-148.5183 503,-138.5184 499.5001,-148.5184 506.5001,-148.5183"/>
<text text-anchor="middle" x="543.5" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort -->
<g id="node13" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M204.5,-524.5C204.5,-524.5 437.5,-524.5 437.5,-524.5 443.5,-524.5 449.5,-530.5 449.5,-536.5 449.5,-536.5 449.5,-558.5 449.5,-558.5 449.5,-564.5 443.5,-570.5 437.5,-570.5 437.5,-570.5 204.5,-570.5 204.5,-570.5 198.5,-570.5 192.5,-564.5 192.5,-558.5 192.5,-558.5 192.5,-536.5 192.5,-536.5 192.5,-530.5 198.5,-524.5 204.5,-524.5"/>
<text text-anchor="middle" x="224" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="255.5,-524.5 255.5,-570.5 "/>
<text text-anchor="middle" x="266" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="276.5,-524.5 276.5,-570.5 "/>
<text text-anchor="middle" x="352.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="276.5,-547.5 428.5,-547.5 "/>
<text text-anchor="middle" x="352.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="428.5,-524.5 428.5,-570.5 "/>
<text text-anchor="middle" x="439" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge40" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M449.7713,-528.1037C526.2053,-516.7996 625.0554,-502.5432 713,-491 777.2874,-482.5619 795.9465,-482.6939 863.0949,-473.243"/>
<polygon fill="#000000" stroke="#000000" points="863.9601,-476.6551 873.365,-471.7769 862.9708,-469.7253 863.9601,-476.6551"/>
<text text-anchor="middle" x="753.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge41" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M192.4568,-526.6382C133.4168,-514.1736 72.6052,-496.2134 55,-473 36.2003,-448.2115 36.3675,-427.9144 55,-403 89.9766,-356.2311 227.4419,-320.3006 340.9801,-297.8194"/>
<polygon fill="#000000" stroke="#000000" points="341.7024,-301.2445 350.8435,-295.888 340.3572,-294.375 341.7024,-301.2445"/>
<text text-anchor="middle" x="95.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- principal_investigator -->
<g id="node14" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M157.5,-403.5C157.5,-403.5 484.5,-403.5 484.5,-403.5 490.5,-403.5 496.5,-409.5 496.5,-415.5 496.5,-415.5 496.5,-460.5 496.5,-460.5 496.5,-466.5 490.5,-472.5 484.5,-472.5 484.5,-472.5 157.5,-472.5 157.5,-472.5 151.5,-472.5 145.5,-466.5 145.5,-460.5 145.5,-460.5 145.5,-415.5 145.5,-415.5 145.5,-409.5 151.5,-403.5 157.5,-403.5"/>
<text text-anchor="middle" x="232.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="319.5,-403.5 319.5,-472.5 "/>
<text text-anchor="middle" x="330" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="340.5,-403.5 340.5,-472.5 "/>
<text text-anchor="middle" x="408" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="340.5,-449.5 475.5,-449.5 "/>
<text text-anchor="middle" x="408" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="340.5,-426.5 475.5,-426.5 "/>
<text text-anchor="middle" x="408" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="475.5,-403.5 475.5,-472.5 "/>
<text text-anchor="middle" x="486" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge9" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M358.7105,-403.3975C373.105,-390.1894 390.2461,-374.461 407.601,-358.5364"/>
<polygon fill="#000000" stroke="#000000" points="410.0427,-361.0462 415.0446,-351.7063 405.31,-355.8884 410.0427,-361.0462"/>
<text text-anchor="middle" x="421.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- study_site -->
<g id="node15" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M526.5,-403.5C526.5,-403.5 843.5,-403.5 843.5,-403.5 849.5,-403.5 855.5,-409.5 855.5,-415.5 855.5,-415.5 855.5,-460.5 855.5,-460.5 855.5,-466.5 849.5,-472.5 843.5,-472.5 843.5,-472.5 526.5,-472.5 526.5,-472.5 520.5,-472.5 514.5,-466.5 514.5,-460.5 514.5,-460.5 514.5,-415.5 514.5,-415.5 514.5,-409.5 520.5,-403.5 526.5,-403.5"/>
<text text-anchor="middle" x="559.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="604.5,-403.5 604.5,-472.5 "/>
<text text-anchor="middle" x="615" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="625.5,-403.5 625.5,-472.5 "/>
<text text-anchor="middle" x="730" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="625.5,-449.5 834.5,-449.5 "/>
<text text-anchor="middle" x="730" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="625.5,-426.5 834.5,-426.5 "/>
<text text-anchor="middle" x="730" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="834.5,-403.5 834.5,-472.5 "/>
<text text-anchor="middle" x="845" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge10" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M647.2895,-403.3975C632.895,-390.1894 615.7539,-374.461 598.399,-358.5364"/>
<polygon fill="#000000" stroke="#000000" points="600.69,-355.8884 590.9554,-351.7063 595.9573,-361.0462 600.69,-355.8884"/>
<text text-anchor="middle" x="657.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge1" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M965.0376,-1595.0098C996.1529,-1598.9199 1024.5,-1591.25 1024.5,-1572 1024.5,-1554.8555 1002.0147,-1546.8964 975.1145,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="974.7006,-1544.6454 965.0376,-1548.9902 975.301,-1551.6196 974.7006,-1544.6454"/>
<text text-anchor="middle" x="1040.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge34" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M855.6514,-1548.8139C807.4962,-1523.92 738.4738,-1479.363 708,-1417 687.7066,-1375.4708 679.2574,-1245.1988 708,-1209 743.5227,-1164.2622 886.2055,-1138.1764 995.2959,-1124.4261"/>
<polygon fill="#000000" stroke="#000000" points="995.916,-1127.8762 1005.4103,-1123.1742 995.0561,-1120.9292 995.916,-1127.8762"/>
<text text-anchor="middle" x="735" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- cycle -->
<g id="node25" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M783,-1278.5C783,-1278.5 1011,-1278.5 1011,-1278.5 1017,-1278.5 1023,-1284.5 1023,-1290.5 1023,-1290.5 1023,-1335.5 1023,-1335.5 1023,-1341.5 1017,-1347.5 1011,-1347.5 1011,-1347.5 783,-1347.5 783,-1347.5 777,-1347.5 771,-1341.5 771,-1335.5 771,-1335.5 771,-1290.5 771,-1290.5 771,-1284.5 777,-1278.5 783,-1278.5"/>
<text text-anchor="middle" x="798" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="825,-1278.5 825,-1347.5 "/>
<text text-anchor="middle" x="835.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="846,-1278.5 846,-1347.5 "/>
<text text-anchor="middle" x="924" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="846,-1324.5 1002,-1324.5 "/>
<text text-anchor="middle" x="924" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="846,-1301.5 1002,-1301.5 "/>
<text text-anchor="middle" x="924" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1002,-1278.5 1002,-1347.5 "/>
<text text-anchor="middle" x="1012.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge11" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M906.0949,-1548.5587C904.4328,-1505.5091 900.8686,-1413.1963 898.7288,-1357.7763"/>
<polygon fill="#000000" stroke="#000000" points="902.217,-1357.4013 898.3337,-1347.5438 895.2223,-1357.6714 902.217,-1357.4013"/>
<text text-anchor="middle" x="931.5" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- assay -->
<g id="node18" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1611,-2662.5C1611,-2662.5 1643,-2662.5 1643,-2662.5 1649,-2662.5 1655,-2668.5 1655,-2674.5 1655,-2674.5 1655,-2686.5 1655,-2686.5 1655,-2692.5 1649,-2698.5 1643,-2698.5 1643,-2698.5 1611,-2698.5 1611,-2698.5 1605,-2698.5 1599,-2692.5 1599,-2686.5 1599,-2686.5 1599,-2674.5 1599,-2674.5 1599,-2668.5 1605,-2662.5 1611,-2662.5"/>
<text text-anchor="middle" x="1627" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge28" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1635.9482,-2662.3257C1664.2813,-2604.7796 1754.6618,-2421.2117 1831.0717,-2266.019"/>
<polygon fill="#000000" stroke="#000000" points="1834.3436,-2267.2971 1835.6208,-2256.7795 1828.0635,-2264.205 1834.3436,-2267.2971"/>
<text text-anchor="middle" x="1824.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- image -->
<g id="node19" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1609,-2836C1609,-2836 1645,-2836 1645,-2836 1651,-2836 1657,-2842 1657,-2848 1657,-2848 1657,-2860 1657,-2860 1657,-2866 1651,-2872 1645,-2872 1645,-2872 1609,-2872 1609,-2872 1603,-2872 1597,-2866 1597,-2860 1597,-2860 1597,-2848 1597,-2848 1597,-2842 1603,-2836 1609,-2836"/>
<text text-anchor="middle" x="1627" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge23" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1627,-2835.7604C1627,-2805.5622 1627,-2744.9545 1627,-2709.0457"/>
<polygon fill="#000000" stroke="#000000" points="1630.5001,-2708.7555 1627,-2698.7556 1623.5001,-2708.7556 1630.5001,-2708.7555"/>
<text text-anchor="middle" x="1657.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- adverse_event -->
<g id="node20" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M432.5,-622.5C432.5,-622.5 827.5,-622.5 827.5,-622.5 833.5,-622.5 839.5,-628.5 839.5,-634.5 839.5,-634.5 839.5,-1001.5 839.5,-1001.5 839.5,-1007.5 833.5,-1013.5 827.5,-1013.5 827.5,-1013.5 432.5,-1013.5 432.5,-1013.5 426.5,-1013.5 420.5,-1007.5 420.5,-1001.5 420.5,-1001.5 420.5,-634.5 420.5,-634.5 420.5,-628.5 426.5,-622.5 432.5,-622.5"/>
<text text-anchor="middle" x="480.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="540.5,-622.5 540.5,-1013.5 "/>
<text text-anchor="middle" x="551" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="561.5,-622.5 561.5,-1013.5 "/>
<text text-anchor="middle" x="690" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="561.5,-990.5 818.5,-990.5 "/>
<text text-anchor="middle" x="690" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="561.5,-967.5 818.5,-967.5 "/>
<text text-anchor="middle" x="690" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="561.5,-944.5 818.5,-944.5 "/>
<text text-anchor="middle" x="690" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="561.5,-921.5 818.5,-921.5 "/>
<text text-anchor="middle" x="690" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="561.5,-898.5 818.5,-898.5 "/>
<text text-anchor="middle" x="690" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="561.5,-875.5 818.5,-875.5 "/>
<text text-anchor="middle" x="690" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="561.5,-852.5 818.5,-852.5 "/>
<text text-anchor="middle" x="690" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="561.5,-829.5 818.5,-829.5 "/>
<text text-anchor="middle" x="690" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="561.5,-806.5 818.5,-806.5 "/>
<text text-anchor="middle" x="690" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="561.5,-783.5 818.5,-783.5 "/>
<text text-anchor="middle" x="690" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="561.5,-760.5 818.5,-760.5 "/>
<text text-anchor="middle" x="690" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="561.5,-737.5 818.5,-737.5 "/>
<text text-anchor="middle" x="690" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="561.5,-714.5 818.5,-714.5 "/>
<text text-anchor="middle" x="690" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="561.5,-691.5 818.5,-691.5 "/>
<text text-anchor="middle" x="690" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="561.5,-668.5 818.5,-668.5 "/>
<text text-anchor="middle" x="690" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="561.5,-645.5 818.5,-645.5 "/>
<text text-anchor="middle" x="690" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="818.5,-622.5 818.5,-1013.5 "/>
<text text-anchor="middle" x="829" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge4" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M839.7046,-845.2761C850.876,-838.5862 857.5,-829.4941 857.5,-818 857.5,-809.7386 854.0781,-802.7181 848.0052,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="849.8073,-793.9155 839.7046,-790.7239 845.6119,-799.519 849.8073,-793.9155"/>
<text text-anchor="middle" x="873.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- agent -->
<g id="node22" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M517,-524.5C517,-524.5 743,-524.5 743,-524.5 749,-524.5 755,-530.5 755,-536.5 755,-536.5 755,-558.5 755,-558.5 755,-564.5 749,-570.5 743,-570.5 743,-570.5 517,-570.5 517,-570.5 511,-570.5 505,-564.5 505,-558.5 505,-558.5 505,-536.5 505,-536.5 505,-530.5 511,-524.5 517,-524.5"/>
<text text-anchor="middle" x="533.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="562,-524.5 562,-570.5 "/>
<text text-anchor="middle" x="572.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="583,-524.5 583,-570.5 "/>
<text text-anchor="middle" x="658.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="583,-547.5 734,-547.5 "/>
<text text-anchor="middle" x="658.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="734,-524.5 734,-570.5 "/>
<text text-anchor="middle" x="744.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge25" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M630,-622.4901C630,-606.8636 630,-592.5861 630,-580.7798"/>
<polygon fill="#000000" stroke="#000000" points="633.5001,-580.664 630,-570.6641 626.5001,-580.6641 633.5001,-580.664"/>
<text text-anchor="middle" x="661" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge36" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M839.6222,-981.2313C859.1699,-993.2048 879.1167,-1004.3481 899,-1014 925.5817,-1026.9035 935.3751,-1021.5143 963,-1032 985.1309,-1040.4003 1008.3329,-1050.6803 1030.0898,-1061.024"/>
<polygon fill="#000000" stroke="#000000" points="1028.7888,-1064.2818 1039.3184,-1065.4556 1031.819,-1057.9717 1028.7888,-1064.2818"/>
<text text-anchor="middle" x="1022" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- vital_signs -->
<g id="node21" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M551.5,-1865.5C551.5,-1865.5 838.5,-1865.5 838.5,-1865.5 844.5,-1865.5 850.5,-1871.5 850.5,-1877.5 850.5,-1877.5 850.5,-2175.5 850.5,-2175.5 850.5,-2181.5 844.5,-2187.5 838.5,-2187.5 838.5,-2187.5 551.5,-2187.5 551.5,-2187.5 545.5,-2187.5 539.5,-2181.5 539.5,-2175.5 539.5,-2175.5 539.5,-1877.5 539.5,-1877.5 539.5,-1871.5 545.5,-1865.5 551.5,-1865.5"/>
<text text-anchor="middle" x="586" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="632.5,-1865.5 632.5,-2187.5 "/>
<text text-anchor="middle" x="643" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="653.5,-1865.5 653.5,-2187.5 "/>
<text text-anchor="middle" x="741.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="653.5,-2164.5 829.5,-2164.5 "/>
<text text-anchor="middle" x="741.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="653.5,-2141.5 829.5,-2141.5 "/>
<text text-anchor="middle" x="741.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="653.5,-2118.5 829.5,-2118.5 "/>
<text text-anchor="middle" x="741.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="653.5,-2095.5 829.5,-2095.5 "/>
<text text-anchor="middle" x="741.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="653.5,-2072.5 829.5,-2072.5 "/>
<text text-anchor="middle" x="741.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="653.5,-2049.5 829.5,-2049.5 "/>
<text text-anchor="middle" x="741.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="653.5,-2026.5 829.5,-2026.5 "/>
<text text-anchor="middle" x="741.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="653.5,-2003.5 829.5,-2003.5 "/>
<text text-anchor="middle" x="741.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="653.5,-1980.5 829.5,-1980.5 "/>
<text text-anchor="middle" x="741.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="653.5,-1957.5 829.5,-1957.5 "/>
<text text-anchor="middle" x="741.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="653.5,-1934.5 829.5,-1934.5 "/>
<text text-anchor="middle" x="741.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="653.5,-1911.5 829.5,-1911.5 "/>
<text text-anchor="middle" x="741.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="653.5,-1888.5 829.5,-1888.5 "/>
<text text-anchor="middle" x="741.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="829.5,-1865.5 829.5,-2187.5 "/>
<text text-anchor="middle" x="840" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge16" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M768.5034,-1865.1245C793.5084,-1810.6661 821.7663,-1749.6005 848,-1694 862.3579,-1663.5694 879.0872,-1629.0636 891.0573,-1604.5331"/>
<polygon fill="#000000" stroke="#000000" points="894.3112,-1605.846 895.5559,-1595.3245 888.0216,-1602.7733 894.3112,-1605.846"/>
<text text-anchor="middle" x="876" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge43" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M722.5066,-524.4785C780.0481,-510.1585 855.3576,-491.4167 921.1522,-475.0428"/>
<polygon fill="#000000" stroke="#000000" points="922.3472,-478.3522 931.206,-472.5408 920.6567,-471.5594 922.3472,-478.3522"/>
<text text-anchor="middle" x="898.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge7" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1127,-1065.3178C1127,-1029.5232 1127,-978.3477 1127,-931.8265"/>
<polygon fill="#000000" stroke="#000000" points="1130.5001,-931.669 1127,-921.6691 1123.5001,-931.6691 1130.5001,-931.669"/>
<text text-anchor="middle" x="1181.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge24" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1248.6096,-1067.0086C1284.2163,-1052.0647 1322.5441,-1034.0375 1356,-1014 1402.6386,-986.0671 1450.092,-950.0298 1490.5993,-916.4897"/>
<polygon fill="#000000" stroke="#000000" points="1492.8998,-919.1287 1498.3427,-910.0388 1488.4193,-913.7505 1492.8998,-919.1287"/>
<text text-anchor="middle" x="1391" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge38" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1248.8118,-1103.1295C1442.8202,-1088.6061 1804.3832,-1056.2043 1845,-1014 1905.6882,-950.9398 1864,-905.5195 1864,-818 1864,-818 1864,-818 1864,-438 1864,-318.4544 1026.077,-283.694 665.1745,-274.2666"/>
<polygon fill="#000000" stroke="#000000" points="665.2493,-270.7675 655.1624,-274.0084 665.0688,-277.7651 665.2493,-270.7675"/>
<text text-anchor="middle" x="1904.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge39" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1005.4925,-1105.2735C793.5453,-1093.1714 374.45,-1063.2536 330,-1014 218.3961,-890.3353 280.284,-664.3303 308.9515,-580.198"/>
<polygon fill="#000000" stroke="#000000" points="312.2903,-581.2526 312.269,-570.6577 305.6786,-578.9534 312.2903,-581.2526"/>
<text text-anchor="middle" x="370.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge21" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1005.2563,-1093.6556C935.3322,-1081.8368 855.5026,-1065.1979 825,-1047 811.8491,-1039.1542 799.1522,-1030.1007 786.9779,-1020.2194"/>
<polygon fill="#000000" stroke="#000000" points="788.9751,-1017.3275 779.0536,-1013.6107 784.4917,-1022.7034 788.9751,-1017.3275"/>
<text text-anchor="middle" x="894" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- lab_exam -->
<g id="node24" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M881,-2008.5C881,-2008.5 941,-2008.5 941,-2008.5 947,-2008.5 953,-2014.5 953,-2020.5 953,-2020.5 953,-2032.5 953,-2032.5 953,-2038.5 947,-2044.5 941,-2044.5 941,-2044.5 881,-2044.5 881,-2044.5 875,-2044.5 869,-2038.5 869,-2032.5 869,-2032.5 869,-2020.5 869,-2020.5 869,-2014.5 875,-2008.5 881,-2008.5"/>
<text text-anchor="middle" x="911" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge17" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M910.8407,-2008.4026C910.2368,-1939.7859 908.0827,-1695.0179 907.2929,-1605.2848"/>
<polygon fill="#000000" stroke="#000000" points="910.7916,-1605.1014 907.2036,-1595.1326 903.7918,-1605.163 910.7916,-1605.1014"/>
<text text-anchor="middle" x="936" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge31" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M936.5384,-1278.3609C972.3285,-1247.0057 1025.5774,-1200.355 1066.6799,-1164.3457"/>
<polygon fill="#000000" stroke="#000000" points="1068.991,-1166.9742 1074.2063,-1157.7519 1064.3782,-1161.709 1068.991,-1166.9742"/>
<text text-anchor="middle" x="1079" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- follow_up -->
<g id="node26" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1053,-1209.5C1053,-1209.5 1385,-1209.5 1385,-1209.5 1391,-1209.5 1397,-1215.5 1397,-1221.5 1397,-1221.5 1397,-1404.5 1397,-1404.5 1397,-1410.5 1391,-1416.5 1385,-1416.5 1385,-1416.5 1053,-1416.5 1053,-1416.5 1047,-1416.5 1041,-1410.5 1041,-1404.5 1041,-1404.5 1041,-1221.5 1041,-1221.5 1041,-1215.5 1047,-1209.5 1053,-1209.5"/>
<text text-anchor="middle" x="1083.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="1126,-1209.5 1126,-1416.5 "/>
<text text-anchor="middle" x="1136.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1147,-1209.5 1147,-1416.5 "/>
<text text-anchor="middle" x="1261.5" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="1147,-1393.5 1376,-1393.5 "/>
<text text-anchor="middle" x="1261.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="1147,-1370.5 1376,-1370.5 "/>
<text text-anchor="middle" x="1261.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1147,-1347.5 1376,-1347.5 "/>
<text text-anchor="middle" x="1261.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="1147,-1324.5 1376,-1324.5 "/>
<text text-anchor="middle" x="1261.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="1147,-1301.5 1376,-1301.5 "/>
<text text-anchor="middle" x="1261.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="1147,-1278.5 1376,-1278.5 "/>
<text text-anchor="middle" x="1261.5" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1147,-1255.5 1376,-1255.5 "/>
<text text-anchor="middle" x="1261.5" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="1147,-1232.5 1376,-1232.5 "/>
<text text-anchor="middle" x="1261.5" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="1376,-1209.5 1376,-1416.5 "/>
<text text-anchor="middle" x="1386.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge32" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1171.6525,-1209.2987C1164.992,-1194.7106 1158.3691,-1180.2051 1152.3431,-1167.007"/>
<polygon fill="#000000" stroke="#000000" points="1155.406,-1165.2883 1148.0688,-1157.6452 1149.0383,-1168.1956 1155.406,-1165.2883"/>
<text text-anchor="middle" x="1189" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file -->
<g id="node27" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M1292.5,-2750.5C1292.5,-2750.5 1477.5,-2750.5 1477.5,-2750.5 1483.5,-2750.5 1489.5,-2756.5 1489.5,-2762.5 1489.5,-2762.5 1489.5,-2945.5 1489.5,-2945.5 1489.5,-2951.5 1483.5,-2957.5 1477.5,-2957.5 1477.5,-2957.5 1292.5,-2957.5 1292.5,-2957.5 1286.5,-2957.5 1280.5,-2951.5 1280.5,-2945.5 1280.5,-2945.5 1280.5,-2762.5 1280.5,-2762.5 1280.5,-2756.5 1286.5,-2750.5 1292.5,-2750.5"/>
<text text-anchor="middle" x="1300" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="1319.5,-2750.5 1319.5,-2957.5 "/>
<text text-anchor="middle" x="1330" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1340.5,-2750.5 1340.5,-2957.5 "/>
<text text-anchor="middle" x="1404.5" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="1340.5,-2934.5 1468.5,-2934.5 "/>
<text text-anchor="middle" x="1404.5" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="1340.5,-2911.5 1468.5,-2911.5 "/>
<text text-anchor="middle" x="1404.5" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="1340.5,-2888.5 1468.5,-2888.5 "/>
<text text-anchor="middle" x="1404.5" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="1340.5,-2865.5 1468.5,-2865.5 "/>
<text text-anchor="middle" x="1404.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="1340.5,-2842.5 1468.5,-2842.5 "/>
<text text-anchor="middle" x="1404.5" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="1340.5,-2819.5 1468.5,-2819.5 "/>
<text text-anchor="middle" x="1404.5" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="1340.5,-2796.5 1468.5,-2796.5 "/>
<text text-anchor="middle" x="1404.5" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="1340.5,-2773.5 1468.5,-2773.5 "/>
<text text-anchor="middle" x="1404.5" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="1468.5,-2750.5 1468.5,-2957.5 "/>
<text text-anchor="middle" x="1479" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge6" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M1373.1961,-2750.3561C1369.7659,-2720.2371 1365.9369,-2686.6169 1362.2102,-2653.8943"/>
<polygon fill="#000000" stroke="#000000" points="1365.6666,-2653.3124 1361.0574,-2643.7727 1358.7116,-2654.1045 1365.6666,-2653.3124"/>
<text text-anchor="middle" x="1424.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge27" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1489.5646,-2792.8196C1520.4376,-2776.8706 1554.8546,-2761.0729 1588,-2750 1632.4923,-2735.1364 1647.4862,-2746.7993 1692,-2732 1773.8591,-2704.7847 1815.0375,-2714.323 1865,-2644 1941.7958,-2535.9087 1964.3141,-2389.7906 1966.9231,-2266.8274"/>
<polygon fill="#000000" stroke="#000000" points="1970.4279,-2266.5708 1967.0967,-2256.5132 1963.4288,-2266.4529 1970.4279,-2266.5708"/>
<text text-anchor="middle" x="1886.5" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge8" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1280.3322,-2851.8674C957.6772,-2843.9192 0,-2809.4654 0,-2680.5 0,-2680.5 0,-2680.5 0,-438 0,-364.9182 193.6703,-318.232 340.6629,-293.3228"/>
<polygon fill="#000000" stroke="#000000" points="341.4332,-296.7426 350.7184,-291.6402 340.2779,-289.8386 341.4332,-296.7426"/>
<text text-anchor="middle" x="30.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge22" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1489.8344,-2768.8072C1513.1267,-2751.0309 1538.0291,-2732.8829 1562,-2717 1570.9117,-2711.0952 1580.8397,-2705.2008 1590.2003,-2699.925"/>
<polygon fill="#000000" stroke="#000000" points="1591.8995,-2702.9849 1598.9494,-2695.076 1588.5062,-2696.8623 1591.8995,-2702.9849"/>
<text text-anchor="middle" x="1592.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- agent_administration -->
<g id="node28" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M40.5,-1785C40.5,-1785 509.5,-1785 509.5,-1785 515.5,-1785 521.5,-1791 521.5,-1797 521.5,-1797 521.5,-2256 521.5,-2256 521.5,-2262 515.5,-2268 509.5,-2268 509.5,-2268 40.5,-2268 40.5,-2268 34.5,-2268 28.5,-2262 28.5,-2256 28.5,-2256 28.5,-1797 28.5,-1797 28.5,-1791 34.5,-1785 40.5,-1785"/>
<text text-anchor="middle" x="113.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="198.5,-1785 198.5,-2268 "/>
<text text-anchor="middle" x="209" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="219.5,-1785 219.5,-2268 "/>
<text text-anchor="middle" x="360" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="219.5,-2245 500.5,-2245 "/>
<text text-anchor="middle" x="360" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="219.5,-2222 500.5,-2222 "/>
<text text-anchor="middle" x="360" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="219.5,-2199 500.5,-2199 "/>
<text text-anchor="middle" x="360" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="219.5,-2176 500.5,-2176 "/>
<text text-anchor="middle" x="360" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="219.5,-2153 500.5,-2153 "/>
<text text-anchor="middle" x="360" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="219.5,-2130 500.5,-2130 "/>
<text text-anchor="middle" x="360" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="219.5,-2107 500.5,-2107 "/>
<text text-anchor="middle" x="360" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="219.5,-2084 500.5,-2084 "/>
<text text-anchor="middle" x="360" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="219.5,-2061 500.5,-2061 "/>
<text text-anchor="middle" x="360" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="219.5,-2038 500.5,-2038 "/>
<text text-anchor="middle" x="360" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="219.5,-2015 500.5,-2015 "/>
<text text-anchor="middle" x="360" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="219.5,-1992 500.5,-1992 "/>
<text text-anchor="middle" x="360" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="219.5,-1969 500.5,-1969 "/>
<text text-anchor="middle" x="360" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="219.5,-1946 500.5,-1946 "/>
<text text-anchor="middle" x="360" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="219.5,-1923 500.5,-1923 "/>
<text text-anchor="middle" x="360" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="219.5,-1900 500.5,-1900 "/>
<text text-anchor="middle" x="360" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="219.5,-1877 500.5,-1877 "/>
<text text-anchor="middle" x="360" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="219.5,-1854 500.5,-1854 "/>
<text text-anchor="middle" x="360" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="219.5,-1831 500.5,-1831 "/>
<text text-anchor="middle" x="360" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="219.5,-1808 500.5,-1808 "/>
<text text-anchor="middle" x="360" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="500.5,-1785 500.5,-2268 "/>
<text text-anchor="middle" x="511" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge18" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M461.8558,-1784.9615C483.5247,-1763.9192 506.3722,-1744.147 530,-1727 615.5829,-1664.8913 729.7009,-1622.4792 809.8844,-1597.9305"/>
<polygon fill="#000000" stroke="#000000" points="810.9319,-1601.2704 819.4904,-1595.0252 808.9054,-1594.5701 810.9319,-1601.2704"/>
<text text-anchor="middle" x="605" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge26" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M275,-1784.729C275,-1715.9856 275,-1641.043 275,-1572 275,-1572 275,-1572 275,-1039.5 275,-853.8401 170.1617,-764.643 289,-622 302.7395,-605.5084 405.7286,-584.4504 494.9644,-568.9327"/>
<polygon fill="#000000" stroke="#000000" points="495.6777,-572.3614 504.9367,-567.2114 494.487,-565.4634 495.6777,-572.3614"/>
<text text-anchor="middle" x="306" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
</g>
</svg>
</div>
