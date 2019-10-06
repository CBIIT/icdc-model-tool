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
<svg width="3288pt" height="2918pt"
 viewBox="0.00 0.00 3288.47 2918.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2914)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2914 3284.4712,-2914 3284.4712,4 -4,4"/>
<!-- study_arm -->
<g id="node1" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M412.4712,-415C412.4712,-415 781.4712,-415 781.4712,-415 787.4712,-415 793.4712,-421 793.4712,-427 793.4712,-427 793.4712,-449 793.4712,-449 793.4712,-455 787.4712,-461 781.4712,-461 781.4712,-461 412.4712,-461 412.4712,-461 406.4712,-461 400.4712,-455 400.4712,-449 400.4712,-449 400.4712,-427 400.4712,-427 400.4712,-421 406.4712,-415 412.4712,-415"/>
<text text-anchor="middle" x="446.4712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="492.4712,-415 492.4712,-461 "/>
<text text-anchor="middle" x="502.9712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="513.4712,-415 513.4712,-461 "/>
<text text-anchor="middle" x="642.9712" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="513.4712,-438 772.4712,-438 "/>
<text text-anchor="middle" x="642.9712" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="772.4712,-415 772.4712,-461 "/>
<text text-anchor="middle" x="782.9712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node24" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M456.9712,-190.5C456.9712,-190.5 736.9712,-190.5 736.9712,-190.5 742.9712,-190.5 748.9712,-196.5 748.9712,-202.5 748.9712,-202.5 748.9712,-339.5 748.9712,-339.5 748.9712,-345.5 742.9712,-351.5 736.9712,-351.5 736.9712,-351.5 456.9712,-351.5 456.9712,-351.5 450.9712,-351.5 444.9712,-345.5 444.9712,-339.5 444.9712,-339.5 444.9712,-202.5 444.9712,-202.5 444.9712,-196.5 450.9712,-190.5 456.9712,-190.5"/>
<text text-anchor="middle" x="472.9712" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="500.9712,-190.5 500.9712,-351.5 "/>
<text text-anchor="middle" x="511.4712" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="521.9712,-190.5 521.9712,-351.5 "/>
<text text-anchor="middle" x="624.9712" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="521.9712,-328.5 727.9712,-328.5 "/>
<text text-anchor="middle" x="624.9712" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="521.9712,-305.5 727.9712,-305.5 "/>
<text text-anchor="middle" x="624.9712" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="521.9712,-282.5 727.9712,-282.5 "/>
<text text-anchor="middle" x="624.9712" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="521.9712,-259.5 727.9712,-259.5 "/>
<text text-anchor="middle" x="624.9712" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="521.9712,-236.5 727.9712,-236.5 "/>
<text text-anchor="middle" x="624.9712" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="521.9712,-213.5 727.9712,-213.5 "/>
<text text-anchor="middle" x="624.9712" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="727.9712,-190.5 727.9712,-351.5 "/>
<text text-anchor="middle" x="738.4712" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge24" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M596.9712,-414.7794C596.9712,-400.5955 596.9712,-381.4427 596.9712,-361.748"/>
<polygon fill="#000000" stroke="#000000" points="600.4713,-361.7407 596.9712,-351.7407 593.4713,-361.7408 600.4713,-361.7407"/>
<text text-anchor="middle" x="637.4712" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- image -->
<g id="node2" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M3131.9712,-2788C3131.9712,-2788 3167.9712,-2788 3167.9712,-2788 3173.9712,-2788 3179.9712,-2794 3179.9712,-2800 3179.9712,-2800 3179.9712,-2812 3179.9712,-2812 3179.9712,-2818 3173.9712,-2824 3167.9712,-2824 3167.9712,-2824 3131.9712,-2824 3131.9712,-2824 3125.9712,-2824 3119.9712,-2818 3119.9712,-2812 3119.9712,-2812 3119.9712,-2800 3119.9712,-2800 3119.9712,-2794 3125.9712,-2788 3131.9712,-2788"/>
<text text-anchor="middle" x="3149.9712" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node8" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M3116.9712,-2333.5C3116.9712,-2333.5 3148.9712,-2333.5 3148.9712,-2333.5 3154.9712,-2333.5 3160.9712,-2339.5 3160.9712,-2345.5 3160.9712,-2345.5 3160.9712,-2357.5 3160.9712,-2357.5 3160.9712,-2363.5 3154.9712,-2369.5 3148.9712,-2369.5 3148.9712,-2369.5 3116.9712,-2369.5 3116.9712,-2369.5 3110.9712,-2369.5 3104.9712,-2363.5 3104.9712,-2357.5 3104.9712,-2357.5 3104.9712,-2345.5 3104.9712,-2345.5 3104.9712,-2339.5 3110.9712,-2333.5 3116.9712,-2333.5"/>
<text text-anchor="middle" x="3132.9712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge38" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M3149.2943,-2787.9026C3146.6794,-2717.9925 3137.2251,-2465.2277 3134.0327,-2379.878"/>
<polygon fill="#000000" stroke="#000000" points="3137.5215,-2379.5113 3133.6501,-2369.6491 3130.5264,-2379.773 3137.5215,-2379.5113"/>
<text text-anchor="middle" x="3174.4712" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- demographic -->
<g id="node3" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M953.9712,-1428C953.9712,-1428 1289.9712,-1428 1289.9712,-1428 1295.9712,-1428 1301.9712,-1434 1301.9712,-1440 1301.9712,-1440 1301.9712,-1577 1301.9712,-1577 1301.9712,-1583 1295.9712,-1589 1289.9712,-1589 1289.9712,-1589 953.9712,-1589 953.9712,-1589 947.9712,-1589 941.9712,-1583 941.9712,-1577 941.9712,-1577 941.9712,-1440 941.9712,-1440 941.9712,-1434 947.9712,-1428 953.9712,-1428"/>
<text text-anchor="middle" x="996.9712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="1051.9712,-1428 1051.9712,-1589 "/>
<text text-anchor="middle" x="1062.4712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1072.9712,-1428 1072.9712,-1589 "/>
<text text-anchor="middle" x="1176.9712" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1072.9712,-1566 1280.9712,-1566 "/>
<text text-anchor="middle" x="1176.9712" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1072.9712,-1543 1280.9712,-1543 "/>
<text text-anchor="middle" x="1176.9712" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1072.9712,-1520 1280.9712,-1520 "/>
<text text-anchor="middle" x="1176.9712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1072.9712,-1497 1280.9712,-1497 "/>
<text text-anchor="middle" x="1176.9712" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1072.9712,-1474 1280.9712,-1474 "/>
<text text-anchor="middle" x="1176.9712" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1072.9712,-1451 1280.9712,-1451 "/>
<text text-anchor="middle" x="1176.9712" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="1280.9712,-1428 1280.9712,-1589 "/>
<text text-anchor="middle" x="1291.4712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node12" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1204.4712,-1157.5C1204.4712,-1157.5 1423.4712,-1157.5 1423.4712,-1157.5 1429.4712,-1157.5 1435.4712,-1163.5 1435.4712,-1169.5 1435.4712,-1169.5 1435.4712,-1237.5 1435.4712,-1237.5 1435.4712,-1243.5 1429.4712,-1249.5 1423.4712,-1249.5 1423.4712,-1249.5 1204.4712,-1249.5 1204.4712,-1249.5 1198.4712,-1249.5 1192.4712,-1243.5 1192.4712,-1237.5 1192.4712,-1237.5 1192.4712,-1169.5 1192.4712,-1169.5 1192.4712,-1163.5 1198.4712,-1157.5 1204.4712,-1157.5"/>
<text text-anchor="middle" x="1216.9712" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1241.4712,-1157.5 1241.4712,-1249.5 "/>
<text text-anchor="middle" x="1251.9712" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1262.4712,-1157.5 1262.4712,-1249.5 "/>
<text text-anchor="middle" x="1338.4712" y="-1234.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1262.4712,-1226.5 1414.4712,-1226.5 "/>
<text text-anchor="middle" x="1338.4712" y="-1211.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1262.4712,-1203.5 1414.4712,-1203.5 "/>
<text text-anchor="middle" x="1338.4712" y="-1188.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1262.4712,-1180.5 1414.4712,-1180.5 "/>
<text text-anchor="middle" x="1338.4712" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1414.4712,-1157.5 1414.4712,-1249.5 "/>
<text text-anchor="middle" x="1424.9712" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge16" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1172.6681,-1427.9659C1206.3466,-1374.4661 1249.6771,-1305.634 1279.4251,-1258.378"/>
<polygon fill="#000000" stroke="#000000" points="1282.4508,-1260.1413 1284.8163,-1249.8139 1276.5268,-1256.4121 1282.4508,-1260.1413"/>
<text text-anchor="middle" x="1298.9712" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_site -->
<g id="node4" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M53.4712,-403.5C53.4712,-403.5 370.4712,-403.5 370.4712,-403.5 376.4712,-403.5 382.4712,-409.5 382.4712,-415.5 382.4712,-415.5 382.4712,-460.5 382.4712,-460.5 382.4712,-466.5 376.4712,-472.5 370.4712,-472.5 370.4712,-472.5 53.4712,-472.5 53.4712,-472.5 47.4712,-472.5 41.4712,-466.5 41.4712,-460.5 41.4712,-460.5 41.4712,-415.5 41.4712,-415.5 41.4712,-409.5 47.4712,-403.5 53.4712,-403.5"/>
<text text-anchor="middle" x="86.4712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="131.4712,-403.5 131.4712,-472.5 "/>
<text text-anchor="middle" x="141.9712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="152.4712,-403.5 152.4712,-472.5 "/>
<text text-anchor="middle" x="256.9712" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="152.4712,-449.5 361.4712,-449.5 "/>
<text text-anchor="middle" x="256.9712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="152.4712,-426.5 361.4712,-426.5 "/>
<text text-anchor="middle" x="256.9712" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="361.4712,-403.5 361.4712,-472.5 "/>
<text text-anchor="middle" x="371.9712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge4" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M291.7435,-403.3975C333.4201,-385.3196 385.9813,-362.5203 435.6892,-340.9587"/>
<polygon fill="#000000" stroke="#000000" points="437.153,-344.1389 444.9343,-336.9485 434.3673,-337.717 437.153,-344.1389"/>
<text text-anchor="middle" x="389.4712" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- cohort -->
<g id="node5" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M480.4712,-524.5C480.4712,-524.5 713.4712,-524.5 713.4712,-524.5 719.4712,-524.5 725.4712,-530.5 725.4712,-536.5 725.4712,-536.5 725.4712,-558.5 725.4712,-558.5 725.4712,-564.5 719.4712,-570.5 713.4712,-570.5 713.4712,-570.5 480.4712,-570.5 480.4712,-570.5 474.4712,-570.5 468.4712,-564.5 468.4712,-558.5 468.4712,-558.5 468.4712,-536.5 468.4712,-536.5 468.4712,-530.5 474.4712,-524.5 480.4712,-524.5"/>
<text text-anchor="middle" x="499.9712" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="531.4712,-524.5 531.4712,-570.5 "/>
<text text-anchor="middle" x="541.9712" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="552.4712,-524.5 552.4712,-570.5 "/>
<text text-anchor="middle" x="628.4712" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="552.4712,-547.5 704.4712,-547.5 "/>
<text text-anchor="middle" x="628.4712" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="704.4712,-524.5 704.4712,-570.5 "/>
<text text-anchor="middle" x="714.9712" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge26" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M596.9712,-524.2779C596.9712,-508.8892 596.9712,-488.4597 596.9712,-471.3432"/>
<polygon fill="#000000" stroke="#000000" points="600.4713,-471.1886 596.9712,-461.1887 593.4713,-471.1887 600.4713,-471.1886"/>
<text text-anchor="middle" x="637.4712" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge25" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M691.2838,-524.4927C738.408,-510.8916 788.2829,-492.5388 801.9712,-473 832.2618,-429.7632 802.6301,-387.8075 757.3788,-353.4404"/>
<polygon fill="#000000" stroke="#000000" points="759.1994,-350.4349 749.0686,-347.3335 755.0541,-356.0756 759.1994,-350.4349"/>
<text text-anchor="middle" x="855.4712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- program -->
<g id="node6" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M442.9712,-.5C442.9712,-.5 750.9712,-.5 750.9712,-.5 756.9712,-.5 762.9712,-6.5 762.9712,-12.5 762.9712,-12.5 762.9712,-126.5 762.9712,-126.5 762.9712,-132.5 756.9712,-138.5 750.9712,-138.5 750.9712,-138.5 442.9712,-138.5 442.9712,-138.5 436.9712,-138.5 430.9712,-132.5 430.9712,-126.5 430.9712,-126.5 430.9712,-12.5 430.9712,-12.5 430.9712,-6.5 436.9712,-.5 442.9712,-.5"/>
<text text-anchor="middle" x="469.9712" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="508.9712,-.5 508.9712,-138.5 "/>
<text text-anchor="middle" x="519.4712" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="529.9712,-.5 529.9712,-138.5 "/>
<text text-anchor="middle" x="635.9712" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="529.9712,-115.5 741.9712,-115.5 "/>
<text text-anchor="middle" x="635.9712" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="529.9712,-92.5 741.9712,-92.5 "/>
<text text-anchor="middle" x="635.9712" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="529.9712,-69.5 741.9712,-69.5 "/>
<text text-anchor="middle" x="635.9712" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="529.9712,-46.5 741.9712,-46.5 "/>
<text text-anchor="middle" x="635.9712" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="529.9712,-23.5 741.9712,-23.5 "/>
<text text-anchor="middle" x="635.9712" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="741.9712,-.5 741.9712,-138.5 "/>
<text text-anchor="middle" x="752.4712" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy -->
<g id="node7" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M1478.9712,-2052.5C1478.9712,-2052.5 1934.9712,-2052.5 1934.9712,-2052.5 1940.9712,-2052.5 1946.9712,-2058.5 1946.9712,-2064.5 1946.9712,-2064.5 1946.9712,-2638.5 1946.9712,-2638.5 1946.9712,-2644.5 1940.9712,-2650.5 1934.9712,-2650.5 1934.9712,-2650.5 1478.9712,-2650.5 1478.9712,-2650.5 1472.9712,-2650.5 1466.9712,-2644.5 1466.9712,-2638.5 1466.9712,-2638.5 1466.9712,-2064.5 1466.9712,-2064.5 1466.9712,-2058.5 1472.9712,-2052.5 1478.9712,-2052.5"/>
<text text-anchor="middle" x="1524.4712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="1581.9712,-2052.5 1581.9712,-2650.5 "/>
<text text-anchor="middle" x="1592.4712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2052.5 1602.9712,-2650.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2635.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2627.5 1925.9712,-2627.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2612.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2604.5 1925.9712,-2604.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2589.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2581.5 1925.9712,-2581.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2566.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2558.5 1925.9712,-2558.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2543.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2535.5 1925.9712,-2535.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2520.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2512.5 1925.9712,-2512.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2497.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2489.5 1925.9712,-2489.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2474.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2466.5 1925.9712,-2466.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2451.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2443.5 1925.9712,-2443.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2428.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2420.5 1925.9712,-2420.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2405.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2397.5 1925.9712,-2397.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2382.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2374.5 1925.9712,-2374.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2359.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2351.5 1925.9712,-2351.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2336.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2328.5 1925.9712,-2328.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2313.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2305.5 1925.9712,-2305.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2290.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2282.5 1925.9712,-2282.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2267.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2259.5 1925.9712,-2259.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2244.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2236.5 1925.9712,-2236.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2221.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2213.5 1925.9712,-2213.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2198.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2190.5 1925.9712,-2190.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2175.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2167.5 1925.9712,-2167.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2152.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2144.5 1925.9712,-2144.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2129.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2121.5 1925.9712,-2121.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2106.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2098.5 1925.9712,-2098.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2083.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="1602.9712,-2075.5 1925.9712,-2075.5 "/>
<text text-anchor="middle" x="1764.4712" y="-2060.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="1925.9712,-2052.5 1925.9712,-2650.5 "/>
<text text-anchor="middle" x="1936.4712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge10" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M1947.2096,-2389.6912C1958.41,-2380.0507 1964.9712,-2367.3203 1964.9712,-2351.5 1964.9712,-2339.3876 1961.1251,-2329.0864 1954.2956,-2320.5965"/>
<polygon fill="#000000" stroke="#000000" points="1956.6902,-2318.0385 1947.2096,-2313.3088 1951.6715,-2322.9183 1956.6902,-2318.0385"/>
<text text-anchor="middle" x="1980.9712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node21" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M1332.4712,-1405C1332.4712,-1405 1681.4712,-1405 1681.4712,-1405 1687.4712,-1405 1693.4712,-1411 1693.4712,-1417 1693.4712,-1417 1693.4712,-1600 1693.4712,-1600 1693.4712,-1606 1687.4712,-1612 1681.4712,-1612 1681.4712,-1612 1332.4712,-1612 1332.4712,-1612 1326.4712,-1612 1320.4712,-1606 1320.4712,-1600 1320.4712,-1600 1320.4712,-1417 1320.4712,-1417 1320.4712,-1411 1326.4712,-1405 1332.4712,-1405"/>
<text text-anchor="middle" x="1367.9712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="1415.4712,-1405 1415.4712,-1612 "/>
<text text-anchor="middle" x="1425.9712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1436.4712,-1405 1436.4712,-1612 "/>
<text text-anchor="middle" x="1554.4712" y="-1596.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="1436.4712,-1589 1672.4712,-1589 "/>
<text text-anchor="middle" x="1554.4712" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="1436.4712,-1566 1672.4712,-1566 "/>
<text text-anchor="middle" x="1554.4712" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1436.4712,-1543 1672.4712,-1543 "/>
<text text-anchor="middle" x="1554.4712" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="1436.4712,-1520 1672.4712,-1520 "/>
<text text-anchor="middle" x="1554.4712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="1436.4712,-1497 1672.4712,-1497 "/>
<text text-anchor="middle" x="1554.4712" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1436.4712,-1474 1672.4712,-1474 "/>
<text text-anchor="middle" x="1554.4712" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="1436.4712,-1451 1672.4712,-1451 "/>
<text text-anchor="middle" x="1554.4712" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="1436.4712,-1428 1672.4712,-1428 "/>
<text text-anchor="middle" x="1554.4712" y="-1412.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="1672.4712,-1405 1672.4712,-1612 "/>
<text text-anchor="middle" x="1682.9712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge41" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1635.966,-2052.213C1600.5922,-1903.1122 1559.9197,-1731.6776 1533.8571,-1621.8238"/>
<polygon fill="#000000" stroke="#000000" points="1537.2517,-1620.9699 1531.5378,-1612.0479 1530.4408,-1622.5858 1537.2517,-1620.9699"/>
<text text-anchor="middle" x="1679.9712" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- sample -->
<g id="node15" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M2795.4712,-1301.5C2795.4712,-1301.5 3218.4712,-1301.5 3218.4712,-1301.5 3224.4712,-1301.5 3230.4712,-1307.5 3230.4712,-1313.5 3230.4712,-1313.5 3230.4712,-1703.5 3230.4712,-1703.5 3230.4712,-1709.5 3224.4712,-1715.5 3218.4712,-1715.5 3218.4712,-1715.5 2795.4712,-1715.5 2795.4712,-1715.5 2789.4712,-1715.5 2783.4712,-1709.5 2783.4712,-1703.5 2783.4712,-1703.5 2783.4712,-1313.5 2783.4712,-1313.5 2783.4712,-1307.5 2789.4712,-1301.5 2795.4712,-1301.5"/>
<text text-anchor="middle" x="2817.4712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="2851.4712,-1301.5 2851.4712,-1715.5 "/>
<text text-anchor="middle" x="2861.9712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1301.5 2872.4712,-1715.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1700.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1692.5 3209.4712,-1692.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1677.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1669.5 3209.4712,-1669.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1654.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1646.5 3209.4712,-1646.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1631.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1623.5 3209.4712,-1623.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1608.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1600.5 3209.4712,-1600.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1585.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1577.5 3209.4712,-1577.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1562.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1554.5 3209.4712,-1554.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1539.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1531.5 3209.4712,-1531.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1508.5 3209.4712,-1508.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1493.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1485.5 3209.4712,-1485.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1462.5 3209.4712,-1462.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1439.5 3209.4712,-1439.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1416.5 3209.4712,-1416.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1393.5 3209.4712,-1393.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1370.5 3209.4712,-1370.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1347.5 3209.4712,-1347.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="2872.4712,-1324.5 3209.4712,-1324.5 "/>
<text text-anchor="middle" x="3040.9712" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="3209.4712,-1301.5 3209.4712,-1715.5 "/>
<text text-anchor="middle" x="3219.9712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge28" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M3130.5033,-2333.2549C3124.157,-2286.4824 3106.6657,-2158.4855 3090.9712,-2052 3075.1227,-1944.4692 3056.7586,-1825.0978 3041.2503,-1725.6806"/>
<polygon fill="#000000" stroke="#000000" points="3044.6632,-1724.8501 3039.6628,-1715.5095 3037.7469,-1725.9296 3044.6632,-1724.8501"/>
<text text-anchor="middle" x="3122.4712" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- prior_surgery -->
<g id="node9" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M1040.9712,-2271C1040.9712,-2271 1386.9712,-2271 1386.9712,-2271 1392.9712,-2271 1398.9712,-2277 1398.9712,-2283 1398.9712,-2283 1398.9712,-2420 1398.9712,-2420 1398.9712,-2426 1392.9712,-2432 1386.9712,-2432 1386.9712,-2432 1040.9712,-2432 1040.9712,-2432 1034.9712,-2432 1028.9712,-2426 1028.9712,-2420 1028.9712,-2420 1028.9712,-2283 1028.9712,-2283 1028.9712,-2277 1034.9712,-2271 1040.9712,-2271"/>
<text text-anchor="middle" x="1086.4712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="1143.9712,-2271 1143.9712,-2432 "/>
<text text-anchor="middle" x="1154.4712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1164.9712,-2271 1164.9712,-2432 "/>
<text text-anchor="middle" x="1271.4712" y="-2416.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="1164.9712,-2409 1377.9712,-2409 "/>
<text text-anchor="middle" x="1271.4712" y="-2393.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1164.9712,-2386 1377.9712,-2386 "/>
<text text-anchor="middle" x="1271.4712" y="-2370.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="1164.9712,-2363 1377.9712,-2363 "/>
<text text-anchor="middle" x="1271.4712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="1164.9712,-2340 1377.9712,-2340 "/>
<text text-anchor="middle" x="1271.4712" y="-2324.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1164.9712,-2317 1377.9712,-2317 "/>
<text text-anchor="middle" x="1271.4712" y="-2301.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1164.9712,-2294 1377.9712,-2294 "/>
<text text-anchor="middle" x="1271.4712" y="-2278.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="1377.9712,-2271 1377.9712,-2432 "/>
<text text-anchor="middle" x="1388.4712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge9" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M1399.0842,-2393.5585C1410.262,-2383.5547 1416.9712,-2369.5352 1416.9712,-2351.5 1416.9712,-2337.5509 1412.9577,-2326.004 1405.9674,-2316.8593"/>
<polygon fill="#000000" stroke="#000000" points="1408.4518,-2314.3911 1399.0842,-2309.4415 1403.3206,-2319.1525 1408.4518,-2314.3911"/>
<text text-anchor="middle" x="1432.9712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge39" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1242.0653,-2270.6696C1294.5352,-2119.7067 1407.5305,-1794.6042 1467.5823,-1621.8271"/>
<polygon fill="#000000" stroke="#000000" points="1470.9536,-1622.7882 1470.9307,-1612.1933 1464.3416,-1620.49 1470.9536,-1622.7882"/>
<text text-anchor="middle" x="1477.9712" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- adverse_event -->
<g id="node10" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1116.4712,-668.5C1116.4712,-668.5 1511.4712,-668.5 1511.4712,-668.5 1517.4712,-668.5 1523.4712,-674.5 1523.4712,-680.5 1523.4712,-680.5 1523.4712,-1047.5 1523.4712,-1047.5 1523.4712,-1053.5 1517.4712,-1059.5 1511.4712,-1059.5 1511.4712,-1059.5 1116.4712,-1059.5 1116.4712,-1059.5 1110.4712,-1059.5 1104.4712,-1053.5 1104.4712,-1047.5 1104.4712,-1047.5 1104.4712,-680.5 1104.4712,-680.5 1104.4712,-674.5 1110.4712,-668.5 1116.4712,-668.5"/>
<text text-anchor="middle" x="1164.4712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1224.4712,-668.5 1224.4712,-1059.5 "/>
<text text-anchor="middle" x="1234.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1245.4712,-668.5 1245.4712,-1059.5 "/>
<text text-anchor="middle" x="1373.9712" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-1036.5 1502.4712,-1036.5 "/>
<text text-anchor="middle" x="1373.9712" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-1013.5 1502.4712,-1013.5 "/>
<text text-anchor="middle" x="1373.9712" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-990.5 1502.4712,-990.5 "/>
<text text-anchor="middle" x="1373.9712" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-967.5 1502.4712,-967.5 "/>
<text text-anchor="middle" x="1373.9712" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-944.5 1502.4712,-944.5 "/>
<text text-anchor="middle" x="1373.9712" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-921.5 1502.4712,-921.5 "/>
<text text-anchor="middle" x="1373.9712" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-898.5 1502.4712,-898.5 "/>
<text text-anchor="middle" x="1373.9712" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-875.5 1502.4712,-875.5 "/>
<text text-anchor="middle" x="1373.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-852.5 1502.4712,-852.5 "/>
<text text-anchor="middle" x="1373.9712" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-829.5 1502.4712,-829.5 "/>
<text text-anchor="middle" x="1373.9712" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-806.5 1502.4712,-806.5 "/>
<text text-anchor="middle" x="1373.9712" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-783.5 1502.4712,-783.5 "/>
<text text-anchor="middle" x="1373.9712" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-760.5 1502.4712,-760.5 "/>
<text text-anchor="middle" x="1373.9712" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-737.5 1502.4712,-737.5 "/>
<text text-anchor="middle" x="1373.9712" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-714.5 1502.4712,-714.5 "/>
<text text-anchor="middle" x="1373.9712" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1245.4712,-691.5 1502.4712,-691.5 "/>
<text text-anchor="middle" x="1373.9712" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1502.4712,-668.5 1502.4712,-1059.5 "/>
<text text-anchor="middle" x="1512.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge8" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1523.6758,-896.9793C1534.8473,-888.8906 1541.4712,-877.8975 1541.4712,-864 1541.4712,-853.7941 1537.8989,-845.1544 1531.5766,-838.0812"/>
<polygon fill="#000000" stroke="#000000" points="1533.4645,-835.0744 1523.6758,-831.0207 1528.8001,-840.2939 1533.4645,-835.0744"/>
<text text-anchor="middle" x="1557.4712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- visit -->
<g id="node13" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M2429.4712,-524.5C2429.4712,-524.5 2604.4712,-524.5 2604.4712,-524.5 2610.4712,-524.5 2616.4712,-530.5 2616.4712,-536.5 2616.4712,-536.5 2616.4712,-558.5 2616.4712,-558.5 2616.4712,-564.5 2610.4712,-570.5 2604.4712,-570.5 2604.4712,-570.5 2429.4712,-570.5 2429.4712,-570.5 2423.4712,-570.5 2417.4712,-564.5 2417.4712,-558.5 2417.4712,-558.5 2417.4712,-536.5 2417.4712,-536.5 2417.4712,-530.5 2423.4712,-524.5 2429.4712,-524.5"/>
<text text-anchor="middle" x="2440.9712" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="2464.4712,-524.5 2464.4712,-570.5 "/>
<text text-anchor="middle" x="2474.9712" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2485.4712,-524.5 2485.4712,-570.5 "/>
<text text-anchor="middle" x="2540.4712" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="2485.4712,-547.5 2595.4712,-547.5 "/>
<text text-anchor="middle" x="2540.4712" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="2595.4712,-524.5 2595.4712,-570.5 "/>
<text text-anchor="middle" x="2605.9712" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;visit -->
<g id="edge36" class="edge">
<title>adverse_event&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1503.0068,-668.4692C1528.3158,-650.2468 1555.1842,-634.1069 1582.9712,-622 1656.9019,-589.7881 2176.7264,-562.7776 2407.2898,-552.2385"/>
<polygon fill="#000000" stroke="#000000" points="2407.5479,-555.7305 2417.3784,-551.7794 2407.2297,-548.7377 2407.5479,-555.7305"/>
<text text-anchor="middle" x="1830.9712" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent -->
<g id="node20" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M1200.9712,-524.5C1200.9712,-524.5 1426.9712,-524.5 1426.9712,-524.5 1432.9712,-524.5 1438.9712,-530.5 1438.9712,-536.5 1438.9712,-536.5 1438.9712,-558.5 1438.9712,-558.5 1438.9712,-564.5 1432.9712,-570.5 1426.9712,-570.5 1426.9712,-570.5 1200.9712,-570.5 1200.9712,-570.5 1194.9712,-570.5 1188.9712,-564.5 1188.9712,-558.5 1188.9712,-558.5 1188.9712,-536.5 1188.9712,-536.5 1188.9712,-530.5 1194.9712,-524.5 1200.9712,-524.5"/>
<text text-anchor="middle" x="1217.4712" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1245.9712,-524.5 1245.9712,-570.5 "/>
<text text-anchor="middle" x="1256.4712" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1266.9712,-524.5 1266.9712,-570.5 "/>
<text text-anchor="middle" x="1342.4712" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1266.9712,-547.5 1417.9712,-547.5 "/>
<text text-anchor="middle" x="1342.4712" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1417.9712,-524.5 1417.9712,-570.5 "/>
<text text-anchor="middle" x="1428.4712" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge12" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1313.9712,-668.058C1313.9712,-634.3679 1313.9712,-603.0978 1313.9712,-580.8505"/>
<polygon fill="#000000" stroke="#000000" points="1317.4713,-580.6828 1313.9712,-570.6828 1310.4713,-580.6828 1317.4713,-580.6828"/>
<text text-anchor="middle" x="1344.9712" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- off_study -->
<g id="node11" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M170.4712,-760.5C170.4712,-760.5 585.4712,-760.5 585.4712,-760.5 591.4712,-760.5 597.4712,-766.5 597.4712,-772.5 597.4712,-772.5 597.4712,-955.5 597.4712,-955.5 597.4712,-961.5 591.4712,-967.5 585.4712,-967.5 585.4712,-967.5 170.4712,-967.5 170.4712,-967.5 164.4712,-967.5 158.4712,-961.5 158.4712,-955.5 158.4712,-955.5 158.4712,-772.5 158.4712,-772.5 158.4712,-766.5 164.4712,-760.5 170.4712,-760.5"/>
<text text-anchor="middle" x="199.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="241.4712,-760.5 241.4712,-967.5 "/>
<text text-anchor="middle" x="251.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="262.4712,-760.5 262.4712,-967.5 "/>
<text text-anchor="middle" x="419.4712" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="262.4712,-944.5 576.4712,-944.5 "/>
<text text-anchor="middle" x="419.4712" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="262.4712,-921.5 576.4712,-921.5 "/>
<text text-anchor="middle" x="419.4712" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="262.4712,-898.5 576.4712,-898.5 "/>
<text text-anchor="middle" x="419.4712" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="262.4712,-875.5 576.4712,-875.5 "/>
<text text-anchor="middle" x="419.4712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="262.4712,-852.5 576.4712,-852.5 "/>
<text text-anchor="middle" x="419.4712" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="262.4712,-829.5 576.4712,-829.5 "/>
<text text-anchor="middle" x="419.4712" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="262.4712,-806.5 576.4712,-806.5 "/>
<text text-anchor="middle" x="419.4712" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="262.4712,-783.5 576.4712,-783.5 "/>
<text text-anchor="middle" x="419.4712" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="576.4712,-760.5 576.4712,-967.5 "/>
<text text-anchor="middle" x="586.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge23" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1192.3384,-1198.404C886.2767,-1184.9948 105.8262,-1146.9328 67.9712,-1106 31.458,-1066.518 32.6956,-662.5916 67.9712,-622 93.3392,-592.809 310.2094,-570.0309 458.273,-557.7007"/>
<polygon fill="#000000" stroke="#000000" points="458.6889,-561.1784 468.367,-556.8674 458.1129,-554.2021 458.6889,-561.1784"/>
<text text-anchor="middle" x="108.4712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge21" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1313.9712,-1157.3602C1313.9712,-1133.5362 1313.9712,-1102.6174 1313.9712,-1069.8149"/>
<polygon fill="#000000" stroke="#000000" points="1317.4713,-1069.58 1313.9712,-1059.5801 1310.4713,-1069.5801 1317.4713,-1069.58"/>
<text text-anchor="middle" x="1382.9712" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge2" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1192.434,-1196.4547C1017.9629,-1184.7132 706.5524,-1157.214 606.9712,-1106 547.769,-1075.5527 495.513,-1023.5686 455.9236,-975.567"/>
<polygon fill="#000000" stroke="#000000" points="458.4583,-973.1368 449.4305,-967.5916 453.0299,-977.5563 458.4583,-973.1368"/>
<text text-anchor="middle" x="758.4712" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge22" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1192.2957,-1201.3927C932.1962,-1196.1516 329.4636,-1179.8783 128.9712,-1139 86.8168,-1130.4052 64.4478,-1139.9095 37.9712,-1106 -28.5733,-1020.774 12.9712,-972.128 12.9712,-864 12.9712,-864 12.9712,-864 12.9712,-438 12.9712,-349.878 261.8825,-305.6392 434.6998,-285.5441"/>
<polygon fill="#000000" stroke="#000000" points="435.1394,-289.0167 444.6759,-284.4009 434.3424,-282.0622 435.1394,-289.0167"/>
<text text-anchor="middle" x="53.4712" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_treatment -->
<g id="node27" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M627.4712,-772C627.4712,-772 1074.4712,-772 1074.4712,-772 1080.4712,-772 1086.4712,-778 1086.4712,-784 1086.4712,-784 1086.4712,-944 1086.4712,-944 1086.4712,-950 1080.4712,-956 1074.4712,-956 1074.4712,-956 627.4712,-956 627.4712,-956 621.4712,-956 615.4712,-950 615.4712,-944 615.4712,-944 615.4712,-784 615.4712,-784 615.4712,-778 621.4712,-772 627.4712,-772"/>
<text text-anchor="middle" x="672.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="730.4712,-772 730.4712,-956 "/>
<text text-anchor="middle" x="740.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="751.4712,-772 751.4712,-956 "/>
<text text-anchor="middle" x="908.4712" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="751.4712,-933 1065.4712,-933 "/>
<text text-anchor="middle" x="908.4712" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="751.4712,-910 1065.4712,-910 "/>
<text text-anchor="middle" x="908.4712" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="751.4712,-887 1065.4712,-887 "/>
<text text-anchor="middle" x="908.4712" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="751.4712,-864 1065.4712,-864 "/>
<text text-anchor="middle" x="908.4712" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="751.4712,-841 1065.4712,-841 "/>
<text text-anchor="middle" x="908.4712" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="751.4712,-818 1065.4712,-818 "/>
<text text-anchor="middle" x="908.4712" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="751.4712,-795 1065.4712,-795 "/>
<text text-anchor="middle" x="908.4712" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1065.4712,-772 1065.4712,-956 "/>
<text text-anchor="middle" x="1075.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge1" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1209.0231,-1157.3434C1195.2033,-1151.2046 1181.2378,-1144.9703 1167.9712,-1139 1135.8711,-1124.5539 1124.9341,-1126.0065 1095.9712,-1106 1037.7215,-1065.7632 980.9393,-1010.9717 936.7301,-963.6994"/>
<polygon fill="#000000" stroke="#000000" points="939.1151,-961.1243 929.7445,-956.1805 933.9868,-965.8889 939.1151,-961.1243"/>
<text text-anchor="middle" x="1238.9712" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge7" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2616.834,-555.0146C2627.5673,-553.5674 2634.4712,-551.0625 2634.4712,-547.5 2634.4712,-545.2178 2631.6379,-543.3696 2626.7795,-541.9555"/>
<polygon fill="#000000" stroke="#000000" points="2627.3235,-538.4953 2616.834,-539.9854 2625.9632,-545.3619 2627.3235,-538.4953"/>
<text text-anchor="middle" x="2650.4712" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cycle -->
<g id="node23" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M2138.9712,-403.5C2138.9712,-403.5 2366.9712,-403.5 2366.9712,-403.5 2372.9712,-403.5 2378.9712,-409.5 2378.9712,-415.5 2378.9712,-415.5 2378.9712,-460.5 2378.9712,-460.5 2378.9712,-466.5 2372.9712,-472.5 2366.9712,-472.5 2366.9712,-472.5 2138.9712,-472.5 2138.9712,-472.5 2132.9712,-472.5 2126.9712,-466.5 2126.9712,-460.5 2126.9712,-460.5 2126.9712,-415.5 2126.9712,-415.5 2126.9712,-409.5 2132.9712,-403.5 2138.9712,-403.5"/>
<text text-anchor="middle" x="2153.9712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="2180.9712,-403.5 2180.9712,-472.5 "/>
<text text-anchor="middle" x="2191.4712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2201.9712,-403.5 2201.9712,-472.5 "/>
<text text-anchor="middle" x="2279.9712" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="2201.9712,-449.5 2357.9712,-449.5 "/>
<text text-anchor="middle" x="2279.9712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="2201.9712,-426.5 2357.9712,-426.5 "/>
<text text-anchor="middle" x="2279.9712" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="2357.9712,-403.5 2357.9712,-472.5 "/>
<text text-anchor="middle" x="2368.4712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge20" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M2461.3062,-524.4117C2427.8358,-510.5291 2384.389,-492.5085 2345.838,-476.5186"/>
<polygon fill="#000000" stroke="#000000" points="2346.7294,-473.0992 2336.1514,-472.5009 2344.0475,-479.5651 2346.7294,-473.0992"/>
<text text-anchor="middle" x="2445.4712" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- lab_exam -->
<g id="node14" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M2878.9712,-846C2878.9712,-846 2938.9712,-846 2938.9712,-846 2944.9712,-846 2950.9712,-852 2950.9712,-858 2950.9712,-858 2950.9712,-870 2950.9712,-870 2950.9712,-876 2944.9712,-882 2938.9712,-882 2938.9712,-882 2878.9712,-882 2878.9712,-882 2872.9712,-882 2866.9712,-876 2866.9712,-870 2866.9712,-870 2866.9712,-858 2866.9712,-858 2866.9712,-852 2872.9712,-846 2878.9712,-846"/>
<text text-anchor="middle" x="2908.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge35" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2911.6502,-845.8791C2917.8401,-796.3475 2927.3716,-657.8122 2852.9712,-589 2836.3868,-573.6612 2718.5458,-561.7787 2627.0454,-554.7331"/>
<polygon fill="#000000" stroke="#000000" points="2627.1091,-551.228 2616.8729,-553.9612 2626.5794,-558.2079 2627.1091,-551.228"/>
<text text-anchor="middle" x="2890.9712" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge15" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2783.1903,-1302.6398C2759.9562,-1288.8291 2735.7417,-1276.8968 2710.9712,-1268 2594.0626,-1226.0101 1771.2788,-1209.9351 1445.9218,-1205.1758"/>
<polygon fill="#000000" stroke="#000000" points="1445.55,-1201.6702 1435.5003,-1205.0248 1445.4485,-1208.6694 1445.55,-1201.6702"/>
<text text-anchor="middle" x="2765.9712" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge34" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M3039.3746,-1301.2528C3058.8468,-1114.1998 3062.8896,-836.3016 2959.9712,-622 2950.4321,-602.1371 2943.1348,-597.886 2922.9712,-589 2871.6755,-566.3942 2728.6844,-555.8787 2626.9465,-551.144"/>
<polygon fill="#000000" stroke="#000000" points="2627.0733,-547.6463 2616.9251,-550.69 2626.7565,-554.6391 2627.0733,-547.6463"/>
<text text-anchor="middle" x="3077.9712" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge6" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M3230.5668,-1536.6646C3241.8284,-1529.6694 3248.4712,-1520.2813 3248.4712,-1508.5 3248.4712,-1499.8481 3244.8887,-1492.4869 3238.5253,-1486.4162"/>
<polygon fill="#000000" stroke="#000000" points="3240.6378,-1483.6256 3230.5668,-1480.3354 3236.3879,-1489.1879 3240.6378,-1483.6256"/>
<text text-anchor="middle" x="3264.4712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- physical_exam -->
<g id="node16" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M2192.9712,-2259.5C2192.9712,-2259.5 2508.9712,-2259.5 2508.9712,-2259.5 2514.9712,-2259.5 2520.9712,-2265.5 2520.9712,-2271.5 2520.9712,-2271.5 2520.9712,-2431.5 2520.9712,-2431.5 2520.9712,-2437.5 2514.9712,-2443.5 2508.9712,-2443.5 2508.9712,-2443.5 2192.9712,-2443.5 2192.9712,-2443.5 2186.9712,-2443.5 2180.9712,-2437.5 2180.9712,-2431.5 2180.9712,-2431.5 2180.9712,-2271.5 2180.9712,-2271.5 2180.9712,-2265.5 2186.9712,-2259.5 2192.9712,-2259.5"/>
<text text-anchor="middle" x="2241.9712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="2302.9712,-2259.5 2302.9712,-2443.5 "/>
<text text-anchor="middle" x="2313.4712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2323.9712,-2259.5 2323.9712,-2443.5 "/>
<text text-anchor="middle" x="2411.9712" y="-2428.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="2323.9712,-2420.5 2499.9712,-2420.5 "/>
<text text-anchor="middle" x="2411.9712" y="-2405.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="2323.9712,-2397.5 2499.9712,-2397.5 "/>
<text text-anchor="middle" x="2411.9712" y="-2382.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="2323.9712,-2374.5 2499.9712,-2374.5 "/>
<text text-anchor="middle" x="2411.9712" y="-2359.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="2323.9712,-2351.5 2499.9712,-2351.5 "/>
<text text-anchor="middle" x="2411.9712" y="-2336.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="2323.9712,-2328.5 2499.9712,-2328.5 "/>
<text text-anchor="middle" x="2411.9712" y="-2313.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2323.9712,-2305.5 2499.9712,-2305.5 "/>
<text text-anchor="middle" x="2411.9712" y="-2290.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="2323.9712,-2282.5 2499.9712,-2282.5 "/>
<text text-anchor="middle" x="2411.9712" y="-2267.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="2499.9712,-2259.5 2499.9712,-2443.5 "/>
<text text-anchor="middle" x="2510.4712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge32" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2360.858,-2259.4503C2384.4044,-2069.499 2455.9697,-1624.7882 2636.9712,-1301 2694.9656,-1197.2557 2776.2359,-1216.5144 2819.9712,-1106 2839.7602,-1055.9955 2853.149,-664.3235 2819.9712,-622 2795.943,-591.3482 2703.3109,-571.6255 2626.7249,-560.2249"/>
<polygon fill="#000000" stroke="#000000" points="2626.9136,-556.7156 2616.5139,-558.7394 2625.9058,-563.6427 2626.9136,-556.7156"/>
<text text-anchor="middle" x="2817.9712" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge40" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2272.8734,-2259.4704C2161.6311,-2131.807 1947.2978,-1898.1786 1733.9712,-1734 1721.3455,-1724.2831 1715.4593,-1725.8933 1702.9712,-1716 1667.0404,-1687.5349 1631.4848,-1652.5481 1600.7247,-1619.4694"/>
<polygon fill="#000000" stroke="#000000" points="1603.1846,-1616.9741 1593.8297,-1612.0005 1598.0412,-1621.7223 1603.1846,-1616.9741"/>
<text text-anchor="middle" x="2101.9712" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- agent_administration -->
<g id="node17" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M1603.4712,-622.5C1603.4712,-622.5 2072.4712,-622.5 2072.4712,-622.5 2078.4712,-622.5 2084.4712,-628.5 2084.4712,-634.5 2084.4712,-634.5 2084.4712,-1093.5 2084.4712,-1093.5 2084.4712,-1099.5 2078.4712,-1105.5 2072.4712,-1105.5 2072.4712,-1105.5 1603.4712,-1105.5 1603.4712,-1105.5 1597.4712,-1105.5 1591.4712,-1099.5 1591.4712,-1093.5 1591.4712,-1093.5 1591.4712,-634.5 1591.4712,-634.5 1591.4712,-628.5 1597.4712,-622.5 1603.4712,-622.5"/>
<text text-anchor="middle" x="1676.4712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="1761.4712,-622.5 1761.4712,-1105.5 "/>
<text text-anchor="middle" x="1771.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1782.4712,-622.5 1782.4712,-1105.5 "/>
<text text-anchor="middle" x="1922.9712" y="-1090.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-1082.5 2063.4712,-1082.5 "/>
<text text-anchor="middle" x="1922.9712" y="-1067.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-1059.5 2063.4712,-1059.5 "/>
<text text-anchor="middle" x="1922.9712" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-1036.5 2063.4712,-1036.5 "/>
<text text-anchor="middle" x="1922.9712" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-1013.5 2063.4712,-1013.5 "/>
<text text-anchor="middle" x="1922.9712" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-990.5 2063.4712,-990.5 "/>
<text text-anchor="middle" x="1922.9712" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-967.5 2063.4712,-967.5 "/>
<text text-anchor="middle" x="1922.9712" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-944.5 2063.4712,-944.5 "/>
<text text-anchor="middle" x="1922.9712" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-921.5 2063.4712,-921.5 "/>
<text text-anchor="middle" x="1922.9712" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-898.5 2063.4712,-898.5 "/>
<text text-anchor="middle" x="1922.9712" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-875.5 2063.4712,-875.5 "/>
<text text-anchor="middle" x="1922.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-852.5 2063.4712,-852.5 "/>
<text text-anchor="middle" x="1922.9712" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-829.5 2063.4712,-829.5 "/>
<text text-anchor="middle" x="1922.9712" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-806.5 2063.4712,-806.5 "/>
<text text-anchor="middle" x="1922.9712" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-783.5 2063.4712,-783.5 "/>
<text text-anchor="middle" x="1922.9712" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-760.5 2063.4712,-760.5 "/>
<text text-anchor="middle" x="1922.9712" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-737.5 2063.4712,-737.5 "/>
<text text-anchor="middle" x="1922.9712" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-714.5 2063.4712,-714.5 "/>
<text text-anchor="middle" x="1922.9712" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-691.5 2063.4712,-691.5 "/>
<text text-anchor="middle" x="1922.9712" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-668.5 2063.4712,-668.5 "/>
<text text-anchor="middle" x="1922.9712" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="1782.4712,-645.5 2063.4712,-645.5 "/>
<text text-anchor="middle" x="1922.9712" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="2063.4712,-622.5 2063.4712,-1105.5 "/>
<text text-anchor="middle" x="2073.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge30" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1988.6578,-622.4678C2003.0722,-609.7442 2018.5114,-598.3704 2034.9712,-589 2066.4942,-571.0544 2274.9565,-558.4309 2407.2056,-552.1184"/>
<polygon fill="#000000" stroke="#000000" points="2407.5583,-555.6058 2417.3821,-551.6379 2407.2281,-548.6136 2407.5583,-555.6058"/>
<text text-anchor="middle" x="2062.9712" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge11" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1591.3162,-626.8413C1588.5423,-625.1919 1585.7603,-623.5774 1582.9712,-622 1542.0039,-598.8304 1493.4029,-582.5181 1448.8572,-571.195"/>
<polygon fill="#000000" stroke="#000000" points="1449.6699,-567.7906 1439.1216,-568.7823 1447.9861,-574.585 1449.6699,-567.7906"/>
<text text-anchor="middle" x="1572.9712" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- vital_signs -->
<g id="node18" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M2153.4712,-703C2153.4712,-703 2440.4712,-703 2440.4712,-703 2446.4712,-703 2452.4712,-709 2452.4712,-715 2452.4712,-715 2452.4712,-1013 2452.4712,-1013 2452.4712,-1019 2446.4712,-1025 2440.4712,-1025 2440.4712,-1025 2153.4712,-1025 2153.4712,-1025 2147.4712,-1025 2141.4712,-1019 2141.4712,-1013 2141.4712,-1013 2141.4712,-715 2141.4712,-715 2141.4712,-709 2147.4712,-703 2153.4712,-703"/>
<text text-anchor="middle" x="2187.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="2234.4712,-703 2234.4712,-1025 "/>
<text text-anchor="middle" x="2244.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2255.4712,-703 2255.4712,-1025 "/>
<text text-anchor="middle" x="2343.4712" y="-1009.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="2255.4712,-1002 2431.4712,-1002 "/>
<text text-anchor="middle" x="2343.4712" y="-986.8" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="2255.4712,-979 2431.4712,-979 "/>
<text text-anchor="middle" x="2343.4712" y="-963.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="2255.4712,-956 2431.4712,-956 "/>
<text text-anchor="middle" x="2343.4712" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="2255.4712,-933 2431.4712,-933 "/>
<text text-anchor="middle" x="2343.4712" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="2255.4712,-910 2431.4712,-910 "/>
<text text-anchor="middle" x="2343.4712" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2255.4712,-887 2431.4712,-887 "/>
<text text-anchor="middle" x="2343.4712" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="2255.4712,-864 2431.4712,-864 "/>
<text text-anchor="middle" x="2343.4712" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="2255.4712,-841 2431.4712,-841 "/>
<text text-anchor="middle" x="2343.4712" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="2255.4712,-818 2431.4712,-818 "/>
<text text-anchor="middle" x="2343.4712" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="2255.4712,-795 2431.4712,-795 "/>
<text text-anchor="middle" x="2343.4712" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="2255.4712,-772 2431.4712,-772 "/>
<text text-anchor="middle" x="2343.4712" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="2255.4712,-749 2431.4712,-749 "/>
<text text-anchor="middle" x="2343.4712" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="2255.4712,-726 2431.4712,-726 "/>
<text text-anchor="middle" x="2343.4712" y="-710.8" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="2431.4712,-703 2431.4712,-1025 "/>
<text text-anchor="middle" x="2441.9712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge31" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2391.8106,-702.9172C2416.8751,-664.3725 2445.0554,-624.2129 2473.9712,-589 2477.0205,-585.2866 2480.3738,-581.5586 2483.8214,-577.9428"/>
<polygon fill="#000000" stroke="#000000" points="2486.4214,-580.2912 2490.963,-570.719 2481.4435,-575.3698 2486.4214,-580.2912"/>
<text text-anchor="middle" x="2501.9712" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- principal_investigator -->
<g id="node19" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M941.4712,-403.5C941.4712,-403.5 1268.4712,-403.5 1268.4712,-403.5 1274.4712,-403.5 1280.4712,-409.5 1280.4712,-415.5 1280.4712,-415.5 1280.4712,-460.5 1280.4712,-460.5 1280.4712,-466.5 1274.4712,-472.5 1268.4712,-472.5 1268.4712,-472.5 941.4712,-472.5 941.4712,-472.5 935.4712,-472.5 929.4712,-466.5 929.4712,-460.5 929.4712,-460.5 929.4712,-415.5 929.4712,-415.5 929.4712,-409.5 935.4712,-403.5 941.4712,-403.5"/>
<text text-anchor="middle" x="1016.4712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="1103.4712,-403.5 1103.4712,-472.5 "/>
<text text-anchor="middle" x="1113.9712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1124.4712,-403.5 1124.4712,-472.5 "/>
<text text-anchor="middle" x="1191.9712" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="1124.4712,-449.5 1259.4712,-449.5 "/>
<text text-anchor="middle" x="1191.9712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="1124.4712,-426.5 1259.4712,-426.5 "/>
<text text-anchor="middle" x="1191.9712" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="1259.4712,-403.5 1259.4712,-472.5 "/>
<text text-anchor="middle" x="1269.9712" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge3" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1000.0214,-403.4988C930.3647,-380.5998 837.5649,-350.0928 758.5704,-324.1241"/>
<polygon fill="#000000" stroke="#000000" points="759.6008,-320.7787 749.0079,-320.9806 757.4147,-327.4285 759.6008,-320.7787"/>
<text text-anchor="middle" x="970.4712" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge5" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1188.849,-529.7241C1086.3872,-515.0121 937.6959,-493.3073 807.9712,-473 787.0539,-469.7256 764.9873,-466.1735 743.3209,-462.6299"/>
<polygon fill="#000000" stroke="#000000" points="743.8344,-459.1675 733.3998,-461.0034 742.7018,-466.0752 743.8344,-459.1675"/>
<text text-anchor="middle" x="1064.4712" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge19" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1441.3609,-1404.8153C1410.3092,-1355.7439 1374.4871,-1299.1339 1348.7537,-1258.4672"/>
<polygon fill="#000000" stroke="#000000" points="1351.5628,-1256.3609 1343.258,-1249.7821 1345.6476,-1260.104 1351.5628,-1256.3609"/>
<text text-anchor="middle" x="1386.9712" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- follow_up -->
<g id="node22" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1723.9712,-1405C1723.9712,-1405 2055.9712,-1405 2055.9712,-1405 2061.9712,-1405 2067.9712,-1411 2067.9712,-1417 2067.9712,-1417 2067.9712,-1600 2067.9712,-1600 2067.9712,-1606 2061.9712,-1612 2055.9712,-1612 2055.9712,-1612 1723.9712,-1612 1723.9712,-1612 1717.9712,-1612 1711.9712,-1606 1711.9712,-1600 1711.9712,-1600 1711.9712,-1417 1711.9712,-1417 1711.9712,-1411 1717.9712,-1405 1723.9712,-1405"/>
<text text-anchor="middle" x="1754.4712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="1796.9712,-1405 1796.9712,-1612 "/>
<text text-anchor="middle" x="1807.4712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1817.9712,-1405 1817.9712,-1612 "/>
<text text-anchor="middle" x="1932.4712" y="-1596.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1817.9712,-1589 2046.9712,-1589 "/>
<text text-anchor="middle" x="1932.4712" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="1817.9712,-1566 2046.9712,-1566 "/>
<text text-anchor="middle" x="1932.4712" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="1817.9712,-1543 2046.9712,-1543 "/>
<text text-anchor="middle" x="1932.4712" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="1817.9712,-1520 2046.9712,-1520 "/>
<text text-anchor="middle" x="1932.4712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="1817.9712,-1497 2046.9712,-1497 "/>
<text text-anchor="middle" x="1932.4712" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="1817.9712,-1474 2046.9712,-1474 "/>
<text text-anchor="middle" x="1932.4712" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1817.9712,-1451 2046.9712,-1451 "/>
<text text-anchor="middle" x="1932.4712" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="1817.9712,-1428 2046.9712,-1428 "/>
<text text-anchor="middle" x="1932.4712" y="-1412.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="2046.9712,-1405 2046.9712,-1612 "/>
<text text-anchor="middle" x="2057.4712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge18" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1817.3089,-1404.7466C1786.094,-1367.0545 1746.7113,-1327.3053 1702.9712,-1301 1624.869,-1254.0292 1524.9307,-1229.6013 1445.908,-1216.9436"/>
<polygon fill="#000000" stroke="#000000" points="1446.3063,-1213.4635 1435.8868,-1215.3832 1445.2292,-1220.3801 1446.3063,-1213.4635"/>
<text text-anchor="middle" x="1690.9712" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge14" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2222.7843,-472.516C2194.116,-507.5347 2152.5722,-564.6166 2132.9712,-622 2098.0921,-724.1115 2168.576,-1028.0421 2093.9712,-1106 2049.9906,-1151.9574 1656.3368,-1182.6896 1445.6771,-1195.9966"/>
<polygon fill="#000000" stroke="#000000" points="1445.238,-1192.5172 1435.4767,-1196.6364 1445.6762,-1199.5035 1445.238,-1192.5172"/>
<text text-anchor="middle" x="2171.9712" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge27" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M596.9712,-190.4932C596.9712,-176.7786 596.9712,-162.5421 596.9712,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="600.4713,-148.5183 596.9712,-138.5184 593.4713,-148.5184 600.4713,-148.5183"/>
<text text-anchor="middle" x="637.4712" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- diagnosis -->
<g id="node25" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M2643.4712,-1734.5C2643.4712,-1734.5 2986.4712,-1734.5 2986.4712,-1734.5 2992.4712,-1734.5 2998.4712,-1740.5 2998.4712,-1746.5 2998.4712,-1746.5 2998.4712,-2021.5 2998.4712,-2021.5 2998.4712,-2027.5 2992.4712,-2033.5 2986.4712,-2033.5 2986.4712,-2033.5 2643.4712,-2033.5 2643.4712,-2033.5 2637.4712,-2033.5 2631.4712,-2027.5 2631.4712,-2021.5 2631.4712,-2021.5 2631.4712,-1746.5 2631.4712,-1746.5 2631.4712,-1740.5 2637.4712,-1734.5 2643.4712,-1734.5"/>
<text text-anchor="middle" x="2673.4712" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2715.4712,-1734.5 2715.4712,-2033.5 "/>
<text text-anchor="middle" x="2725.9712" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2736.4712,-1734.5 2736.4712,-2033.5 "/>
<text text-anchor="middle" x="2856.9712" y="-2018.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2736.4712,-2010.5 2977.4712,-2010.5 "/>
<text text-anchor="middle" x="2856.9712" y="-1995.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="2736.4712,-1987.5 2977.4712,-1987.5 "/>
<text text-anchor="middle" x="2856.9712" y="-1972.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2736.4712,-1964.5 2977.4712,-1964.5 "/>
<text text-anchor="middle" x="2856.9712" y="-1949.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2736.4712,-1941.5 2977.4712,-1941.5 "/>
<text text-anchor="middle" x="2856.9712" y="-1926.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2736.4712,-1918.5 2977.4712,-1918.5 "/>
<text text-anchor="middle" x="2856.9712" y="-1903.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2736.4712,-1895.5 2977.4712,-1895.5 "/>
<text text-anchor="middle" x="2856.9712" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2736.4712,-1872.5 2977.4712,-1872.5 "/>
<text text-anchor="middle" x="2856.9712" y="-1857.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2736.4712,-1849.5 2977.4712,-1849.5 "/>
<text text-anchor="middle" x="2856.9712" y="-1834.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2736.4712,-1826.5 2977.4712,-1826.5 "/>
<text text-anchor="middle" x="2856.9712" y="-1811.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="2736.4712,-1803.5 2977.4712,-1803.5 "/>
<text text-anchor="middle" x="2856.9712" y="-1788.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2736.4712,-1780.5 2977.4712,-1780.5 "/>
<text text-anchor="middle" x="2856.9712" y="-1765.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="2736.4712,-1757.5 2977.4712,-1757.5 "/>
<text text-anchor="middle" x="2856.9712" y="-1742.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="2977.4712,-1734.5 2977.4712,-2033.5 "/>
<text text-anchor="middle" x="2987.9712" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge17" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2675.2579,-1734.4293C2537.3289,-1597.0914 2313.3001,-1400.3189 2076.9712,-1301 1966.0563,-1254.3872 1633.2851,-1225.0894 1445.9106,-1211.8244"/>
<polygon fill="#000000" stroke="#000000" points="1445.9388,-1208.3178 1435.7181,-1211.1085 1445.4483,-1215.3006 1445.9388,-1208.3178"/>
<text text-anchor="middle" x="2682.9712" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file -->
<g id="node26" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M2904.4712,-2702.5C2904.4712,-2702.5 3089.4712,-2702.5 3089.4712,-2702.5 3095.4712,-2702.5 3101.4712,-2708.5 3101.4712,-2714.5 3101.4712,-2714.5 3101.4712,-2897.5 3101.4712,-2897.5 3101.4712,-2903.5 3095.4712,-2909.5 3089.4712,-2909.5 3089.4712,-2909.5 2904.4712,-2909.5 2904.4712,-2909.5 2898.4712,-2909.5 2892.4712,-2903.5 2892.4712,-2897.5 2892.4712,-2897.5 2892.4712,-2714.5 2892.4712,-2714.5 2892.4712,-2708.5 2898.4712,-2702.5 2904.4712,-2702.5"/>
<text text-anchor="middle" x="2911.9712" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="2931.4712,-2702.5 2931.4712,-2909.5 "/>
<text text-anchor="middle" x="2941.9712" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2952.4712,-2702.5 2952.4712,-2909.5 "/>
<text text-anchor="middle" x="3016.4712" y="-2894.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="2952.4712,-2886.5 3080.4712,-2886.5 "/>
<text text-anchor="middle" x="3016.4712" y="-2871.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="2952.4712,-2863.5 3080.4712,-2863.5 "/>
<text text-anchor="middle" x="3016.4712" y="-2848.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="2952.4712,-2840.5 3080.4712,-2840.5 "/>
<text text-anchor="middle" x="3016.4712" y="-2825.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="2952.4712,-2817.5 3080.4712,-2817.5 "/>
<text text-anchor="middle" x="3016.4712" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="2952.4712,-2794.5 3080.4712,-2794.5 "/>
<text text-anchor="middle" x="3016.4712" y="-2779.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="2952.4712,-2771.5 3080.4712,-2771.5 "/>
<text text-anchor="middle" x="3016.4712" y="-2756.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="2952.4712,-2748.5 3080.4712,-2748.5 "/>
<text text-anchor="middle" x="3016.4712" y="-2733.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="2952.4712,-2725.5 3080.4712,-2725.5 "/>
<text text-anchor="middle" x="3016.4712" y="-2710.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_locations</text>
<polyline fill="none" stroke="#000000" points="3080.4712,-2702.5 3080.4712,-2909.5 "/>
<text text-anchor="middle" x="3090.9712" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge37" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M3058.2267,-2702.4394C3065.1464,-2691.1068 3072.1584,-2679.7784 3078.9712,-2669 3084.1084,-2660.8726 3087.5512,-2659.986 3090.9712,-2651 3126.9645,-2556.4282 3132.5678,-2434.5087 3133.1388,-2380.0153"/>
<polygon fill="#000000" stroke="#000000" points="3136.6401,-2379.7622 3133.1934,-2369.7436 3129.6402,-2379.7249 3136.6401,-2379.7622"/>
<text text-anchor="middle" x="3109.4712" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge29" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2999.6559,-2702.1744C2999.774,-2696.0252 2999.8807,-2689.9317 2999.9712,-2684 3005.0786,-2349.5546 3006.5155,-1961.532 3006.8883,-1725.6168"/>
<polygon fill="#000000" stroke="#000000" points="3010.3883,-1725.5512 3006.9037,-1715.5458 3003.3883,-1725.5404 3010.3883,-1725.5512"/>
<text text-anchor="middle" x="3041.4712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge13" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M2900.1293,-2702.2651C2896.7123,-2696.2902 2893.6247,-2690.1892 2890.9712,-2684 2801.8541,-2476.1374 2795.1254,-2210.7424 2802.178,-2044.025"/>
<polygon fill="#000000" stroke="#000000" points="2805.69,-2043.8302 2802.6384,-2033.6844 2798.6969,-2043.5188 2805.69,-2043.8302"/>
<text text-anchor="middle" x="2945.4712" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- disease_extent -->
<g id="node28" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M2482.9712,-714.5C2482.9712,-714.5 2798.9712,-714.5 2798.9712,-714.5 2804.9712,-714.5 2810.9712,-720.5 2810.9712,-726.5 2810.9712,-726.5 2810.9712,-1001.5 2810.9712,-1001.5 2810.9712,-1007.5 2804.9712,-1013.5 2798.9712,-1013.5 2798.9712,-1013.5 2482.9712,-1013.5 2482.9712,-1013.5 2476.9712,-1013.5 2470.9712,-1007.5 2470.9712,-1001.5 2470.9712,-1001.5 2470.9712,-726.5 2470.9712,-726.5 2470.9712,-720.5 2476.9712,-714.5 2482.9712,-714.5"/>
<text text-anchor="middle" x="2532.4712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="2593.9712,-714.5 2593.9712,-1013.5 "/>
<text text-anchor="middle" x="2604.4712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2614.9712,-714.5 2614.9712,-1013.5 "/>
<text text-anchor="middle" x="2702.4712" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="2614.9712,-990.5 2789.9712,-990.5 "/>
<text text-anchor="middle" x="2702.4712" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="2614.9712,-967.5 2789.9712,-967.5 "/>
<text text-anchor="middle" x="2702.4712" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="2614.9712,-944.5 2789.9712,-944.5 "/>
<text text-anchor="middle" x="2702.4712" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="2614.9712,-921.5 2789.9712,-921.5 "/>
<text text-anchor="middle" x="2702.4712" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="2614.9712,-898.5 2789.9712,-898.5 "/>
<text text-anchor="middle" x="2702.4712" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="2614.9712,-875.5 2789.9712,-875.5 "/>
<text text-anchor="middle" x="2702.4712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="2614.9712,-852.5 2789.9712,-852.5 "/>
<text text-anchor="middle" x="2702.4712" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="2614.9712,-829.5 2789.9712,-829.5 "/>
<text text-anchor="middle" x="2702.4712" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="2614.9712,-806.5 2789.9712,-806.5 "/>
<text text-anchor="middle" x="2702.4712" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="2614.9712,-783.5 2789.9712,-783.5 "/>
<text text-anchor="middle" x="2702.4712" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2614.9712,-760.5 2789.9712,-760.5 "/>
<text text-anchor="middle" x="2702.4712" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="2614.9712,-737.5 2789.9712,-737.5 "/>
<text text-anchor="middle" x="2702.4712" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="2789.9712,-714.5 2789.9712,-1013.5 "/>
<text text-anchor="middle" x="2800.4712" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge33" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2582.2394,-714.0918C2562.4976,-663.7023 2542.3126,-612.1819 2529.7208,-580.0423"/>
<polygon fill="#000000" stroke="#000000" points="2532.9724,-578.747 2526.0657,-570.7129 2526.4548,-581.3005 2532.9724,-578.747"/>
<text text-anchor="middle" x="2564.9712" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
</g>
</svg>
</div>
