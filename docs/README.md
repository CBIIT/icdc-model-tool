<link rel='stylesheet' href="assets/style.css">
<link rel='stylesheet' href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"  src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"></script>
<script type="text/javascript" src="assets/actions.js"></script>

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
nodes. However, the Gen3 "graph" doesn't support relationship
properties, so specifying these will not influence the output.

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
<svg width="3238pt" height="2966pt"
 viewBox="0.00 0.00 3238.34 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 3234.3385,-2962 3234.3385,4 -4,4"/>
<!-- lab_exam -->
<g id="node1" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1211.5,-2008.5C1211.5,-2008.5 1271.5,-2008.5 1271.5,-2008.5 1277.5,-2008.5 1283.5,-2014.5 1283.5,-2020.5 1283.5,-2020.5 1283.5,-2032.5 1283.5,-2032.5 1283.5,-2038.5 1277.5,-2044.5 1271.5,-2044.5 1271.5,-2044.5 1211.5,-2044.5 1211.5,-2044.5 1205.5,-2044.5 1199.5,-2038.5 1199.5,-2032.5 1199.5,-2032.5 1199.5,-2020.5 1199.5,-2020.5 1199.5,-2014.5 1205.5,-2008.5 1211.5,-2008.5"/>
<text text-anchor="middle" x="1241.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- visit -->
<g id="node11" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M959,-1549C959,-1549 1134,-1549 1134,-1549 1140,-1549 1146,-1555 1146,-1561 1146,-1561 1146,-1583 1146,-1583 1146,-1589 1140,-1595 1134,-1595 1134,-1595 959,-1595 959,-1595 953,-1595 947,-1589 947,-1583 947,-1583 947,-1561 947,-1561 947,-1555 953,-1549 959,-1549"/>
<text text-anchor="middle" x="970.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="994,-1549 994,-1595 "/>
<text text-anchor="middle" x="1004.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1015,-1549 1015,-1595 "/>
<text text-anchor="middle" x="1070" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1015,-1572 1125,-1572 "/>
<text text-anchor="middle" x="1070" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1125,-1549 1125,-1595 "/>
<text text-anchor="middle" x="1135.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge3" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1241.9258,-2008.1915C1242.3324,-1959.6431 1238.7219,-1824.662 1190.5,-1727 1165.3583,-1676.0814 1118.0632,-1630.1322 1084.5427,-1601.7215"/>
<polygon fill="#000000" stroke="#000000" points="1086.6859,-1598.9514 1076.7649,-1595.2332 1082.2018,-1604.3267 1086.6859,-1598.9514"/>
<text text-anchor="middle" x="1206.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent_administration -->
<g id="node2" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M12,-1785C12,-1785 481,-1785 481,-1785 487,-1785 493,-1791 493,-1797 493,-1797 493,-2256 493,-2256 493,-2262 487,-2268 481,-2268 481,-2268 12,-2268 12,-2268 6,-2268 0,-2262 0,-2256 0,-2256 0,-1797 0,-1797 0,-1791 6,-1785 12,-1785"/>
<text text-anchor="middle" x="85" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="170,-1785 170,-2268 "/>
<text text-anchor="middle" x="180.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="191,-1785 191,-2268 "/>
<text text-anchor="middle" x="331.5" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="191,-2245 472,-2245 "/>
<text text-anchor="middle" x="331.5" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2222 472,-2222 "/>
<text text-anchor="middle" x="331.5" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="191,-2199 472,-2199 "/>
<text text-anchor="middle" x="331.5" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="191,-2176 472,-2176 "/>
<text text-anchor="middle" x="331.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2153 472,-2153 "/>
<text text-anchor="middle" x="331.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="191,-2130 472,-2130 "/>
<text text-anchor="middle" x="331.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-2107 472,-2107 "/>
<text text-anchor="middle" x="331.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="191,-2084 472,-2084 "/>
<text text-anchor="middle" x="331.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="191,-2061 472,-2061 "/>
<text text-anchor="middle" x="331.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="191,-2038 472,-2038 "/>
<text text-anchor="middle" x="331.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="191,-2015 472,-2015 "/>
<text text-anchor="middle" x="331.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="191,-1992 472,-1992 "/>
<text text-anchor="middle" x="331.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="191,-1969 472,-1969 "/>
<text text-anchor="middle" x="331.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="191,-1946 472,-1946 "/>
<text text-anchor="middle" x="331.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="191,-1923 472,-1923 "/>
<text text-anchor="middle" x="331.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="191,-1900 472,-1900 "/>
<text text-anchor="middle" x="331.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="191,-1877 472,-1877 "/>
<text text-anchor="middle" x="331.5" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="191,-1854 472,-1854 "/>
<text text-anchor="middle" x="331.5" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="191,-1831 472,-1831 "/>
<text text-anchor="middle" x="331.5" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="191,-1808 472,-1808 "/>
<text text-anchor="middle" x="331.5" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="472,-1785 472,-2268 "/>
<text text-anchor="middle" x="482.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent -->
<g id="node7" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M837.5,-524.5C837.5,-524.5 1063.5,-524.5 1063.5,-524.5 1069.5,-524.5 1075.5,-530.5 1075.5,-536.5 1075.5,-536.5 1075.5,-558.5 1075.5,-558.5 1075.5,-564.5 1069.5,-570.5 1063.5,-570.5 1063.5,-570.5 837.5,-570.5 837.5,-570.5 831.5,-570.5 825.5,-564.5 825.5,-558.5 825.5,-558.5 825.5,-536.5 825.5,-536.5 825.5,-530.5 831.5,-524.5 837.5,-524.5"/>
<text text-anchor="middle" x="854" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="882.5,-524.5 882.5,-570.5 "/>
<text text-anchor="middle" x="893" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="903.5,-524.5 903.5,-570.5 "/>
<text text-anchor="middle" x="979" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="903.5,-547.5 1054.5,-547.5 "/>
<text text-anchor="middle" x="979" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1054.5,-524.5 1054.5,-570.5 "/>
<text text-anchor="middle" x="1065" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge19" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M441.3937,-1784.7493C461.2401,-1764.4144 481.7534,-1744.8384 502.5,-1727 601.3429,-1642.0126 751.5,-1702.3564 751.5,-1572 751.5,-1572 751.5,-1572 751.5,-818 751.5,-730.4805 718.409,-692.3291 770.5,-622 786.2969,-600.6723 809.3232,-585.4196 833.6622,-574.5216"/>
<polygon fill="#000000" stroke="#000000" points="835.1955,-577.6734 843.0423,-570.5545 832.4688,-571.2262 835.1955,-577.6734"/>
<text text-anchor="middle" x="782.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge2" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M419.6202,-1784.9257C444.9892,-1762.1367 472.7143,-1741.993 502.5,-1727 554.232,-1700.9601 706.52,-1723.8495 762.5,-1709 851.9683,-1685.2673 947.1461,-1633.1184 1001.4602,-1600.4444"/>
<polygon fill="#000000" stroke="#000000" points="1003.4088,-1603.356 1010.1432,-1595.1768 999.7781,-1597.3711 1003.4088,-1603.356"/>
<text text-anchor="middle" x="831.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- off_study -->
<g id="node3" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M1767,-714.5C1767,-714.5 2182,-714.5 2182,-714.5 2188,-714.5 2194,-720.5 2194,-726.5 2194,-726.5 2194,-909.5 2194,-909.5 2194,-915.5 2188,-921.5 2182,-921.5 2182,-921.5 1767,-921.5 1767,-921.5 1761,-921.5 1755,-915.5 1755,-909.5 1755,-909.5 1755,-726.5 1755,-726.5 1755,-720.5 1761,-714.5 1767,-714.5"/>
<text text-anchor="middle" x="1796.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="1838,-714.5 1838,-921.5 "/>
<text text-anchor="middle" x="1848.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1859,-714.5 1859,-921.5 "/>
<text text-anchor="middle" x="2016" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1859,-898.5 2173,-898.5 "/>
<text text-anchor="middle" x="2016" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1859,-875.5 2173,-875.5 "/>
<text text-anchor="middle" x="2016" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1859,-852.5 2173,-852.5 "/>
<text text-anchor="middle" x="2016" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1859,-829.5 2173,-829.5 "/>
<text text-anchor="middle" x="2016" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="1859,-806.5 2173,-806.5 "/>
<text text-anchor="middle" x="2016" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="1859,-783.5 2173,-783.5 "/>
<text text-anchor="middle" x="2016" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1859,-760.5 2173,-760.5 "/>
<text text-anchor="middle" x="2016" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1859,-737.5 2173,-737.5 "/>
<text text-anchor="middle" x="2016" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2173,-714.5 2173,-921.5 "/>
<text text-anchor="middle" x="2183.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent -->
<g id="node4" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M523.5,-1877C523.5,-1877 839.5,-1877 839.5,-1877 845.5,-1877 851.5,-1883 851.5,-1889 851.5,-1889 851.5,-2164 851.5,-2164 851.5,-2170 845.5,-2176 839.5,-2176 839.5,-2176 523.5,-2176 523.5,-2176 517.5,-2176 511.5,-2170 511.5,-2164 511.5,-2164 511.5,-1889 511.5,-1889 511.5,-1883 517.5,-1877 523.5,-1877"/>
<text text-anchor="middle" x="573" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="634.5,-1877 634.5,-2176 "/>
<text text-anchor="middle" x="645" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="655.5,-1877 655.5,-2176 "/>
<text text-anchor="middle" x="743" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="655.5,-2153 830.5,-2153 "/>
<text text-anchor="middle" x="743" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="655.5,-2130 830.5,-2130 "/>
<text text-anchor="middle" x="743" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="655.5,-2107 830.5,-2107 "/>
<text text-anchor="middle" x="743" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="655.5,-2084 830.5,-2084 "/>
<text text-anchor="middle" x="743" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="655.5,-2061 830.5,-2061 "/>
<text text-anchor="middle" x="743" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="655.5,-2038 830.5,-2038 "/>
<text text-anchor="middle" x="743" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="655.5,-2015 830.5,-2015 "/>
<text text-anchor="middle" x="743" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="655.5,-1992 830.5,-1992 "/>
<text text-anchor="middle" x="743" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="655.5,-1969 830.5,-1969 "/>
<text text-anchor="middle" x="743" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="655.5,-1946 830.5,-1946 "/>
<text text-anchor="middle" x="743" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="655.5,-1923 830.5,-1923 "/>
<text text-anchor="middle" x="743" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="655.5,-1900 830.5,-1900 "/>
<text text-anchor="middle" x="743" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="830.5,-1877 830.5,-2176 "/>
<text text-anchor="middle" x="841" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge5" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M757.8041,-1876.6296C786.6496,-1826.5861 821.9227,-1772.1206 860.5,-1727 903.4705,-1676.7409 963.865,-1629.7212 1004.0437,-1600.9377"/>
<polygon fill="#000000" stroke="#000000" points="1006.1695,-1603.7209 1012.2971,-1595.0778 1002.117,-1598.0132 1006.1695,-1603.7209"/>
<text text-anchor="middle" x="915.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- cohort -->
<g id="node5" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M1106,-524.5C1106,-524.5 1339,-524.5 1339,-524.5 1345,-524.5 1351,-530.5 1351,-536.5 1351,-536.5 1351,-558.5 1351,-558.5 1351,-564.5 1345,-570.5 1339,-570.5 1339,-570.5 1106,-570.5 1106,-570.5 1100,-570.5 1094,-564.5 1094,-558.5 1094,-558.5 1094,-536.5 1094,-536.5 1094,-530.5 1100,-524.5 1106,-524.5"/>
<text text-anchor="middle" x="1125.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="1157,-524.5 1157,-570.5 "/>
<text text-anchor="middle" x="1167.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1178,-524.5 1178,-570.5 "/>
<text text-anchor="middle" x="1254" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1178,-547.5 1330,-547.5 "/>
<text text-anchor="middle" x="1254" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="1330,-524.5 1330,-570.5 "/>
<text text-anchor="middle" x="1340.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm -->
<g id="node8" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M795,-415C795,-415 1164,-415 1164,-415 1170,-415 1176,-421 1176,-427 1176,-427 1176,-449 1176,-449 1176,-455 1170,-461 1164,-461 1164,-461 795,-461 795,-461 789,-461 783,-455 783,-449 783,-449 783,-427 783,-427 783,-421 789,-415 795,-415"/>
<text text-anchor="middle" x="829" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="875,-415 875,-461 "/>
<text text-anchor="middle" x="885.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="896,-415 896,-461 "/>
<text text-anchor="middle" x="1025.5" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="896,-438 1155,-438 "/>
<text text-anchor="middle" x="1025.5" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="1155,-415 1155,-461 "/>
<text text-anchor="middle" x="1165.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge30" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1161.6296,-524.4138C1147.0762,-518.6269 1131.6574,-512.2734 1117.5,-506 1089.3361,-493.5201 1058.5386,-478.4829 1033.1972,-465.7257"/>
<polygon fill="#000000" stroke="#000000" points="1034.6262,-462.5264 1024.1228,-461.1379 1031.4678,-468.7734 1034.6262,-462.5264"/>
<text text-anchor="middle" x="1158" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study -->
<g id="node19" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M1072.5,-190.5C1072.5,-190.5 1352.5,-190.5 1352.5,-190.5 1358.5,-190.5 1364.5,-196.5 1364.5,-202.5 1364.5,-202.5 1364.5,-339.5 1364.5,-339.5 1364.5,-345.5 1358.5,-351.5 1352.5,-351.5 1352.5,-351.5 1072.5,-351.5 1072.5,-351.5 1066.5,-351.5 1060.5,-345.5 1060.5,-339.5 1060.5,-339.5 1060.5,-202.5 1060.5,-202.5 1060.5,-196.5 1066.5,-190.5 1072.5,-190.5"/>
<text text-anchor="middle" x="1088.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="1116.5,-190.5 1116.5,-351.5 "/>
<text text-anchor="middle" x="1127" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1137.5,-190.5 1137.5,-351.5 "/>
<text text-anchor="middle" x="1240.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="1137.5,-328.5 1343.5,-328.5 "/>
<text text-anchor="middle" x="1240.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="1137.5,-305.5 1343.5,-305.5 "/>
<text text-anchor="middle" x="1240.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="1137.5,-282.5 1343.5,-282.5 "/>
<text text-anchor="middle" x="1240.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="1137.5,-259.5 1343.5,-259.5 "/>
<text text-anchor="middle" x="1240.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="1137.5,-236.5 1343.5,-236.5 "/>
<text text-anchor="middle" x="1240.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="1137.5,-213.5 1343.5,-213.5 "/>
<text text-anchor="middle" x="1240.5" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="1343.5,-190.5 1343.5,-351.5 "/>
<text text-anchor="middle" x="1354" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge31" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1221.6646,-524.4013C1220.3826,-488.9546 1217.8608,-419.2251 1215.7865,-361.8713"/>
<polygon fill="#000000" stroke="#000000" points="1219.2773,-361.5513 1215.4181,-351.6844 1212.2819,-361.8044 1219.2773,-361.5513"/>
<text text-anchor="middle" x="1260" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- prior_surgery -->
<g id="node6" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M2735.5,-1946C2735.5,-1946 3081.5,-1946 3081.5,-1946 3087.5,-1946 3093.5,-1952 3093.5,-1958 3093.5,-1958 3093.5,-2095 3093.5,-2095 3093.5,-2101 3087.5,-2107 3081.5,-2107 3081.5,-2107 2735.5,-2107 2735.5,-2107 2729.5,-2107 2723.5,-2101 2723.5,-2095 2723.5,-2095 2723.5,-1958 2723.5,-1958 2723.5,-1952 2729.5,-1946 2735.5,-1946"/>
<text text-anchor="middle" x="2781" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="2838.5,-1946 2838.5,-2107 "/>
<text text-anchor="middle" x="2849" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2859.5,-1946 2859.5,-2107 "/>
<text text-anchor="middle" x="2966" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="2859.5,-2084 3072.5,-2084 "/>
<text text-anchor="middle" x="2966" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2859.5,-2061 3072.5,-2061 "/>
<text text-anchor="middle" x="2966" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="2859.5,-2038 3072.5,-2038 "/>
<text text-anchor="middle" x="2966" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="2859.5,-2015 3072.5,-2015 "/>
<text text-anchor="middle" x="2966" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2859.5,-1992 3072.5,-1992 "/>
<text text-anchor="middle" x="2966" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="2859.5,-1969 3072.5,-1969 "/>
<text text-anchor="middle" x="2966" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="3072.5,-1946 3072.5,-2107 "/>
<text text-anchor="middle" x="3083" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge17" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M3093.613,-2068.5585C3104.7907,-2058.5547 3111.5,-2044.5352 3111.5,-2026.5 3111.5,-2012.5509 3107.4865,-2001.004 3100.4962,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="3102.9806,-1989.3911 3093.613,-1984.4415 3097.8494,-1994.1525 3102.9806,-1989.3911"/>
<text text-anchor="middle" x="3127.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node17" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M2241,-1468.5C2241,-1468.5 2590,-1468.5 2590,-1468.5 2596,-1468.5 2602,-1474.5 2602,-1480.5 2602,-1480.5 2602,-1663.5 2602,-1663.5 2602,-1669.5 2596,-1675.5 2590,-1675.5 2590,-1675.5 2241,-1675.5 2241,-1675.5 2235,-1675.5 2229,-1669.5 2229,-1663.5 2229,-1663.5 2229,-1480.5 2229,-1480.5 2229,-1474.5 2235,-1468.5 2241,-1468.5"/>
<text text-anchor="middle" x="2276.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="2324,-1468.5 2324,-1675.5 "/>
<text text-anchor="middle" x="2334.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2345,-1468.5 2345,-1675.5 "/>
<text text-anchor="middle" x="2463" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="2345,-1652.5 2581,-1652.5 "/>
<text text-anchor="middle" x="2463" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="2345,-1629.5 2581,-1629.5 "/>
<text text-anchor="middle" x="2463" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2345,-1606.5 2581,-1606.5 "/>
<text text-anchor="middle" x="2463" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2345,-1583.5 2581,-1583.5 "/>
<text text-anchor="middle" x="2463" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="2345,-1560.5 2581,-1560.5 "/>
<text text-anchor="middle" x="2463" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2345,-1537.5 2581,-1537.5 "/>
<text text-anchor="middle" x="2463" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="2345,-1514.5 2581,-1514.5 "/>
<text text-anchor="middle" x="2463" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="2345,-1491.5 2581,-1491.5 "/>
<text text-anchor="middle" x="2463" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2581,-1468.5 2581,-1675.5 "/>
<text text-anchor="middle" x="2591.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge34" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2870.9761,-1945.79C2837.3516,-1880.3257 2782.8449,-1789.0464 2714.5,-1727 2684.0405,-1699.3476 2647.7383,-1675.1869 2611.1059,-1654.6874"/>
<polygon fill="#000000" stroke="#000000" points="2612.7391,-1651.5911 2602.292,-1649.8278 2609.3592,-1657.7212 2612.7391,-1651.5911"/>
<text text-anchor="middle" x="2736.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge13" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M956.6502,-524.2779C960.7641,-508.744 966.2385,-488.0738 970.7974,-470.8597"/>
<polygon fill="#000000" stroke="#000000" points="974.1819,-471.7515 973.3587,-461.1887 967.4151,-469.9593 974.1819,-471.7515"/>
<text text-anchor="middle" x="1013" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge29" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1011.8977,-414.7794C1033.0998,-399.583 1062.2596,-378.6831 1091.7811,-357.5239"/>
<polygon fill="#000000" stroke="#000000" points="1094.022,-360.2239 1100.1109,-351.5535 1089.9441,-354.5344 1094.022,-360.2239"/>
<text text-anchor="middle" x="1108" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_site -->
<g id="node9" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M1324,-403.5C1324,-403.5 1641,-403.5 1641,-403.5 1647,-403.5 1653,-409.5 1653,-415.5 1653,-415.5 1653,-460.5 1653,-460.5 1653,-466.5 1647,-472.5 1641,-472.5 1641,-472.5 1324,-472.5 1324,-472.5 1318,-472.5 1312,-466.5 1312,-460.5 1312,-460.5 1312,-415.5 1312,-415.5 1312,-409.5 1318,-403.5 1324,-403.5"/>
<text text-anchor="middle" x="1357" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="1402,-403.5 1402,-472.5 "/>
<text text-anchor="middle" x="1412.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1423,-403.5 1423,-472.5 "/>
<text text-anchor="middle" x="1527.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1423,-449.5 1632,-449.5 "/>
<text text-anchor="middle" x="1527.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="1423,-426.5 1632,-426.5 "/>
<text text-anchor="middle" x="1527.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="1632,-403.5 1632,-472.5 "/>
<text text-anchor="middle" x="1642.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge26" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1426.5558,-403.3975C1404.4644,-389.7335 1378.0122,-373.3723 1351.3592,-356.887"/>
<polygon fill="#000000" stroke="#000000" points="1353.0496,-353.8172 1342.7038,-351.5335 1349.3674,-359.7705 1353.0496,-353.8172"/>
<text text-anchor="middle" x="1425" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- diagnosis -->
<g id="node10" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M2517,-2344.5C2517,-2344.5 2860,-2344.5 2860,-2344.5 2866,-2344.5 2872,-2350.5 2872,-2356.5 2872,-2356.5 2872,-2631.5 2872,-2631.5 2872,-2637.5 2866,-2643.5 2860,-2643.5 2860,-2643.5 2517,-2643.5 2517,-2643.5 2511,-2643.5 2505,-2637.5 2505,-2631.5 2505,-2631.5 2505,-2356.5 2505,-2356.5 2505,-2350.5 2511,-2344.5 2517,-2344.5"/>
<text text-anchor="middle" x="2547" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2589,-2344.5 2589,-2643.5 "/>
<text text-anchor="middle" x="2599.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2610,-2344.5 2610,-2643.5 "/>
<text text-anchor="middle" x="2730.5" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="2610,-2620.5 2851,-2620.5 "/>
<text text-anchor="middle" x="2730.5" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2610,-2597.5 2851,-2597.5 "/>
<text text-anchor="middle" x="2730.5" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2610,-2574.5 2851,-2574.5 "/>
<text text-anchor="middle" x="2730.5" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="2610,-2551.5 2851,-2551.5 "/>
<text text-anchor="middle" x="2730.5" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2610,-2528.5 2851,-2528.5 "/>
<text text-anchor="middle" x="2730.5" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2610,-2505.5 2851,-2505.5 "/>
<text text-anchor="middle" x="2730.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2610,-2482.5 2851,-2482.5 "/>
<text text-anchor="middle" x="2730.5" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="2610,-2459.5 2851,-2459.5 "/>
<text text-anchor="middle" x="2730.5" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2610,-2436.5 2851,-2436.5 "/>
<text text-anchor="middle" x="2730.5" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2610,-2413.5 2851,-2413.5 "/>
<text text-anchor="middle" x="2730.5" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="2610,-2390.5 2851,-2390.5 "/>
<text text-anchor="middle" x="2730.5" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2610,-2367.5 2851,-2367.5 "/>
<text text-anchor="middle" x="2730.5" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2851,-2344.5 2851,-2643.5 "/>
<text text-anchor="middle" x="2861.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node25" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1714,-1065.5C1714,-1065.5 1933,-1065.5 1933,-1065.5 1939,-1065.5 1945,-1071.5 1945,-1077.5 1945,-1077.5 1945,-1145.5 1945,-1145.5 1945,-1151.5 1939,-1157.5 1933,-1157.5 1933,-1157.5 1714,-1157.5 1714,-1157.5 1708,-1157.5 1702,-1151.5 1702,-1145.5 1702,-1145.5 1702,-1077.5 1702,-1077.5 1702,-1071.5 1708,-1065.5 1714,-1065.5"/>
<text text-anchor="middle" x="1726.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1751,-1065.5 1751,-1157.5 "/>
<text text-anchor="middle" x="1761.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1772,-1065.5 1772,-1157.5 "/>
<text text-anchor="middle" x="1848" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1772,-1134.5 1924,-1134.5 "/>
<text text-anchor="middle" x="1848" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1772,-1111.5 1924,-1111.5 "/>
<text text-anchor="middle" x="1848" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1772,-1088.5 1924,-1088.5 "/>
<text text-anchor="middle" x="1848" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1924,-1065.5 1924,-1157.5 "/>
<text text-anchor="middle" x="1934.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge36" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2872.1968,-2450.0816C2986.4143,-2418.7071 3117.9149,-2373.7433 3152.5,-2326 3315.4026,-2101.1197 3171.5,-1979.184 3171.5,-1701.5 3171.5,-1701.5 3171.5,-1701.5 3171.5,-1313 3171.5,-1190.8557 2294.6118,-1134.6626 1955.3303,-1117.492"/>
<polygon fill="#000000" stroke="#000000" points="1955.3684,-1113.9896 1945.2052,-1116.9831 1955.0169,-1120.9808 1955.3684,-1113.9896"/>
<text text-anchor="middle" x="3198.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge15" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1104.5376,-1595.0098C1135.6529,-1598.9199 1164,-1591.25 1164,-1572 1164,-1554.8555 1141.5147,-1546.8964 1114.6145,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="1114.2006,-1544.6454 1104.5376,-1548.9902 1114.801,-1551.6196 1114.2006,-1544.6454"/>
<text text-anchor="middle" x="1180" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cycle -->
<g id="node24" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M995.5,-1278.5C995.5,-1278.5 1223.5,-1278.5 1223.5,-1278.5 1229.5,-1278.5 1235.5,-1284.5 1235.5,-1290.5 1235.5,-1290.5 1235.5,-1335.5 1235.5,-1335.5 1235.5,-1341.5 1229.5,-1347.5 1223.5,-1347.5 1223.5,-1347.5 995.5,-1347.5 995.5,-1347.5 989.5,-1347.5 983.5,-1341.5 983.5,-1335.5 983.5,-1335.5 983.5,-1290.5 983.5,-1290.5 983.5,-1284.5 989.5,-1278.5 995.5,-1278.5"/>
<text text-anchor="middle" x="1010.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1037.5,-1278.5 1037.5,-1347.5 "/>
<text text-anchor="middle" x="1048" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1058.5,-1278.5 1058.5,-1347.5 "/>
<text text-anchor="middle" x="1136.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1058.5,-1324.5 1214.5,-1324.5 "/>
<text text-anchor="middle" x="1136.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1058.5,-1301.5 1214.5,-1301.5 "/>
<text text-anchor="middle" x="1136.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1214.5,-1278.5 1214.5,-1347.5 "/>
<text text-anchor="middle" x="1225" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge24" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1052.2019,-1548.5587C1062.6952,-1505.4196 1085.2214,-1412.8122 1098.6924,-1357.4311"/>
<polygon fill="#000000" stroke="#000000" points="1102.1347,-1358.0878 1101.0974,-1347.5438 1095.333,-1356.4332 1102.1347,-1358.0878"/>
<text text-anchor="middle" x="1107" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- image -->
<g id="node12" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1829.5,-2836C1829.5,-2836 1865.5,-2836 1865.5,-2836 1871.5,-2836 1877.5,-2842 1877.5,-2848 1877.5,-2848 1877.5,-2860 1877.5,-2860 1877.5,-2866 1871.5,-2872 1865.5,-2872 1865.5,-2872 1829.5,-2872 1829.5,-2872 1823.5,-2872 1817.5,-2866 1817.5,-2860 1817.5,-2860 1817.5,-2848 1817.5,-2848 1817.5,-2842 1823.5,-2836 1829.5,-2836"/>
<text text-anchor="middle" x="1847.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node13" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1867.5,-2662.5C1867.5,-2662.5 1899.5,-2662.5 1899.5,-2662.5 1905.5,-2662.5 1911.5,-2668.5 1911.5,-2674.5 1911.5,-2674.5 1911.5,-2686.5 1911.5,-2686.5 1911.5,-2692.5 1905.5,-2698.5 1899.5,-2698.5 1899.5,-2698.5 1867.5,-2698.5 1867.5,-2698.5 1861.5,-2698.5 1855.5,-2692.5 1855.5,-2686.5 1855.5,-2686.5 1855.5,-2674.5 1855.5,-2674.5 1855.5,-2668.5 1861.5,-2662.5 1867.5,-2662.5"/>
<text text-anchor="middle" x="1883.5" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge9" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1843.5351,-2835.8839C1838.5063,-2808.8561 1832.2973,-2756.8861 1848.5,-2717 1850.0179,-2713.2635 1852.118,-2709.6927 1854.5425,-2706.3484"/>
<polygon fill="#000000" stroke="#000000" points="1857.3489,-2708.4488 1861.0907,-2698.5367 1851.9843,-2703.9519 1857.3489,-2708.4488"/>
<text text-anchor="middle" x="1879" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- sample -->
<g id="node22" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M1672,-1819.5C1672,-1819.5 2095,-1819.5 2095,-1819.5 2101,-1819.5 2107,-1825.5 2107,-1831.5 2107,-1831.5 2107,-2221.5 2107,-2221.5 2107,-2227.5 2101,-2233.5 2095,-2233.5 2095,-2233.5 1672,-2233.5 1672,-2233.5 1666,-2233.5 1660,-2227.5 1660,-2221.5 1660,-2221.5 1660,-1831.5 1660,-1831.5 1660,-1825.5 1666,-1819.5 1672,-1819.5"/>
<text text-anchor="middle" x="1694" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="1728,-1819.5 1728,-2233.5 "/>
<text text-anchor="middle" x="1738.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1749,-1819.5 1749,-2233.5 "/>
<text text-anchor="middle" x="1917.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="1749,-2210.5 2086,-2210.5 "/>
<text text-anchor="middle" x="1917.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1749,-2187.5 2086,-2187.5 "/>
<text text-anchor="middle" x="1917.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1749,-2164.5 2086,-2164.5 "/>
<text text-anchor="middle" x="1917.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1749,-2141.5 2086,-2141.5 "/>
<text text-anchor="middle" x="1917.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1749,-2118.5 2086,-2118.5 "/>
<text text-anchor="middle" x="1917.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1749,-2095.5 2086,-2095.5 "/>
<text text-anchor="middle" x="1917.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="1749,-2072.5 2086,-2072.5 "/>
<text text-anchor="middle" x="1917.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1749,-2049.5 2086,-2049.5 "/>
<text text-anchor="middle" x="1917.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="1749,-2026.5 2086,-2026.5 "/>
<text text-anchor="middle" x="1917.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="1749,-2003.5 2086,-2003.5 "/>
<text text-anchor="middle" x="1917.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1749,-1980.5 2086,-1980.5 "/>
<text text-anchor="middle" x="1917.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="1749,-1957.5 2086,-1957.5 "/>
<text text-anchor="middle" x="1917.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="1749,-1934.5 2086,-1934.5 "/>
<text text-anchor="middle" x="1917.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1749,-1911.5 2086,-1911.5 "/>
<text text-anchor="middle" x="1917.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="1749,-1888.5 2086,-1888.5 "/>
<text text-anchor="middle" x="1917.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1749,-1865.5 2086,-1865.5 "/>
<text text-anchor="middle" x="1917.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1749,-1842.5 2086,-1842.5 "/>
<text text-anchor="middle" x="1917.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2086,-1819.5 2086,-2233.5 "/>
<text text-anchor="middle" x="2096.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge23" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1883.5,-2662.3257C1883.5,-2602.0681 1883.5,-2403.6328 1883.5,-2244.2865"/>
<polygon fill="#000000" stroke="#000000" points="1887.0001,-2243.849 1883.5,-2233.849 1880.0001,-2243.8491 1887.0001,-2243.849"/>
<text text-anchor="middle" x="1920" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- physical_exam -->
<g id="node14" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1313.5,-1934.5C1313.5,-1934.5 1629.5,-1934.5 1629.5,-1934.5 1635.5,-1934.5 1641.5,-1940.5 1641.5,-1946.5 1641.5,-1946.5 1641.5,-2106.5 1641.5,-2106.5 1641.5,-2112.5 1635.5,-2118.5 1629.5,-2118.5 1629.5,-2118.5 1313.5,-2118.5 1313.5,-2118.5 1307.5,-2118.5 1301.5,-2112.5 1301.5,-2106.5 1301.5,-2106.5 1301.5,-1946.5 1301.5,-1946.5 1301.5,-1940.5 1307.5,-1934.5 1313.5,-1934.5"/>
<text text-anchor="middle" x="1362.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1423.5,-1934.5 1423.5,-2118.5 "/>
<text text-anchor="middle" x="1434" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1444.5,-1934.5 1444.5,-2118.5 "/>
<text text-anchor="middle" x="1532.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1444.5,-2095.5 1620.5,-2095.5 "/>
<text text-anchor="middle" x="1532.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1444.5,-2072.5 1620.5,-2072.5 "/>
<text text-anchor="middle" x="1532.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1444.5,-2049.5 1620.5,-2049.5 "/>
<text text-anchor="middle" x="1532.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1444.5,-2026.5 1620.5,-2026.5 "/>
<text text-anchor="middle" x="1532.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1444.5,-2003.5 1620.5,-2003.5 "/>
<text text-anchor="middle" x="1532.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1444.5,-1980.5 1620.5,-1980.5 "/>
<text text-anchor="middle" x="1532.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1444.5,-1957.5 1620.5,-1957.5 "/>
<text text-anchor="middle" x="1532.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1620.5,-1934.5 1620.5,-2118.5 "/>
<text text-anchor="middle" x="1631" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge6" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1430.7129,-1934.4348C1399.3923,-1870.954 1351.5449,-1787.4517 1292.5,-1727 1238.1517,-1671.3568 1160.1065,-1626.543 1106.58,-1599.6808"/>
<polygon fill="#000000" stroke="#000000" points="1108.0596,-1596.5079 1097.5457,-1595.2004 1104.9495,-1602.779 1108.0596,-1596.5079"/>
<text text-anchor="middle" x="1297.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge33" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1503.4442,-1934.3244C1531.7772,-1866.4736 1579.8963,-1777.5694 1651.5,-1727 1741.0777,-1663.7366 2023.4051,-1618.4553 2218.5501,-1593.7414"/>
<polygon fill="#000000" stroke="#000000" points="2219.1637,-1597.1919 2228.6485,-1592.4709 2218.2898,-1590.2466 2219.1637,-1597.1919"/>
<text text-anchor="middle" x="1756.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- vital_signs -->
<g id="node15" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M882,-1865.5C882,-1865.5 1169,-1865.5 1169,-1865.5 1175,-1865.5 1181,-1871.5 1181,-1877.5 1181,-1877.5 1181,-2175.5 1181,-2175.5 1181,-2181.5 1175,-2187.5 1169,-2187.5 1169,-2187.5 882,-2187.5 882,-2187.5 876,-2187.5 870,-2181.5 870,-2175.5 870,-2175.5 870,-1877.5 870,-1877.5 870,-1871.5 876,-1865.5 882,-1865.5"/>
<text text-anchor="middle" x="916.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="963,-1865.5 963,-2187.5 "/>
<text text-anchor="middle" x="973.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="984,-1865.5 984,-2187.5 "/>
<text text-anchor="middle" x="1072" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="984,-2164.5 1160,-2164.5 "/>
<text text-anchor="middle" x="1072" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="984,-2141.5 1160,-2141.5 "/>
<text text-anchor="middle" x="1072" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="984,-2118.5 1160,-2118.5 "/>
<text text-anchor="middle" x="1072" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="984,-2095.5 1160,-2095.5 "/>
<text text-anchor="middle" x="1072" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="984,-2072.5 1160,-2072.5 "/>
<text text-anchor="middle" x="1072" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="984,-2049.5 1160,-2049.5 "/>
<text text-anchor="middle" x="1072" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="984,-2026.5 1160,-2026.5 "/>
<text text-anchor="middle" x="1072" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="984,-2003.5 1160,-2003.5 "/>
<text text-anchor="middle" x="1072" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="984,-1980.5 1160,-1980.5 "/>
<text text-anchor="middle" x="1072" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="984,-1957.5 1160,-1957.5 "/>
<text text-anchor="middle" x="1072" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="984,-1934.5 1160,-1934.5 "/>
<text text-anchor="middle" x="1072" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="984,-1911.5 1160,-1911.5 "/>
<text text-anchor="middle" x="1072" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="984,-1888.5 1160,-1888.5 "/>
<text text-anchor="middle" x="1072" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1160,-1865.5 1160,-2187.5 "/>
<text text-anchor="middle" x="1170.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge4" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1032.9482,-1865.3007C1037.3156,-1770.7762 1042.4546,-1659.5546 1044.9643,-1605.236"/>
<polygon fill="#000000" stroke="#000000" points="1048.4649,-1605.3037 1045.4302,-1595.1528 1041.4723,-1604.9806 1048.4649,-1605.3037"/>
<text text-anchor="middle" x="1067.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- program -->
<g id="node16" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M1058.5,-.5C1058.5,-.5 1366.5,-.5 1366.5,-.5 1372.5,-.5 1378.5,-6.5 1378.5,-12.5 1378.5,-12.5 1378.5,-126.5 1378.5,-126.5 1378.5,-132.5 1372.5,-138.5 1366.5,-138.5 1366.5,-138.5 1058.5,-138.5 1058.5,-138.5 1052.5,-138.5 1046.5,-132.5 1046.5,-126.5 1046.5,-126.5 1046.5,-12.5 1046.5,-12.5 1046.5,-6.5 1052.5,-.5 1058.5,-.5"/>
<text text-anchor="middle" x="1085.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="1124.5,-.5 1124.5,-138.5 "/>
<text text-anchor="middle" x="1135" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1145.5,-.5 1145.5,-138.5 "/>
<text text-anchor="middle" x="1251.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="1145.5,-115.5 1357.5,-115.5 "/>
<text text-anchor="middle" x="1251.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="1145.5,-92.5 1357.5,-92.5 "/>
<text text-anchor="middle" x="1251.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="1145.5,-69.5 1357.5,-69.5 "/>
<text text-anchor="middle" x="1251.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="1145.5,-46.5 1357.5,-46.5 "/>
<text text-anchor="middle" x="1251.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="1145.5,-23.5 1357.5,-23.5 "/>
<text text-anchor="middle" x="1251.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="1357.5,-.5 1357.5,-138.5 "/>
<text text-anchor="middle" x="1368" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge40" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2438.8826,-1468.4365C2450.5713,-1387.6373 2451.0445,-1277.9009 2388.5,-1209 2331.9691,-1146.7239 2103.8657,-1124.1807 1955.3427,-1116.0508"/>
<polygon fill="#000000" stroke="#000000" points="1955.4058,-1112.5493 1945.234,-1115.5129 1955.0338,-1119.5394 1955.4058,-1112.5493"/>
<text text-anchor="middle" x="2471.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file -->
<g id="node18" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M1915,-2750.5C1915,-2750.5 2100,-2750.5 2100,-2750.5 2106,-2750.5 2112,-2756.5 2112,-2762.5 2112,-2762.5 2112,-2945.5 2112,-2945.5 2112,-2951.5 2106,-2957.5 2100,-2957.5 2100,-2957.5 1915,-2957.5 1915,-2957.5 1909,-2957.5 1903,-2951.5 1903,-2945.5 1903,-2945.5 1903,-2762.5 1903,-2762.5 1903,-2756.5 1909,-2750.5 1915,-2750.5"/>
<text text-anchor="middle" x="1922.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="1942,-2750.5 1942,-2957.5 "/>
<text text-anchor="middle" x="1952.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1963,-2750.5 1963,-2957.5 "/>
<text text-anchor="middle" x="2027" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="1963,-2934.5 2091,-2934.5 "/>
<text text-anchor="middle" x="2027" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="1963,-2911.5 2091,-2911.5 "/>
<text text-anchor="middle" x="2027" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_locations</text>
<polyline fill="none" stroke="#000000" points="1963,-2888.5 2091,-2888.5 "/>
<text text-anchor="middle" x="2027" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="1963,-2865.5 2091,-2865.5 "/>
<text text-anchor="middle" x="2027" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="1963,-2842.5 2091,-2842.5 "/>
<text text-anchor="middle" x="2027" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="1963,-2819.5 2091,-2819.5 "/>
<text text-anchor="middle" x="2027" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="1963,-2796.5 2091,-2796.5 "/>
<text text-anchor="middle" x="2027" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="1963,-2773.5 2091,-2773.5 "/>
<text text-anchor="middle" x="2027" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="2091,-2750.5 2091,-2957.5 "/>
<text text-anchor="middle" x="2101.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge12" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M2112.0419,-2798.7355C2213.9923,-2744.8411 2371.4638,-2661.5962 2496.0756,-2595.7222"/>
<polygon fill="#000000" stroke="#000000" points="2497.7846,-2598.7777 2504.9896,-2591.0099 2494.5131,-2592.5892 2497.7846,-2598.7777"/>
<text text-anchor="middle" x="2315" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge8" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1933.2211,-2750.0694C1921.7656,-2734.041 1910.8927,-2718.8278 1902.2525,-2706.7384"/>
<polygon fill="#000000" stroke="#000000" points="1905.0415,-2704.6213 1896.3793,-2698.5206 1899.3464,-2708.6915 1905.0415,-2704.6213"/>
<text text-anchor="middle" x="1950" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge22" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2002.3956,-2750.3798C1996.2582,-2646.9331 1983.7458,-2483.679 1960.5,-2344 1955.055,-2311.2819 1948.0797,-2276.9443 1940.5574,-2243.4344"/>
<polygon fill="#000000" stroke="#000000" points="1943.9383,-2242.5166 1938.3148,-2233.5373 1937.1114,-2244.0636 1943.9383,-2242.5166"/>
<text text-anchor="middle" x="2035" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge32" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M1212.5,-190.4932C1212.5,-176.7786 1212.5,-162.5421 1212.5,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="1216.0001,-148.5183 1212.5,-138.5184 1209.0001,-148.5184 1216.0001,-148.5183"/>
<text text-anchor="middle" x="1253" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- follow_up -->
<g id="node20" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1657.5,-1209.5C1657.5,-1209.5 1989.5,-1209.5 1989.5,-1209.5 1995.5,-1209.5 2001.5,-1215.5 2001.5,-1221.5 2001.5,-1221.5 2001.5,-1404.5 2001.5,-1404.5 2001.5,-1410.5 1995.5,-1416.5 1989.5,-1416.5 1989.5,-1416.5 1657.5,-1416.5 1657.5,-1416.5 1651.5,-1416.5 1645.5,-1410.5 1645.5,-1404.5 1645.5,-1404.5 1645.5,-1221.5 1645.5,-1221.5 1645.5,-1215.5 1651.5,-1209.5 1657.5,-1209.5"/>
<text text-anchor="middle" x="1688" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="1730.5,-1209.5 1730.5,-1416.5 "/>
<text text-anchor="middle" x="1741" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1751.5,-1209.5 1751.5,-1416.5 "/>
<text text-anchor="middle" x="1866" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="1751.5,-1393.5 1980.5,-1393.5 "/>
<text text-anchor="middle" x="1866" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1751.5,-1370.5 1980.5,-1370.5 "/>
<text text-anchor="middle" x="1866" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="1751.5,-1347.5 1980.5,-1347.5 "/>
<text text-anchor="middle" x="1866" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="1751.5,-1324.5 1980.5,-1324.5 "/>
<text text-anchor="middle" x="1866" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="1751.5,-1301.5 1980.5,-1301.5 "/>
<text text-anchor="middle" x="1866" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="1751.5,-1278.5 1980.5,-1278.5 "/>
<text text-anchor="middle" x="1866" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="1751.5,-1255.5 1980.5,-1255.5 "/>
<text text-anchor="middle" x="1866" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="1751.5,-1232.5 1980.5,-1232.5 "/>
<text text-anchor="middle" x="1866" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1980.5,-1209.5 1980.5,-1416.5 "/>
<text text-anchor="middle" x="1991" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge41" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1823.5,-1209.2987C1823.5,-1194.9939 1823.5,-1180.7685 1823.5,-1167.7773"/>
<polygon fill="#000000" stroke="#000000" points="1827.0001,-1167.6452 1823.5,-1157.6452 1820.0001,-1167.6453 1827.0001,-1167.6452"/>
<text text-anchor="middle" x="1850.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_therapy -->
<g id="node21" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M2187.5,-1727.5C2187.5,-1727.5 2643.5,-1727.5 2643.5,-1727.5 2649.5,-1727.5 2655.5,-1733.5 2655.5,-1739.5 2655.5,-1739.5 2655.5,-2313.5 2655.5,-2313.5 2655.5,-2319.5 2649.5,-2325.5 2643.5,-2325.5 2643.5,-2325.5 2187.5,-2325.5 2187.5,-2325.5 2181.5,-2325.5 2175.5,-2319.5 2175.5,-2313.5 2175.5,-2313.5 2175.5,-1739.5 2175.5,-1739.5 2175.5,-1733.5 2181.5,-1727.5 2187.5,-1727.5"/>
<text text-anchor="middle" x="2233" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2290.5,-1727.5 2290.5,-2325.5 "/>
<text text-anchor="middle" x="2301" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2311.5,-1727.5 2311.5,-2325.5 "/>
<text text-anchor="middle" x="2473" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2302.5 2634.5,-2302.5 "/>
<text text-anchor="middle" x="2473" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2279.5 2634.5,-2279.5 "/>
<text text-anchor="middle" x="2473" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2256.5 2634.5,-2256.5 "/>
<text text-anchor="middle" x="2473" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2233.5 2634.5,-2233.5 "/>
<text text-anchor="middle" x="2473" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2210.5 2634.5,-2210.5 "/>
<text text-anchor="middle" x="2473" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2187.5 2634.5,-2187.5 "/>
<text text-anchor="middle" x="2473" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2164.5 2634.5,-2164.5 "/>
<text text-anchor="middle" x="2473" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2141.5 2634.5,-2141.5 "/>
<text text-anchor="middle" x="2473" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2118.5 2634.5,-2118.5 "/>
<text text-anchor="middle" x="2473" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2095.5 2634.5,-2095.5 "/>
<text text-anchor="middle" x="2473" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2072.5 2634.5,-2072.5 "/>
<text text-anchor="middle" x="2473" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2049.5 2634.5,-2049.5 "/>
<text text-anchor="middle" x="2473" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2026.5 2634.5,-2026.5 "/>
<text text-anchor="middle" x="2473" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="2311.5,-2003.5 2634.5,-2003.5 "/>
<text text-anchor="middle" x="2473" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2311.5,-1980.5 2634.5,-1980.5 "/>
<text text-anchor="middle" x="2473" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="2311.5,-1957.5 2634.5,-1957.5 "/>
<text text-anchor="middle" x="2473" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2311.5,-1934.5 2634.5,-1934.5 "/>
<text text-anchor="middle" x="2473" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2311.5,-1911.5 2634.5,-1911.5 "/>
<text text-anchor="middle" x="2473" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="2311.5,-1888.5 2634.5,-1888.5 "/>
<text text-anchor="middle" x="2473" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2311.5,-1865.5 2634.5,-1865.5 "/>
<text text-anchor="middle" x="2473" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="2311.5,-1842.5 2634.5,-1842.5 "/>
<text text-anchor="middle" x="2473" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="2311.5,-1819.5 2634.5,-1819.5 "/>
<text text-anchor="middle" x="2473" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="2311.5,-1796.5 2634.5,-1796.5 "/>
<text text-anchor="middle" x="2473" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="2311.5,-1773.5 2634.5,-1773.5 "/>
<text text-anchor="middle" x="2473" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="2311.5,-1750.5 2634.5,-1750.5 "/>
<text text-anchor="middle" x="2473" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="2634.5,-1727.5 2634.5,-2325.5 "/>
<text text-anchor="middle" x="2645" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge35" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2415.5,-1727.4595C2415.5,-1712.999 2415.5,-1698.9707 2415.5,-1685.6442"/>
<polygon fill="#000000" stroke="#000000" points="2419.0001,-1685.5945 2415.5,-1675.5945 2412.0001,-1685.5946 2419.0001,-1685.5945"/>
<text text-anchor="middle" x="2465.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge18" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M2655.7384,-2064.6912C2666.9387,-2055.0507 2673.5,-2042.3203 2673.5,-2026.5 2673.5,-2014.3876 2669.6539,-2004.0864 2662.8244,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="2665.219,-1993.0385 2655.7384,-1988.3088 2660.2002,-1997.9183 2665.219,-1993.0385"/>
<text text-anchor="middle" x="2689.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge7" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1755.4987,-1819.1819C1725.0985,-1783.6849 1689.8805,-1750.6768 1650.5,-1727 1610.6726,-1703.0546 1592.8518,-1719.1401 1547.5,-1709 1399.9536,-1676.0106 1230.7702,-1627.4668 1131.5831,-1597.8942"/>
<polygon fill="#000000" stroke="#000000" points="1132.4941,-1594.5136 1121.9106,-1595.0043 1130.4901,-1601.2206 1132.4941,-1594.5136"/>
<text text-anchor="middle" x="1575.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge14" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2107.0955,-2065.8333C2118.3572,-2056.0642 2125,-2042.9531 2125,-2026.5 2125,-2013.9031 2121.1061,-2003.2652 2114.2267,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="2116.5485,-1991.9513 2107.0955,-1987.1667 2111.5016,-1996.802 2116.5485,-1991.9513"/>
<text text-anchor="middle" x="2141" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge37" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1742.2031,-1819.4559C1722.1887,-1783.7347 1703.6441,-1746.1239 1689.5,-1709 1642.5399,-1585.7446 1648.3254,-1548.367 1636.5,-1417 1628.2118,-1324.9278 1588.5679,-1288.0474 1636.5,-1209 1650.0508,-1186.6527 1670.5835,-1169.1873 1693.151,-1155.6188"/>
<polygon fill="#000000" stroke="#000000" points="1694.9561,-1158.6184 1701.8896,-1150.6073 1691.4736,-1152.5461 1694.9561,-1158.6184"/>
<text text-anchor="middle" x="1665.5" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- demographic -->
<g id="node23" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M2031.5,-1232.5C2031.5,-1232.5 2367.5,-1232.5 2367.5,-1232.5 2373.5,-1232.5 2379.5,-1238.5 2379.5,-1244.5 2379.5,-1244.5 2379.5,-1381.5 2379.5,-1381.5 2379.5,-1387.5 2373.5,-1393.5 2367.5,-1393.5 2367.5,-1393.5 2031.5,-1393.5 2031.5,-1393.5 2025.5,-1393.5 2019.5,-1387.5 2019.5,-1381.5 2019.5,-1381.5 2019.5,-1244.5 2019.5,-1244.5 2019.5,-1238.5 2025.5,-1232.5 2031.5,-1232.5"/>
<text text-anchor="middle" x="2074.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="2129.5,-1232.5 2129.5,-1393.5 "/>
<text text-anchor="middle" x="2140" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2150.5,-1232.5 2150.5,-1393.5 "/>
<text text-anchor="middle" x="2254.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="2150.5,-1370.5 2358.5,-1370.5 "/>
<text text-anchor="middle" x="2254.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="2150.5,-1347.5 2358.5,-1347.5 "/>
<text text-anchor="middle" x="2254.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="2150.5,-1324.5 2358.5,-1324.5 "/>
<text text-anchor="middle" x="2254.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="2150.5,-1301.5 2358.5,-1301.5 "/>
<text text-anchor="middle" x="2254.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="2150.5,-1278.5 2358.5,-1278.5 "/>
<text text-anchor="middle" x="2254.5" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="2150.5,-1255.5 2358.5,-1255.5 "/>
<text text-anchor="middle" x="2254.5" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2358.5,-1232.5 2358.5,-1393.5 "/>
<text text-anchor="middle" x="2369" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge38" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2053.9305,-1232.4716C2039.2831,-1224.4968 2024.613,-1216.5609 2010.5,-1209 1981.9608,-1193.7104 1950.8251,-1177.3499 1922.292,-1162.4828"/>
<polygon fill="#000000" stroke="#000000" points="1923.6123,-1159.2243 1913.1261,-1157.7115 1920.3802,-1165.4334 1923.6123,-1159.2243"/>
<text text-anchor="middle" x="2001.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge39" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1213.3497,-1278.3885C1302.1271,-1249.349 1433.5351,-1207.6603 1549.5,-1176 1595.7274,-1163.3792 1646.7406,-1150.9638 1692.0915,-1140.4481"/>
<polygon fill="#000000" stroke="#000000" points="1693.0229,-1143.8252 1701.9788,-1138.1646 1691.4477,-1137.0047 1693.0229,-1143.8252"/>
<text text-anchor="middle" x="1576.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge21" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1847.2599,-1065.3178C1865.8299,-1029.223 1892.4464,-977.4884 1916.5401,-930.6572"/>
<polygon fill="#000000" stroke="#000000" points="1919.7017,-932.1625 1921.1643,-921.6691 1913.4771,-928.96 1919.7017,-932.1625"/>
<text text-anchor="middle" x="1918" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge27" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1945.4666,-1096.4758C2044.1759,-1081.5144 2171.8229,-1054.8309 2203.5,-1014 2310.2935,-876.3463 2321.9375,-749.773 2203.5,-622 2175.306,-591.5837 1625.0649,-564.4319 1361.2663,-553.1033"/>
<polygon fill="#000000" stroke="#000000" points="1361.3744,-549.6048 1351.2339,-552.6742 1361.0752,-556.5984 1361.3744,-549.6048"/>
<text text-anchor="middle" x="2328" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge28" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1701.9304,-1108.603C1439.1838,-1101.1661 836.6366,-1077.3294 770.5,-1014 635.2357,-884.477 713.5,-783.7769 713.5,-596.5 713.5,-596.5 713.5,-596.5 713.5,-438 713.5,-365.6089 904.7444,-318.8454 1050.4436,-293.7228"/>
<polygon fill="#000000" stroke="#000000" points="1051.1412,-297.1545 1060.4117,-292.0253 1049.9661,-290.2538 1051.1412,-297.1545"/>
<text text-anchor="middle" x="754" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- adverse_event -->
<g id="node26" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M791,-622.5C791,-622.5 1186,-622.5 1186,-622.5 1192,-622.5 1198,-628.5 1198,-634.5 1198,-634.5 1198,-1001.5 1198,-1001.5 1198,-1007.5 1192,-1013.5 1186,-1013.5 1186,-1013.5 791,-1013.5 791,-1013.5 785,-1013.5 779,-1007.5 779,-1001.5 779,-1001.5 779,-634.5 779,-634.5 779,-628.5 785,-622.5 791,-622.5"/>
<text text-anchor="middle" x="839" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="899,-622.5 899,-1013.5 "/>
<text text-anchor="middle" x="909.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="920,-622.5 920,-1013.5 "/>
<text text-anchor="middle" x="1048.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="920,-990.5 1177,-990.5 "/>
<text text-anchor="middle" x="1048.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="920,-967.5 1177,-967.5 "/>
<text text-anchor="middle" x="1048.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="920,-944.5 1177,-944.5 "/>
<text text-anchor="middle" x="1048.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="920,-921.5 1177,-921.5 "/>
<text text-anchor="middle" x="1048.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="920,-898.5 1177,-898.5 "/>
<text text-anchor="middle" x="1048.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="920,-875.5 1177,-875.5 "/>
<text text-anchor="middle" x="1048.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="920,-852.5 1177,-852.5 "/>
<text text-anchor="middle" x="1048.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="920,-829.5 1177,-829.5 "/>
<text text-anchor="middle" x="1048.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="920,-806.5 1177,-806.5 "/>
<text text-anchor="middle" x="1048.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="920,-783.5 1177,-783.5 "/>
<text text-anchor="middle" x="1048.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="920,-760.5 1177,-760.5 "/>
<text text-anchor="middle" x="1048.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="920,-737.5 1177,-737.5 "/>
<text text-anchor="middle" x="1048.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="920,-714.5 1177,-714.5 "/>
<text text-anchor="middle" x="1048.5" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="920,-691.5 1177,-691.5 "/>
<text text-anchor="middle" x="1048.5" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="920,-668.5 1177,-668.5 "/>
<text text-anchor="middle" x="1048.5" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="920,-645.5 1177,-645.5 "/>
<text text-anchor="middle" x="1048.5" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1177,-622.5 1177,-1013.5 "/>
<text text-anchor="middle" x="1187.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge11" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1701.8427,-1097.1396C1560.1995,-1079.2723 1335.6744,-1047.0639 1257.5,-1014 1240.6612,-1006.878 1223.8756,-998.5224 1207.3872,-989.347"/>
<polygon fill="#000000" stroke="#000000" points="1208.6839,-986.0586 1198.2591,-984.1678 1205.2294,-992.1469 1208.6839,-986.0586"/>
<text text-anchor="middle" x="1443.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- off_treatment -->
<g id="node27" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1278,-726C1278,-726 1725,-726 1725,-726 1731,-726 1737,-732 1737,-738 1737,-738 1737,-898 1737,-898 1737,-904 1731,-910 1725,-910 1725,-910 1278,-910 1278,-910 1272,-910 1266,-904 1266,-898 1266,-898 1266,-738 1266,-738 1266,-732 1272,-726 1278,-726"/>
<text text-anchor="middle" x="1323.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1381,-726 1381,-910 "/>
<text text-anchor="middle" x="1391.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1402,-726 1402,-910 "/>
<text text-anchor="middle" x="1559" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1402,-887 1716,-887 "/>
<text text-anchor="middle" x="1559" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1402,-864 1716,-864 "/>
<text text-anchor="middle" x="1559" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1402,-841 1716,-841 "/>
<text text-anchor="middle" x="1559" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1402,-818 1716,-818 "/>
<text text-anchor="middle" x="1559" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1402,-795 1716,-795 "/>
<text text-anchor="middle" x="1559" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1402,-772 1716,-772 "/>
<text text-anchor="middle" x="1559" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1402,-749 1716,-749 "/>
<text text-anchor="middle" x="1559" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1716,-726 1716,-910 "/>
<text text-anchor="middle" x="1726.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge10" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1738.9008,-1065.38C1730.0729,-1059.5507 1721.4368,-1053.3806 1713.5,-1047 1666.1979,-1008.9726 1619.6985,-960.3756 1582.3571,-917.741"/>
<polygon fill="#000000" stroke="#000000" points="1584.9374,-915.3745 1575.7319,-910.1296 1579.6574,-919.9704 1584.9374,-915.3745"/>
<text text-anchor="middle" x="1784.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge20" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M961.0347,-622.4901C958.8394,-606.8636 956.8337,-592.5861 955.1752,-580.7798"/>
<polygon fill="#000000" stroke="#000000" points="958.6113,-580.0799 953.7541,-570.6641 951.6794,-581.0538 958.6113,-580.0799"/>
<text text-anchor="middle" x="989.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- adverse_event&#45;&gt;visit -->
<g id="edge1" class="edge">
<title>adverse_event&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M960.5278,-1013.8381C949.4103,-1131.9667 945.2724,-1284.7021 974.5,-1417 984.4771,-1462.1611 1008.9978,-1509.7914 1026.6524,-1540.1408"/>
<polygon fill="#000000" stroke="#000000" points="1023.781,-1542.161 1031.8873,-1548.9829 1029.8045,-1538.5948 1023.781,-1542.161"/>
<text text-anchor="middle" x="980.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge16" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1198.2046,-845.2761C1209.376,-838.5862 1216,-829.4941 1216,-818 1216,-809.7386 1212.5781,-802.7181 1206.5052,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="1208.3073,-793.9155 1198.2046,-790.7239 1204.1119,-799.519 1208.3073,-793.9155"/>
<text text-anchor="middle" x="1232" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- principal_investigator -->
<g id="node28" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M1683,-403.5C1683,-403.5 2010,-403.5 2010,-403.5 2016,-403.5 2022,-409.5 2022,-415.5 2022,-415.5 2022,-460.5 2022,-460.5 2022,-466.5 2016,-472.5 2010,-472.5 2010,-472.5 1683,-472.5 1683,-472.5 1677,-472.5 1671,-466.5 1671,-460.5 1671,-460.5 1671,-415.5 1671,-415.5 1671,-409.5 1677,-403.5 1683,-403.5"/>
<text text-anchor="middle" x="1758" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="1845,-403.5 1845,-472.5 "/>
<text text-anchor="middle" x="1855.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1866,-403.5 1866,-472.5 "/>
<text text-anchor="middle" x="1933.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="1866,-449.5 2001,-449.5 "/>
<text text-anchor="middle" x="1933.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="1866,-426.5 2001,-426.5 "/>
<text text-anchor="middle" x="1933.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="2001,-403.5 2001,-472.5 "/>
<text text-anchor="middle" x="2011.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge25" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1715.5193,-403.4988C1616.6265,-377.4497 1480.3571,-341.5554 1374.5926,-313.6963"/>
<polygon fill="#000000" stroke="#000000" points="1375.3401,-310.2739 1364.7784,-311.1112 1373.557,-317.043 1375.3401,-310.2739"/>
<text text-anchor="middle" x="1671" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
</g>
</svg>
</div>
