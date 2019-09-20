<link rel='stylesheet' href="assets/style.css">
<link rel='stylesheet' href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"  src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"></script>
<script type="text/javascript" src="assets/actions.js"></script>

Zoom to Node: <select id="node_select">
  <option value="">Zoom to Node</option>
</select>
<div id="model"></div>

<a href=".//model-desc/icdc-model.svg">SVG file (in view above)</a>


# MakeModel and model-tool

## Overview

The MakeModel "framework" takes a convenient, human-readable
description of an overall graph model, laid out in one or two YAML
files, and uses these to perform various functions that enable
tasks related to the ICDC data system.


The command-line tool `model-tool` takes the model description files (MDF)
as input, and performs the following tasks:

* Validates the content of the MDF for syntax and consistency
* Creates an SVG graphical representation of the model as specified; 
* Output a simple tab-delimited table of nodes and properties;
* _Coming Soon_: Outputs Cypher queries that can be used to create a representation
  of the model in a [Neo4j](https://neo4j.com) graph database.

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

## Docker version of model-tool

Rather than install the tool and its dependencies,
model-tool can be run using a Docker container,
[maj1/icdc:icdc-model-tool](https://cloud.docker.com/repository/docker/maj1/icdc/general).

[model-tool-d](https://github.com/CBIIT/icdc-model-tool-docker) is a
command-line tool that runs just like model-tool, but uses the Docker
container above under the hood. Check it out!

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
p
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
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
 "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<!-- Generated by graphviz version 2.40.1 (20161225.0304)
 -->
<!-- Title: Perl Pages: 1 -->
<svg width="3364pt" height="2966pt"
 viewBox="0.00 0.00 3363.50 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 3359.5,-2962 3359.5,4 -4,4"/>
<!-- disease_extent -->
<g id="node1" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M739.5,-1877C739.5,-1877 1055.5,-1877 1055.5,-1877 1061.5,-1877 1067.5,-1883 1067.5,-1889 1067.5,-1889 1067.5,-2164 1067.5,-2164 1067.5,-2170 1061.5,-2176 1055.5,-2176 1055.5,-2176 739.5,-2176 739.5,-2176 733.5,-2176 727.5,-2170 727.5,-2164 727.5,-2164 727.5,-1889 727.5,-1889 727.5,-1883 733.5,-1877 739.5,-1877"/>
<text text-anchor="middle" x="789" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="850.5,-1877 850.5,-2176 "/>
<text text-anchor="middle" x="861" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="871.5,-1877 871.5,-2176 "/>
<text text-anchor="middle" x="959" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="871.5,-2153 1046.5,-2153 "/>
<text text-anchor="middle" x="959" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="871.5,-2130 1046.5,-2130 "/>
<text text-anchor="middle" x="959" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="871.5,-2107 1046.5,-2107 "/>
<text text-anchor="middle" x="959" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="871.5,-2084 1046.5,-2084 "/>
<text text-anchor="middle" x="959" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="871.5,-2061 1046.5,-2061 "/>
<text text-anchor="middle" x="959" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="871.5,-2038 1046.5,-2038 "/>
<text text-anchor="middle" x="959" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="871.5,-2015 1046.5,-2015 "/>
<text text-anchor="middle" x="959" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="871.5,-1992 1046.5,-1992 "/>
<text text-anchor="middle" x="959" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="871.5,-1969 1046.5,-1969 "/>
<text text-anchor="middle" x="959" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="871.5,-1946 1046.5,-1946 "/>
<text text-anchor="middle" x="959" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="871.5,-1923 1046.5,-1923 "/>
<text text-anchor="middle" x="959" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="871.5,-1900 1046.5,-1900 "/>
<text text-anchor="middle" x="959" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="1046.5,-1877 1046.5,-2176 "/>
<text text-anchor="middle" x="1057" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit -->
<g id="node21" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1245,-1549C1245,-1549 1420,-1549 1420,-1549 1426,-1549 1432,-1555 1432,-1561 1432,-1561 1432,-1583 1432,-1583 1432,-1589 1426,-1595 1420,-1595 1420,-1595 1245,-1595 1245,-1595 1239,-1595 1233,-1589 1233,-1583 1233,-1583 1233,-1561 1233,-1561 1233,-1555 1239,-1549 1245,-1549"/>
<text text-anchor="middle" x="1256.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1280,-1549 1280,-1595 "/>
<text text-anchor="middle" x="1290.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1301,-1549 1301,-1595 "/>
<text text-anchor="middle" x="1356" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1301,-1572 1411,-1572 "/>
<text text-anchor="middle" x="1356" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1411,-1549 1411,-1595 "/>
<text text-anchor="middle" x="1421.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge9" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M968.1029,-1876.6344C996.9503,-1825.3281 1033.6829,-1770.0633 1076.5,-1727 1132.8028,-1670.3735 1213.7736,-1625.8721 1269.499,-1599.3473"/>
<polygon fill="#000000" stroke="#000000" points="1271.0022,-1602.5081 1278.5623,-1595.0855 1268.0235,-1596.1735 1271.0022,-1602.5081"/>
<text text-anchor="middle" x="1141.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- diagnosis -->
<g id="node2" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M12,-2344.5C12,-2344.5 355,-2344.5 355,-2344.5 361,-2344.5 367,-2350.5 367,-2356.5 367,-2356.5 367,-2631.5 367,-2631.5 367,-2637.5 361,-2643.5 355,-2643.5 355,-2643.5 12,-2643.5 12,-2643.5 6,-2643.5 0,-2637.5 0,-2631.5 0,-2631.5 0,-2356.5 0,-2356.5 0,-2350.5 6,-2344.5 12,-2344.5"/>
<text text-anchor="middle" x="42" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="84,-2344.5 84,-2643.5 "/>
<text text-anchor="middle" x="94.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="105,-2344.5 105,-2643.5 "/>
<text text-anchor="middle" x="225.5" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="105,-2620.5 346,-2620.5 "/>
<text text-anchor="middle" x="225.5" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="105,-2597.5 346,-2597.5 "/>
<text text-anchor="middle" x="225.5" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="105,-2574.5 346,-2574.5 "/>
<text text-anchor="middle" x="225.5" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="105,-2551.5 346,-2551.5 "/>
<text text-anchor="middle" x="225.5" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="105,-2528.5 346,-2528.5 "/>
<text text-anchor="middle" x="225.5" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="105,-2505.5 346,-2505.5 "/>
<text text-anchor="middle" x="225.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="105,-2482.5 346,-2482.5 "/>
<text text-anchor="middle" x="225.5" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="105,-2459.5 346,-2459.5 "/>
<text text-anchor="middle" x="225.5" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="105,-2436.5 346,-2436.5 "/>
<text text-anchor="middle" x="225.5" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="105,-2413.5 346,-2413.5 "/>
<text text-anchor="middle" x="225.5" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="105,-2390.5 346,-2390.5 "/>
<text text-anchor="middle" x="225.5" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="105,-2367.5 346,-2367.5 "/>
<text text-anchor="middle" x="225.5" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="346,-2344.5 346,-2643.5 "/>
<text text-anchor="middle" x="356.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node14" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M883,-1065.5C883,-1065.5 1102,-1065.5 1102,-1065.5 1108,-1065.5 1114,-1071.5 1114,-1077.5 1114,-1077.5 1114,-1145.5 1114,-1145.5 1114,-1151.5 1108,-1157.5 1102,-1157.5 1102,-1157.5 883,-1157.5 883,-1157.5 877,-1157.5 871,-1151.5 871,-1145.5 871,-1145.5 871,-1077.5 871,-1077.5 871,-1071.5 877,-1065.5 883,-1065.5"/>
<text text-anchor="middle" x="895.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="920,-1065.5 920,-1157.5 "/>
<text text-anchor="middle" x="930.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="941,-1065.5 941,-1157.5 "/>
<text text-anchor="middle" x="1017" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="941,-1134.5 1093,-1134.5 "/>
<text text-anchor="middle" x="1017" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="941,-1111.5 1093,-1111.5 "/>
<text text-anchor="middle" x="1017" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="941,-1088.5 1093,-1088.5 "/>
<text text-anchor="middle" x="1017" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1093,-1065.5 1093,-1157.5 "/>
<text text-anchor="middle" x="1103.5" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge20" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M183.5,-2344.2818C183.5,-2184.9343 183.5,-1925.4225 183.5,-1701.5 183.5,-1701.5 183.5,-1701.5 183.5,-1313 183.5,-1175.1022 631.6792,-1130.8514 860.8725,-1117.2378"/>
<polygon fill="#000000" stroke="#000000" points="861.1674,-1120.7267 870.9469,-1116.6508 860.7602,-1113.7385 861.1674,-1120.7267"/>
<text text-anchor="middle" x="210.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- program -->
<g id="node3" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M1225.5,-.5C1225.5,-.5 1533.5,-.5 1533.5,-.5 1539.5,-.5 1545.5,-6.5 1545.5,-12.5 1545.5,-12.5 1545.5,-126.5 1545.5,-126.5 1545.5,-132.5 1539.5,-138.5 1533.5,-138.5 1533.5,-138.5 1225.5,-138.5 1225.5,-138.5 1219.5,-138.5 1213.5,-132.5 1213.5,-126.5 1213.5,-126.5 1213.5,-12.5 1213.5,-12.5 1213.5,-6.5 1219.5,-.5 1225.5,-.5"/>
<text text-anchor="middle" x="1252.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="1291.5,-.5 1291.5,-138.5 "/>
<text text-anchor="middle" x="1302" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1312.5,-.5 1312.5,-138.5 "/>
<text text-anchor="middle" x="1418.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="1312.5,-115.5 1524.5,-115.5 "/>
<text text-anchor="middle" x="1418.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="1312.5,-92.5 1524.5,-92.5 "/>
<text text-anchor="middle" x="1418.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="1312.5,-69.5 1524.5,-69.5 "/>
<text text-anchor="middle" x="1418.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="1312.5,-46.5 1524.5,-46.5 "/>
<text text-anchor="middle" x="1418.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="1312.5,-23.5 1524.5,-23.5 "/>
<text text-anchor="middle" x="1418.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="1524.5,-.5 1524.5,-138.5 "/>
<text text-anchor="middle" x="1535" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node4" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M1239.5,-190.5C1239.5,-190.5 1519.5,-190.5 1519.5,-190.5 1525.5,-190.5 1531.5,-196.5 1531.5,-202.5 1531.5,-202.5 1531.5,-339.5 1531.5,-339.5 1531.5,-345.5 1525.5,-351.5 1519.5,-351.5 1519.5,-351.5 1239.5,-351.5 1239.5,-351.5 1233.5,-351.5 1227.5,-345.5 1227.5,-339.5 1227.5,-339.5 1227.5,-202.5 1227.5,-202.5 1227.5,-196.5 1233.5,-190.5 1239.5,-190.5"/>
<text text-anchor="middle" x="1255.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="1283.5,-190.5 1283.5,-351.5 "/>
<text text-anchor="middle" x="1294" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1304.5,-190.5 1304.5,-351.5 "/>
<text text-anchor="middle" x="1407.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="1304.5,-328.5 1510.5,-328.5 "/>
<text text-anchor="middle" x="1407.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="1304.5,-305.5 1510.5,-305.5 "/>
<text text-anchor="middle" x="1407.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="1304.5,-282.5 1510.5,-282.5 "/>
<text text-anchor="middle" x="1407.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="1304.5,-259.5 1510.5,-259.5 "/>
<text text-anchor="middle" x="1407.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="1304.5,-236.5 1510.5,-236.5 "/>
<text text-anchor="middle" x="1407.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="1304.5,-213.5 1510.5,-213.5 "/>
<text text-anchor="middle" x="1407.5" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="1510.5,-190.5 1510.5,-351.5 "/>
<text text-anchor="middle" x="1521" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge32" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M1379.5,-190.4932C1379.5,-176.7786 1379.5,-162.5421 1379.5,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="1383.0001,-148.5183 1379.5,-138.5184 1376.0001,-148.5184 1383.0001,-148.5183"/>
<text text-anchor="middle" x="1420" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- physical_exam -->
<g id="node5" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1529.5,-1934.5C1529.5,-1934.5 1845.5,-1934.5 1845.5,-1934.5 1851.5,-1934.5 1857.5,-1940.5 1857.5,-1946.5 1857.5,-1946.5 1857.5,-2106.5 1857.5,-2106.5 1857.5,-2112.5 1851.5,-2118.5 1845.5,-2118.5 1845.5,-2118.5 1529.5,-2118.5 1529.5,-2118.5 1523.5,-2118.5 1517.5,-2112.5 1517.5,-2106.5 1517.5,-2106.5 1517.5,-1946.5 1517.5,-1946.5 1517.5,-1940.5 1523.5,-1934.5 1529.5,-1934.5"/>
<text text-anchor="middle" x="1578.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1639.5,-1934.5 1639.5,-2118.5 "/>
<text text-anchor="middle" x="1650" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1660.5,-1934.5 1660.5,-2118.5 "/>
<text text-anchor="middle" x="1748.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1660.5,-2095.5 1836.5,-2095.5 "/>
<text text-anchor="middle" x="1748.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1660.5,-2072.5 1836.5,-2072.5 "/>
<text text-anchor="middle" x="1748.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1660.5,-2049.5 1836.5,-2049.5 "/>
<text text-anchor="middle" x="1748.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1660.5,-2026.5 1836.5,-2026.5 "/>
<text text-anchor="middle" x="1748.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1660.5,-2003.5 1836.5,-2003.5 "/>
<text text-anchor="middle" x="1748.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1660.5,-1980.5 1836.5,-1980.5 "/>
<text text-anchor="middle" x="1748.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1660.5,-1957.5 1836.5,-1957.5 "/>
<text text-anchor="middle" x="1748.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1836.5,-1934.5 1836.5,-2118.5 "/>
<text text-anchor="middle" x="1847" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment -->
<g id="node13" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M1613,-1468.5C1613,-1468.5 1962,-1468.5 1962,-1468.5 1968,-1468.5 1974,-1474.5 1974,-1480.5 1974,-1480.5 1974,-1663.5 1974,-1663.5 1974,-1669.5 1968,-1675.5 1962,-1675.5 1962,-1675.5 1613,-1675.5 1613,-1675.5 1607,-1675.5 1601,-1669.5 1601,-1663.5 1601,-1663.5 1601,-1480.5 1601,-1480.5 1601,-1474.5 1607,-1468.5 1613,-1468.5"/>
<text text-anchor="middle" x="1648.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="1696,-1468.5 1696,-1675.5 "/>
<text text-anchor="middle" x="1706.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1717,-1468.5 1717,-1675.5 "/>
<text text-anchor="middle" x="1835" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="1717,-1652.5 1953,-1652.5 "/>
<text text-anchor="middle" x="1835" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="1717,-1629.5 1953,-1629.5 "/>
<text text-anchor="middle" x="1835" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="1717,-1606.5 1953,-1606.5 "/>
<text text-anchor="middle" x="1835" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1717,-1583.5 1953,-1583.5 "/>
<text text-anchor="middle" x="1835" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="1717,-1560.5 1953,-1560.5 "/>
<text text-anchor="middle" x="1835" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="1717,-1537.5 1953,-1537.5 "/>
<text text-anchor="middle" x="1835" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1717,-1514.5 1953,-1514.5 "/>
<text text-anchor="middle" x="1835" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="1717,-1491.5 1953,-1491.5 "/>
<text text-anchor="middle" x="1835" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="1953,-1468.5 1953,-1675.5 "/>
<text text-anchor="middle" x="1963.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge5" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1703.848,-1934.3587C1716.2009,-1867.391 1734.2696,-1774.7222 1753.5,-1694 1754.1688,-1691.1927 1754.8584,-1688.3525 1755.5649,-1685.4903"/>
<polygon fill="#000000" stroke="#000000" points="1758.985,-1686.2407 1758.0264,-1675.6893 1752.1959,-1684.5355 1758.985,-1686.2407"/>
<text text-anchor="middle" x="1803.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge7" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1642.0007,-1934.2182C1609.2701,-1872.3918 1561.6602,-1790.9235 1508.5,-1727 1467.5961,-1677.8144 1410.6059,-1630.6183 1372.6825,-1601.4967"/>
<polygon fill="#000000" stroke="#000000" points="1374.4971,-1598.4793 1364.4205,-1595.2064 1370.2568,-1604.0488 1374.4971,-1598.4793"/>
<text text-anchor="middle" x="1519.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- vital_signs -->
<g id="node6" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1098,-1865.5C1098,-1865.5 1385,-1865.5 1385,-1865.5 1391,-1865.5 1397,-1871.5 1397,-1877.5 1397,-1877.5 1397,-2175.5 1397,-2175.5 1397,-2181.5 1391,-2187.5 1385,-2187.5 1385,-2187.5 1098,-2187.5 1098,-2187.5 1092,-2187.5 1086,-2181.5 1086,-2175.5 1086,-2175.5 1086,-1877.5 1086,-1877.5 1086,-1871.5 1092,-1865.5 1098,-1865.5"/>
<text text-anchor="middle" x="1132.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1179,-1865.5 1179,-2187.5 "/>
<text text-anchor="middle" x="1189.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1200,-1865.5 1200,-2187.5 "/>
<text text-anchor="middle" x="1288" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1200,-2164.5 1376,-2164.5 "/>
<text text-anchor="middle" x="1288" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1200,-2141.5 1376,-2141.5 "/>
<text text-anchor="middle" x="1288" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1200,-2118.5 1376,-2118.5 "/>
<text text-anchor="middle" x="1288" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1200,-2095.5 1376,-2095.5 "/>
<text text-anchor="middle" x="1288" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1200,-2072.5 1376,-2072.5 "/>
<text text-anchor="middle" x="1288" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1200,-2049.5 1376,-2049.5 "/>
<text text-anchor="middle" x="1288" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1200,-2026.5 1376,-2026.5 "/>
<text text-anchor="middle" x="1288" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1200,-2003.5 1376,-2003.5 "/>
<text text-anchor="middle" x="1288" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1200,-1980.5 1376,-1980.5 "/>
<text text-anchor="middle" x="1288" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1200,-1957.5 1376,-1957.5 "/>
<text text-anchor="middle" x="1288" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1200,-1934.5 1376,-1934.5 "/>
<text text-anchor="middle" x="1288" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1200,-1911.5 1376,-1911.5 "/>
<text text-anchor="middle" x="1288" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1200,-1888.5 1376,-1888.5 "/>
<text text-anchor="middle" x="1288" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1376,-1865.5 1376,-2187.5 "/>
<text text-anchor="middle" x="1386.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge8" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1273.7753,-1865.3007C1292.701,-1770.7762 1314.9698,-1659.5546 1325.8455,-1605.236"/>
<polygon fill="#000000" stroke="#000000" points="1329.3329,-1605.6454 1327.8643,-1595.1528 1322.4691,-1604.2711 1329.3329,-1605.6454"/>
<text text-anchor="middle" x="1334.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- demographic -->
<g id="node7" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M878.5,-1232.5C878.5,-1232.5 1214.5,-1232.5 1214.5,-1232.5 1220.5,-1232.5 1226.5,-1238.5 1226.5,-1244.5 1226.5,-1244.5 1226.5,-1381.5 1226.5,-1381.5 1226.5,-1387.5 1220.5,-1393.5 1214.5,-1393.5 1214.5,-1393.5 878.5,-1393.5 878.5,-1393.5 872.5,-1393.5 866.5,-1387.5 866.5,-1381.5 866.5,-1381.5 866.5,-1244.5 866.5,-1244.5 866.5,-1238.5 872.5,-1232.5 878.5,-1232.5"/>
<text text-anchor="middle" x="921.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="976.5,-1232.5 976.5,-1393.5 "/>
<text text-anchor="middle" x="987" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="997.5,-1232.5 997.5,-1393.5 "/>
<text text-anchor="middle" x="1101.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="997.5,-1370.5 1205.5,-1370.5 "/>
<text text-anchor="middle" x="1101.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="997.5,-1347.5 1205.5,-1347.5 "/>
<text text-anchor="middle" x="1101.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="997.5,-1324.5 1205.5,-1324.5 "/>
<text text-anchor="middle" x="1101.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="997.5,-1301.5 1205.5,-1301.5 "/>
<text text-anchor="middle" x="1101.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="997.5,-1278.5 1205.5,-1278.5 "/>
<text text-anchor="middle" x="1101.5" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="997.5,-1255.5 1205.5,-1255.5 "/>
<text text-anchor="middle" x="1101.5" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1205.5,-1232.5 1205.5,-1393.5 "/>
<text text-anchor="middle" x="1216" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge18" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1024.925,-1232.4932C1019.0945,-1210.7369 1012.912,-1187.6672 1007.5265,-1167.5713"/>
<polygon fill="#000000" stroke="#000000" points="1010.84,-1166.4142 1004.8707,-1157.661 1004.0786,-1168.2262 1010.84,-1166.4142"/>
<text text-anchor="middle" x="1040.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- assay -->
<g id="node8" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M374.5,-2662.5C374.5,-2662.5 406.5,-2662.5 406.5,-2662.5 412.5,-2662.5 418.5,-2668.5 418.5,-2674.5 418.5,-2674.5 418.5,-2686.5 418.5,-2686.5 418.5,-2692.5 412.5,-2698.5 406.5,-2698.5 406.5,-2698.5 374.5,-2698.5 374.5,-2698.5 368.5,-2698.5 362.5,-2692.5 362.5,-2686.5 362.5,-2686.5 362.5,-2674.5 362.5,-2674.5 362.5,-2668.5 368.5,-2662.5 374.5,-2662.5"/>
<text text-anchor="middle" x="390.5" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- sample -->
<g id="node15" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M224,-1819.5C224,-1819.5 647,-1819.5 647,-1819.5 653,-1819.5 659,-1825.5 659,-1831.5 659,-1831.5 659,-2221.5 659,-2221.5 659,-2227.5 653,-2233.5 647,-2233.5 647,-2233.5 224,-2233.5 224,-2233.5 218,-2233.5 212,-2227.5 212,-2221.5 212,-2221.5 212,-1831.5 212,-1831.5 212,-1825.5 218,-1819.5 224,-1819.5"/>
<text text-anchor="middle" x="246" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="280,-1819.5 280,-2233.5 "/>
<text text-anchor="middle" x="290.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="301,-1819.5 301,-2233.5 "/>
<text text-anchor="middle" x="469.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="301,-2210.5 638,-2210.5 "/>
<text text-anchor="middle" x="469.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="301,-2187.5 638,-2187.5 "/>
<text text-anchor="middle" x="469.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="301,-2164.5 638,-2164.5 "/>
<text text-anchor="middle" x="469.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="301,-2141.5 638,-2141.5 "/>
<text text-anchor="middle" x="469.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="301,-2118.5 638,-2118.5 "/>
<text text-anchor="middle" x="469.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="301,-2095.5 638,-2095.5 "/>
<text text-anchor="middle" x="469.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="301,-2072.5 638,-2072.5 "/>
<text text-anchor="middle" x="469.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="301,-2049.5 638,-2049.5 "/>
<text text-anchor="middle" x="469.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="301,-2026.5 638,-2026.5 "/>
<text text-anchor="middle" x="469.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="301,-2003.5 638,-2003.5 "/>
<text text-anchor="middle" x="469.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="301,-1980.5 638,-1980.5 "/>
<text text-anchor="middle" x="469.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="301,-1957.5 638,-1957.5 "/>
<text text-anchor="middle" x="469.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="301,-1934.5 638,-1934.5 "/>
<text text-anchor="middle" x="469.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="301,-1911.5 638,-1911.5 "/>
<text text-anchor="middle" x="469.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="301,-1888.5 638,-1888.5 "/>
<text text-anchor="middle" x="469.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="301,-1865.5 638,-1865.5 "/>
<text text-anchor="middle" x="469.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="301,-1842.5 638,-1842.5 "/>
<text text-anchor="middle" x="469.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="638,-1819.5 638,-2233.5 "/>
<text text-anchor="middle" x="648.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge15" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M389.6916,-2662.2303C387.6373,-2611.5978 382.9599,-2465.214 391.5,-2344 393.7861,-2311.5523 397.3222,-2277.3692 401.4183,-2243.9349"/>
<polygon fill="#000000" stroke="#000000" points="404.9444,-2243.9413 402.7067,-2233.5855 397.998,-2243.0765 404.9444,-2243.9413"/>
<text text-anchor="middle" x="428" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- adverse_event -->
<g id="node9" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1593,-622.5C1593,-622.5 1988,-622.5 1988,-622.5 1994,-622.5 2000,-628.5 2000,-634.5 2000,-634.5 2000,-1001.5 2000,-1001.5 2000,-1007.5 1994,-1013.5 1988,-1013.5 1988,-1013.5 1593,-1013.5 1593,-1013.5 1587,-1013.5 1581,-1007.5 1581,-1001.5 1581,-1001.5 1581,-634.5 1581,-634.5 1581,-628.5 1587,-622.5 1593,-622.5"/>
<text text-anchor="middle" x="1641" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1701,-622.5 1701,-1013.5 "/>
<text text-anchor="middle" x="1711.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1722,-622.5 1722,-1013.5 "/>
<text text-anchor="middle" x="1850.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1722,-990.5 1979,-990.5 "/>
<text text-anchor="middle" x="1850.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1722,-967.5 1979,-967.5 "/>
<text text-anchor="middle" x="1850.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1722,-944.5 1979,-944.5 "/>
<text text-anchor="middle" x="1850.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1722,-921.5 1979,-921.5 "/>
<text text-anchor="middle" x="1850.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1722,-898.5 1979,-898.5 "/>
<text text-anchor="middle" x="1850.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1722,-875.5 1979,-875.5 "/>
<text text-anchor="middle" x="1850.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1722,-852.5 1979,-852.5 "/>
<text text-anchor="middle" x="1850.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1722,-829.5 1979,-829.5 "/>
<text text-anchor="middle" x="1850.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1722,-806.5 1979,-806.5 "/>
<text text-anchor="middle" x="1850.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1722,-783.5 1979,-783.5 "/>
<text text-anchor="middle" x="1850.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1722,-760.5 1979,-760.5 "/>
<text text-anchor="middle" x="1850.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1722,-737.5 1979,-737.5 "/>
<text text-anchor="middle" x="1850.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1722,-714.5 1979,-714.5 "/>
<text text-anchor="middle" x="1850.5" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1722,-691.5 1979,-691.5 "/>
<text text-anchor="middle" x="1850.5" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1722,-668.5 1979,-668.5 "/>
<text text-anchor="middle" x="1850.5" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1722,-645.5 1979,-645.5 "/>
<text text-anchor="middle" x="1850.5" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1979,-622.5 1979,-1013.5 "/>
<text text-anchor="middle" x="1989.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge39" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2000.2046,-845.2761C2011.376,-838.5862 2018,-829.4941 2018,-818 2018,-809.7386 2014.5781,-802.7181 2008.5052,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="2010.3073,-793.9155 2000.2046,-790.7239 2006.1119,-799.519 2010.3073,-793.9155"/>
<text text-anchor="middle" x="2034" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- agent -->
<g id="node18" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M1677.5,-524.5C1677.5,-524.5 1903.5,-524.5 1903.5,-524.5 1909.5,-524.5 1915.5,-530.5 1915.5,-536.5 1915.5,-536.5 1915.5,-558.5 1915.5,-558.5 1915.5,-564.5 1909.5,-570.5 1903.5,-570.5 1903.5,-570.5 1677.5,-570.5 1677.5,-570.5 1671.5,-570.5 1665.5,-564.5 1665.5,-558.5 1665.5,-558.5 1665.5,-536.5 1665.5,-536.5 1665.5,-530.5 1671.5,-524.5 1677.5,-524.5"/>
<text text-anchor="middle" x="1694" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1722.5,-524.5 1722.5,-570.5 "/>
<text text-anchor="middle" x="1733" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1743.5,-524.5 1743.5,-570.5 "/>
<text text-anchor="middle" x="1819" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1743.5,-547.5 1894.5,-547.5 "/>
<text text-anchor="middle" x="1819" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1894.5,-524.5 1894.5,-570.5 "/>
<text text-anchor="middle" x="1905" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge2" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1790.5,-622.4901C1790.5,-606.8636 1790.5,-592.5861 1790.5,-580.7798"/>
<polygon fill="#000000" stroke="#000000" points="1794.0001,-580.664 1790.5,-570.6641 1787.0001,-580.6641 1794.0001,-580.664"/>
<text text-anchor="middle" x="1821.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- adverse_event&#45;&gt;visit -->
<g id="edge12" class="edge">
<title>adverse_event&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1835.8596,-1013.8042C1853.5366,-1141.5539 1852.1063,-1304.8079 1764.5,-1417 1715.4274,-1479.8443 1667.818,-1441.8326 1592.5,-1468 1524.4087,-1491.6567 1447.9738,-1522.7976 1395.702,-1544.8174"/>
<polygon fill="#000000" stroke="#000000" points="1394.0799,-1541.7031 1386.2304,-1548.819 1396.8042,-1548.1513 1394.0799,-1541.7031"/>
<text text-anchor="middle" x="1871.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- prior_surgery -->
<g id="node10" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M2399.5,-1946C2399.5,-1946 2745.5,-1946 2745.5,-1946 2751.5,-1946 2757.5,-1952 2757.5,-1958 2757.5,-1958 2757.5,-2095 2757.5,-2095 2757.5,-2101 2751.5,-2107 2745.5,-2107 2745.5,-2107 2399.5,-2107 2399.5,-2107 2393.5,-2107 2387.5,-2101 2387.5,-2095 2387.5,-2095 2387.5,-1958 2387.5,-1958 2387.5,-1952 2393.5,-1946 2399.5,-1946"/>
<text text-anchor="middle" x="2445" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="2502.5,-1946 2502.5,-2107 "/>
<text text-anchor="middle" x="2513" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2523.5,-1946 2523.5,-2107 "/>
<text text-anchor="middle" x="2630" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="2523.5,-2084 2736.5,-2084 "/>
<text text-anchor="middle" x="2630" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2523.5,-2061 2736.5,-2061 "/>
<text text-anchor="middle" x="2630" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="2523.5,-2038 2736.5,-2038 "/>
<text text-anchor="middle" x="2630" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2523.5,-2015 2736.5,-2015 "/>
<text text-anchor="middle" x="2630" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2523.5,-1992 2736.5,-1992 "/>
<text text-anchor="middle" x="2630" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="2523.5,-1969 2736.5,-1969 "/>
<text text-anchor="middle" x="2630" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="2736.5,-1946 2736.5,-2107 "/>
<text text-anchor="middle" x="2747" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge38" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M2757.613,-2068.5585C2768.7907,-2058.5547 2775.5,-2044.5352 2775.5,-2026.5 2775.5,-2012.5509 2771.4865,-2001.004 2764.4962,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="2766.9806,-1989.3911 2757.613,-1984.4415 2761.8494,-1994.1525 2766.9806,-1989.3911"/>
<text text-anchor="middle" x="2791.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge6" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2540.2374,-1945.7001C2508.8837,-1877.4289 2454.7968,-1782.192 2378.5,-1727 2315.4367,-1681.381 2130.4614,-1637.1284 1984.0711,-1607.667"/>
<polygon fill="#000000" stroke="#000000" points="1984.5358,-1604.1906 1974.0433,-1605.6597 1983.1619,-1611.0545 1984.5358,-1604.1906"/>
<text text-anchor="middle" x="2394.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- image -->
<g id="node11" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M162.5,-2836C162.5,-2836 198.5,-2836 198.5,-2836 204.5,-2836 210.5,-2842 210.5,-2848 210.5,-2848 210.5,-2860 210.5,-2860 210.5,-2866 204.5,-2872 198.5,-2872 198.5,-2872 162.5,-2872 162.5,-2872 156.5,-2872 150.5,-2866 150.5,-2860 150.5,-2860 150.5,-2848 150.5,-2848 150.5,-2842 156.5,-2836 162.5,-2836"/>
<text text-anchor="middle" x="180.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge26" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M174.1265,-2835.9806C165.2053,-2807.173 153.0652,-2750.5815 181.5,-2717 202.922,-2691.7007 297.5457,-2683.9335 351.8405,-2681.5515"/>
<polygon fill="#000000" stroke="#000000" points="352.2748,-2685.0371 362.1281,-2681.1433 351.9972,-2678.0426 352.2748,-2685.0371"/>
<text text-anchor="middle" x="212" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- off_treatment -->
<g id="node12" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1104,-726C1104,-726 1551,-726 1551,-726 1557,-726 1563,-732 1563,-738 1563,-738 1563,-898 1563,-898 1563,-904 1557,-910 1551,-910 1551,-910 1104,-910 1104,-910 1098,-910 1092,-904 1092,-898 1092,-898 1092,-738 1092,-738 1092,-732 1098,-726 1104,-726"/>
<text text-anchor="middle" x="1149.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1207,-726 1207,-910 "/>
<text text-anchor="middle" x="1217.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1228,-726 1228,-910 "/>
<text text-anchor="middle" x="1385" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1228,-887 1542,-887 "/>
<text text-anchor="middle" x="1385" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1228,-864 1542,-864 "/>
<text text-anchor="middle" x="1385" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1228,-841 1542,-841 "/>
<text text-anchor="middle" x="1385" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1228,-818 1542,-818 "/>
<text text-anchor="middle" x="1385" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1228,-795 1542,-795 "/>
<text text-anchor="middle" x="1385" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1228,-772 1542,-772 "/>
<text text-anchor="middle" x="1385" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1228,-749 1542,-749 "/>
<text text-anchor="middle" x="1385" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1542,-726 1542,-910 "/>
<text text-anchor="middle" x="1552.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge19" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1764.549,-1468.1526C1740.4521,-1384.6428 1693.9288,-1271.3127 1609.5,-1209 1534.5247,-1153.6645 1282.1667,-1128.6848 1124.3654,-1118.2417"/>
<polygon fill="#000000" stroke="#000000" points="1124.3171,-1114.7312 1114.111,-1117.5747 1123.8627,-1121.7165 1124.3171,-1114.7312"/>
<text text-anchor="middle" x="1773.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge28" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M979.7876,-1065.1442C975.7212,-1049.048 971.5008,-1030.8181 968.5,-1014 953.1028,-927.7047 946.5,-905.6581 946.5,-818 946.5,-818 946.5,-818 946.5,-438 946.5,-377.6943 1094.5569,-330.8133 1217.5181,-302.2774"/>
<polygon fill="#000000" stroke="#000000" points="1218.4849,-305.6466 1227.4493,-299.9995 1216.9199,-298.8238 1218.4849,-305.6466"/>
<text text-anchor="middle" x="987" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge34" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1114.0411,-1099.0667C1259.3086,-1082.8204 1492.6748,-1051.9245 1571.5,-1014 1571.597,-1013.9533 1571.694,-1013.9066 1571.7909,-1013.8598"/>
<polygon fill="#000000" stroke="#000000" points="1573.4068,-1016.965 1580.775,-1009.3519 1570.2674,-1010.7084 1573.4068,-1016.965"/>
<text text-anchor="middle" x="1584.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge23" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1045.2123,-1065.3178C1090.5321,-1025.6122 1157.4534,-966.9811 1214.7637,-916.7704"/>
<polygon fill="#000000" stroke="#000000" points="1217.207,-919.2832 1222.4222,-910.0607 1212.5941,-914.018 1217.207,-919.2832"/>
<text text-anchor="middle" x="1153.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- off_study -->
<g id="node17" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M491,-714.5C491,-714.5 906,-714.5 906,-714.5 912,-714.5 918,-720.5 918,-726.5 918,-726.5 918,-909.5 918,-909.5 918,-915.5 912,-921.5 906,-921.5 906,-921.5 491,-921.5 491,-921.5 485,-921.5 479,-915.5 479,-909.5 479,-909.5 479,-726.5 479,-726.5 479,-720.5 485,-714.5 491,-714.5"/>
<text text-anchor="middle" x="520.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="562,-714.5 562,-921.5 "/>
<text text-anchor="middle" x="572.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="583,-714.5 583,-921.5 "/>
<text text-anchor="middle" x="740" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="583,-898.5 897,-898.5 "/>
<text text-anchor="middle" x="740" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="583,-875.5 897,-875.5 "/>
<text text-anchor="middle" x="740" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="583,-852.5 897,-852.5 "/>
<text text-anchor="middle" x="740" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="583,-829.5 897,-829.5 "/>
<text text-anchor="middle" x="740" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="583,-806.5 897,-806.5 "/>
<text text-anchor="middle" x="740" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="583,-783.5 897,-783.5 "/>
<text text-anchor="middle" x="740" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="583,-760.5 897,-760.5 "/>
<text text-anchor="middle" x="740" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="583,-737.5 897,-737.5 "/>
<text text-anchor="middle" x="740" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="897,-714.5 897,-921.5 "/>
<text text-anchor="middle" x="907.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge3" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M870.65,-1077.1428C853.6762,-1069.0142 837.3377,-1059.0845 823.5,-1047 787.8181,-1015.8389 760.4276,-971.9159 740.5095,-930.8602"/>
<polygon fill="#000000" stroke="#000000" points="743.5657,-929.1365 736.1181,-921.601 737.241,-932.1361 743.5657,-929.1365"/>
<text text-anchor="middle" x="878" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- cohort -->
<g id="node22" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M1058,-524.5C1058,-524.5 1291,-524.5 1291,-524.5 1297,-524.5 1303,-530.5 1303,-536.5 1303,-536.5 1303,-558.5 1303,-558.5 1303,-564.5 1297,-570.5 1291,-570.5 1291,-570.5 1058,-570.5 1058,-570.5 1052,-570.5 1046,-564.5 1046,-558.5 1046,-558.5 1046,-536.5 1046,-536.5 1046,-530.5 1052,-524.5 1058,-524.5"/>
<text text-anchor="middle" x="1077.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="1109,-524.5 1109,-570.5 "/>
<text text-anchor="middle" x="1119.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1130,-524.5 1130,-570.5 "/>
<text text-anchor="middle" x="1206" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1130,-547.5 1282,-547.5 "/>
<text text-anchor="middle" x="1206" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="1282,-524.5 1282,-570.5 "/>
<text text-anchor="middle" x="1292.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge29" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M987.1873,-1065.2623C975.7633,-957.4932 953.5881,-693.3611 1001.5,-622 1015.7416,-600.7883 1037.4038,-585.5848 1060.6308,-574.6979"/>
<polygon fill="#000000" stroke="#000000" points="1062.2132,-577.8253 1069.9496,-570.5866 1059.3876,-571.4209 1062.2132,-577.8253"/>
<text text-anchor="middle" x="1042" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge22" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M415.8341,-1819.1717C410.3977,-1635.0519 433.9767,-1370.7882 587.5,-1209 624.8448,-1169.6448 757.5268,-1142.9301 860.9692,-1127.5572"/>
<polygon fill="#000000" stroke="#000000" points="861.4972,-1131.0173 870.8843,-1126.1049 860.4826,-1124.0913 861.4972,-1131.0173"/>
<text text-anchor="middle" x="487.5" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge40" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M659.0955,-2065.8333C670.3572,-2056.0642 677,-2042.9531 677,-2026.5 677,-2013.9031 673.1061,-2003.2652 666.2267,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="668.5485,-1991.9513 659.0955,-1987.1667 663.5016,-1996.802 668.5485,-1991.9513"/>
<text text-anchor="middle" x="693" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge10" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M600.926,-1819.3732C636.6133,-1784.5219 676.3864,-1751.7032 718.5,-1727 878.3466,-1633.2365 1093.8891,-1595.7491 1222.4828,-1581.0795"/>
<polygon fill="#000000" stroke="#000000" points="1223.1851,-1584.5229 1232.7361,-1579.9372 1222.41,-1577.566 1223.1851,-1584.5229"/>
<text text-anchor="middle" x="807.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent_administration -->
<g id="node16" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M1888,-1785C1888,-1785 2357,-1785 2357,-1785 2363,-1785 2369,-1791 2369,-1797 2369,-1797 2369,-2256 2369,-2256 2369,-2262 2363,-2268 2357,-2268 2357,-2268 1888,-2268 1888,-2268 1882,-2268 1876,-2262 1876,-2256 1876,-2256 1876,-1797 1876,-1797 1876,-1791 1882,-1785 1888,-1785"/>
<text text-anchor="middle" x="1961" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="2046,-1785 2046,-2268 "/>
<text text-anchor="middle" x="2056.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2067,-1785 2067,-2268 "/>
<text text-anchor="middle" x="2207.5" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="2067,-2245 2348,-2245 "/>
<text text-anchor="middle" x="2207.5" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2067,-2222 2348,-2222 "/>
<text text-anchor="middle" x="2207.5" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="2067,-2199 2348,-2199 "/>
<text text-anchor="middle" x="2207.5" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2067,-2176 2348,-2176 "/>
<text text-anchor="middle" x="2207.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="2067,-2153 2348,-2153 "/>
<text text-anchor="middle" x="2207.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="2067,-2130 2348,-2130 "/>
<text text-anchor="middle" x="2207.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="2067,-2107 2348,-2107 "/>
<text text-anchor="middle" x="2207.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2067,-2084 2348,-2084 "/>
<text text-anchor="middle" x="2207.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="2067,-2061 2348,-2061 "/>
<text text-anchor="middle" x="2207.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2067,-2038 2348,-2038 "/>
<text text-anchor="middle" x="2207.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2067,-2015 2348,-2015 "/>
<text text-anchor="middle" x="2207.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2067,-1992 2348,-1992 "/>
<text text-anchor="middle" x="2207.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2067,-1969 2348,-1969 "/>
<text text-anchor="middle" x="2207.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2067,-1946 2348,-1946 "/>
<text text-anchor="middle" x="2207.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="2067,-1923 2348,-1923 "/>
<text text-anchor="middle" x="2207.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2067,-1900 2348,-1900 "/>
<text text-anchor="middle" x="2207.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="2067,-1877 2348,-1877 "/>
<text text-anchor="middle" x="2207.5" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="2067,-1854 2348,-1854 "/>
<text text-anchor="middle" x="2207.5" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2067,-1831 2348,-1831 "/>
<text text-anchor="middle" x="2207.5" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="2067,-1808 2348,-1808 "/>
<text text-anchor="middle" x="2207.5" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="2348,-1785 2348,-2268 "/>
<text text-anchor="middle" x="2358.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge1" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2110.1004,-1784.7917C2107.486,-1716.0492 2105.5,-1641.0912 2105.5,-1572 2105.5,-1572 2105.5,-1572 2105.5,-818 2105.5,-728.522 2121.5036,-686.5126 2059.5,-622 2039.9381,-601.6466 1982.4639,-584.3882 1925.6383,-571.6236"/>
<polygon fill="#000000" stroke="#000000" points="1926.3089,-568.1874 1915.79,-569.4536 1924.8026,-575.0235 1926.3089,-568.1874"/>
<text text-anchor="middle" x="2136.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge13" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1968.2204,-1784.6203C1934.7311,-1748.6741 1896.3157,-1716.2749 1853.5,-1694 1801.9245,-1667.1678 1649.1765,-1688.9529 1592.5,-1676 1518.6587,-1659.1243 1438.3938,-1624.2683 1386.875,-1599.5686"/>
<polygon fill="#000000" stroke="#000000" points="1388.1241,-1596.2849 1377.5979,-1595.0814 1385.0762,-1602.5865 1388.1241,-1596.2849"/>
<text text-anchor="middle" x="1900.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- study_arm -->
<g id="node24" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M1195,-415C1195,-415 1564,-415 1564,-415 1570,-415 1576,-421 1576,-427 1576,-427 1576,-449 1576,-449 1576,-455 1570,-461 1564,-461 1564,-461 1195,-461 1195,-461 1189,-461 1183,-455 1183,-449 1183,-449 1183,-427 1183,-427 1183,-421 1189,-415 1195,-415"/>
<text text-anchor="middle" x="1229" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="1275,-415 1275,-461 "/>
<text text-anchor="middle" x="1285.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1296,-415 1296,-461 "/>
<text text-anchor="middle" x="1425.5" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="1296,-438 1555,-438 "/>
<text text-anchor="middle" x="1425.5" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="1555,-415 1555,-461 "/>
<text text-anchor="middle" x="1565.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge41" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1704.0904,-524.4785C1637.4395,-506.7211 1545.2673,-482.1643 1476.1688,-463.7548"/>
<polygon fill="#000000" stroke="#000000" points="1476.7111,-460.2773 1466.1471,-461.0848 1474.909,-467.0413 1476.7111,-460.2773"/>
<text text-anchor="middle" x="1682" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- cycle -->
<g id="node19" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M608.5,-1278.5C608.5,-1278.5 836.5,-1278.5 836.5,-1278.5 842.5,-1278.5 848.5,-1284.5 848.5,-1290.5 848.5,-1290.5 848.5,-1335.5 848.5,-1335.5 848.5,-1341.5 842.5,-1347.5 836.5,-1347.5 836.5,-1347.5 608.5,-1347.5 608.5,-1347.5 602.5,-1347.5 596.5,-1341.5 596.5,-1335.5 596.5,-1335.5 596.5,-1290.5 596.5,-1290.5 596.5,-1284.5 602.5,-1278.5 608.5,-1278.5"/>
<text text-anchor="middle" x="623.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="650.5,-1278.5 650.5,-1347.5 "/>
<text text-anchor="middle" x="661" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="671.5,-1278.5 671.5,-1347.5 "/>
<text text-anchor="middle" x="749.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="671.5,-1324.5 827.5,-1324.5 "/>
<text text-anchor="middle" x="749.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="671.5,-1301.5 827.5,-1301.5 "/>
<text text-anchor="middle" x="749.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="827.5,-1278.5 827.5,-1347.5 "/>
<text text-anchor="middle" x="838" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge17" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M766.6229,-1278.459C792.8687,-1258.0509 826.9091,-1231.8214 857.5,-1209 877.4595,-1194.1098 899.2704,-1178.2022 919.4274,-1163.6473"/>
<polygon fill="#000000" stroke="#000000" points="921.5912,-1166.4021 927.6556,-1157.7145 917.4972,-1160.7241 921.5912,-1166.4021"/>
<text text-anchor="middle" x="929.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_site -->
<g id="node20" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M1606,-403.5C1606,-403.5 1923,-403.5 1923,-403.5 1929,-403.5 1935,-409.5 1935,-415.5 1935,-415.5 1935,-460.5 1935,-460.5 1935,-466.5 1929,-472.5 1923,-472.5 1923,-472.5 1606,-472.5 1606,-472.5 1600,-472.5 1594,-466.5 1594,-460.5 1594,-460.5 1594,-415.5 1594,-415.5 1594,-409.5 1600,-403.5 1606,-403.5"/>
<text text-anchor="middle" x="1639" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="1684,-403.5 1684,-472.5 "/>
<text text-anchor="middle" x="1694.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1705,-403.5 1705,-472.5 "/>
<text text-anchor="middle" x="1809.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1705,-449.5 1914,-449.5 "/>
<text text-anchor="middle" x="1809.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="1705,-426.5 1914,-426.5 "/>
<text text-anchor="middle" x="1809.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="1914,-403.5 1914,-472.5 "/>
<text text-anchor="middle" x="1924.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge25" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1684.7278,-403.3975C1643.0511,-385.3196 1590.49,-362.5203 1540.782,-340.9587"/>
<polygon fill="#000000" stroke="#000000" points="1542.1039,-337.717 1531.537,-336.9485 1539.3183,-344.1389 1542.1039,-337.717"/>
<text text-anchor="middle" x="1670" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge16" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1232.5878,-1549.9614C1133.6403,-1525.7444 979.6509,-1481.5145 857.5,-1417 825.3953,-1400.0438 793.0483,-1375.4454 768.0688,-1354.4282"/>
<polygon fill="#000000" stroke="#000000" points="770.1081,-1351.5676 760.227,-1347.7445 765.5673,-1356.895 770.1081,-1351.5676"/>
<text text-anchor="middle" x="949" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge36" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1390.5376,-1595.0098C1421.6529,-1598.9199 1450,-1591.25 1450,-1572 1450,-1554.8555 1427.5147,-1546.8964 1400.6145,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="1400.2006,-1544.6454 1390.5376,-1548.9902 1400.801,-1551.6196 1400.2006,-1544.6454"/>
<text text-anchor="middle" x="1466" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge30" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1137.1414,-524.3109C1120.1327,-511.5003 1101.7629,-493.9307 1092.5,-473 1079.9096,-444.5504 1075.7152,-429.1949 1092.5,-403 1121.1313,-358.3172 1169.1223,-328.5541 1217.7472,-308.8157"/>
<polygon fill="#000000" stroke="#000000" points="1219.1227,-312.0359 1227.1516,-305.123 1216.5642,-305.5202 1219.1227,-312.0359"/>
<text text-anchor="middle" x="1133" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge31" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1217.9752,-524.2779C1250.0185,-507.1621 1293.7364,-483.8103 1327.6097,-465.717"/>
<polygon fill="#000000" stroke="#000000" points="1329.2679,-468.7994 1336.4394,-461.0007 1325.9698,-462.625 1329.2679,-468.7994"/>
<text text-anchor="middle" x="1318" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- lab_exam -->
<g id="node23" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1427.5,-2008.5C1427.5,-2008.5 1487.5,-2008.5 1487.5,-2008.5 1493.5,-2008.5 1499.5,-2014.5 1499.5,-2020.5 1499.5,-2020.5 1499.5,-2032.5 1499.5,-2032.5 1499.5,-2038.5 1493.5,-2044.5 1487.5,-2044.5 1487.5,-2044.5 1427.5,-2044.5 1427.5,-2044.5 1421.5,-2044.5 1415.5,-2038.5 1415.5,-2032.5 1415.5,-2032.5 1415.5,-2020.5 1415.5,-2020.5 1415.5,-2014.5 1421.5,-2008.5 1427.5,-2008.5"/>
<text text-anchor="middle" x="1457.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge11" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1456.1537,-2008.196C1452.2884,-1960.7562 1439.2602,-1830.3217 1406.5,-1727 1392.4108,-1682.5644 1367.9342,-1634.5988 1351.0104,-1603.9846"/>
<polygon fill="#000000" stroke="#000000" points="1353.9569,-1602.0827 1346.0205,-1595.0638 1347.8477,-1605.4999 1353.9569,-1602.0827"/>
<text text-anchor="middle" x="1426.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge33" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1379.5,-414.7794C1379.5,-400.5955 1379.5,-381.4427 1379.5,-361.748"/>
<polygon fill="#000000" stroke="#000000" points="1383.0001,-361.7407 1379.5,-351.7407 1376.0001,-361.7408 1383.0001,-361.7407"/>
<text text-anchor="middle" x="1420" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- follow_up -->
<g id="node25" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1256.5,-1209.5C1256.5,-1209.5 1588.5,-1209.5 1588.5,-1209.5 1594.5,-1209.5 1600.5,-1215.5 1600.5,-1221.5 1600.5,-1221.5 1600.5,-1404.5 1600.5,-1404.5 1600.5,-1410.5 1594.5,-1416.5 1588.5,-1416.5 1588.5,-1416.5 1256.5,-1416.5 1256.5,-1416.5 1250.5,-1416.5 1244.5,-1410.5 1244.5,-1404.5 1244.5,-1404.5 1244.5,-1221.5 1244.5,-1221.5 1244.5,-1215.5 1250.5,-1209.5 1256.5,-1209.5"/>
<text text-anchor="middle" x="1287" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="1329.5,-1209.5 1329.5,-1416.5 "/>
<text text-anchor="middle" x="1340" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1350.5,-1209.5 1350.5,-1416.5 "/>
<text text-anchor="middle" x="1465" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1350.5,-1393.5 1579.5,-1393.5 "/>
<text text-anchor="middle" x="1465" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="1350.5,-1370.5 1579.5,-1370.5 "/>
<text text-anchor="middle" x="1465" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="1350.5,-1347.5 1579.5,-1347.5 "/>
<text text-anchor="middle" x="1465" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1350.5,-1324.5 1579.5,-1324.5 "/>
<text text-anchor="middle" x="1465" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="1350.5,-1301.5 1579.5,-1301.5 "/>
<text text-anchor="middle" x="1465" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="1350.5,-1278.5 1579.5,-1278.5 "/>
<text text-anchor="middle" x="1465" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="1350.5,-1255.5 1579.5,-1255.5 "/>
<text text-anchor="middle" x="1465" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="1350.5,-1232.5 1579.5,-1232.5 "/>
<text text-anchor="middle" x="1465" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="1579.5,-1209.5 1579.5,-1416.5 "/>
<text text-anchor="middle" x="1590" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge21" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1244.3525,-1213.2681C1241.3869,-1211.8218 1238.4345,-1210.3979 1235.5,-1209 1199.9001,-1192.0415 1160.5243,-1175.3805 1124.0193,-1160.7628"/>
<polygon fill="#000000" stroke="#000000" points="1124.8917,-1157.3429 1114.3064,-1156.8942 1122.3015,-1163.8461 1124.8917,-1157.3429"/>
<text text-anchor="middle" x="1217.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file -->
<g id="node26" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M304,-2750.5C304,-2750.5 489,-2750.5 489,-2750.5 495,-2750.5 501,-2756.5 501,-2762.5 501,-2762.5 501,-2945.5 501,-2945.5 501,-2951.5 495,-2957.5 489,-2957.5 489,-2957.5 304,-2957.5 304,-2957.5 298,-2957.5 292,-2951.5 292,-2945.5 292,-2945.5 292,-2762.5 292,-2762.5 292,-2756.5 298,-2750.5 304,-2750.5"/>
<text text-anchor="middle" x="311.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="331,-2750.5 331,-2957.5 "/>
<text text-anchor="middle" x="341.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="352,-2750.5 352,-2957.5 "/>
<text text-anchor="middle" x="416" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="352,-2934.5 480,-2934.5 "/>
<text text-anchor="middle" x="416" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="352,-2911.5 480,-2911.5 "/>
<text text-anchor="middle" x="416" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="352,-2888.5 480,-2888.5 "/>
<text text-anchor="middle" x="416" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="352,-2865.5 480,-2865.5 "/>
<text text-anchor="middle" x="416" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="352,-2842.5 480,-2842.5 "/>
<text text-anchor="middle" x="416" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="352,-2819.5 480,-2819.5 "/>
<text text-anchor="middle" x="416" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="352,-2796.5 480,-2796.5 "/>
<text text-anchor="middle" x="416" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="352,-2773.5 480,-2773.5 "/>
<text text-anchor="middle" x="416" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_locations</text>
<polyline fill="none" stroke="#000000" points="480,-2750.5 480,-2957.5 "/>
<text text-anchor="middle" x="490.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge35" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M292.3596,-2750.3126C287.8046,-2744.2823 283.4834,-2738.161 279.5,-2732 263.7431,-2707.629 249.7896,-2680.2518 237.7418,-2652.9761"/>
<polygon fill="#000000" stroke="#000000" points="240.9224,-2651.5132 233.7292,-2643.7344 234.5015,-2654.3011 240.9224,-2651.5132"/>
<text text-anchor="middle" x="334" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge27" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M392.9059,-2750.0694C392.3785,-2734.8191 391.8766,-2720.3067 391.469,-2708.5208"/>
<polygon fill="#000000" stroke="#000000" points="394.9668,-2708.3937 391.1232,-2698.5206 387.971,-2708.6356 394.9668,-2708.3937"/>
<text text-anchor="middle" x="423" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge14" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M451.6166,-2750.2272C453.8288,-2744.1466 455.817,-2738.0455 457.5,-2732 468.0223,-2694.2027 462.9432,-2683.2038 464.5,-2644 469.7905,-2510.7717 470.5703,-2477.1951 464.5,-2344 463.027,-2311.6792 460.7147,-2277.565 458.0232,-2244.1616"/>
<polygon fill="#000000" stroke="#000000" points="461.481,-2243.5015 457.1763,-2233.8206 454.5044,-2244.073 461.481,-2243.5015"/>
<text text-anchor="middle" x="501" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- principal_investigator -->
<g id="node27" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M1965,-403.5C1965,-403.5 2292,-403.5 2292,-403.5 2298,-403.5 2304,-409.5 2304,-415.5 2304,-415.5 2304,-460.5 2304,-460.5 2304,-466.5 2298,-472.5 2292,-472.5 2292,-472.5 1965,-472.5 1965,-472.5 1959,-472.5 1953,-466.5 1953,-460.5 1953,-460.5 1953,-415.5 1953,-415.5 1953,-409.5 1959,-403.5 1965,-403.5"/>
<text text-anchor="middle" x="2040" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="2127,-403.5 2127,-472.5 "/>
<text text-anchor="middle" x="2137.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2148,-403.5 2148,-472.5 "/>
<text text-anchor="middle" x="2215.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="2148,-449.5 2283,-449.5 "/>
<text text-anchor="middle" x="2215.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="2148,-426.5 2283,-426.5 "/>
<text text-anchor="middle" x="2215.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="2283,-403.5 2283,-472.5 "/>
<text text-anchor="middle" x="2293.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge24" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1973.761,-403.4988C1847.5746,-375.3638 1669.8771,-335.7436 1541.7117,-307.1674"/>
<polygon fill="#000000" stroke="#000000" points="1542.3195,-303.717 1531.7974,-304.9568 1540.7961,-310.5492 1542.3195,-303.717"/>
<text text-anchor="middle" x="1916" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- prior_therapy -->
<g id="node28" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M2837.5,-1727.5C2837.5,-1727.5 3293.5,-1727.5 3293.5,-1727.5 3299.5,-1727.5 3305.5,-1733.5 3305.5,-1739.5 3305.5,-1739.5 3305.5,-2313.5 3305.5,-2313.5 3305.5,-2319.5 3299.5,-2325.5 3293.5,-2325.5 3293.5,-2325.5 2837.5,-2325.5 2837.5,-2325.5 2831.5,-2325.5 2825.5,-2319.5 2825.5,-2313.5 2825.5,-2313.5 2825.5,-1739.5 2825.5,-1739.5 2825.5,-1733.5 2831.5,-1727.5 2837.5,-1727.5"/>
<text text-anchor="middle" x="2883" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2940.5,-1727.5 2940.5,-2325.5 "/>
<text text-anchor="middle" x="2951" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2961.5,-1727.5 2961.5,-2325.5 "/>
<text text-anchor="middle" x="3123" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2302.5 3284.5,-2302.5 "/>
<text text-anchor="middle" x="3123" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2279.5 3284.5,-2279.5 "/>
<text text-anchor="middle" x="3123" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2256.5 3284.5,-2256.5 "/>
<text text-anchor="middle" x="3123" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2233.5 3284.5,-2233.5 "/>
<text text-anchor="middle" x="3123" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2210.5 3284.5,-2210.5 "/>
<text text-anchor="middle" x="3123" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2187.5 3284.5,-2187.5 "/>
<text text-anchor="middle" x="3123" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2164.5 3284.5,-2164.5 "/>
<text text-anchor="middle" x="3123" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2141.5 3284.5,-2141.5 "/>
<text text-anchor="middle" x="3123" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2118.5 3284.5,-2118.5 "/>
<text text-anchor="middle" x="3123" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2095.5 3284.5,-2095.5 "/>
<text text-anchor="middle" x="3123" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2072.5 3284.5,-2072.5 "/>
<text text-anchor="middle" x="3123" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2049.5 3284.5,-2049.5 "/>
<text text-anchor="middle" x="3123" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2026.5 3284.5,-2026.5 "/>
<text text-anchor="middle" x="3123" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="2961.5,-2003.5 3284.5,-2003.5 "/>
<text text-anchor="middle" x="3123" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2961.5,-1980.5 3284.5,-1980.5 "/>
<text text-anchor="middle" x="3123" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="2961.5,-1957.5 3284.5,-1957.5 "/>
<text text-anchor="middle" x="3123" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="2961.5,-1934.5 3284.5,-1934.5 "/>
<text text-anchor="middle" x="3123" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2961.5,-1911.5 3284.5,-1911.5 "/>
<text text-anchor="middle" x="3123" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="2961.5,-1888.5 3284.5,-1888.5 "/>
<text text-anchor="middle" x="3123" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="2961.5,-1865.5 3284.5,-1865.5 "/>
<text text-anchor="middle" x="3123" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="2961.5,-1842.5 3284.5,-1842.5 "/>
<text text-anchor="middle" x="3123" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="2961.5,-1819.5 3284.5,-1819.5 "/>
<text text-anchor="middle" x="3123" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2961.5,-1796.5 3284.5,-1796.5 "/>
<text text-anchor="middle" x="3123" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="2961.5,-1773.5 3284.5,-1773.5 "/>
<text text-anchor="middle" x="3123" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="2961.5,-1750.5 3284.5,-1750.5 "/>
<text text-anchor="middle" x="3123" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="3284.5,-1727.5 3284.5,-2325.5 "/>
<text text-anchor="middle" x="3295" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge4" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2825.275,-1732.1269C2822.3703,-1730.3702 2819.4452,-1728.6604 2816.5,-1727 2677.7984,-1648.8034 2242.247,-1604.8054 1984.4002,-1584.9844"/>
<polygon fill="#000000" stroke="#000000" points="1984.3996,-1581.4742 1974.1622,-1584.2029 1983.8668,-1588.4539 1984.3996,-1581.4742"/>
<text text-anchor="middle" x="2823.5" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge37" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M3305.7384,-2064.6912C3316.9387,-2055.0507 3323.5,-2042.3203 3323.5,-2026.5 3323.5,-2014.3876 3319.6539,-2004.0864 3312.8244,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="3315.219,-1993.0385 3305.7384,-1988.3088 3310.2002,-1997.9183 3315.219,-1993.0385"/>
<text text-anchor="middle" x="3339.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
</g>
</svg>
</div>
