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
        $ export MODELTOOL_DIR=$(pwd)                     # set MODELTOOL_DIR to absolute path to repo dir
        $ export PATH=$PATH:$MODELTOOL_DIR/make_model/bin # put the script in your path
        $ cd model-desc                                   # go to where the model description files are
        $ model-tool-d -T icdc-model.txt icdc-model*.yml  # try creating a node/property table


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
<svg width="3443pt" height="2918pt"
 viewBox="0.00 0.00 3442.50 2918.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2914)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2914 3438.5,-2914 3438.5,4 -4,4"/>
<!-- assay -->
<g id="node1" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1589,-2333.5C1589,-2333.5 1621,-2333.5 1621,-2333.5 1627,-2333.5 1633,-2339.5 1633,-2345.5 1633,-2345.5 1633,-2357.5 1633,-2357.5 1633,-2363.5 1627,-2369.5 1621,-2369.5 1621,-2369.5 1589,-2369.5 1589,-2369.5 1583,-2369.5 1577,-2363.5 1577,-2357.5 1577,-2357.5 1577,-2345.5 1577,-2345.5 1577,-2339.5 1583,-2333.5 1589,-2333.5"/>
<text text-anchor="middle" x="1605" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- sample -->
<g id="node9" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M1393.5,-1301.5C1393.5,-1301.5 1816.5,-1301.5 1816.5,-1301.5 1822.5,-1301.5 1828.5,-1307.5 1828.5,-1313.5 1828.5,-1313.5 1828.5,-1703.5 1828.5,-1703.5 1828.5,-1709.5 1822.5,-1715.5 1816.5,-1715.5 1816.5,-1715.5 1393.5,-1715.5 1393.5,-1715.5 1387.5,-1715.5 1381.5,-1709.5 1381.5,-1703.5 1381.5,-1703.5 1381.5,-1313.5 1381.5,-1313.5 1381.5,-1307.5 1387.5,-1301.5 1393.5,-1301.5"/>
<text text-anchor="middle" x="1415.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="1449.5,-1301.5 1449.5,-1715.5 "/>
<text text-anchor="middle" x="1460" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1470.5,-1301.5 1470.5,-1715.5 "/>
<text text-anchor="middle" x="1639" y="-1700.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1692.5 1807.5,-1692.5 "/>
<text text-anchor="middle" x="1639" y="-1677.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1669.5 1807.5,-1669.5 "/>
<text text-anchor="middle" x="1639" y="-1654.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1646.5 1807.5,-1646.5 "/>
<text text-anchor="middle" x="1639" y="-1631.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1623.5 1807.5,-1623.5 "/>
<text text-anchor="middle" x="1639" y="-1608.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1600.5 1807.5,-1600.5 "/>
<text text-anchor="middle" x="1639" y="-1585.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1577.5 1807.5,-1577.5 "/>
<text text-anchor="middle" x="1639" y="-1562.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1554.5 1807.5,-1554.5 "/>
<text text-anchor="middle" x="1639" y="-1539.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1531.5 1807.5,-1531.5 "/>
<text text-anchor="middle" x="1639" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1508.5 1807.5,-1508.5 "/>
<text text-anchor="middle" x="1639" y="-1493.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1485.5 1807.5,-1485.5 "/>
<text text-anchor="middle" x="1639" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1462.5 1807.5,-1462.5 "/>
<text text-anchor="middle" x="1639" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1439.5 1807.5,-1439.5 "/>
<text text-anchor="middle" x="1639" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1416.5 1807.5,-1416.5 "/>
<text text-anchor="middle" x="1639" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1393.5 1807.5,-1393.5 "/>
<text text-anchor="middle" x="1639" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1370.5 1807.5,-1370.5 "/>
<text text-anchor="middle" x="1639" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1347.5 1807.5,-1347.5 "/>
<text text-anchor="middle" x="1639" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1470.5,-1324.5 1807.5,-1324.5 "/>
<text text-anchor="middle" x="1639" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1807.5,-1301.5 1807.5,-1715.5 "/>
<text text-anchor="middle" x="1818" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge3" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1605,-2333.1088C1605,-2254.7737 1605,-1943.0456 1605,-1726.159"/>
<polygon fill="#000000" stroke="#000000" points="1608.5001,-1725.9041 1605,-1715.9041 1601.5001,-1725.9041 1608.5001,-1725.9041"/>
<text text-anchor="middle" x="1641.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- case -->
<g id="node2" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M2183.5,-1157.5C2183.5,-1157.5 2402.5,-1157.5 2402.5,-1157.5 2408.5,-1157.5 2414.5,-1163.5 2414.5,-1169.5 2414.5,-1169.5 2414.5,-1237.5 2414.5,-1237.5 2414.5,-1243.5 2408.5,-1249.5 2402.5,-1249.5 2402.5,-1249.5 2183.5,-1249.5 2183.5,-1249.5 2177.5,-1249.5 2171.5,-1243.5 2171.5,-1237.5 2171.5,-1237.5 2171.5,-1169.5 2171.5,-1169.5 2171.5,-1163.5 2177.5,-1157.5 2183.5,-1157.5"/>
<text text-anchor="middle" x="2196" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="2220.5,-1157.5 2220.5,-1249.5 "/>
<text text-anchor="middle" x="2231" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2241.5,-1157.5 2241.5,-1249.5 "/>
<text text-anchor="middle" x="2317.5" y="-1234.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="2241.5,-1226.5 2393.5,-1226.5 "/>
<text text-anchor="middle" x="2317.5" y="-1211.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="2241.5,-1203.5 2393.5,-1203.5 "/>
<text text-anchor="middle" x="2317.5" y="-1188.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2241.5,-1180.5 2393.5,-1180.5 "/>
<text text-anchor="middle" x="2317.5" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="2393.5,-1157.5 2393.5,-1249.5 "/>
<text text-anchor="middle" x="2404" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort -->
<g id="node4" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M2196.5,-524.5C2196.5,-524.5 2429.5,-524.5 2429.5,-524.5 2435.5,-524.5 2441.5,-530.5 2441.5,-536.5 2441.5,-536.5 2441.5,-558.5 2441.5,-558.5 2441.5,-564.5 2435.5,-570.5 2429.5,-570.5 2429.5,-570.5 2196.5,-570.5 2196.5,-570.5 2190.5,-570.5 2184.5,-564.5 2184.5,-558.5 2184.5,-558.5 2184.5,-536.5 2184.5,-536.5 2184.5,-530.5 2190.5,-524.5 2196.5,-524.5"/>
<text text-anchor="middle" x="2216" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="2247.5,-524.5 2247.5,-570.5 "/>
<text text-anchor="middle" x="2258" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2268.5,-524.5 2268.5,-570.5 "/>
<text text-anchor="middle" x="2344.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2268.5,-547.5 2420.5,-547.5 "/>
<text text-anchor="middle" x="2344.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="2420.5,-524.5 2420.5,-570.5 "/>
<text text-anchor="middle" x="2431" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge15" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M2294.4064,-1157.3714C2298.2183,-1032.3385 2308.6834,-689.0832 2311.9869,-580.7305"/>
<polygon fill="#000000" stroke="#000000" points="2315.4861,-580.8064 2312.2926,-570.7043 2308.4893,-580.593 2315.4861,-580.8064"/>
<text text-anchor="middle" x="2350.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_study -->
<g id="node6" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M2518.5,-760.5C2518.5,-760.5 2933.5,-760.5 2933.5,-760.5 2939.5,-760.5 2945.5,-766.5 2945.5,-772.5 2945.5,-772.5 2945.5,-955.5 2945.5,-955.5 2945.5,-961.5 2939.5,-967.5 2933.5,-967.5 2933.5,-967.5 2518.5,-967.5 2518.5,-967.5 2512.5,-967.5 2506.5,-961.5 2506.5,-955.5 2506.5,-955.5 2506.5,-772.5 2506.5,-772.5 2506.5,-766.5 2512.5,-760.5 2518.5,-760.5"/>
<text text-anchor="middle" x="2548" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="2589.5,-760.5 2589.5,-967.5 "/>
<text text-anchor="middle" x="2600" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2610.5,-760.5 2610.5,-967.5 "/>
<text text-anchor="middle" x="2767.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2610.5,-944.5 2924.5,-944.5 "/>
<text text-anchor="middle" x="2767.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2610.5,-921.5 2924.5,-921.5 "/>
<text text-anchor="middle" x="2767.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2610.5,-898.5 2924.5,-898.5 "/>
<text text-anchor="middle" x="2767.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="2610.5,-875.5 2924.5,-875.5 "/>
<text text-anchor="middle" x="2767.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2610.5,-852.5 2924.5,-852.5 "/>
<text text-anchor="middle" x="2767.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="2610.5,-829.5 2924.5,-829.5 "/>
<text text-anchor="middle" x="2767.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2610.5,-806.5 2924.5,-806.5 "/>
<text text-anchor="middle" x="2767.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2610.5,-783.5 2924.5,-783.5 "/>
<text text-anchor="middle" x="2767.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2924.5,-760.5 2924.5,-967.5 "/>
<text text-anchor="middle" x="2935" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge22" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M2414.7285,-1175.8022C2441.4923,-1166.5801 2468.7567,-1154.5494 2492,-1139 2555.6908,-1096.3919 2611.9097,-1031.774 2653.2708,-975.88"/>
<polygon fill="#000000" stroke="#000000" points="2656.177,-977.8353 2659.2645,-967.7003 2650.5307,-973.6978 2656.177,-977.8353"/>
<text text-anchor="middle" x="2561.5" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- study -->
<g id="node18" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M2022,-190.5C2022,-190.5 2302,-190.5 2302,-190.5 2308,-190.5 2314,-196.5 2314,-202.5 2314,-202.5 2314,-339.5 2314,-339.5 2314,-345.5 2308,-351.5 2302,-351.5 2302,-351.5 2022,-351.5 2022,-351.5 2016,-351.5 2010,-345.5 2010,-339.5 2010,-339.5 2010,-202.5 2010,-202.5 2010,-196.5 2016,-190.5 2022,-190.5"/>
<text text-anchor="middle" x="2038" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="2066,-190.5 2066,-351.5 "/>
<text text-anchor="middle" x="2076.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2087,-190.5 2087,-351.5 "/>
<text text-anchor="middle" x="2190" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="2087,-328.5 2293,-328.5 "/>
<text text-anchor="middle" x="2190" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="2087,-305.5 2293,-305.5 "/>
<text text-anchor="middle" x="2190" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="2087,-282.5 2293,-282.5 "/>
<text text-anchor="middle" x="2190" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="2087,-259.5 2293,-259.5 "/>
<text text-anchor="middle" x="2190" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="2087,-236.5 2293,-236.5 "/>
<text text-anchor="middle" x="2190" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="2087,-213.5 2293,-213.5 "/>
<text text-anchor="middle" x="2190" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="2293,-190.5 2293,-351.5 "/>
<text text-anchor="middle" x="2303.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge16" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2350.7899,-1157.3545C2366.804,-1142.3307 2383.0518,-1124.6747 2395,-1106 2456.2804,-1010.2206 2478,-977.7057 2478,-864 2478,-864 2478,-864 2478,-438 2478,-360.0471 2401.9021,-318.3856 2324.3933,-296.1692"/>
<polygon fill="#000000" stroke="#000000" points="2325.0171,-292.7106 2314.4463,-293.424 2323.1548,-299.4583 2325.0171,-292.7106"/>
<text text-anchor="middle" x="2518.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- adverse_event -->
<g id="node22" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1273.5,-668.5C1273.5,-668.5 1668.5,-668.5 1668.5,-668.5 1674.5,-668.5 1680.5,-674.5 1680.5,-680.5 1680.5,-680.5 1680.5,-1047.5 1680.5,-1047.5 1680.5,-1053.5 1674.5,-1059.5 1668.5,-1059.5 1668.5,-1059.5 1273.5,-1059.5 1273.5,-1059.5 1267.5,-1059.5 1261.5,-1053.5 1261.5,-1047.5 1261.5,-1047.5 1261.5,-680.5 1261.5,-680.5 1261.5,-674.5 1267.5,-668.5 1273.5,-668.5"/>
<text text-anchor="middle" x="1321.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1381.5,-668.5 1381.5,-1059.5 "/>
<text text-anchor="middle" x="1392" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1402.5,-668.5 1402.5,-1059.5 "/>
<text text-anchor="middle" x="1531" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1402.5,-1036.5 1659.5,-1036.5 "/>
<text text-anchor="middle" x="1531" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1402.5,-1013.5 1659.5,-1013.5 "/>
<text text-anchor="middle" x="1531" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1402.5,-990.5 1659.5,-990.5 "/>
<text text-anchor="middle" x="1531" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1402.5,-967.5 1659.5,-967.5 "/>
<text text-anchor="middle" x="1531" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1402.5,-944.5 1659.5,-944.5 "/>
<text text-anchor="middle" x="1531" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1402.5,-921.5 1659.5,-921.5 "/>
<text text-anchor="middle" x="1531" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1402.5,-898.5 1659.5,-898.5 "/>
<text text-anchor="middle" x="1531" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1402.5,-875.5 1659.5,-875.5 "/>
<text text-anchor="middle" x="1531" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1402.5,-852.5 1659.5,-852.5 "/>
<text text-anchor="middle" x="1531" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1402.5,-829.5 1659.5,-829.5 "/>
<text text-anchor="middle" x="1531" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1402.5,-806.5 1659.5,-806.5 "/>
<text text-anchor="middle" x="1531" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1402.5,-783.5 1659.5,-783.5 "/>
<text text-anchor="middle" x="1531" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1402.5,-760.5 1659.5,-760.5 "/>
<text text-anchor="middle" x="1531" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1402.5,-737.5 1659.5,-737.5 "/>
<text text-anchor="middle" x="1531" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1402.5,-714.5 1659.5,-714.5 "/>
<text text-anchor="middle" x="1531" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1402.5,-691.5 1659.5,-691.5 "/>
<text text-anchor="middle" x="1531" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1659.5,-668.5 1659.5,-1059.5 "/>
<text text-anchor="middle" x="1670" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge21" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2171.3874,-1189.9901C2032.2954,-1173.1619 1814.2124,-1142.1754 1740,-1106 1716.8424,-1094.7116 1694.2009,-1080.8295 1672.5045,-1065.4743"/>
<polygon fill="#000000" stroke="#000000" points="1674.3964,-1062.5235 1664.2364,-1059.5194 1670.3054,-1068.2037 1674.3964,-1062.5235"/>
<text text-anchor="middle" x="1909" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- off_treatment -->
<g id="node24" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M2975.5,-772C2975.5,-772 3422.5,-772 3422.5,-772 3428.5,-772 3434.5,-778 3434.5,-784 3434.5,-784 3434.5,-944 3434.5,-944 3434.5,-950 3428.5,-956 3422.5,-956 3422.5,-956 2975.5,-956 2975.5,-956 2969.5,-956 2963.5,-950 2963.5,-944 2963.5,-944 2963.5,-784 2963.5,-784 2963.5,-778 2969.5,-772 2975.5,-772"/>
<text text-anchor="middle" x="3021" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="3078.5,-772 3078.5,-956 "/>
<text text-anchor="middle" x="3089" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3099.5,-772 3099.5,-956 "/>
<text text-anchor="middle" x="3256.5" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="3099.5,-933 3413.5,-933 "/>
<text text-anchor="middle" x="3256.5" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="3099.5,-910 3413.5,-910 "/>
<text text-anchor="middle" x="3256.5" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="3099.5,-887 3413.5,-887 "/>
<text text-anchor="middle" x="3256.5" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="3099.5,-864 3413.5,-864 "/>
<text text-anchor="middle" x="3256.5" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="3099.5,-841 3413.5,-841 "/>
<text text-anchor="middle" x="3256.5" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="3099.5,-818 3413.5,-818 "/>
<text text-anchor="middle" x="3256.5" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="3099.5,-795 3413.5,-795 "/>
<text text-anchor="middle" x="3256.5" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="3413.5,-772 3413.5,-956 "/>
<text text-anchor="middle" x="3424" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge1" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M2414.5123,-1194.7136C2578.9988,-1181.279 2862.5937,-1152.2157 2955,-1106 3021.3628,-1072.8096 3080.8323,-1014.754 3124.4441,-963.8255"/>
<polygon fill="#000000" stroke="#000000" points="3127.2429,-965.9363 3131.0339,-956.043 3121.9007,-961.4129 3127.2429,-965.9363"/>
<text text-anchor="middle" x="2975" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- cycle -->
<g id="node3" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M871,-403.5C871,-403.5 1099,-403.5 1099,-403.5 1105,-403.5 1111,-409.5 1111,-415.5 1111,-415.5 1111,-460.5 1111,-460.5 1111,-466.5 1105,-472.5 1099,-472.5 1099,-472.5 871,-472.5 871,-472.5 865,-472.5 859,-466.5 859,-460.5 859,-460.5 859,-415.5 859,-415.5 859,-409.5 865,-403.5 871,-403.5"/>
<text text-anchor="middle" x="886" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="913,-403.5 913,-472.5 "/>
<text text-anchor="middle" x="923.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="934,-403.5 934,-472.5 "/>
<text text-anchor="middle" x="1012" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="934,-449.5 1090,-449.5 "/>
<text text-anchor="middle" x="1012" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="934,-426.5 1090,-426.5 "/>
<text text-anchor="middle" x="1012" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1090,-403.5 1090,-472.5 "/>
<text text-anchor="middle" x="1100.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge36" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1111.2149,-460.5513C1141.218,-465.2772 1173.1772,-469.7935 1203,-473 1407.9087,-495.0313 1940.8394,-439.9255 2129,-524 2155.9714,-536.0514 2153.2406,-552.1665 2176,-571 2207.0558,-596.6988 2230.8708,-587.0757 2251,-622 2263.9748,-644.5113 2283.1605,-1005.107 2290.243,-1146.8844"/>
<polygon fill="#000000" stroke="#000000" points="2286.759,-1147.2949 2290.7517,-1157.1086 2293.7504,-1146.947 2286.759,-1147.2949"/>
<text text-anchor="middle" x="2263" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge19" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2326.3462,-524.4891C2341.6131,-494.8954 2362.0666,-442.5994 2342,-403 2333.7973,-386.8127 2322.5726,-372.1307 2309.706,-358.9449"/>
<polygon fill="#000000" stroke="#000000" points="2311.9866,-356.2792 2302.3977,-351.7733 2307.0838,-361.2754 2311.9866,-356.2792"/>
<text text-anchor="middle" x="2390.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_arm -->
<g id="node23" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M1223.5,-415C1223.5,-415 1592.5,-415 1592.5,-415 1598.5,-415 1604.5,-421 1604.5,-427 1604.5,-427 1604.5,-449 1604.5,-449 1604.5,-455 1598.5,-461 1592.5,-461 1592.5,-461 1223.5,-461 1223.5,-461 1217.5,-461 1211.5,-455 1211.5,-449 1211.5,-449 1211.5,-427 1211.5,-427 1211.5,-421 1217.5,-415 1223.5,-415"/>
<text text-anchor="middle" x="1257.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="1303.5,-415 1303.5,-461 "/>
<text text-anchor="middle" x="1314" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1324.5,-415 1324.5,-461 "/>
<text text-anchor="middle" x="1454" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="1324.5,-438 1583.5,-438 "/>
<text text-anchor="middle" x="1454" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="1583.5,-415 1583.5,-461 "/>
<text text-anchor="middle" x="1594" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge18" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2184.4703,-526.4602C2178.5689,-525.605 2172.7236,-524.7803 2167,-524 2036.2803,-506.1789 2003.3887,-502.9269 1872,-491 1757.5253,-480.6084 1728.1328,-486.6434 1614,-473 1590.4938,-470.1901 1565.5854,-466.5384 1541.5172,-462.6566"/>
<polygon fill="#000000" stroke="#000000" points="1542.0562,-459.1983 1531.6228,-461.0406 1540.9278,-466.1068 1542.0562,-459.1983"/>
<text text-anchor="middle" x="2064.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- prior_therapy -->
<g id="node5" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M370,-2052.5C370,-2052.5 826,-2052.5 826,-2052.5 832,-2052.5 838,-2058.5 838,-2064.5 838,-2064.5 838,-2638.5 838,-2638.5 838,-2644.5 832,-2650.5 826,-2650.5 826,-2650.5 370,-2650.5 370,-2650.5 364,-2650.5 358,-2644.5 358,-2638.5 358,-2638.5 358,-2064.5 358,-2064.5 358,-2058.5 364,-2052.5 370,-2052.5"/>
<text text-anchor="middle" x="415.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="473,-2052.5 473,-2650.5 "/>
<text text-anchor="middle" x="483.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="494,-2052.5 494,-2650.5 "/>
<text text-anchor="middle" x="655.5" y="-2635.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="494,-2627.5 817,-2627.5 "/>
<text text-anchor="middle" x="655.5" y="-2612.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="494,-2604.5 817,-2604.5 "/>
<text text-anchor="middle" x="655.5" y="-2589.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="494,-2581.5 817,-2581.5 "/>
<text text-anchor="middle" x="655.5" y="-2566.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="494,-2558.5 817,-2558.5 "/>
<text text-anchor="middle" x="655.5" y="-2543.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="494,-2535.5 817,-2535.5 "/>
<text text-anchor="middle" x="655.5" y="-2520.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="494,-2512.5 817,-2512.5 "/>
<text text-anchor="middle" x="655.5" y="-2497.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="494,-2489.5 817,-2489.5 "/>
<text text-anchor="middle" x="655.5" y="-2474.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="494,-2466.5 817,-2466.5 "/>
<text text-anchor="middle" x="655.5" y="-2451.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="494,-2443.5 817,-2443.5 "/>
<text text-anchor="middle" x="655.5" y="-2428.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="494,-2420.5 817,-2420.5 "/>
<text text-anchor="middle" x="655.5" y="-2405.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="494,-2397.5 817,-2397.5 "/>
<text text-anchor="middle" x="655.5" y="-2382.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="494,-2374.5 817,-2374.5 "/>
<text text-anchor="middle" x="655.5" y="-2359.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="494,-2351.5 817,-2351.5 "/>
<text text-anchor="middle" x="655.5" y="-2336.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="494,-2328.5 817,-2328.5 "/>
<text text-anchor="middle" x="655.5" y="-2313.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="494,-2305.5 817,-2305.5 "/>
<text text-anchor="middle" x="655.5" y="-2290.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="494,-2282.5 817,-2282.5 "/>
<text text-anchor="middle" x="655.5" y="-2267.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="494,-2259.5 817,-2259.5 "/>
<text text-anchor="middle" x="655.5" y="-2244.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="494,-2236.5 817,-2236.5 "/>
<text text-anchor="middle" x="655.5" y="-2221.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="494,-2213.5 817,-2213.5 "/>
<text text-anchor="middle" x="655.5" y="-2198.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="494,-2190.5 817,-2190.5 "/>
<text text-anchor="middle" x="655.5" y="-2175.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="494,-2167.5 817,-2167.5 "/>
<text text-anchor="middle" x="655.5" y="-2152.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="494,-2144.5 817,-2144.5 "/>
<text text-anchor="middle" x="655.5" y="-2129.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="494,-2121.5 817,-2121.5 "/>
<text text-anchor="middle" x="655.5" y="-2106.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="494,-2098.5 817,-2098.5 "/>
<text text-anchor="middle" x="655.5" y="-2083.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="494,-2075.5 817,-2075.5 "/>
<text text-anchor="middle" x="655.5" y="-2060.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="817,-2052.5 817,-2650.5 "/>
<text text-anchor="middle" x="827.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge11" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M838.2384,-2389.6912C849.4387,-2380.0507 856,-2367.3203 856,-2351.5 856,-2339.3876 852.1539,-2329.0864 845.3244,-2320.5965"/>
<polygon fill="#000000" stroke="#000000" points="847.719,-2318.0385 838.2384,-2313.3088 842.7002,-2322.9183 847.719,-2318.0385"/>
<text text-anchor="middle" x="872" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node7" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M343.5,-1405C343.5,-1405 692.5,-1405 692.5,-1405 698.5,-1405 704.5,-1411 704.5,-1417 704.5,-1417 704.5,-1600 704.5,-1600 704.5,-1606 698.5,-1612 692.5,-1612 692.5,-1612 343.5,-1612 343.5,-1612 337.5,-1612 331.5,-1606 331.5,-1600 331.5,-1600 331.5,-1417 331.5,-1417 331.5,-1411 337.5,-1405 343.5,-1405"/>
<text text-anchor="middle" x="379" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="426.5,-1405 426.5,-1612 "/>
<text text-anchor="middle" x="437" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="447.5,-1405 447.5,-1612 "/>
<text text-anchor="middle" x="565.5" y="-1596.8" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="447.5,-1589 683.5,-1589 "/>
<text text-anchor="middle" x="565.5" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="447.5,-1566 683.5,-1566 "/>
<text text-anchor="middle" x="565.5" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="447.5,-1543 683.5,-1543 "/>
<text text-anchor="middle" x="565.5" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="447.5,-1520 683.5,-1520 "/>
<text text-anchor="middle" x="565.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="447.5,-1497 683.5,-1497 "/>
<text text-anchor="middle" x="565.5" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="447.5,-1474 683.5,-1474 "/>
<text text-anchor="middle" x="565.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="447.5,-1451 683.5,-1451 "/>
<text text-anchor="middle" x="565.5" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="447.5,-1428 683.5,-1428 "/>
<text text-anchor="middle" x="565.5" y="-1412.8" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="683.5,-1405 683.5,-1612 "/>
<text text-anchor="middle" x="694" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge41" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M569.5979,-2052.213C555.4626,-1903.2622 539.2121,-1732.0225 528.7858,-1622.1556"/>
<polygon fill="#000000" stroke="#000000" points="532.2558,-1621.6725 527.8266,-1612.0479 525.2871,-1622.3339 532.2558,-1621.6725"/>
<text text-anchor="middle" x="618" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge38" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M704.565,-1455.6532C876.7772,-1408.6852 1140.2944,-1341.3854 1373,-1301 1651.5961,-1252.6505 1982.0956,-1224.6907 2161.3622,-1211.9422"/>
<polygon fill="#000000" stroke="#000000" points="2161.6376,-1215.4316 2171.3661,-1211.2354 2161.1442,-1208.449 2161.6376,-1215.4316"/>
<text text-anchor="middle" x="1600" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_surgery -->
<g id="node8" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M918,-2271C918,-2271 1264,-2271 1264,-2271 1270,-2271 1276,-2277 1276,-2283 1276,-2283 1276,-2420 1276,-2420 1276,-2426 1270,-2432 1264,-2432 1264,-2432 918,-2432 918,-2432 912,-2432 906,-2426 906,-2420 906,-2420 906,-2283 906,-2283 906,-2277 912,-2271 918,-2271"/>
<text text-anchor="middle" x="963.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="1021,-2271 1021,-2432 "/>
<text text-anchor="middle" x="1031.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1042,-2271 1042,-2432 "/>
<text text-anchor="middle" x="1148.5" y="-2416.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="1042,-2409 1255,-2409 "/>
<text text-anchor="middle" x="1148.5" y="-2393.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="1042,-2386 1255,-2386 "/>
<text text-anchor="middle" x="1148.5" y="-2370.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1042,-2363 1255,-2363 "/>
<text text-anchor="middle" x="1148.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="1042,-2340 1255,-2340 "/>
<text text-anchor="middle" x="1148.5" y="-2324.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="1042,-2317 1255,-2317 "/>
<text text-anchor="middle" x="1148.5" y="-2301.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1042,-2294 1255,-2294 "/>
<text text-anchor="middle" x="1148.5" y="-2278.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1255,-2271 1255,-2432 "/>
<text text-anchor="middle" x="1265.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge39" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1039.8628,-2270.9277C1001.1667,-2210.3582 946.4255,-2125.522 897,-2052 795.7493,-1901.3864 675.3544,-1729.9952 597.8651,-1620.6368"/>
<polygon fill="#000000" stroke="#000000" points="600.5356,-1618.3519 591.8973,-1612.2176 594.8248,-1622.3999 600.5356,-1618.3519"/>
<text text-anchor="middle" x="928" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge9" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M1276.113,-2393.5585C1287.2907,-2383.5547 1294,-2369.5352 1294,-2351.5 1294,-2337.5509 1289.9865,-2326.004 1282.9962,-2316.8593"/>
<polygon fill="#000000" stroke="#000000" points="1285.4806,-2314.3911 1276.113,-2309.4415 1280.3494,-2319.1525 1285.4806,-2314.3911"/>
<text text-anchor="middle" x="1310" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge34" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1828.7059,-1332.6099C1848.2091,-1320.9706 1868.105,-1310.2318 1888,-1301 1974.661,-1260.7868 2079.7254,-1236.1133 2161.1249,-1221.6498"/>
<polygon fill="#000000" stroke="#000000" points="2162.1871,-1225.0174 2171.4361,-1219.8496 2160.9831,-1218.1217 2162.1871,-1225.0174"/>
<text text-anchor="middle" x="1988" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge7" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1828.5955,-1536.6646C1839.8572,-1529.6694 1846.5,-1520.2813 1846.5,-1508.5 1846.5,-1499.8481 1842.9175,-1492.4869 1836.5541,-1486.4162"/>
<polygon fill="#000000" stroke="#000000" points="1838.6666,-1483.6256 1828.5955,-1480.3354 1834.4167,-1489.1879 1838.6666,-1483.6256"/>
<text text-anchor="middle" x="1862.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- visit -->
<g id="node25" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M682.5,-524.5C682.5,-524.5 857.5,-524.5 857.5,-524.5 863.5,-524.5 869.5,-530.5 869.5,-536.5 869.5,-536.5 869.5,-558.5 869.5,-558.5 869.5,-564.5 863.5,-570.5 857.5,-570.5 857.5,-570.5 682.5,-570.5 682.5,-570.5 676.5,-570.5 670.5,-564.5 670.5,-558.5 670.5,-558.5 670.5,-536.5 670.5,-536.5 670.5,-530.5 676.5,-524.5 682.5,-524.5"/>
<text text-anchor="middle" x="694" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="717.5,-524.5 717.5,-570.5 "/>
<text text-anchor="middle" x="728" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="738.5,-524.5 738.5,-570.5 "/>
<text text-anchor="middle" x="793.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="738.5,-547.5 848.5,-547.5 "/>
<text text-anchor="middle" x="793.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="848.5,-524.5 848.5,-570.5 "/>
<text text-anchor="middle" x="859" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge27" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1381.465,-1461.7311C1080.5278,-1393.7127 570.1987,-1258.8128 462,-1106 337.6955,-930.4404 331.6097,-793.0882 462,-622 486.1844,-590.2671 581.8382,-570.5771 660.2104,-559.4701"/>
<polygon fill="#000000" stroke="#000000" points="660.7391,-562.9304 670.1645,-558.0918 659.7789,-555.9966 660.7391,-562.9304"/>
<text text-anchor="middle" x="517" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- image -->
<g id="node10" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1551,-2788C1551,-2788 1587,-2788 1587,-2788 1593,-2788 1599,-2794 1599,-2800 1599,-2800 1599,-2812 1599,-2812 1599,-2818 1593,-2824 1587,-2824 1587,-2824 1551,-2824 1551,-2824 1545,-2824 1539,-2818 1539,-2812 1539,-2812 1539,-2800 1539,-2800 1539,-2794 1545,-2788 1551,-2788"/>
<text text-anchor="middle" x="1569" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge5" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1568.5408,-2787.8087C1568.0125,-2761.5484 1567.5088,-2711.5028 1570,-2669 1576.2818,-2561.8257 1593.0784,-2435.1763 1600.8942,-2379.7975"/>
<polygon fill="#000000" stroke="#000000" points="1604.3875,-2380.0924 1602.3319,-2369.6989 1597.4573,-2379.1057 1604.3875,-2380.0924"/>
<text text-anchor="middle" x="1600.5" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- agent -->
<g id="node11" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M1882,-524.5C1882,-524.5 2108,-524.5 2108,-524.5 2114,-524.5 2120,-530.5 2120,-536.5 2120,-536.5 2120,-558.5 2120,-558.5 2120,-564.5 2114,-570.5 2108,-570.5 2108,-570.5 1882,-570.5 1882,-570.5 1876,-570.5 1870,-564.5 1870,-558.5 1870,-558.5 1870,-536.5 1870,-536.5 1870,-530.5 1876,-524.5 1882,-524.5"/>
<text text-anchor="middle" x="1898.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1927,-524.5 1927,-570.5 "/>
<text text-anchor="middle" x="1937.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1948,-524.5 1948,-570.5 "/>
<text text-anchor="middle" x="2023.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1948,-547.5 2099,-547.5 "/>
<text text-anchor="middle" x="2023.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2099,-524.5 2099,-570.5 "/>
<text text-anchor="middle" x="2109.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge6" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1871.5878,-524.4785C1774.9486,-506.4512 1640.743,-481.4163 1541.5881,-462.9198"/>
<polygon fill="#000000" stroke="#000000" points="1541.9714,-459.4309 1531.4991,-461.0377 1540.6877,-466.3122 1541.9714,-459.4309"/>
<text text-anchor="middle" x="1819.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- lab_exam -->
<g id="node12" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M483,-846C483,-846 543,-846 543,-846 549,-846 555,-852 555,-858 555,-858 555,-870 555,-870 555,-876 549,-882 543,-882 543,-882 483,-882 483,-882 477,-882 471,-876 471,-870 471,-870 471,-858 471,-858 471,-852 477,-846 483,-846"/>
<text text-anchor="middle" x="513" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge29" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M511.321,-845.9601C508.257,-801.9635 506.6656,-687.9347 564,-622 588.6923,-593.6038 625.0716,-576.0289 660.4147,-565.1523"/>
<polygon fill="#000000" stroke="#000000" points="661.7236,-568.4165 670.3452,-562.2587 659.7653,-561.696 661.7236,-568.4165"/>
<text text-anchor="middle" x="628" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- demographic -->
<g id="node13" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M1909,-1428C1909,-1428 2245,-1428 2245,-1428 2251,-1428 2257,-1434 2257,-1440 2257,-1440 2257,-1577 2257,-1577 2257,-1583 2251,-1589 2245,-1589 2245,-1589 1909,-1589 1909,-1589 1903,-1589 1897,-1583 1897,-1577 1897,-1577 1897,-1440 1897,-1440 1897,-1434 1903,-1428 1909,-1428"/>
<text text-anchor="middle" x="1952" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="2007,-1428 2007,-1589 "/>
<text text-anchor="middle" x="2017.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2028,-1428 2028,-1589 "/>
<text text-anchor="middle" x="2132" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="2028,-1566 2236,-1566 "/>
<text text-anchor="middle" x="2132" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="2028,-1543 2236,-1543 "/>
<text text-anchor="middle" x="2132" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="2028,-1520 2236,-1520 "/>
<text text-anchor="middle" x="2132" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="2028,-1497 2236,-1497 "/>
<text text-anchor="middle" x="2132" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="2028,-1474 2236,-1474 "/>
<text text-anchor="middle" x="2132" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2028,-1451 2236,-1451 "/>
<text text-anchor="middle" x="2132" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="2236,-1428 2236,-1589 "/>
<text text-anchor="middle" x="2246.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge37" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2119.6087,-1427.8682C2146.868,-1379.4407 2184.6071,-1317.7738 2225,-1268 2227.9831,-1264.3241 2231.1664,-1260.6507 2234.4659,-1257.0266"/>
<polygon fill="#000000" stroke="#000000" points="2237.0789,-1259.3569 2241.3748,-1249.6721 2231.977,-1254.5641 2237.0789,-1259.3569"/>
<text text-anchor="middle" x="2252" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- principal_investigator -->
<g id="node14" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M1634.5,-403.5C1634.5,-403.5 1961.5,-403.5 1961.5,-403.5 1967.5,-403.5 1973.5,-409.5 1973.5,-415.5 1973.5,-415.5 1973.5,-460.5 1973.5,-460.5 1973.5,-466.5 1967.5,-472.5 1961.5,-472.5 1961.5,-472.5 1634.5,-472.5 1634.5,-472.5 1628.5,-472.5 1622.5,-466.5 1622.5,-460.5 1622.5,-460.5 1622.5,-415.5 1622.5,-415.5 1622.5,-409.5 1628.5,-403.5 1634.5,-403.5"/>
<text text-anchor="middle" x="1709.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="1796.5,-403.5 1796.5,-472.5 "/>
<text text-anchor="middle" x="1807" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1817.5,-403.5 1817.5,-472.5 "/>
<text text-anchor="middle" x="1885" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="1817.5,-449.5 1952.5,-449.5 "/>
<text text-anchor="middle" x="1885" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="1817.5,-426.5 1952.5,-426.5 "/>
<text text-anchor="middle" x="1885" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="1952.5,-403.5 1952.5,-472.5 "/>
<text text-anchor="middle" x="1963" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge13" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1873.421,-403.3975C1910.3387,-386.46 1956.2899,-365.378 2000.5923,-345.0524"/>
<polygon fill="#000000" stroke="#000000" points="2002.0922,-348.2151 2009.7218,-340.8639 1999.1732,-341.8528 2002.0922,-348.2151"/>
<text text-anchor="middle" x="1966.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- study_site -->
<g id="node15" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M2003.5,-403.5C2003.5,-403.5 2320.5,-403.5 2320.5,-403.5 2326.5,-403.5 2332.5,-409.5 2332.5,-415.5 2332.5,-415.5 2332.5,-460.5 2332.5,-460.5 2332.5,-466.5 2326.5,-472.5 2320.5,-472.5 2320.5,-472.5 2003.5,-472.5 2003.5,-472.5 1997.5,-472.5 1991.5,-466.5 1991.5,-460.5 1991.5,-460.5 1991.5,-415.5 1991.5,-415.5 1991.5,-409.5 1997.5,-403.5 2003.5,-403.5"/>
<text text-anchor="middle" x="2036.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="2081.5,-403.5 2081.5,-472.5 "/>
<text text-anchor="middle" x="2092" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2102.5,-403.5 2102.5,-472.5 "/>
<text text-anchor="middle" x="2207" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2102.5,-449.5 2311.5,-449.5 "/>
<text text-anchor="middle" x="2207" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2102.5,-426.5 2311.5,-426.5 "/>
<text text-anchor="middle" x="2207" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2311.5,-403.5 2311.5,-472.5 "/>
<text text-anchor="middle" x="2322" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge14" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2162,-403.3975C2162,-391.1328 2162,-376.6951 2162,-361.945"/>
<polygon fill="#000000" stroke="#000000" points="2165.5001,-361.7063 2162,-351.7063 2158.5001,-361.7064 2165.5001,-361.7063"/>
<text text-anchor="middle" x="2192.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- agent_administration -->
<g id="node16" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M1760.5,-622.5C1760.5,-622.5 2229.5,-622.5 2229.5,-622.5 2235.5,-622.5 2241.5,-628.5 2241.5,-634.5 2241.5,-634.5 2241.5,-1093.5 2241.5,-1093.5 2241.5,-1099.5 2235.5,-1105.5 2229.5,-1105.5 2229.5,-1105.5 1760.5,-1105.5 1760.5,-1105.5 1754.5,-1105.5 1748.5,-1099.5 1748.5,-1093.5 1748.5,-1093.5 1748.5,-634.5 1748.5,-634.5 1748.5,-628.5 1754.5,-622.5 1760.5,-622.5"/>
<text text-anchor="middle" x="1833.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="1918.5,-622.5 1918.5,-1105.5 "/>
<text text-anchor="middle" x="1929" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1939.5,-622.5 1939.5,-1105.5 "/>
<text text-anchor="middle" x="2080" y="-1090.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1939.5,-1082.5 2220.5,-1082.5 "/>
<text text-anchor="middle" x="2080" y="-1067.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1939.5,-1059.5 2220.5,-1059.5 "/>
<text text-anchor="middle" x="2080" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1939.5,-1036.5 2220.5,-1036.5 "/>
<text text-anchor="middle" x="2080" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1939.5,-1013.5 2220.5,-1013.5 "/>
<text text-anchor="middle" x="2080" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="1939.5,-990.5 2220.5,-990.5 "/>
<text text-anchor="middle" x="2080" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="1939.5,-967.5 2220.5,-967.5 "/>
<text text-anchor="middle" x="2080" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="1939.5,-944.5 2220.5,-944.5 "/>
<text text-anchor="middle" x="2080" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="1939.5,-921.5 2220.5,-921.5 "/>
<text text-anchor="middle" x="2080" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="1939.5,-898.5 2220.5,-898.5 "/>
<text text-anchor="middle" x="2080" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="1939.5,-875.5 2220.5,-875.5 "/>
<text text-anchor="middle" x="2080" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1939.5,-852.5 2220.5,-852.5 "/>
<text text-anchor="middle" x="2080" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="1939.5,-829.5 2220.5,-829.5 "/>
<text text-anchor="middle" x="2080" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1939.5,-806.5 2220.5,-806.5 "/>
<text text-anchor="middle" x="2080" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="1939.5,-783.5 2220.5,-783.5 "/>
<text text-anchor="middle" x="2080" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1939.5,-760.5 2220.5,-760.5 "/>
<text text-anchor="middle" x="2080" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1939.5,-737.5 2220.5,-737.5 "/>
<text text-anchor="middle" x="2080" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1939.5,-714.5 2220.5,-714.5 "/>
<text text-anchor="middle" x="2080" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="1939.5,-691.5 2220.5,-691.5 "/>
<text text-anchor="middle" x="2080" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="1939.5,-668.5 2220.5,-668.5 "/>
<text text-anchor="middle" x="2080" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="1939.5,-645.5 2220.5,-645.5 "/>
<text text-anchor="middle" x="2080" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2220.5,-622.5 2220.5,-1105.5 "/>
<text text-anchor="middle" x="2231" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge32" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1995,-622.1053C1995,-606.5346 1995,-592.48 1995,-580.8773"/>
<polygon fill="#000000" stroke="#000000" points="1998.5001,-580.5348 1995,-570.5348 1991.5001,-580.5348 1998.5001,-580.5348"/>
<text text-anchor="middle" x="2026" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge23" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1859.3131,-622.3558C1845.3883,-609.5585 1830.298,-598.2067 1814,-589 1773.8921,-566.3431 1139.936,-553.5105 879.9438,-549.1784"/>
<polygon fill="#000000" stroke="#000000" points="879.7826,-545.6754 869.7261,-549.0094 879.6668,-552.6744 879.7826,-545.6754"/>
<text text-anchor="middle" x="1864" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- program -->
<g id="node17" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M2008,-.5C2008,-.5 2316,-.5 2316,-.5 2322,-.5 2328,-6.5 2328,-12.5 2328,-12.5 2328,-126.5 2328,-126.5 2328,-132.5 2322,-138.5 2316,-138.5 2316,-138.5 2008,-138.5 2008,-138.5 2002,-138.5 1996,-132.5 1996,-126.5 1996,-126.5 1996,-12.5 1996,-12.5 1996,-6.5 2002,-.5 2008,-.5"/>
<text text-anchor="middle" x="2035" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="2074,-.5 2074,-138.5 "/>
<text text-anchor="middle" x="2084.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2095,-.5 2095,-138.5 "/>
<text text-anchor="middle" x="2201" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="2095,-115.5 2307,-115.5 "/>
<text text-anchor="middle" x="2201" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="2095,-92.5 2307,-92.5 "/>
<text text-anchor="middle" x="2201" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="2095,-69.5 2307,-69.5 "/>
<text text-anchor="middle" x="2201" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="2095,-46.5 2307,-46.5 "/>
<text text-anchor="middle" x="2201" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="2095,-23.5 2307,-23.5 "/>
<text text-anchor="middle" x="2201" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="2307,-.5 2307,-138.5 "/>
<text text-anchor="middle" x="2317.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge17" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M2162,-190.4932C2162,-176.7786 2162,-162.5421 2162,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="2165.5001,-148.5183 2162,-138.5184 2158.5001,-148.5184 2165.5001,-148.5183"/>
<text text-anchor="middle" x="2202.5" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- file -->
<g id="node19" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M1636.5,-2702.5C1636.5,-2702.5 1821.5,-2702.5 1821.5,-2702.5 1827.5,-2702.5 1833.5,-2708.5 1833.5,-2714.5 1833.5,-2714.5 1833.5,-2897.5 1833.5,-2897.5 1833.5,-2903.5 1827.5,-2909.5 1821.5,-2909.5 1821.5,-2909.5 1636.5,-2909.5 1636.5,-2909.5 1630.5,-2909.5 1624.5,-2903.5 1624.5,-2897.5 1624.5,-2897.5 1624.5,-2714.5 1624.5,-2714.5 1624.5,-2708.5 1630.5,-2702.5 1636.5,-2702.5"/>
<text text-anchor="middle" x="1644" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="1663.5,-2702.5 1663.5,-2909.5 "/>
<text text-anchor="middle" x="1674" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1684.5,-2702.5 1684.5,-2909.5 "/>
<text text-anchor="middle" x="1748.5" y="-2894.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="1684.5,-2886.5 1812.5,-2886.5 "/>
<text text-anchor="middle" x="1748.5" y="-2871.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="1684.5,-2863.5 1812.5,-2863.5 "/>
<text text-anchor="middle" x="1748.5" y="-2848.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="1684.5,-2840.5 1812.5,-2840.5 "/>
<text text-anchor="middle" x="1748.5" y="-2825.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="1684.5,-2817.5 1812.5,-2817.5 "/>
<text text-anchor="middle" x="1748.5" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_locations</text>
<polyline fill="none" stroke="#000000" points="1684.5,-2794.5 1812.5,-2794.5 "/>
<text text-anchor="middle" x="1748.5" y="-2779.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="1684.5,-2771.5 1812.5,-2771.5 "/>
<text text-anchor="middle" x="1748.5" y="-2756.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="1684.5,-2748.5 1812.5,-2748.5 "/>
<text text-anchor="middle" x="1748.5" y="-2733.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="1684.5,-2725.5 1812.5,-2725.5 "/>
<text text-anchor="middle" x="1748.5" y="-2710.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="1812.5,-2702.5 1812.5,-2909.5 "/>
<text text-anchor="middle" x="1823" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge4" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1661.5131,-2702.2311C1658.743,-2696.1747 1656.209,-2690.0752 1654,-2684 1614.9431,-2576.5886 1606.9677,-2438.888 1605.3758,-2380.1321"/>
<polygon fill="#000000" stroke="#000000" points="1608.8671,-2379.7028 1605.1409,-2369.7848 1601.8689,-2379.8617 1608.8671,-2379.7028"/>
<text text-anchor="middle" x="1684.5" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge2" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1728.2072,-2702.1353C1725.8279,-2470.4552 1716.5944,-1917.4051 1682,-1734 1681.4609,-1731.1417 1680.8932,-1728.2702 1680.2991,-1725.3886"/>
<polygon fill="#000000" stroke="#000000" points="1683.7083,-1724.5938 1678.1799,-1715.5557 1676.8654,-1726.0687 1683.7083,-1724.5938"/>
<text text-anchor="middle" x="1763.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- diagnosis -->
<g id="node27" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M1938.5,-1734.5C1938.5,-1734.5 2281.5,-1734.5 2281.5,-1734.5 2287.5,-1734.5 2293.5,-1740.5 2293.5,-1746.5 2293.5,-1746.5 2293.5,-2021.5 2293.5,-2021.5 2293.5,-2027.5 2287.5,-2033.5 2281.5,-2033.5 2281.5,-2033.5 1938.5,-2033.5 1938.5,-2033.5 1932.5,-2033.5 1926.5,-2027.5 1926.5,-2021.5 1926.5,-2021.5 1926.5,-1746.5 1926.5,-1746.5 1926.5,-1740.5 1932.5,-1734.5 1938.5,-1734.5"/>
<text text-anchor="middle" x="1968.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2010.5,-1734.5 2010.5,-2033.5 "/>
<text text-anchor="middle" x="2021" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2031.5,-1734.5 2031.5,-2033.5 "/>
<text text-anchor="middle" x="2152" y="-2018.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="2031.5,-2010.5 2272.5,-2010.5 "/>
<text text-anchor="middle" x="2152" y="-1995.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2031.5,-1987.5 2272.5,-1987.5 "/>
<text text-anchor="middle" x="2152" y="-1972.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2031.5,-1964.5 2272.5,-1964.5 "/>
<text text-anchor="middle" x="2152" y="-1949.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="2031.5,-1941.5 2272.5,-1941.5 "/>
<text text-anchor="middle" x="2152" y="-1926.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2031.5,-1918.5 2272.5,-1918.5 "/>
<text text-anchor="middle" x="2152" y="-1903.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="2031.5,-1895.5 2272.5,-1895.5 "/>
<text text-anchor="middle" x="2152" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="2031.5,-1872.5 2272.5,-1872.5 "/>
<text text-anchor="middle" x="2152" y="-1857.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2031.5,-1849.5 2272.5,-1849.5 "/>
<text text-anchor="middle" x="2152" y="-1834.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2031.5,-1826.5 2272.5,-1826.5 "/>
<text text-anchor="middle" x="2152" y="-1811.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2031.5,-1803.5 2272.5,-1803.5 "/>
<text text-anchor="middle" x="2152" y="-1788.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2031.5,-1780.5 2272.5,-1780.5 "/>
<text text-anchor="middle" x="2152" y="-1765.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2031.5,-1757.5 2272.5,-1757.5 "/>
<text text-anchor="middle" x="2152" y="-1742.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2272.5,-1734.5 2272.5,-2033.5 "/>
<text text-anchor="middle" x="2283" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge12" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M1781.9816,-2702.3492C1790.2624,-2685.3056 1798.5395,-2667.7418 1806,-2651 1898.3001,-2443.8749 1992.6987,-2199.607 2051.3031,-2043.3431"/>
<polygon fill="#000000" stroke="#000000" points="2054.7057,-2044.2371 2054.9367,-2033.6448 2048.1506,-2041.7811 2054.7057,-2044.2371"/>
<text text-anchor="middle" x="1851.5" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- follow_up -->
<g id="node20" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M2377,-1405C2377,-1405 2709,-1405 2709,-1405 2715,-1405 2721,-1411 2721,-1417 2721,-1417 2721,-1600 2721,-1600 2721,-1606 2715,-1612 2709,-1612 2709,-1612 2377,-1612 2377,-1612 2371,-1612 2365,-1606 2365,-1600 2365,-1600 2365,-1417 2365,-1417 2365,-1411 2371,-1405 2377,-1405"/>
<text text-anchor="middle" x="2407.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="2450,-1405 2450,-1612 "/>
<text text-anchor="middle" x="2460.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2471,-1405 2471,-1612 "/>
<text text-anchor="middle" x="2585.5" y="-1596.8" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="2471,-1589 2700,-1589 "/>
<text text-anchor="middle" x="2585.5" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="2471,-1566 2700,-1566 "/>
<text text-anchor="middle" x="2585.5" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="2471,-1543 2700,-1543 "/>
<text text-anchor="middle" x="2585.5" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="2471,-1520 2700,-1520 "/>
<text text-anchor="middle" x="2585.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="2471,-1497 2700,-1497 "/>
<text text-anchor="middle" x="2585.5" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2471,-1474 2700,-1474 "/>
<text text-anchor="middle" x="2585.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2471,-1451 2700,-1451 "/>
<text text-anchor="middle" x="2585.5" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="2471,-1428 2700,-1428 "/>
<text text-anchor="middle" x="2585.5" y="-1412.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="2700,-1405 2700,-1612 "/>
<text text-anchor="middle" x="2710.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge35" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2458.0126,-1404.8153C2417.5371,-1355.4353 2370.8046,-1298.4216 2337.4277,-1257.7018"/>
<polygon fill="#000000" stroke="#000000" points="2339.9824,-1255.2973 2330.9362,-1249.7821 2334.5686,-1259.7348 2339.9824,-1255.2973"/>
<text text-anchor="middle" x="2380" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- vital_signs -->
<g id="node21" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M585.5,-703C585.5,-703 872.5,-703 872.5,-703 878.5,-703 884.5,-709 884.5,-715 884.5,-715 884.5,-1013 884.5,-1013 884.5,-1019 878.5,-1025 872.5,-1025 872.5,-1025 585.5,-1025 585.5,-1025 579.5,-1025 573.5,-1019 573.5,-1013 573.5,-1013 573.5,-715 573.5,-715 573.5,-709 579.5,-703 585.5,-703"/>
<text text-anchor="middle" x="620" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="666.5,-703 666.5,-1025 "/>
<text text-anchor="middle" x="677" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="687.5,-703 687.5,-1025 "/>
<text text-anchor="middle" x="775.5" y="-1009.8" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="687.5,-1002 863.5,-1002 "/>
<text text-anchor="middle" x="775.5" y="-986.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="687.5,-979 863.5,-979 "/>
<text text-anchor="middle" x="775.5" y="-963.8" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="687.5,-956 863.5,-956 "/>
<text text-anchor="middle" x="775.5" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="687.5,-933 863.5,-933 "/>
<text text-anchor="middle" x="775.5" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="687.5,-910 863.5,-910 "/>
<text text-anchor="middle" x="775.5" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="687.5,-887 863.5,-887 "/>
<text text-anchor="middle" x="775.5" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="687.5,-864 863.5,-864 "/>
<text text-anchor="middle" x="775.5" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="687.5,-841 863.5,-841 "/>
<text text-anchor="middle" x="775.5" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="687.5,-818 863.5,-818 "/>
<text text-anchor="middle" x="775.5" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="687.5,-795 863.5,-795 "/>
<text text-anchor="middle" x="775.5" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="687.5,-772 863.5,-772 "/>
<text text-anchor="middle" x="775.5" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="687.5,-749 863.5,-749 "/>
<text text-anchor="middle" x="775.5" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="687.5,-726 863.5,-726 "/>
<text text-anchor="middle" x="775.5" y="-710.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="863.5,-703 863.5,-1025 "/>
<text text-anchor="middle" x="874" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge26" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M749.8603,-702.9684C755.8683,-656.5902 761.8349,-610.5306 765.6953,-580.7299"/>
<polygon fill="#000000" stroke="#000000" points="769.2047,-580.8827 767.0185,-570.5158 762.2627,-579.9833 769.2047,-580.8827"/>
<text text-anchor="middle" x="793" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge31" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1639.2862,-668.2519C1673.7579,-637.6763 1711.8722,-609.4785 1752,-589 1771.6696,-578.962 1814.9676,-570.2732 1859.6482,-563.477"/>
<polygon fill="#000000" stroke="#000000" points="1860.4234,-566.9003 1869.8,-561.9677 1859.394,-559.9764 1860.4234,-566.9003"/>
<text text-anchor="middle" x="1783" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge8" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1680.7046,-896.9793C1691.876,-888.8906 1698.5,-877.8975 1698.5,-864 1698.5,-853.7941 1694.9277,-845.1544 1688.6053,-838.0812"/>
<polygon fill="#000000" stroke="#000000" points="1690.4933,-835.0744 1680.7046,-831.0207 1685.8288,-840.2939 1690.4933,-835.0744"/>
<text text-anchor="middle" x="1714.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- adverse_event&#45;&gt;visit -->
<g id="edge25" class="edge">
<title>adverse_event&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1317.9828,-668.4531C1297.4251,-650.6151 1275.3193,-634.5673 1252,-622 1189.4229,-588.2757 1001.5868,-566.7413 879.7202,-555.9141"/>
<polygon fill="#000000" stroke="#000000" points="879.8706,-552.4139 869.6029,-555.0263 879.2587,-559.3871 879.8706,-552.4139"/>
<text text-anchor="middle" x="1224" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge20" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1512.0488,-414.9547C1638.1252,-387.0306 1851.9812,-339.6646 1999.7674,-306.9321"/>
<polygon fill="#000000" stroke="#000000" points="2000.8415,-310.2792 2009.848,-304.6994 1999.3277,-303.4448 2000.8415,-310.2792"/>
<text text-anchor="middle" x="1735.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge30" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M815.3333,-524.4117C842.2448,-510.7055 877.0759,-492.966 908.1707,-477.1294"/>
<polygon fill="#000000" stroke="#000000" points="909.9361,-480.1581 917.2585,-472.5009 906.7592,-473.9205 909.9361,-480.1581"/>
<text text-anchor="middle" x="907.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge10" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M869.8627,-555.0146C880.5961,-553.5674 887.5,-551.0625 887.5,-547.5 887.5,-545.2178 884.6666,-543.3696 879.8082,-541.9555"/>
<polygon fill="#000000" stroke="#000000" points="880.3522,-538.4953 869.8627,-539.9854 878.992,-545.3619 880.3522,-538.4953"/>
<text text-anchor="middle" x="903.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- physical_exam -->
<g id="node26" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M12,-2259.5C12,-2259.5 328,-2259.5 328,-2259.5 334,-2259.5 340,-2265.5 340,-2271.5 340,-2271.5 340,-2431.5 340,-2431.5 340,-2437.5 334,-2443.5 328,-2443.5 328,-2443.5 12,-2443.5 12,-2443.5 6,-2443.5 0,-2437.5 0,-2431.5 0,-2431.5 0,-2271.5 0,-2271.5 0,-2265.5 6,-2259.5 12,-2259.5"/>
<text text-anchor="middle" x="61" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="122,-2259.5 122,-2443.5 "/>
<text text-anchor="middle" x="132.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="143,-2259.5 143,-2443.5 "/>
<text text-anchor="middle" x="231" y="-2428.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="143,-2420.5 319,-2420.5 "/>
<text text-anchor="middle" x="231" y="-2405.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="143,-2397.5 319,-2397.5 "/>
<text text-anchor="middle" x="231" y="-2382.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="143,-2374.5 319,-2374.5 "/>
<text text-anchor="middle" x="231" y="-2359.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="143,-2351.5 319,-2351.5 "/>
<text text-anchor="middle" x="231" y="-2336.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="143,-2328.5 319,-2328.5 "/>
<text text-anchor="middle" x="231" y="-2313.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="143,-2305.5 319,-2305.5 "/>
<text text-anchor="middle" x="231" y="-2290.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="143,-2282.5 319,-2282.5 "/>
<text text-anchor="middle" x="231" y="-2267.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="319,-2259.5 319,-2443.5 "/>
<text text-anchor="middle" x="329.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge40" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M208.0709,-2259.2765C272.2441,-2103.8224 401.7404,-1790.1288 471.2993,-1621.6285"/>
<polygon fill="#000000" stroke="#000000" points="474.5987,-1622.8084 475.1793,-1612.2295 468.1283,-1620.1373 474.5987,-1622.8084"/>
<text text-anchor="middle" x="475" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge24" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M174.8895,-2259.2225C182.6702,-2104.1892 197,-1781.5905 197,-1508.5 197,-1508.5 197,-1508.5 197,-864 197,-733.5724 256.7693,-697.673 363,-622 409.6421,-588.7747 556.0601,-568.0374 659.8778,-557.1207"/>
<polygon fill="#000000" stroke="#000000" points="660.5155,-560.5735 670.1021,-556.0627 659.7949,-553.6107 660.5155,-560.5735"/>
<text text-anchor="middle" x="225" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge33" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2257.1295,-1734.4166C2260.3863,-1728.3751 2263.3619,-1722.2309 2266,-1716 2300.2264,-1635.161 2297.7595,-1375.1177 2294.8087,-1259.6472"/>
<polygon fill="#000000" stroke="#000000" points="2298.3061,-1259.4995 2294.5412,-1249.5961 2291.3086,-1259.6858 2298.3061,-1259.4995"/>
<text text-anchor="middle" x="2323" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- disease_extent -->
<g id="node28" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M915,-714.5C915,-714.5 1231,-714.5 1231,-714.5 1237,-714.5 1243,-720.5 1243,-726.5 1243,-726.5 1243,-1001.5 1243,-1001.5 1243,-1007.5 1237,-1013.5 1231,-1013.5 1231,-1013.5 915,-1013.5 915,-1013.5 909,-1013.5 903,-1007.5 903,-1001.5 903,-1001.5 903,-726.5 903,-726.5 903,-720.5 909,-714.5 915,-714.5"/>
<text text-anchor="middle" x="964.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="1026,-714.5 1026,-1013.5 "/>
<text text-anchor="middle" x="1036.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1047,-714.5 1047,-1013.5 "/>
<text text-anchor="middle" x="1134.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="1047,-990.5 1222,-990.5 "/>
<text text-anchor="middle" x="1134.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="1047,-967.5 1222,-967.5 "/>
<text text-anchor="middle" x="1134.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="1047,-944.5 1222,-944.5 "/>
<text text-anchor="middle" x="1134.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="1047,-921.5 1222,-921.5 "/>
<text text-anchor="middle" x="1134.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="1047,-898.5 1222,-898.5 "/>
<text text-anchor="middle" x="1134.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="1047,-875.5 1222,-875.5 "/>
<text text-anchor="middle" x="1134.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="1047,-852.5 1222,-852.5 "/>
<text text-anchor="middle" x="1134.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="1047,-829.5 1222,-829.5 "/>
<text text-anchor="middle" x="1134.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="1047,-806.5 1222,-806.5 "/>
<text text-anchor="middle" x="1134.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="1047,-783.5 1222,-783.5 "/>
<text text-anchor="middle" x="1134.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="1047,-760.5 1222,-760.5 "/>
<text text-anchor="middle" x="1134.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1047,-737.5 1222,-737.5 "/>
<text text-anchor="middle" x="1134.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="1222,-714.5 1222,-1013.5 "/>
<text text-anchor="middle" x="1232.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge28" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M975.8095,-714.2946C950.9998,-681.8257 922.83,-649.1246 893,-622 873.194,-603.9902 848.4007,-587.9972 826.2727,-575.4911"/>
<polygon fill="#000000" stroke="#000000" points="827.7426,-572.3043 817.2983,-570.5243 824.3529,-578.429 827.7426,-572.3043"/>
<text text-anchor="middle" x="897" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
</g>
</svg>
</div>
