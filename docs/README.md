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
<svg width="4013pt" height="2966pt"
 viewBox="0.00 0.00 4012.59 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 4008.5932,-2962 4008.5932,4 -4,4"/>
<!-- agent_administration -->
<g id="node1" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M2756.5932,-1785C2756.5932,-1785 3225.5932,-1785 3225.5932,-1785 3231.5932,-1785 3237.5932,-1791 3237.5932,-1797 3237.5932,-1797 3237.5932,-2256 3237.5932,-2256 3237.5932,-2262 3231.5932,-2268 3225.5932,-2268 3225.5932,-2268 2756.5932,-2268 2756.5932,-2268 2750.5932,-2268 2744.5932,-2262 2744.5932,-2256 2744.5932,-2256 2744.5932,-1797 2744.5932,-1797 2744.5932,-1791 2750.5932,-1785 2756.5932,-1785"/>
<text text-anchor="middle" x="2829.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="2914.5932,-1785 2914.5932,-2268 "/>
<text text-anchor="middle" x="2925.0932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2935.5932,-1785 2935.5932,-2268 "/>
<text text-anchor="middle" x="3076.0932" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-2245 3216.5932,-2245 "/>
<text text-anchor="middle" x="3076.0932" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-2222 3216.5932,-2222 "/>
<text text-anchor="middle" x="3076.0932" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-2199 3216.5932,-2199 "/>
<text text-anchor="middle" x="3076.0932" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-2176 3216.5932,-2176 "/>
<text text-anchor="middle" x="3076.0932" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-2153 3216.5932,-2153 "/>
<text text-anchor="middle" x="3076.0932" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-2130 3216.5932,-2130 "/>
<text text-anchor="middle" x="3076.0932" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-2107 3216.5932,-2107 "/>
<text text-anchor="middle" x="3076.0932" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-2084 3216.5932,-2084 "/>
<text text-anchor="middle" x="3076.0932" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-2061 3216.5932,-2061 "/>
<text text-anchor="middle" x="3076.0932" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-2038 3216.5932,-2038 "/>
<text text-anchor="middle" x="3076.0932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-2015 3216.5932,-2015 "/>
<text text-anchor="middle" x="3076.0932" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-1992 3216.5932,-1992 "/>
<text text-anchor="middle" x="3076.0932" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-1969 3216.5932,-1969 "/>
<text text-anchor="middle" x="3076.0932" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-1946 3216.5932,-1946 "/>
<text text-anchor="middle" x="3076.0932" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-1923 3216.5932,-1923 "/>
<text text-anchor="middle" x="3076.0932" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-1900 3216.5932,-1900 "/>
<text text-anchor="middle" x="3076.0932" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-1877 3216.5932,-1877 "/>
<text text-anchor="middle" x="3076.0932" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-1854 3216.5932,-1854 "/>
<text text-anchor="middle" x="3076.0932" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-1831 3216.5932,-1831 "/>
<text text-anchor="middle" x="3076.0932" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="2935.5932,-1808 3216.5932,-1808 "/>
<text text-anchor="middle" x="3076.0932" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="3216.5932,-1785 3216.5932,-2268 "/>
<text text-anchor="middle" x="3227.0932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit -->
<g id="node23" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1966.5932,-1549C1966.5932,-1549 2141.5932,-1549 2141.5932,-1549 2147.5932,-1549 2153.5932,-1555 2153.5932,-1561 2153.5932,-1561 2153.5932,-1583 2153.5932,-1583 2153.5932,-1589 2147.5932,-1595 2141.5932,-1595 2141.5932,-1595 1966.5932,-1595 1966.5932,-1595 1960.5932,-1595 1954.5932,-1589 1954.5932,-1583 1954.5932,-1583 1954.5932,-1561 1954.5932,-1561 1954.5932,-1555 1960.5932,-1549 1966.5932,-1549"/>
<text text-anchor="middle" x="1978.0932" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="2001.5932,-1549 2001.5932,-1595 "/>
<text text-anchor="middle" x="2012.0932" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2022.5932,-1549 2022.5932,-1595 "/>
<text text-anchor="middle" x="2077.5932" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="2022.5932,-1572 2132.5932,-1572 "/>
<text text-anchor="middle" x="2077.5932" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="2132.5932,-1549 2132.5932,-1595 "/>
<text text-anchor="middle" x="2143.0932" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge5" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2811.3075,-1784.6654C2787.8584,-1762.9288 2762.6721,-1743.0944 2736.0932,-1727 2640.7334,-1669.2565 2331.2899,-1614.6034 2163.9406,-1588.3159"/>
<polygon fill="#000000" stroke="#000000" points="2164.2862,-1584.8275 2153.8655,-1586.7406 2163.2047,-1591.7434 2164.2862,-1584.8275"/>
<text text-anchor="middle" x="2724.0932" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent -->
<g id="node24" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M2674.0932,-524.5C2674.0932,-524.5 2900.0932,-524.5 2900.0932,-524.5 2906.0932,-524.5 2912.0932,-530.5 2912.0932,-536.5 2912.0932,-536.5 2912.0932,-558.5 2912.0932,-558.5 2912.0932,-564.5 2906.0932,-570.5 2900.0932,-570.5 2900.0932,-570.5 2674.0932,-570.5 2674.0932,-570.5 2668.0932,-570.5 2662.0932,-564.5 2662.0932,-558.5 2662.0932,-558.5 2662.0932,-536.5 2662.0932,-536.5 2662.0932,-530.5 2668.0932,-524.5 2674.0932,-524.5"/>
<text text-anchor="middle" x="2690.5932" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="2719.0932,-524.5 2719.0932,-570.5 "/>
<text text-anchor="middle" x="2729.5932" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2740.0932,-524.5 2740.0932,-570.5 "/>
<text text-anchor="middle" x="2815.5932" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2740.0932,-547.5 2891.0932,-547.5 "/>
<text text-anchor="middle" x="2815.5932" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2891.0932,-524.5 2891.0932,-570.5 "/>
<text text-anchor="middle" x="2901.5932" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge21" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2991.8226,-1784.7292C2991.9764,-1715.9858 2992.0932,-1641.0431 2992.0932,-1572 2992.0932,-1572 2992.0932,-1572 2992.0932,-1039.5 2992.0932,-853.8401 3085.3943,-773.5126 2978.0932,-622 2962.9536,-600.6224 2940.7327,-585.3791 2916.7533,-574.5097"/>
<polygon fill="#000000" stroke="#000000" points="2918.0592,-571.2617 2907.488,-570.5545 2915.3109,-577.6996 2918.0592,-571.2617"/>
<text text-anchor="middle" x="3023.0932" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- case -->
<g id="node2" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1911.5932,-1065.5C1911.5932,-1065.5 2130.5932,-1065.5 2130.5932,-1065.5 2136.5932,-1065.5 2142.5932,-1071.5 2142.5932,-1077.5 2142.5932,-1077.5 2142.5932,-1145.5 2142.5932,-1145.5 2142.5932,-1151.5 2136.5932,-1157.5 2130.5932,-1157.5 2130.5932,-1157.5 1911.5932,-1157.5 1911.5932,-1157.5 1905.5932,-1157.5 1899.5932,-1151.5 1899.5932,-1145.5 1899.5932,-1145.5 1899.5932,-1077.5 1899.5932,-1077.5 1899.5932,-1071.5 1905.5932,-1065.5 1911.5932,-1065.5"/>
<text text-anchor="middle" x="1924.0932" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1948.5932,-1065.5 1948.5932,-1157.5 "/>
<text text-anchor="middle" x="1959.0932" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1969.5932,-1065.5 1969.5932,-1157.5 "/>
<text text-anchor="middle" x="2045.5932" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1969.5932,-1134.5 2121.5932,-1134.5 "/>
<text text-anchor="middle" x="2045.5932" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1969.5932,-1111.5 2121.5932,-1111.5 "/>
<text text-anchor="middle" x="2045.5932" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1969.5932,-1088.5 2121.5932,-1088.5 "/>
<text text-anchor="middle" x="2045.5932" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="2121.5932,-1065.5 2121.5932,-1157.5 "/>
<text text-anchor="middle" x="2132.0932" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- off_study -->
<g id="node9" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M1405.5932,-714.5C1405.5932,-714.5 1820.5932,-714.5 1820.5932,-714.5 1826.5932,-714.5 1832.5932,-720.5 1832.5932,-726.5 1832.5932,-726.5 1832.5932,-909.5 1832.5932,-909.5 1832.5932,-915.5 1826.5932,-921.5 1820.5932,-921.5 1820.5932,-921.5 1405.5932,-921.5 1405.5932,-921.5 1399.5932,-921.5 1393.5932,-915.5 1393.5932,-909.5 1393.5932,-909.5 1393.5932,-726.5 1393.5932,-726.5 1393.5932,-720.5 1399.5932,-714.5 1405.5932,-714.5"/>
<text text-anchor="middle" x="1435.0932" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="1476.5932,-714.5 1476.5932,-921.5 "/>
<text text-anchor="middle" x="1487.0932" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1497.5932,-714.5 1497.5932,-921.5 "/>
<text text-anchor="middle" x="1654.5932" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1497.5932,-898.5 1811.5932,-898.5 "/>
<text text-anchor="middle" x="1654.5932" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="1497.5932,-875.5 1811.5932,-875.5 "/>
<text text-anchor="middle" x="1654.5932" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1497.5932,-852.5 1811.5932,-852.5 "/>
<text text-anchor="middle" x="1654.5932" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1497.5932,-829.5 1811.5932,-829.5 "/>
<text text-anchor="middle" x="1654.5932" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1497.5932,-806.5 1811.5932,-806.5 "/>
<text text-anchor="middle" x="1654.5932" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1497.5932,-783.5 1811.5932,-783.5 "/>
<text text-anchor="middle" x="1654.5932" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1497.5932,-760.5 1811.5932,-760.5 "/>
<text text-anchor="middle" x="1654.5932" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="1497.5932,-737.5 1811.5932,-737.5 "/>
<text text-anchor="middle" x="1654.5932" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1811.5932,-714.5 1811.5932,-921.5 "/>
<text text-anchor="middle" x="1822.0932" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge12" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1899.2606,-1093.9083C1834.8405,-1082.6444 1763.8642,-1066.4945 1738.0932,-1047 1699.4754,-1017.7876 1671.3124,-973.0381 1651.607,-930.8224"/>
<polygon fill="#000000" stroke="#000000" points="1654.7293,-929.2332 1647.4051,-921.5777 1648.3567,-932.1297 1654.7293,-929.2332"/>
<text text-anchor="middle" x="1792.5932" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- cohort -->
<g id="node14" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M2942.5932,-524.5C2942.5932,-524.5 3175.5932,-524.5 3175.5932,-524.5 3181.5932,-524.5 3187.5932,-530.5 3187.5932,-536.5 3187.5932,-536.5 3187.5932,-558.5 3187.5932,-558.5 3187.5932,-564.5 3181.5932,-570.5 3175.5932,-570.5 3175.5932,-570.5 2942.5932,-570.5 2942.5932,-570.5 2936.5932,-570.5 2930.5932,-564.5 2930.5932,-558.5 2930.5932,-558.5 2930.5932,-536.5 2930.5932,-536.5 2930.5932,-530.5 2936.5932,-524.5 2942.5932,-524.5"/>
<text text-anchor="middle" x="2962.0932" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="2993.5932,-524.5 2993.5932,-570.5 "/>
<text text-anchor="middle" x="3004.0932" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3014.5932,-524.5 3014.5932,-570.5 "/>
<text text-anchor="middle" x="3090.5932" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="3014.5932,-547.5 3166.5932,-547.5 "/>
<text text-anchor="middle" x="3090.5932" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="3166.5932,-524.5 3166.5932,-570.5 "/>
<text text-anchor="middle" x="3177.0932" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge24" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M2142.7146,-1103.9794C2360.5714,-1089.5375 2799.9769,-1055.6328 2856.0932,-1014 3002.6676,-905.2562 3044.8798,-668.1344 3055.7097,-580.7229"/>
<polygon fill="#000000" stroke="#000000" points="3059.2096,-580.9282 3056.9063,-570.5868 3052.2579,-580.1075 3059.2096,-580.9282"/>
<text text-anchor="middle" x="3089.5932" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_treatment -->
<g id="node15" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M2387.5932,-726C2387.5932,-726 2834.5932,-726 2834.5932,-726 2840.5932,-726 2846.5932,-732 2846.5932,-738 2846.5932,-738 2846.5932,-898 2846.5932,-898 2846.5932,-904 2840.5932,-910 2834.5932,-910 2834.5932,-910 2387.5932,-910 2387.5932,-910 2381.5932,-910 2375.5932,-904 2375.5932,-898 2375.5932,-898 2375.5932,-738 2375.5932,-738 2375.5932,-732 2381.5932,-726 2387.5932,-726"/>
<text text-anchor="middle" x="2433.0932" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="2490.5932,-726 2490.5932,-910 "/>
<text text-anchor="middle" x="2501.0932" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2511.5932,-726 2511.5932,-910 "/>
<text text-anchor="middle" x="2668.5932" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2511.5932,-887 2825.5932,-887 "/>
<text text-anchor="middle" x="2668.5932" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2511.5932,-864 2825.5932,-864 "/>
<text text-anchor="middle" x="2668.5932" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2511.5932,-841 2825.5932,-841 "/>
<text text-anchor="middle" x="2668.5932" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2511.5932,-818 2825.5932,-818 "/>
<text text-anchor="middle" x="2668.5932" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2511.5932,-795 2825.5932,-795 "/>
<text text-anchor="middle" x="2668.5932" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2511.5932,-772 2825.5932,-772 "/>
<text text-anchor="middle" x="2668.5932" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2511.5932,-749 2825.5932,-749 "/>
<text text-anchor="middle" x="2668.5932" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2825.5932,-726 2825.5932,-910 "/>
<text text-anchor="middle" x="2836.0932" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge28" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M2142.8518,-1089.739C2211.2672,-1074.4814 2296.7727,-1050.2264 2367.0932,-1014 2416.8957,-988.3436 2466.1613,-951.5604 2507.244,-916.7748"/>
<polygon fill="#000000" stroke="#000000" points="2509.7536,-919.2342 2515.0832,-910.0775 2505.2066,-913.912 2509.7536,-919.2342"/>
<text text-anchor="middle" x="2393.0932" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- study -->
<g id="node17" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M3071.0932,-190.5C3071.0932,-190.5 3351.0932,-190.5 3351.0932,-190.5 3357.0932,-190.5 3363.0932,-196.5 3363.0932,-202.5 3363.0932,-202.5 3363.0932,-339.5 3363.0932,-339.5 3363.0932,-345.5 3357.0932,-351.5 3351.0932,-351.5 3351.0932,-351.5 3071.0932,-351.5 3071.0932,-351.5 3065.0932,-351.5 3059.0932,-345.5 3059.0932,-339.5 3059.0932,-339.5 3059.0932,-202.5 3059.0932,-202.5 3059.0932,-196.5 3065.0932,-190.5 3071.0932,-190.5"/>
<text text-anchor="middle" x="3087.0932" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="3115.0932,-190.5 3115.0932,-351.5 "/>
<text text-anchor="middle" x="3125.5932" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3136.0932,-190.5 3136.0932,-351.5 "/>
<text text-anchor="middle" x="3239.0932" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="3136.0932,-328.5 3342.0932,-328.5 "/>
<text text-anchor="middle" x="3239.0932" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="3136.0932,-305.5 3342.0932,-305.5 "/>
<text text-anchor="middle" x="3239.0932" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="3136.0932,-282.5 3342.0932,-282.5 "/>
<text text-anchor="middle" x="3239.0932" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="3136.0932,-259.5 3342.0932,-259.5 "/>
<text text-anchor="middle" x="3239.0932" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="3136.0932,-236.5 3342.0932,-236.5 "/>
<text text-anchor="middle" x="3239.0932" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="3136.0932,-213.5 3342.0932,-213.5 "/>
<text text-anchor="middle" x="3239.0932" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="3342.0932,-190.5 3342.0932,-351.5 "/>
<text text-anchor="middle" x="3352.5932" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge23" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1929.5341,-1065.4594C1910.2188,-1051.5323 1892.0793,-1034.3998 1880.0932,-1014 1835.757,-938.5417 1861.0932,-905.5195 1861.0932,-818 1861.0932,-818 1861.0932,-818 1861.0932,-438 1861.0932,-319.5816 2689.7869,-284.2086 3048.6377,-274.4423"/>
<polygon fill="#000000" stroke="#000000" points="3048.9529,-277.9352 3058.8553,-274.1677 3048.7648,-270.9377 3048.9529,-277.9352"/>
<text text-anchor="middle" x="1901.5932" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- adverse_event -->
<g id="node26" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1900.5932,-622.5C1900.5932,-622.5 2295.5932,-622.5 2295.5932,-622.5 2301.5932,-622.5 2307.5932,-628.5 2307.5932,-634.5 2307.5932,-634.5 2307.5932,-1001.5 2307.5932,-1001.5 2307.5932,-1007.5 2301.5932,-1013.5 2295.5932,-1013.5 2295.5932,-1013.5 1900.5932,-1013.5 1900.5932,-1013.5 1894.5932,-1013.5 1888.5932,-1007.5 1888.5932,-1001.5 1888.5932,-1001.5 1888.5932,-634.5 1888.5932,-634.5 1888.5932,-628.5 1894.5932,-622.5 1900.5932,-622.5"/>
<text text-anchor="middle" x="1948.5932" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="2008.5932,-622.5 2008.5932,-1013.5 "/>
<text text-anchor="middle" x="2019.0932" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2029.5932,-622.5 2029.5932,-1013.5 "/>
<text text-anchor="middle" x="2158.0932" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-990.5 2286.5932,-990.5 "/>
<text text-anchor="middle" x="2158.0932" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-967.5 2286.5932,-967.5 "/>
<text text-anchor="middle" x="2158.0932" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-944.5 2286.5932,-944.5 "/>
<text text-anchor="middle" x="2158.0932" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-921.5 2286.5932,-921.5 "/>
<text text-anchor="middle" x="2158.0932" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-898.5 2286.5932,-898.5 "/>
<text text-anchor="middle" x="2158.0932" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-875.5 2286.5932,-875.5 "/>
<text text-anchor="middle" x="2158.0932" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-852.5 2286.5932,-852.5 "/>
<text text-anchor="middle" x="2158.0932" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-829.5 2286.5932,-829.5 "/>
<text text-anchor="middle" x="2158.0932" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-806.5 2286.5932,-806.5 "/>
<text text-anchor="middle" x="2158.0932" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-783.5 2286.5932,-783.5 "/>
<text text-anchor="middle" x="2158.0932" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-760.5 2286.5932,-760.5 "/>
<text text-anchor="middle" x="2158.0932" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-737.5 2286.5932,-737.5 "/>
<text text-anchor="middle" x="2158.0932" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-714.5 2286.5932,-714.5 "/>
<text text-anchor="middle" x="2158.0932" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-691.5 2286.5932,-691.5 "/>
<text text-anchor="middle" x="2158.0932" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-668.5 2286.5932,-668.5 "/>
<text text-anchor="middle" x="2158.0932" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="2029.5932,-645.5 2286.5932,-645.5 "/>
<text text-anchor="middle" x="2158.0932" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="2286.5932,-622.5 2286.5932,-1013.5 "/>
<text text-anchor="middle" x="2297.0932" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge43" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2065.8148,-1065.4575C2069.8318,-1059.5721 2073.3939,-1053.3682 2076.0932,-1047 2079.3069,-1039.4185 2082.1456,-1031.5728 2084.6489,-1023.5548"/>
<polygon fill="#000000" stroke="#000000" points="2088.0847,-1024.2759 2087.5387,-1013.6951 2081.3673,-1022.307 2088.0847,-1024.2759"/>
<text text-anchor="middle" x="2149.0932" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- physical_exam -->
<g id="node3" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1094.0932,-1934.5C1094.0932,-1934.5 1410.0932,-1934.5 1410.0932,-1934.5 1416.0932,-1934.5 1422.0932,-1940.5 1422.0932,-1946.5 1422.0932,-1946.5 1422.0932,-2106.5 1422.0932,-2106.5 1422.0932,-2112.5 1416.0932,-2118.5 1410.0932,-2118.5 1410.0932,-2118.5 1094.0932,-2118.5 1094.0932,-2118.5 1088.0932,-2118.5 1082.0932,-2112.5 1082.0932,-2106.5 1082.0932,-2106.5 1082.0932,-1946.5 1082.0932,-1946.5 1082.0932,-1940.5 1088.0932,-1934.5 1094.0932,-1934.5"/>
<text text-anchor="middle" x="1143.0932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1204.0932,-1934.5 1204.0932,-2118.5 "/>
<text text-anchor="middle" x="1214.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1225.0932,-1934.5 1225.0932,-2118.5 "/>
<text text-anchor="middle" x="1313.0932" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1225.0932,-2095.5 1401.0932,-2095.5 "/>
<text text-anchor="middle" x="1313.0932" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1225.0932,-2072.5 1401.0932,-2072.5 "/>
<text text-anchor="middle" x="1313.0932" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1225.0932,-2049.5 1401.0932,-2049.5 "/>
<text text-anchor="middle" x="1313.0932" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1225.0932,-2026.5 1401.0932,-2026.5 "/>
<text text-anchor="middle" x="1313.0932" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1225.0932,-2003.5 1401.0932,-2003.5 "/>
<text text-anchor="middle" x="1313.0932" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1225.0932,-1980.5 1401.0932,-1980.5 "/>
<text text-anchor="middle" x="1313.0932" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1225.0932,-1957.5 1401.0932,-1957.5 "/>
<text text-anchor="middle" x="1313.0932" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1401.0932,-1934.5 1401.0932,-2118.5 "/>
<text text-anchor="middle" x="1411.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment -->
<g id="node6" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M828.5932,-1468.5C828.5932,-1468.5 1177.5932,-1468.5 1177.5932,-1468.5 1183.5932,-1468.5 1189.5932,-1474.5 1189.5932,-1480.5 1189.5932,-1480.5 1189.5932,-1663.5 1189.5932,-1663.5 1189.5932,-1669.5 1183.5932,-1675.5 1177.5932,-1675.5 1177.5932,-1675.5 828.5932,-1675.5 828.5932,-1675.5 822.5932,-1675.5 816.5932,-1669.5 816.5932,-1663.5 816.5932,-1663.5 816.5932,-1480.5 816.5932,-1480.5 816.5932,-1474.5 822.5932,-1468.5 828.5932,-1468.5"/>
<text text-anchor="middle" x="864.0932" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="911.5932,-1468.5 911.5932,-1675.5 "/>
<text text-anchor="middle" x="922.0932" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="932.5932,-1468.5 932.5932,-1675.5 "/>
<text text-anchor="middle" x="1050.5932" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="932.5932,-1652.5 1168.5932,-1652.5 "/>
<text text-anchor="middle" x="1050.5932" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="932.5932,-1629.5 1168.5932,-1629.5 "/>
<text text-anchor="middle" x="1050.5932" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="932.5932,-1606.5 1168.5932,-1606.5 "/>
<text text-anchor="middle" x="1050.5932" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="932.5932,-1583.5 1168.5932,-1583.5 "/>
<text text-anchor="middle" x="1050.5932" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="932.5932,-1560.5 1168.5932,-1560.5 "/>
<text text-anchor="middle" x="1050.5932" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="932.5932,-1537.5 1168.5932,-1537.5 "/>
<text text-anchor="middle" x="1050.5932" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="932.5932,-1514.5 1168.5932,-1514.5 "/>
<text text-anchor="middle" x="1050.5932" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="932.5932,-1491.5 1168.5932,-1491.5 "/>
<text text-anchor="middle" x="1050.5932" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1168.5932,-1468.5 1168.5932,-1675.5 "/>
<text text-anchor="middle" x="1179.0932" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge40" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1201.5543,-1934.2514C1161.9972,-1862.0477 1106.8139,-1761.3215 1064.6754,-1684.4061"/>
<polygon fill="#000000" stroke="#000000" points="1067.7375,-1682.7107 1059.8632,-1675.6223 1061.5984,-1686.0741 1067.7375,-1682.7107"/>
<text text-anchor="middle" x="1127.0932" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge4" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1284.8117,-1934.1621C1313.3105,-1866.9139 1361.1436,-1778.8603 1431.0932,-1727 1511.8591,-1667.1206 1788.2063,-1614.6578 1944.3531,-1588.8978"/>
<polygon fill="#000000" stroke="#000000" points="1945.1595,-1592.3124 1954.4611,-1587.2398 1944.0264,-1585.4047 1945.1595,-1592.3124"/>
<text text-anchor="middle" x="1516.0932" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- image -->
<g id="node4" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M2529.0932,-2836C2529.0932,-2836 2565.0932,-2836 2565.0932,-2836 2571.0932,-2836 2577.0932,-2842 2577.0932,-2848 2577.0932,-2848 2577.0932,-2860 2577.0932,-2860 2577.0932,-2866 2571.0932,-2872 2565.0932,-2872 2565.0932,-2872 2529.0932,-2872 2529.0932,-2872 2523.0932,-2872 2517.0932,-2866 2517.0932,-2860 2517.0932,-2860 2517.0932,-2848 2517.0932,-2848 2517.0932,-2842 2523.0932,-2836 2529.0932,-2836"/>
<text text-anchor="middle" x="2547.0932" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node8" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M2497.0932,-2662.5C2497.0932,-2662.5 2529.0932,-2662.5 2529.0932,-2662.5 2535.0932,-2662.5 2541.0932,-2668.5 2541.0932,-2674.5 2541.0932,-2674.5 2541.0932,-2686.5 2541.0932,-2686.5 2541.0932,-2692.5 2535.0932,-2698.5 2529.0932,-2698.5 2529.0932,-2698.5 2497.0932,-2698.5 2497.0932,-2698.5 2491.0932,-2698.5 2485.0932,-2692.5 2485.0932,-2686.5 2485.0932,-2686.5 2485.0932,-2674.5 2485.0932,-2674.5 2485.0932,-2668.5 2491.0932,-2662.5 2497.0932,-2662.5"/>
<text text-anchor="middle" x="2513.0932" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge38" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2543.5189,-2835.7604C2537.5756,-2805.4321 2525.6215,-2744.4314 2518.5964,-2708.5827"/>
<polygon fill="#000000" stroke="#000000" points="2522.0285,-2707.8958 2516.6707,-2698.7556 2515.1591,-2709.242 2522.0285,-2707.8958"/>
<text text-anchor="middle" x="2553.5932" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- disease_extent -->
<g id="node5" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M1452.0932,-1877C1452.0932,-1877 1768.0932,-1877 1768.0932,-1877 1774.0932,-1877 1780.0932,-1883 1780.0932,-1889 1780.0932,-1889 1780.0932,-2164 1780.0932,-2164 1780.0932,-2170 1774.0932,-2176 1768.0932,-2176 1768.0932,-2176 1452.0932,-2176 1452.0932,-2176 1446.0932,-2176 1440.0932,-2170 1440.0932,-2164 1440.0932,-2164 1440.0932,-1889 1440.0932,-1889 1440.0932,-1883 1446.0932,-1877 1452.0932,-1877"/>
<text text-anchor="middle" x="1501.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="1563.0932,-1877 1563.0932,-2176 "/>
<text text-anchor="middle" x="1573.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1584.0932,-1877 1584.0932,-2176 "/>
<text text-anchor="middle" x="1671.5932" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="1584.0932,-2153 1759.0932,-2153 "/>
<text text-anchor="middle" x="1671.5932" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="1584.0932,-2130 1759.0932,-2130 "/>
<text text-anchor="middle" x="1671.5932" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="1584.0932,-2107 1759.0932,-2107 "/>
<text text-anchor="middle" x="1671.5932" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="1584.0932,-2084 1759.0932,-2084 "/>
<text text-anchor="middle" x="1671.5932" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="1584.0932,-2061 1759.0932,-2061 "/>
<text text-anchor="middle" x="1671.5932" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="1584.0932,-2038 1759.0932,-2038 "/>
<text text-anchor="middle" x="1671.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="1584.0932,-2015 1759.0932,-2015 "/>
<text text-anchor="middle" x="1671.5932" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="1584.0932,-1992 1759.0932,-1992 "/>
<text text-anchor="middle" x="1671.5932" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="1584.0932,-1969 1759.0932,-1969 "/>
<text text-anchor="middle" x="1671.5932" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="1584.0932,-1946 1759.0932,-1946 "/>
<text text-anchor="middle" x="1671.5932" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="1584.0932,-1923 1759.0932,-1923 "/>
<text text-anchor="middle" x="1671.5932" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="1584.0932,-1900 1759.0932,-1900 "/>
<text text-anchor="middle" x="1671.5932" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1759.0932,-1877 1759.0932,-2176 "/>
<text text-anchor="middle" x="1769.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge1" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1680.3847,-1876.9227C1709.2552,-1825.4991 1746.0828,-1770.0845 1789.0932,-1727 1846.5216,-1669.4727 1929.5756,-1625.4775 1987.341,-1599.308"/>
<polygon fill="#000000" stroke="#000000" points="1989.0438,-1602.3806 1996.7445,-1595.1039 1986.1868,-1595.9902 1989.0438,-1602.3806"/>
<text text-anchor="middle" x="1848.0932" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge35" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1189.8623,-1560.2359C1400.5049,-1542.9553 1724.7478,-1502.9297 1809.0932,-1417 1874.813,-1350.0457 1790.7231,-1285.4583 1845.0932,-1209 1858.054,-1190.7738 1875.5406,-1175.5657 1894.4784,-1163.0061"/>
<polygon fill="#000000" stroke="#000000" points="1896.4126,-1165.9239 1902.9712,-1157.6032 1892.6552,-1160.0178 1896.4126,-1165.9239"/>
<text text-anchor="middle" x="1872.0932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample -->
<g id="node7" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M2241.5932,-1796.5C2241.5932,-1796.5 2664.5932,-1796.5 2664.5932,-1796.5 2670.5932,-1796.5 2676.5932,-1802.5 2676.5932,-1808.5 2676.5932,-1808.5 2676.5932,-2244.5 2676.5932,-2244.5 2676.5932,-2250.5 2670.5932,-2256.5 2664.5932,-2256.5 2664.5932,-2256.5 2241.5932,-2256.5 2241.5932,-2256.5 2235.5932,-2256.5 2229.5932,-2250.5 2229.5932,-2244.5 2229.5932,-2244.5 2229.5932,-1808.5 2229.5932,-1808.5 2229.5932,-1802.5 2235.5932,-1796.5 2241.5932,-1796.5"/>
<text text-anchor="middle" x="2263.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="2297.5932,-1796.5 2297.5932,-2256.5 "/>
<text text-anchor="middle" x="2308.0932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2318.5932,-1796.5 2318.5932,-2256.5 "/>
<text text-anchor="middle" x="2487.0932" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-2233.5 2655.5932,-2233.5 "/>
<text text-anchor="middle" x="2487.0932" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-2210.5 2655.5932,-2210.5 "/>
<text text-anchor="middle" x="2487.0932" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-2187.5 2655.5932,-2187.5 "/>
<text text-anchor="middle" x="2487.0932" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-2164.5 2655.5932,-2164.5 "/>
<text text-anchor="middle" x="2487.0932" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-2141.5 2655.5932,-2141.5 "/>
<text text-anchor="middle" x="2487.0932" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-2118.5 2655.5932,-2118.5 "/>
<text text-anchor="middle" x="2487.0932" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-2095.5 2655.5932,-2095.5 "/>
<text text-anchor="middle" x="2487.0932" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-2072.5 2655.5932,-2072.5 "/>
<text text-anchor="middle" x="2487.0932" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-2049.5 2655.5932,-2049.5 "/>
<text text-anchor="middle" x="2487.0932" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-2026.5 2655.5932,-2026.5 "/>
<text text-anchor="middle" x="2487.0932" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-2003.5 2655.5932,-2003.5 "/>
<text text-anchor="middle" x="2487.0932" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-1980.5 2655.5932,-1980.5 "/>
<text text-anchor="middle" x="2487.0932" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-1957.5 2655.5932,-1957.5 "/>
<text text-anchor="middle" x="2487.0932" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-1934.5 2655.5932,-1934.5 "/>
<text text-anchor="middle" x="2487.0932" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-1911.5 2655.5932,-1911.5 "/>
<text text-anchor="middle" x="2487.0932" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-1888.5 2655.5932,-1888.5 "/>
<text text-anchor="middle" x="2487.0932" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-1865.5 2655.5932,-1865.5 "/>
<text text-anchor="middle" x="2487.0932" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-1842.5 2655.5932,-1842.5 "/>
<text text-anchor="middle" x="2487.0932" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="2318.5932,-1819.5 2655.5932,-1819.5 "/>
<text text-anchor="middle" x="2487.0932" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="2655.5932,-1796.5 2655.5932,-2256.5 "/>
<text text-anchor="middle" x="2666.0932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge32" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2455.3751,-1796.2871C2444.8302,-1614.8229 2401.2489,-1366.8727 2254.0932,-1209 2226.7368,-1179.6514 2189.1719,-1158.8269 2152.19,-1144.1824"/>
<polygon fill="#000000" stroke="#000000" points="2153.3974,-1140.897 2142.807,-1140.591 2150.8951,-1147.4345 2153.3974,-1140.897"/>
<text text-anchor="middle" x="2418.0932" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge11" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2676.6887,-2065.8333C2687.9504,-2056.0642 2694.5932,-2042.9531 2694.5932,-2026.5 2694.5932,-2013.9031 2690.6993,-2003.2652 2683.8199,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="2686.1417,-1991.9513 2676.6887,-1987.1667 2681.0948,-1996.802 2686.1417,-1991.9513"/>
<text text-anchor="middle" x="2710.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge6" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2281.1165,-1796.4145C2261.4145,-1772.5155 2241.1801,-1748.9608 2221.0932,-1727 2178.7048,-1680.6572 2124.6586,-1632.1775 2089.7197,-1602.0372"/>
<polygon fill="#000000" stroke="#000000" points="2091.568,-1599.0111 2081.7009,-1595.1524 2087.0081,-1604.3221 2091.568,-1599.0111"/>
<text text-anchor="middle" x="2227.0932" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge13" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2511.4258,-2662.3257C2506.1569,-2604.8942 2489.3723,-2421.9425 2475.1525,-2266.9467"/>
<polygon fill="#000000" stroke="#000000" points="2478.6188,-2266.4179 2474.2198,-2256.7795 2471.6481,-2267.0575 2478.6188,-2266.4179"/>
<text text-anchor="middle" x="2544.5932" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- prior_surgery -->
<g id="node10" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M656.0932,-1946C656.0932,-1946 1002.0932,-1946 1002.0932,-1946 1008.0932,-1946 1014.0932,-1952 1014.0932,-1958 1014.0932,-1958 1014.0932,-2095 1014.0932,-2095 1014.0932,-2101 1008.0932,-2107 1002.0932,-2107 1002.0932,-2107 656.0932,-2107 656.0932,-2107 650.0932,-2107 644.0932,-2101 644.0932,-2095 644.0932,-2095 644.0932,-1958 644.0932,-1958 644.0932,-1952 650.0932,-1946 656.0932,-1946"/>
<text text-anchor="middle" x="701.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="759.0932,-1946 759.0932,-2107 "/>
<text text-anchor="middle" x="769.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="780.0932,-1946 780.0932,-2107 "/>
<text text-anchor="middle" x="886.5932" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="780.0932,-2084 993.0932,-2084 "/>
<text text-anchor="middle" x="886.5932" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="780.0932,-2061 993.0932,-2061 "/>
<text text-anchor="middle" x="886.5932" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="780.0932,-2038 993.0932,-2038 "/>
<text text-anchor="middle" x="886.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="780.0932,-2015 993.0932,-2015 "/>
<text text-anchor="middle" x="886.5932" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="780.0932,-1992 993.0932,-1992 "/>
<text text-anchor="middle" x="886.5932" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="780.0932,-1969 993.0932,-1969 "/>
<text text-anchor="middle" x="886.5932" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="993.0932,-1946 993.0932,-2107 "/>
<text text-anchor="middle" x="1003.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge41" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M860.0004,-1945.7682C887.731,-1873.3341 928.7158,-1766.2789 959.7237,-1685.2842"/>
<polygon fill="#000000" stroke="#000000" points="963.1474,-1686.1305 963.4541,-1675.5401 956.61,-1683.6277 963.1474,-1686.1305"/>
<text text-anchor="middle" x="1002.0932" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge8" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M1014.2062,-2068.5585C1025.3839,-2058.5547 1032.0932,-2044.5352 1032.0932,-2026.5 1032.0932,-2012.5509 1028.0797,-2001.004 1021.0894,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="1023.5738,-1989.3911 1014.2062,-1984.4415 1018.4426,-1994.1525 1023.5738,-1989.3911"/>
<text text-anchor="middle" x="1048.0932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- lab_exam -->
<g id="node11" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1810.0932,-2008.5C1810.0932,-2008.5 1870.0932,-2008.5 1870.0932,-2008.5 1876.0932,-2008.5 1882.0932,-2014.5 1882.0932,-2020.5 1882.0932,-2020.5 1882.0932,-2032.5 1882.0932,-2032.5 1882.0932,-2038.5 1876.0932,-2044.5 1870.0932,-2044.5 1870.0932,-2044.5 1810.0932,-2044.5 1810.0932,-2044.5 1804.0932,-2044.5 1798.0932,-2038.5 1798.0932,-2032.5 1798.0932,-2032.5 1798.0932,-2020.5 1798.0932,-2020.5 1798.0932,-2014.5 1804.0932,-2008.5 1810.0932,-2008.5"/>
<text text-anchor="middle" x="1840.0932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge3" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1839.3399,-2008.373C1838.0922,-1959.7062 1839.747,-1823.3551 1891.0932,-1727 1919.3497,-1673.9744 1972.5216,-1628.6972 2010.452,-1601.009"/>
<polygon fill="#000000" stroke="#000000" points="2012.6955,-1603.707 2018.7791,-1595.0329 2008.614,-1598.02 2012.6955,-1603.707"/>
<text text-anchor="middle" x="1939.0932" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- program -->
<g id="node12" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M3057.0932,-.5C3057.0932,-.5 3365.0932,-.5 3365.0932,-.5 3371.0932,-.5 3377.0932,-6.5 3377.0932,-12.5 3377.0932,-12.5 3377.0932,-126.5 3377.0932,-126.5 3377.0932,-132.5 3371.0932,-138.5 3365.0932,-138.5 3365.0932,-138.5 3057.0932,-138.5 3057.0932,-138.5 3051.0932,-138.5 3045.0932,-132.5 3045.0932,-126.5 3045.0932,-126.5 3045.0932,-12.5 3045.0932,-12.5 3045.0932,-6.5 3051.0932,-.5 3057.0932,-.5"/>
<text text-anchor="middle" x="3084.0932" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="3123.0932,-.5 3123.0932,-138.5 "/>
<text text-anchor="middle" x="3133.5932" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3144.0932,-.5 3144.0932,-138.5 "/>
<text text-anchor="middle" x="3250.0932" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="3144.0932,-115.5 3356.0932,-115.5 "/>
<text text-anchor="middle" x="3250.0932" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="3144.0932,-92.5 3356.0932,-92.5 "/>
<text text-anchor="middle" x="3250.0932" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="3144.0932,-69.5 3356.0932,-69.5 "/>
<text text-anchor="middle" x="3250.0932" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="3144.0932,-46.5 3356.0932,-46.5 "/>
<text text-anchor="middle" x="3250.0932" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="3144.0932,-23.5 3356.0932,-23.5 "/>
<text text-anchor="middle" x="3250.0932" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="3356.0932,-.5 3356.0932,-138.5 "/>
<text text-anchor="middle" x="3366.5932" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file -->
<g id="node13" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M2301.5932,-2750.5C2301.5932,-2750.5 2486.5932,-2750.5 2486.5932,-2750.5 2492.5932,-2750.5 2498.5932,-2756.5 2498.5932,-2762.5 2498.5932,-2762.5 2498.5932,-2945.5 2498.5932,-2945.5 2498.5932,-2951.5 2492.5932,-2957.5 2486.5932,-2957.5 2486.5932,-2957.5 2301.5932,-2957.5 2301.5932,-2957.5 2295.5932,-2957.5 2289.5932,-2951.5 2289.5932,-2945.5 2289.5932,-2945.5 2289.5932,-2762.5 2289.5932,-2762.5 2289.5932,-2756.5 2295.5932,-2750.5 2301.5932,-2750.5"/>
<text text-anchor="middle" x="2309.0932" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="2328.5932,-2750.5 2328.5932,-2957.5 "/>
<text text-anchor="middle" x="2339.0932" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2349.5932,-2750.5 2349.5932,-2957.5 "/>
<text text-anchor="middle" x="2413.5932" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="2349.5932,-2934.5 2477.5932,-2934.5 "/>
<text text-anchor="middle" x="2413.5932" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="2349.5932,-2911.5 2477.5932,-2911.5 "/>
<text text-anchor="middle" x="2413.5932" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="2349.5932,-2888.5 2477.5932,-2888.5 "/>
<text text-anchor="middle" x="2413.5932" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="2349.5932,-2865.5 2477.5932,-2865.5 "/>
<text text-anchor="middle" x="2413.5932" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="2349.5932,-2842.5 2477.5932,-2842.5 "/>
<text text-anchor="middle" x="2413.5932" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="2349.5932,-2819.5 2477.5932,-2819.5 "/>
<text text-anchor="middle" x="2413.5932" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="2349.5932,-2796.5 2477.5932,-2796.5 "/>
<text text-anchor="middle" x="2413.5932" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="2349.5932,-2773.5 2477.5932,-2773.5 "/>
<text text-anchor="middle" x="2413.5932" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="2477.5932,-2750.5 2477.5932,-2957.5 "/>
<text text-anchor="middle" x="2488.0932" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge14" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2398.3505,-2750.337C2399.6901,-2721.7078 2401.2956,-2690.6418 2403.0932,-2662 2411.2941,-2531.3313 2422.593,-2385.7186 2432.3754,-2266.8783"/>
<polygon fill="#000000" stroke="#000000" points="2435.8928,-2266.8104 2433.2268,-2256.5565 2428.9165,-2266.2349 2435.8928,-2266.8104"/>
<text text-anchor="middle" x="2439.5932" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge39" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2432.0669,-2750.4503C2438.7459,-2738.509 2446.3977,-2727.035 2455.0932,-2717 2460.9731,-2710.2143 2468.4268,-2704.2573 2476.0154,-2699.2302"/>
<polygon fill="#000000" stroke="#000000" points="2478.218,-2701.9844 2484.8996,-2693.762 2474.5488,-2696.0231 2478.218,-2701.9844"/>
<text text-anchor="middle" x="2485.5932" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge17" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2498.6281,-2754.5772C2501.75,-2752.937 2504.9068,-2751.4058 2508.0932,-2750 2585.4727,-2715.8616 3266.0932,-2765.0755 3266.0932,-2680.5 3266.0932,-2680.5 3266.0932,-2680.5 3266.0932,-438 3266.0932,-412.3996 3260.1903,-385.6495 3252.2521,-361.2505"/>
<polygon fill="#000000" stroke="#000000" points="3255.5261,-360.0069 3248.9923,-351.6666 3248.8989,-362.261 3255.5261,-360.0069"/>
<text text-anchor="middle" x="3296.5932" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- diagnosis -->
<g id="node19" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M989.5932,-2344.5C989.5932,-2344.5 1332.5932,-2344.5 1332.5932,-2344.5 1338.5932,-2344.5 1344.5932,-2350.5 1344.5932,-2356.5 1344.5932,-2356.5 1344.5932,-2631.5 1344.5932,-2631.5 1344.5932,-2637.5 1338.5932,-2643.5 1332.5932,-2643.5 1332.5932,-2643.5 989.5932,-2643.5 989.5932,-2643.5 983.5932,-2643.5 977.5932,-2637.5 977.5932,-2631.5 977.5932,-2631.5 977.5932,-2356.5 977.5932,-2356.5 977.5932,-2350.5 983.5932,-2344.5 989.5932,-2344.5"/>
<text text-anchor="middle" x="1019.5932" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="1061.5932,-2344.5 1061.5932,-2643.5 "/>
<text text-anchor="middle" x="1072.0932" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1082.5932,-2344.5 1082.5932,-2643.5 "/>
<text text-anchor="middle" x="1203.0932" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="1082.5932,-2620.5 1323.5932,-2620.5 "/>
<text text-anchor="middle" x="1203.0932" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="1082.5932,-2597.5 1323.5932,-2597.5 "/>
<text text-anchor="middle" x="1203.0932" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="1082.5932,-2574.5 1323.5932,-2574.5 "/>
<text text-anchor="middle" x="1203.0932" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="1082.5932,-2551.5 1323.5932,-2551.5 "/>
<text text-anchor="middle" x="1203.0932" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="1082.5932,-2528.5 1323.5932,-2528.5 "/>
<text text-anchor="middle" x="1203.0932" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="1082.5932,-2505.5 1323.5932,-2505.5 "/>
<text text-anchor="middle" x="1203.0932" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="1082.5932,-2482.5 1323.5932,-2482.5 "/>
<text text-anchor="middle" x="1203.0932" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="1082.5932,-2459.5 1323.5932,-2459.5 "/>
<text text-anchor="middle" x="1203.0932" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1082.5932,-2436.5 1323.5932,-2436.5 "/>
<text text-anchor="middle" x="1203.0932" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="1082.5932,-2413.5 1323.5932,-2413.5 "/>
<text text-anchor="middle" x="1203.0932" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="1082.5932,-2390.5 1323.5932,-2390.5 "/>
<text text-anchor="middle" x="1203.0932" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="1082.5932,-2367.5 1323.5932,-2367.5 "/>
<text text-anchor="middle" x="1203.0932" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="1323.5932,-2344.5 1323.5932,-2643.5 "/>
<text text-anchor="middle" x="1334.0932" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge37" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M2289.5002,-2823.4619C2082.651,-2763.068 1618.5238,-2627.5564 1354.4744,-2550.4617"/>
<polygon fill="#000000" stroke="#000000" points="1355.3579,-2547.0735 1344.7777,-2547.6305 1353.3959,-2553.793 1355.3579,-2547.0735"/>
<text text-anchor="middle" x="2014.5932" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge25" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3085.6618,-524.3533C3100.2529,-510.5713 3117.8225,-492.087 3130.0932,-473 3152.1319,-438.7188 3169.9786,-397.4659 3183.2534,-361.2016"/>
<polygon fill="#000000" stroke="#000000" points="3186.6129,-362.2023 3186.7023,-351.6078 3180.0256,-359.8341 3186.6129,-362.2023"/>
<text text-anchor="middle" x="3205.5932" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_arm -->
<g id="node28" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M2739.5932,-415C2739.5932,-415 3108.5932,-415 3108.5932,-415 3114.5932,-415 3120.5932,-421 3120.5932,-427 3120.5932,-427 3120.5932,-449 3120.5932,-449 3120.5932,-455 3114.5932,-461 3108.5932,-461 3108.5932,-461 2739.5932,-461 2739.5932,-461 2733.5932,-461 2727.5932,-455 2727.5932,-449 2727.5932,-449 2727.5932,-427 2727.5932,-427 2727.5932,-421 2733.5932,-415 2739.5932,-415"/>
<text text-anchor="middle" x="2773.5932" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="2819.5932,-415 2819.5932,-461 "/>
<text text-anchor="middle" x="2830.0932" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2840.5932,-415 2840.5932,-461 "/>
<text text-anchor="middle" x="2970.0932" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="2840.5932,-438 3099.5932,-438 "/>
<text text-anchor="middle" x="2970.0932" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="3099.5932,-415 3099.5932,-461 "/>
<text text-anchor="middle" x="3110.0932" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge26" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M3030.4632,-524.2779C3010.059,-507.7278 2982.4665,-485.3473 2960.4976,-467.528"/>
<polygon fill="#000000" stroke="#000000" points="2962.6532,-464.7699 2952.682,-461.1887 2958.2436,-470.2064 2962.6532,-464.7699"/>
<text text-anchor="middle" x="3047.5932" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_site -->
<g id="node16" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M3306.5932,-403.5C3306.5932,-403.5 3623.5932,-403.5 3623.5932,-403.5 3629.5932,-403.5 3635.5932,-409.5 3635.5932,-415.5 3635.5932,-415.5 3635.5932,-460.5 3635.5932,-460.5 3635.5932,-466.5 3629.5932,-472.5 3623.5932,-472.5 3623.5932,-472.5 3306.5932,-472.5 3306.5932,-472.5 3300.5932,-472.5 3294.5932,-466.5 3294.5932,-460.5 3294.5932,-460.5 3294.5932,-415.5 3294.5932,-415.5 3294.5932,-409.5 3300.5932,-403.5 3306.5932,-403.5"/>
<text text-anchor="middle" x="3339.5932" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="3384.5932,-403.5 3384.5932,-472.5 "/>
<text text-anchor="middle" x="3395.0932" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3405.5932,-403.5 3405.5932,-472.5 "/>
<text text-anchor="middle" x="3510.0932" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="3405.5932,-449.5 3614.5932,-449.5 "/>
<text text-anchor="middle" x="3510.0932" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="3405.5932,-426.5 3614.5932,-426.5 "/>
<text text-anchor="middle" x="3510.0932" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="3614.5932,-403.5 3614.5932,-472.5 "/>
<text text-anchor="middle" x="3625.0932" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge16" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3412.4642,-403.3975C3391.7719,-389.7927 3367.0126,-373.5139 3342.0493,-357.1011"/>
<polygon fill="#000000" stroke="#000000" points="3343.8598,-354.1027 3333.5812,-351.5335 3340.0142,-359.9518 3343.8598,-354.1027"/>
<text text-anchor="middle" x="3412.5932" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge27" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M3211.0932,-190.4932C3211.0932,-176.7786 3211.0932,-162.5421 3211.0932,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="3214.5933,-148.5183 3211.0932,-138.5184 3207.5933,-148.5184 3214.5933,-148.5183"/>
<text text-anchor="middle" x="3251.5932" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- vital_signs -->
<g id="node18" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1912.5932,-1865.5C1912.5932,-1865.5 2199.5932,-1865.5 2199.5932,-1865.5 2205.5932,-1865.5 2211.5932,-1871.5 2211.5932,-1877.5 2211.5932,-1877.5 2211.5932,-2175.5 2211.5932,-2175.5 2211.5932,-2181.5 2205.5932,-2187.5 2199.5932,-2187.5 2199.5932,-2187.5 1912.5932,-2187.5 1912.5932,-2187.5 1906.5932,-2187.5 1900.5932,-2181.5 1900.5932,-2175.5 1900.5932,-2175.5 1900.5932,-1877.5 1900.5932,-1877.5 1900.5932,-1871.5 1906.5932,-1865.5 1912.5932,-1865.5"/>
<text text-anchor="middle" x="1947.0932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1993.5932,-1865.5 1993.5932,-2187.5 "/>
<text text-anchor="middle" x="2004.0932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2014.5932,-1865.5 2014.5932,-2187.5 "/>
<text text-anchor="middle" x="2102.5932" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="2014.5932,-2164.5 2190.5932,-2164.5 "/>
<text text-anchor="middle" x="2102.5932" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="2014.5932,-2141.5 2190.5932,-2141.5 "/>
<text text-anchor="middle" x="2102.5932" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="2014.5932,-2118.5 2190.5932,-2118.5 "/>
<text text-anchor="middle" x="2102.5932" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="2014.5932,-2095.5 2190.5932,-2095.5 "/>
<text text-anchor="middle" x="2102.5932" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="2014.5932,-2072.5 2190.5932,-2072.5 "/>
<text text-anchor="middle" x="2102.5932" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="2014.5932,-2049.5 2190.5932,-2049.5 "/>
<text text-anchor="middle" x="2102.5932" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="2014.5932,-2026.5 2190.5932,-2026.5 "/>
<text text-anchor="middle" x="2102.5932" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="2014.5932,-2003.5 2190.5932,-2003.5 "/>
<text text-anchor="middle" x="2102.5932" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2014.5932,-1980.5 2190.5932,-1980.5 "/>
<text text-anchor="middle" x="2102.5932" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="2014.5932,-1957.5 2190.5932,-1957.5 "/>
<text text-anchor="middle" x="2102.5932" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="2014.5932,-1934.5 2190.5932,-1934.5 "/>
<text text-anchor="middle" x="2102.5932" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="2014.5932,-1911.5 2190.5932,-1911.5 "/>
<text text-anchor="middle" x="2102.5932" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="2014.5932,-1888.5 2190.5932,-1888.5 "/>
<text text-anchor="middle" x="2102.5932" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="2190.5932,-1865.5 2190.5932,-2187.5 "/>
<text text-anchor="middle" x="2201.0932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge2" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2055.3838,-1865.3007C2054.9679,-1770.7762 2054.4785,-1659.5546 2054.2395,-1605.236"/>
<polygon fill="#000000" stroke="#000000" points="2057.7391,-1605.1373 2054.1951,-1595.1528 2050.7392,-1605.1682 2057.7391,-1605.1373"/>
<text text-anchor="middle" x="2082.0932" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge36" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M977.4229,-2477.9732C686.1681,-2450.7107 145.1778,-2391.8235 87.0932,-2326 -96.6374,-2117.7899 68.0932,-1979.184 68.0932,-1701.5 68.0932,-1701.5 68.0932,-1701.5 68.0932,-1313 68.0932,-1221.237 1450.3203,-1141.2593 1889.1051,-1118.1824"/>
<polygon fill="#000000" stroke="#000000" points="1889.4906,-1121.6671 1899.2935,-1117.6479 1889.1238,-1114.6767 1889.4906,-1121.6671"/>
<text text-anchor="middle" x="95.0932" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- principal_investigator -->
<g id="node20" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M3665.5932,-403.5C3665.5932,-403.5 3992.5932,-403.5 3992.5932,-403.5 3998.5932,-403.5 4004.5932,-409.5 4004.5932,-415.5 4004.5932,-415.5 4004.5932,-460.5 4004.5932,-460.5 4004.5932,-466.5 3998.5932,-472.5 3992.5932,-472.5 3992.5932,-472.5 3665.5932,-472.5 3665.5932,-472.5 3659.5932,-472.5 3653.5932,-466.5 3653.5932,-460.5 3653.5932,-460.5 3653.5932,-415.5 3653.5932,-415.5 3653.5932,-409.5 3659.5932,-403.5 3665.5932,-403.5"/>
<text text-anchor="middle" x="3740.5932" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="3827.5932,-403.5 3827.5932,-472.5 "/>
<text text-anchor="middle" x="3838.0932" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3848.5932,-403.5 3848.5932,-472.5 "/>
<text text-anchor="middle" x="3916.0932" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="3848.5932,-449.5 3983.5932,-449.5 "/>
<text text-anchor="middle" x="3916.0932" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="3848.5932,-426.5 3983.5932,-426.5 "/>
<text text-anchor="middle" x="3916.0932" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="3983.5932,-403.5 3983.5932,-472.5 "/>
<text text-anchor="middle" x="3994.0932" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge18" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3701.418,-403.4988C3606.2308,-377.7767 3475.5191,-342.4549 3372.9909,-314.749"/>
<polygon fill="#000000" stroke="#000000" points="3373.7257,-311.3221 3363.1589,-312.0922 3371.8996,-318.0798 3373.7257,-311.3221"/>
<text text-anchor="middle" x="3659.5932" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- cycle -->
<g id="node21" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1920.0932,-1278.5C1920.0932,-1278.5 2148.0932,-1278.5 2148.0932,-1278.5 2154.0932,-1278.5 2160.0932,-1284.5 2160.0932,-1290.5 2160.0932,-1290.5 2160.0932,-1335.5 2160.0932,-1335.5 2160.0932,-1341.5 2154.0932,-1347.5 2148.0932,-1347.5 2148.0932,-1347.5 1920.0932,-1347.5 1920.0932,-1347.5 1914.0932,-1347.5 1908.0932,-1341.5 1908.0932,-1335.5 1908.0932,-1335.5 1908.0932,-1290.5 1908.0932,-1290.5 1908.0932,-1284.5 1914.0932,-1278.5 1920.0932,-1278.5"/>
<text text-anchor="middle" x="1935.0932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1962.0932,-1278.5 1962.0932,-1347.5 "/>
<text text-anchor="middle" x="1972.5932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1983.0932,-1278.5 1983.0932,-1347.5 "/>
<text text-anchor="middle" x="2061.0932" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1983.0932,-1324.5 2139.0932,-1324.5 "/>
<text text-anchor="middle" x="2061.0932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1983.0932,-1301.5 2139.0932,-1301.5 "/>
<text text-anchor="middle" x="2061.0932" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="2139.0932,-1278.5 2139.0932,-1347.5 "/>
<text text-anchor="middle" x="2149.5932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge31" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2031.8584,-1278.3609C2029.9026,-1248.0465 2027.0245,-1203.4353 2024.7362,-1167.9659"/>
<polygon fill="#000000" stroke="#000000" points="2028.2138,-1167.5058 2024.0772,-1157.7519 2021.2284,-1167.9565 2028.2138,-1167.5058"/>
<text text-anchor="middle" x="2052.0932" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- demographic -->
<g id="node22" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M1078.0932,-1232.5C1078.0932,-1232.5 1414.0932,-1232.5 1414.0932,-1232.5 1420.0932,-1232.5 1426.0932,-1238.5 1426.0932,-1244.5 1426.0932,-1244.5 1426.0932,-1381.5 1426.0932,-1381.5 1426.0932,-1387.5 1420.0932,-1393.5 1414.0932,-1393.5 1414.0932,-1393.5 1078.0932,-1393.5 1078.0932,-1393.5 1072.0932,-1393.5 1066.0932,-1387.5 1066.0932,-1381.5 1066.0932,-1381.5 1066.0932,-1244.5 1066.0932,-1244.5 1066.0932,-1238.5 1072.0932,-1232.5 1078.0932,-1232.5"/>
<text text-anchor="middle" x="1121.0932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="1176.0932,-1232.5 1176.0932,-1393.5 "/>
<text text-anchor="middle" x="1186.5932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1197.0932,-1232.5 1197.0932,-1393.5 "/>
<text text-anchor="middle" x="1301.0932" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1197.0932,-1370.5 1405.0932,-1370.5 "/>
<text text-anchor="middle" x="1301.0932" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1197.0932,-1347.5 1405.0932,-1347.5 "/>
<text text-anchor="middle" x="1301.0932" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1197.0932,-1324.5 1405.0932,-1324.5 "/>
<text text-anchor="middle" x="1301.0932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1197.0932,-1301.5 1405.0932,-1301.5 "/>
<text text-anchor="middle" x="1301.0932" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="1197.0932,-1278.5 1405.0932,-1278.5 "/>
<text text-anchor="middle" x="1301.0932" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1197.0932,-1255.5 1405.0932,-1255.5 "/>
<text text-anchor="middle" x="1301.0932" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1405.0932,-1232.5 1405.0932,-1393.5 "/>
<text text-anchor="middle" x="1415.5932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge29" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1379.5541,-1232.4182C1397.7914,-1223.5427 1416.6056,-1215.4144 1435.0932,-1209 1585.8998,-1156.677 1768.5523,-1131.9829 1889.4202,-1120.6349"/>
<polygon fill="#000000" stroke="#000000" points="1889.8287,-1124.1122 1899.4653,-1119.7092 1889.1863,-1117.1417 1889.8287,-1124.1122"/>
<text text-anchor="middle" x="1571.0932" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge30" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2079.2561,-1548.593C2107.4236,-1520.4995 2151.4304,-1470.4496 2169.0932,-1417 2198.0994,-1329.2241 2212.9369,-1290.3862 2169.0932,-1209 2159.4996,-1191.1915 2145.0729,-1176.0996 2128.9281,-1163.5035"/>
<polygon fill="#000000" stroke="#000000" points="2130.9917,-1160.6764 2120.8781,-1157.5195 2126.8156,-1166.2943 2130.9917,-1160.6764"/>
<text text-anchor="middle" x="2223.0932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge15" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M2052.2831,-1548.5587C2048.9588,-1505.5091 2041.8304,-1413.1963 2037.5508,-1357.7763"/>
<polygon fill="#000000" stroke="#000000" points="2041.0203,-1357.2446 2036.7607,-1347.5438 2034.0411,-1357.7836 2041.0203,-1357.2446"/>
<text text-anchor="middle" x="2073.5932" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge10" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2112.1308,-1595.0098C2143.2461,-1598.9199 2171.5932,-1591.25 2171.5932,-1572 2171.5932,-1554.8555 2149.1079,-1546.8964 2122.2077,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="2121.7937,-1544.6454 2112.1308,-1548.9902 2122.3942,-1551.6196 2121.7937,-1544.6454"/>
<text text-anchor="middle" x="2187.5932" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge19" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2816.1474,-524.2779C2836.8538,-507.7278 2864.8551,-485.3473 2887.1495,-467.528"/>
<polygon fill="#000000" stroke="#000000" points="2889.4546,-470.1662 2895.0809,-461.1887 2885.0842,-464.6981 2889.4546,-470.1662"/>
<text text-anchor="middle" x="2903.5932" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- prior_therapy -->
<g id="node25" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M108.0932,-1727.5C108.0932,-1727.5 564.0932,-1727.5 564.0932,-1727.5 570.0932,-1727.5 576.0932,-1733.5 576.0932,-1739.5 576.0932,-1739.5 576.0932,-2313.5 576.0932,-2313.5 576.0932,-2319.5 570.0932,-2325.5 564.0932,-2325.5 564.0932,-2325.5 108.0932,-2325.5 108.0932,-2325.5 102.0932,-2325.5 96.0932,-2319.5 96.0932,-2313.5 96.0932,-2313.5 96.0932,-1739.5 96.0932,-1739.5 96.0932,-1733.5 102.0932,-1727.5 108.0932,-1727.5"/>
<text text-anchor="middle" x="153.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="211.0932,-1727.5 211.0932,-2325.5 "/>
<text text-anchor="middle" x="221.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="232.0932,-1727.5 232.0932,-2325.5 "/>
<text text-anchor="middle" x="393.5932" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2302.5 555.0932,-2302.5 "/>
<text text-anchor="middle" x="393.5932" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2279.5 555.0932,-2279.5 "/>
<text text-anchor="middle" x="393.5932" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2256.5 555.0932,-2256.5 "/>
<text text-anchor="middle" x="393.5932" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2233.5 555.0932,-2233.5 "/>
<text text-anchor="middle" x="393.5932" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2210.5 555.0932,-2210.5 "/>
<text text-anchor="middle" x="393.5932" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2187.5 555.0932,-2187.5 "/>
<text text-anchor="middle" x="393.5932" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2164.5 555.0932,-2164.5 "/>
<text text-anchor="middle" x="393.5932" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2141.5 555.0932,-2141.5 "/>
<text text-anchor="middle" x="393.5932" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2118.5 555.0932,-2118.5 "/>
<text text-anchor="middle" x="393.5932" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2095.5 555.0932,-2095.5 "/>
<text text-anchor="middle" x="393.5932" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2072.5 555.0932,-2072.5 "/>
<text text-anchor="middle" x="393.5932" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2049.5 555.0932,-2049.5 "/>
<text text-anchor="middle" x="393.5932" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2026.5 555.0932,-2026.5 "/>
<text text-anchor="middle" x="393.5932" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="232.0932,-2003.5 555.0932,-2003.5 "/>
<text text-anchor="middle" x="393.5932" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="232.0932,-1980.5 555.0932,-1980.5 "/>
<text text-anchor="middle" x="393.5932" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="232.0932,-1957.5 555.0932,-1957.5 "/>
<text text-anchor="middle" x="393.5932" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="232.0932,-1934.5 555.0932,-1934.5 "/>
<text text-anchor="middle" x="393.5932" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="232.0932,-1911.5 555.0932,-1911.5 "/>
<text text-anchor="middle" x="393.5932" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="232.0932,-1888.5 555.0932,-1888.5 "/>
<text text-anchor="middle" x="393.5932" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="232.0932,-1865.5 555.0932,-1865.5 "/>
<text text-anchor="middle" x="393.5932" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="232.0932,-1842.5 555.0932,-1842.5 "/>
<text text-anchor="middle" x="393.5932" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="232.0932,-1819.5 555.0932,-1819.5 "/>
<text text-anchor="middle" x="393.5932" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="232.0932,-1796.5 555.0932,-1796.5 "/>
<text text-anchor="middle" x="393.5932" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="232.0932,-1773.5 555.0932,-1773.5 "/>
<text text-anchor="middle" x="393.5932" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="232.0932,-1750.5 555.0932,-1750.5 "/>
<text text-anchor="middle" x="393.5932" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="555.0932,-1727.5 555.0932,-2325.5 "/>
<text text-anchor="middle" x="565.5932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge42" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M576.1219,-1771.1054C595.3838,-1755.336 615.1315,-1740.4361 635.0932,-1727 687.3918,-1691.7981 748.9709,-1662.0468 806.6377,-1638.3156"/>
<polygon fill="#000000" stroke="#000000" points="808.2892,-1641.4222 816.2301,-1634.4083 805.6485,-1634.9394 808.2892,-1641.4222"/>
<text text-anchor="middle" x="732.0932" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge9" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M576.3316,-2064.6912C587.5319,-2055.0507 594.0932,-2042.3203 594.0932,-2026.5 594.0932,-2014.3876 590.2471,-2004.0864 583.4176,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="585.8122,-1993.0385 576.3316,-1988.3088 580.7934,-1997.9183 585.8122,-1993.0385"/>
<text text-anchor="middle" x="610.0932" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge33" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2025.8083,-1013.5185C2024.4321,-1019.7167 2023.186,-1025.8873 2022.0932,-1032 2020.7588,-1039.4637 2019.951,-1047.3846 2019.5053,-1055.2229"/>
<polygon fill="#000000" stroke="#000000" points="2015.9996,-1055.3074 2019.1141,-1065.4342 2022.9945,-1055.5755 2015.9996,-1055.3074"/>
<text text-anchor="middle" x="2049.0932" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge20" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2307.8983,-651.9405C2327.2896,-640.6991 2347.1571,-630.4904 2367.0932,-622 2457.6081,-583.4513 2567.2858,-564.8488 2651.8616,-555.8718"/>
<polygon fill="#000000" stroke="#000000" points="2652.4589,-559.3289 2662.0483,-554.8241 2651.7427,-552.3657 2652.4589,-559.3289"/>
<text text-anchor="middle" x="2485.0932" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge7" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2307.7978,-845.2761C2318.9692,-838.5862 2325.5932,-829.4941 2325.5932,-818 2325.5932,-809.7386 2322.1712,-802.7181 2316.0984,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="2317.9005,-793.9155 2307.7978,-790.7239 2313.7051,-799.519 2317.9005,-793.9155"/>
<text text-anchor="middle" x="2341.5932" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- follow_up -->
<g id="node27" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1456.0932,-1209.5C1456.0932,-1209.5 1788.0932,-1209.5 1788.0932,-1209.5 1794.0932,-1209.5 1800.0932,-1215.5 1800.0932,-1221.5 1800.0932,-1221.5 1800.0932,-1404.5 1800.0932,-1404.5 1800.0932,-1410.5 1794.0932,-1416.5 1788.0932,-1416.5 1788.0932,-1416.5 1456.0932,-1416.5 1456.0932,-1416.5 1450.0932,-1416.5 1444.0932,-1410.5 1444.0932,-1404.5 1444.0932,-1404.5 1444.0932,-1221.5 1444.0932,-1221.5 1444.0932,-1215.5 1450.0932,-1209.5 1456.0932,-1209.5"/>
<text text-anchor="middle" x="1486.5932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="1529.0932,-1209.5 1529.0932,-1416.5 "/>
<text text-anchor="middle" x="1539.5932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1550.0932,-1209.5 1550.0932,-1416.5 "/>
<text text-anchor="middle" x="1664.5932" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1550.0932,-1393.5 1779.0932,-1393.5 "/>
<text text-anchor="middle" x="1664.5932" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="1550.0932,-1370.5 1779.0932,-1370.5 "/>
<text text-anchor="middle" x="1664.5932" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="1550.0932,-1347.5 1779.0932,-1347.5 "/>
<text text-anchor="middle" x="1664.5932" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="1550.0932,-1324.5 1779.0932,-1324.5 "/>
<text text-anchor="middle" x="1664.5932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="1550.0932,-1301.5 1779.0932,-1301.5 "/>
<text text-anchor="middle" x="1664.5932" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="1550.0932,-1278.5 1779.0932,-1278.5 "/>
<text text-anchor="middle" x="1664.5932" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="1550.0932,-1255.5 1779.0932,-1255.5 "/>
<text text-anchor="middle" x="1664.5932" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="1550.0932,-1232.5 1779.0932,-1232.5 "/>
<text text-anchor="middle" x="1664.5932" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1779.0932,-1209.5 1779.0932,-1416.5 "/>
<text text-anchor="middle" x="1789.5932" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge34" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1719.7713,-1209.2544C1735.032,-1196.7587 1751.3308,-1185.1925 1768.0932,-1176 1805.1774,-1155.663 1848.8385,-1141.5823 1889.3558,-1131.899"/>
<polygon fill="#000000" stroke="#000000" points="1890.3569,-1135.2599 1899.3085,-1129.5924 1888.7765,-1128.4406 1890.3569,-1135.2599"/>
<text text-anchor="middle" x="1795.0932" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge22" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2963.698,-414.9547C2990.1769,-399.5471 3026.8281,-378.2204 3063.8143,-356.6989"/>
<polygon fill="#000000" stroke="#000000" points="3065.8281,-359.5765 3072.7111,-351.522 3062.3075,-353.5263 3065.8281,-359.5765"/>
<text text-anchor="middle" x="3073.5932" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
</g>
</svg>
</div>
