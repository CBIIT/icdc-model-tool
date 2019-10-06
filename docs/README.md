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
<svg width="4204pt" height="2918pt"
 viewBox="0.00 0.00 4204.36 2918.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2914)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2914 4200.3647,-2914 4200.3647,4 -4,4"/>
<!-- prior_surgery -->
<g id="node1" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M1453.8647,-2271C1453.8647,-2271 1799.8647,-2271 1799.8647,-2271 1805.8647,-2271 1811.8647,-2277 1811.8647,-2283 1811.8647,-2283 1811.8647,-2420 1811.8647,-2420 1811.8647,-2426 1805.8647,-2432 1799.8647,-2432 1799.8647,-2432 1453.8647,-2432 1453.8647,-2432 1447.8647,-2432 1441.8647,-2426 1441.8647,-2420 1441.8647,-2420 1441.8647,-2283 1441.8647,-2283 1441.8647,-2277 1447.8647,-2271 1453.8647,-2271"/>
<text text-anchor="middle" x="1499.3647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="1556.8647,-2271 1556.8647,-2432 "/>
<text text-anchor="middle" x="1567.3647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1577.8647,-2271 1577.8647,-2432 "/>
<text text-anchor="middle" x="1684.3647" y="-2416.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="1577.8647,-2409 1790.8647,-2409 "/>
<text text-anchor="middle" x="1684.3647" y="-2393.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1577.8647,-2386 1790.8647,-2386 "/>
<text text-anchor="middle" x="1684.3647" y="-2370.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="1577.8647,-2363 1790.8647,-2363 "/>
<text text-anchor="middle" x="1684.3647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1577.8647,-2340 1790.8647,-2340 "/>
<text text-anchor="middle" x="1684.3647" y="-2324.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1577.8647,-2317 1790.8647,-2317 "/>
<text text-anchor="middle" x="1684.3647" y="-2301.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="1577.8647,-2294 1790.8647,-2294 "/>
<text text-anchor="middle" x="1684.3647" y="-2278.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="1790.8647,-2271 1790.8647,-2432 "/>
<text text-anchor="middle" x="1801.3647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge10" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M1811.9777,-2393.5585C1823.1554,-2383.5547 1829.8647,-2369.5352 1829.8647,-2351.5 1829.8647,-2337.5509 1825.8512,-2326.004 1818.8609,-2316.8593"/>
<polygon fill="#000000" stroke="#000000" points="1821.3453,-2314.3911 1811.9777,-2309.4415 1816.214,-2319.1525 1821.3453,-2314.3911"/>
<text text-anchor="middle" x="1845.8647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node25" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M1114.3647,-1405C1114.3647,-1405 1463.3647,-1405 1463.3647,-1405 1469.3647,-1405 1475.3647,-1411 1475.3647,-1417 1475.3647,-1417 1475.3647,-1600 1475.3647,-1600 1475.3647,-1606 1469.3647,-1612 1463.3647,-1612 1463.3647,-1612 1114.3647,-1612 1114.3647,-1612 1108.3647,-1612 1102.3647,-1606 1102.3647,-1600 1102.3647,-1600 1102.3647,-1417 1102.3647,-1417 1102.3647,-1411 1108.3647,-1405 1114.3647,-1405"/>
<text text-anchor="middle" x="1149.8647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="1197.3647,-1405 1197.3647,-1612 "/>
<text text-anchor="middle" x="1207.8647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1218.3647,-1405 1218.3647,-1612 "/>
<text text-anchor="middle" x="1336.3647" y="-1596.8" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="1218.3647,-1589 1454.3647,-1589 "/>
<text text-anchor="middle" x="1336.3647" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1218.3647,-1566 1454.3647,-1566 "/>
<text text-anchor="middle" x="1336.3647" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="1218.3647,-1543 1454.3647,-1543 "/>
<text text-anchor="middle" x="1336.3647" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="1218.3647,-1520 1454.3647,-1520 "/>
<text text-anchor="middle" x="1336.3647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="1218.3647,-1497 1454.3647,-1497 "/>
<text text-anchor="middle" x="1336.3647" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="1218.3647,-1474 1454.3647,-1474 "/>
<text text-anchor="middle" x="1336.3647" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1218.3647,-1451 1454.3647,-1451 "/>
<text text-anchor="middle" x="1336.3647" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="1218.3647,-1428 1454.3647,-1428 "/>
<text text-anchor="middle" x="1336.3647" y="-1412.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="1454.3647,-1405 1454.3647,-1612 "/>
<text text-anchor="middle" x="1464.8647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge35" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1594.4558,-2270.6696C1533.8972,-2119.6315 1403.4481,-1794.2806 1334.1997,-1621.5693"/>
<polygon fill="#000000" stroke="#000000" points="1337.4106,-1620.1725 1330.4404,-1612.1933 1330.9134,-1622.7776 1337.4106,-1620.1725"/>
<text text-anchor="middle" x="1547.8647" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- study_arm -->
<g id="node2" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M2969.3647,-415C2969.3647,-415 3338.3647,-415 3338.3647,-415 3344.3647,-415 3350.3647,-421 3350.3647,-427 3350.3647,-427 3350.3647,-449 3350.3647,-449 3350.3647,-455 3344.3647,-461 3338.3647,-461 3338.3647,-461 2969.3647,-461 2969.3647,-461 2963.3647,-461 2957.3647,-455 2957.3647,-449 2957.3647,-449 2957.3647,-427 2957.3647,-427 2957.3647,-421 2963.3647,-415 2969.3647,-415"/>
<text text-anchor="middle" x="3003.3647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="3049.3647,-415 3049.3647,-461 "/>
<text text-anchor="middle" x="3059.8647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3070.3647,-415 3070.3647,-461 "/>
<text text-anchor="middle" x="3199.8647" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="3070.3647,-438 3329.3647,-438 "/>
<text text-anchor="middle" x="3199.8647" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="3329.3647,-415 3329.3647,-461 "/>
<text text-anchor="middle" x="3339.8647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node11" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M3403.8647,-190.5C3403.8647,-190.5 3683.8647,-190.5 3683.8647,-190.5 3689.8647,-190.5 3695.8647,-196.5 3695.8647,-202.5 3695.8647,-202.5 3695.8647,-339.5 3695.8647,-339.5 3695.8647,-345.5 3689.8647,-351.5 3683.8647,-351.5 3683.8647,-351.5 3403.8647,-351.5 3403.8647,-351.5 3397.8647,-351.5 3391.8647,-345.5 3391.8647,-339.5 3391.8647,-339.5 3391.8647,-202.5 3391.8647,-202.5 3391.8647,-196.5 3397.8647,-190.5 3403.8647,-190.5"/>
<text text-anchor="middle" x="3419.8647" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="3447.8647,-190.5 3447.8647,-351.5 "/>
<text text-anchor="middle" x="3458.3647" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3468.8647,-190.5 3468.8647,-351.5 "/>
<text text-anchor="middle" x="3571.8647" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="3468.8647,-328.5 3674.8647,-328.5 "/>
<text text-anchor="middle" x="3571.8647" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="3468.8647,-305.5 3674.8647,-305.5 "/>
<text text-anchor="middle" x="3571.8647" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="3468.8647,-282.5 3674.8647,-282.5 "/>
<text text-anchor="middle" x="3571.8647" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="3468.8647,-259.5 3674.8647,-259.5 "/>
<text text-anchor="middle" x="3571.8647" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="3468.8647,-236.5 3674.8647,-236.5 "/>
<text text-anchor="middle" x="3571.8647" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="3468.8647,-213.5 3674.8647,-213.5 "/>
<text text-anchor="middle" x="3571.8647" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="3674.8647,-190.5 3674.8647,-351.5 "/>
<text text-anchor="middle" x="3685.3647" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge20" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3207.683,-414.9547C3252.9001,-395.5925 3319.9464,-366.883 3382.2932,-340.1858"/>
<polygon fill="#000000" stroke="#000000" points="3384.0391,-343.2456 3391.8541,-336.0917 3381.2837,-336.8107 3384.0391,-343.2456"/>
<text text-anchor="middle" x="3342.3647" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- adverse_event -->
<g id="node3" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M2443.3647,-668.5C2443.3647,-668.5 2838.3647,-668.5 2838.3647,-668.5 2844.3647,-668.5 2850.3647,-674.5 2850.3647,-680.5 2850.3647,-680.5 2850.3647,-1047.5 2850.3647,-1047.5 2850.3647,-1053.5 2844.3647,-1059.5 2838.3647,-1059.5 2838.3647,-1059.5 2443.3647,-1059.5 2443.3647,-1059.5 2437.3647,-1059.5 2431.3647,-1053.5 2431.3647,-1047.5 2431.3647,-1047.5 2431.3647,-680.5 2431.3647,-680.5 2431.3647,-674.5 2437.3647,-668.5 2443.3647,-668.5"/>
<text text-anchor="middle" x="2491.3647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="2551.3647,-668.5 2551.3647,-1059.5 "/>
<text text-anchor="middle" x="2561.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2572.3647,-668.5 2572.3647,-1059.5 "/>
<text text-anchor="middle" x="2700.8647" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-1036.5 2829.3647,-1036.5 "/>
<text text-anchor="middle" x="2700.8647" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-1013.5 2829.3647,-1013.5 "/>
<text text-anchor="middle" x="2700.8647" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-990.5 2829.3647,-990.5 "/>
<text text-anchor="middle" x="2700.8647" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-967.5 2829.3647,-967.5 "/>
<text text-anchor="middle" x="2700.8647" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-944.5 2829.3647,-944.5 "/>
<text text-anchor="middle" x="2700.8647" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-921.5 2829.3647,-921.5 "/>
<text text-anchor="middle" x="2700.8647" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-898.5 2829.3647,-898.5 "/>
<text text-anchor="middle" x="2700.8647" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-875.5 2829.3647,-875.5 "/>
<text text-anchor="middle" x="2700.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-852.5 2829.3647,-852.5 "/>
<text text-anchor="middle" x="2700.8647" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-829.5 2829.3647,-829.5 "/>
<text text-anchor="middle" x="2700.8647" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-806.5 2829.3647,-806.5 "/>
<text text-anchor="middle" x="2700.8647" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-783.5 2829.3647,-783.5 "/>
<text text-anchor="middle" x="2700.8647" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-760.5 2829.3647,-760.5 "/>
<text text-anchor="middle" x="2700.8647" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-737.5 2829.3647,-737.5 "/>
<text text-anchor="middle" x="2700.8647" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-714.5 2829.3647,-714.5 "/>
<text text-anchor="middle" x="2700.8647" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="2572.3647,-691.5 2829.3647,-691.5 "/>
<text text-anchor="middle" x="2700.8647" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="2829.3647,-668.5 2829.3647,-1059.5 "/>
<text text-anchor="middle" x="2839.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge9" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2850.5692,-896.9793C2861.7407,-888.8906 2868.3647,-877.8975 2868.3647,-864 2868.3647,-853.7941 2864.7923,-845.1544 2858.47,-838.0812"/>
<polygon fill="#000000" stroke="#000000" points="2860.3579,-835.0744 2850.5692,-831.0207 2855.6935,-840.2939 2860.3579,-835.0744"/>
<text text-anchor="middle" x="2884.3647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- agent -->
<g id="node15" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M2527.8647,-524.5C2527.8647,-524.5 2753.8647,-524.5 2753.8647,-524.5 2759.8647,-524.5 2765.8647,-530.5 2765.8647,-536.5 2765.8647,-536.5 2765.8647,-558.5 2765.8647,-558.5 2765.8647,-564.5 2759.8647,-570.5 2753.8647,-570.5 2753.8647,-570.5 2527.8647,-570.5 2527.8647,-570.5 2521.8647,-570.5 2515.8647,-564.5 2515.8647,-558.5 2515.8647,-558.5 2515.8647,-536.5 2515.8647,-536.5 2515.8647,-530.5 2521.8647,-524.5 2527.8647,-524.5"/>
<text text-anchor="middle" x="2544.3647" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="2572.8647,-524.5 2572.8647,-570.5 "/>
<text text-anchor="middle" x="2583.3647" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2593.8647,-524.5 2593.8647,-570.5 "/>
<text text-anchor="middle" x="2669.3647" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2593.8647,-547.5 2744.8647,-547.5 "/>
<text text-anchor="middle" x="2669.3647" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2744.8647,-524.5 2744.8647,-570.5 "/>
<text text-anchor="middle" x="2755.3647" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge37" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2640.8647,-668.058C2640.8647,-634.3679 2640.8647,-603.0978 2640.8647,-580.8505"/>
<polygon fill="#000000" stroke="#000000" points="2644.3648,-580.6828 2640.8647,-570.6828 2637.3648,-580.6828 2644.3648,-580.6828"/>
<text text-anchor="middle" x="2671.8647" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- visit -->
<g id="node17" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1055.3647,-524.5C1055.3647,-524.5 1230.3647,-524.5 1230.3647,-524.5 1236.3647,-524.5 1242.3647,-530.5 1242.3647,-536.5 1242.3647,-536.5 1242.3647,-558.5 1242.3647,-558.5 1242.3647,-564.5 1236.3647,-570.5 1230.3647,-570.5 1230.3647,-570.5 1055.3647,-570.5 1055.3647,-570.5 1049.3647,-570.5 1043.3647,-564.5 1043.3647,-558.5 1043.3647,-558.5 1043.3647,-536.5 1043.3647,-536.5 1043.3647,-530.5 1049.3647,-524.5 1055.3647,-524.5"/>
<text text-anchor="middle" x="1066.8647" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1090.3647,-524.5 1090.3647,-570.5 "/>
<text text-anchor="middle" x="1100.8647" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1111.3647,-524.5 1111.3647,-570.5 "/>
<text text-anchor="middle" x="1166.3647" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1111.3647,-547.5 1221.3647,-547.5 "/>
<text text-anchor="middle" x="1166.3647" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1221.3647,-524.5 1221.3647,-570.5 "/>
<text text-anchor="middle" x="1231.8647" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;visit -->
<g id="edge1" class="edge">
<title>adverse_event&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2491.9619,-668.4531C2470.6526,-650.1677 2447.5168,-634.0177 2422.8647,-622 2319.1416,-571.436 1543.6874,-553.9067 1252.7223,-549.0706"/>
<polygon fill="#000000" stroke="#000000" points="1252.6343,-545.5687 1242.5781,-548.9038 1252.5192,-552.5678 1252.6343,-545.5687"/>
<text text-anchor="middle" x="2363.8647" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- diagnosis -->
<g id="node4" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M1718.3647,-1734.5C1718.3647,-1734.5 2061.3647,-1734.5 2061.3647,-1734.5 2067.3647,-1734.5 2073.3647,-1740.5 2073.3647,-1746.5 2073.3647,-1746.5 2073.3647,-2021.5 2073.3647,-2021.5 2073.3647,-2027.5 2067.3647,-2033.5 2061.3647,-2033.5 2061.3647,-2033.5 1718.3647,-2033.5 1718.3647,-2033.5 1712.3647,-2033.5 1706.3647,-2027.5 1706.3647,-2021.5 1706.3647,-2021.5 1706.3647,-1746.5 1706.3647,-1746.5 1706.3647,-1740.5 1712.3647,-1734.5 1718.3647,-1734.5"/>
<text text-anchor="middle" x="1748.3647" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="1790.3647,-1734.5 1790.3647,-2033.5 "/>
<text text-anchor="middle" x="1800.8647" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1811.3647,-1734.5 1811.3647,-2033.5 "/>
<text text-anchor="middle" x="1931.8647" y="-2018.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="1811.3647,-2010.5 2052.3647,-2010.5 "/>
<text text-anchor="middle" x="1931.8647" y="-1995.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="1811.3647,-1987.5 2052.3647,-1987.5 "/>
<text text-anchor="middle" x="1931.8647" y="-1972.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="1811.3647,-1964.5 2052.3647,-1964.5 "/>
<text text-anchor="middle" x="1931.8647" y="-1949.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="1811.3647,-1941.5 2052.3647,-1941.5 "/>
<text text-anchor="middle" x="1931.8647" y="-1926.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="1811.3647,-1918.5 2052.3647,-1918.5 "/>
<text text-anchor="middle" x="1931.8647" y="-1903.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1811.3647,-1895.5 2052.3647,-1895.5 "/>
<text text-anchor="middle" x="1931.8647" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="1811.3647,-1872.5 2052.3647,-1872.5 "/>
<text text-anchor="middle" x="1931.8647" y="-1857.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="1811.3647,-1849.5 2052.3647,-1849.5 "/>
<text text-anchor="middle" x="1931.8647" y="-1834.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="1811.3647,-1826.5 2052.3647,-1826.5 "/>
<text text-anchor="middle" x="1931.8647" y="-1811.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="1811.3647,-1803.5 2052.3647,-1803.5 "/>
<text text-anchor="middle" x="1931.8647" y="-1788.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="1811.3647,-1780.5 2052.3647,-1780.5 "/>
<text text-anchor="middle" x="1931.8647" y="-1765.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="1811.3647,-1757.5 2052.3647,-1757.5 "/>
<text text-anchor="middle" x="1931.8647" y="-1742.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2052.3647,-1734.5 2052.3647,-2033.5 "/>
<text text-anchor="middle" x="2062.8647" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node21" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1564.3647,-1157.5C1564.3647,-1157.5 1783.3647,-1157.5 1783.3647,-1157.5 1789.3647,-1157.5 1795.3647,-1163.5 1795.3647,-1169.5 1795.3647,-1169.5 1795.3647,-1237.5 1795.3647,-1237.5 1795.3647,-1243.5 1789.3647,-1249.5 1783.3647,-1249.5 1783.3647,-1249.5 1564.3647,-1249.5 1564.3647,-1249.5 1558.3647,-1249.5 1552.3647,-1243.5 1552.3647,-1237.5 1552.3647,-1237.5 1552.3647,-1169.5 1552.3647,-1169.5 1552.3647,-1163.5 1558.3647,-1157.5 1564.3647,-1157.5"/>
<text text-anchor="middle" x="1576.8647" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1601.3647,-1157.5 1601.3647,-1249.5 "/>
<text text-anchor="middle" x="1611.8647" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1622.3647,-1157.5 1622.3647,-1249.5 "/>
<text text-anchor="middle" x="1698.3647" y="-1234.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1622.3647,-1226.5 1774.3647,-1226.5 "/>
<text text-anchor="middle" x="1698.3647" y="-1211.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1622.3647,-1203.5 1774.3647,-1203.5 "/>
<text text-anchor="middle" x="1698.3647" y="-1188.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1622.3647,-1180.5 1774.3647,-1180.5 "/>
<text text-anchor="middle" x="1698.3647" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1774.3647,-1157.5 1774.3647,-1249.5 "/>
<text text-anchor="middle" x="1784.8647" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge30" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1921.7954,-1734.2764C1940.0553,-1608.5795 1945.2748,-1429.4566 1862.8647,-1301 1848.5454,-1278.6799 1827.3838,-1261.2094 1804.3464,-1247.6242"/>
<polygon fill="#000000" stroke="#000000" points="1805.8663,-1244.4633 1795.4356,-1242.6058 1802.4313,-1250.5626 1805.8663,-1244.4633"/>
<text text-anchor="middle" x="1959.8647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- image -->
<g id="node5" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M266.8647,-2788C266.8647,-2788 302.8647,-2788 302.8647,-2788 308.8647,-2788 314.8647,-2794 314.8647,-2800 314.8647,-2800 314.8647,-2812 314.8647,-2812 314.8647,-2818 308.8647,-2824 302.8647,-2824 302.8647,-2824 266.8647,-2824 266.8647,-2824 260.8647,-2824 254.8647,-2818 254.8647,-2812 254.8647,-2812 254.8647,-2800 254.8647,-2800 254.8647,-2794 260.8647,-2788 266.8647,-2788"/>
<text text-anchor="middle" x="284.8647" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node20" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M340.8647,-2333.5C340.8647,-2333.5 372.8647,-2333.5 372.8647,-2333.5 378.8647,-2333.5 384.8647,-2339.5 384.8647,-2345.5 384.8647,-2345.5 384.8647,-2357.5 384.8647,-2357.5 384.8647,-2363.5 378.8647,-2369.5 372.8647,-2369.5 372.8647,-2369.5 340.8647,-2369.5 340.8647,-2369.5 334.8647,-2369.5 328.8647,-2363.5 328.8647,-2357.5 328.8647,-2357.5 328.8647,-2345.5 328.8647,-2345.5 328.8647,-2339.5 334.8647,-2333.5 340.8647,-2333.5"/>
<text text-anchor="middle" x="356.8647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge14" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M283.7712,-2787.7539C282.4712,-2761.427 281.0363,-2711.3011 285.8647,-2669 298.2912,-2560.1317 332.6567,-2433.9361 348.5743,-2379.1935"/>
<polygon fill="#000000" stroke="#000000" points="351.9546,-2380.1042 351.4112,-2369.5233 345.2377,-2378.1336 351.9546,-2380.1042"/>
<text text-anchor="middle" x="316.3647" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- follow_up -->
<g id="node6" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M739.8647,-1405C739.8647,-1405 1071.8647,-1405 1071.8647,-1405 1077.8647,-1405 1083.8647,-1411 1083.8647,-1417 1083.8647,-1417 1083.8647,-1600 1083.8647,-1600 1083.8647,-1606 1077.8647,-1612 1071.8647,-1612 1071.8647,-1612 739.8647,-1612 739.8647,-1612 733.8647,-1612 727.8647,-1606 727.8647,-1600 727.8647,-1600 727.8647,-1417 727.8647,-1417 727.8647,-1411 733.8647,-1405 739.8647,-1405"/>
<text text-anchor="middle" x="770.3647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="812.8647,-1405 812.8647,-1612 "/>
<text text-anchor="middle" x="823.3647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="833.8647,-1405 833.8647,-1612 "/>
<text text-anchor="middle" x="948.3647" y="-1596.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="833.8647,-1589 1062.8647,-1589 "/>
<text text-anchor="middle" x="948.3647" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="833.8647,-1566 1062.8647,-1566 "/>
<text text-anchor="middle" x="948.3647" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="833.8647,-1543 1062.8647,-1543 "/>
<text text-anchor="middle" x="948.3647" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="833.8647,-1520 1062.8647,-1520 "/>
<text text-anchor="middle" x="948.3647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="833.8647,-1497 1062.8647,-1497 "/>
<text text-anchor="middle" x="948.3647" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="833.8647,-1474 1062.8647,-1474 "/>
<text text-anchor="middle" x="948.3647" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="833.8647,-1451 1062.8647,-1451 "/>
<text text-anchor="middle" x="948.3647" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="833.8647,-1428 1062.8647,-1428 "/>
<text text-anchor="middle" x="948.3647" y="-1412.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1062.8647,-1405 1062.8647,-1612 "/>
<text text-anchor="middle" x="1073.3647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge27" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M975.9347,-1404.8118C1007.2399,-1366.3032 1047.372,-1325.9586 1092.8647,-1301 1168.2487,-1259.6421 1395.2339,-1230.5525 1542.1638,-1215.4563"/>
<polygon fill="#000000" stroke="#000000" points="1542.5684,-1218.9333 1552.1622,-1214.4379 1541.859,-1211.9693 1542.5684,-1218.9333"/>
<text text-anchor="middle" x="1210.8647" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file -->
<g id="node7" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M352.3647,-2702.5C352.3647,-2702.5 537.3647,-2702.5 537.3647,-2702.5 543.3647,-2702.5 549.3647,-2708.5 549.3647,-2714.5 549.3647,-2714.5 549.3647,-2897.5 549.3647,-2897.5 549.3647,-2903.5 543.3647,-2909.5 537.3647,-2909.5 537.3647,-2909.5 352.3647,-2909.5 352.3647,-2909.5 346.3647,-2909.5 340.3647,-2903.5 340.3647,-2897.5 340.3647,-2897.5 340.3647,-2714.5 340.3647,-2714.5 340.3647,-2708.5 346.3647,-2702.5 352.3647,-2702.5"/>
<text text-anchor="middle" x="359.8647" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="379.3647,-2702.5 379.3647,-2909.5 "/>
<text text-anchor="middle" x="389.8647" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="400.3647,-2702.5 400.3647,-2909.5 "/>
<text text-anchor="middle" x="464.3647" y="-2894.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="400.3647,-2886.5 528.3647,-2886.5 "/>
<text text-anchor="middle" x="464.3647" y="-2871.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_locations</text>
<polyline fill="none" stroke="#000000" points="400.3647,-2863.5 528.3647,-2863.5 "/>
<text text-anchor="middle" x="464.3647" y="-2848.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="400.3647,-2840.5 528.3647,-2840.5 "/>
<text text-anchor="middle" x="464.3647" y="-2825.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="400.3647,-2817.5 528.3647,-2817.5 "/>
<text text-anchor="middle" x="464.3647" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="400.3647,-2794.5 528.3647,-2794.5 "/>
<text text-anchor="middle" x="464.3647" y="-2779.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="400.3647,-2771.5 528.3647,-2771.5 "/>
<text text-anchor="middle" x="464.3647" y="-2756.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="400.3647,-2748.5 528.3647,-2748.5 "/>
<text text-anchor="middle" x="464.3647" y="-2733.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="400.3647,-2725.5 528.3647,-2725.5 "/>
<text text-anchor="middle" x="464.3647" y="-2710.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="528.3647,-2702.5 528.3647,-2909.5 "/>
<text text-anchor="middle" x="538.8647" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge21" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M549.3969,-2802.4255C863.2963,-2790.6398 1781.5669,-2748.0841 1870.8647,-2651 2019.9879,-2488.8739 1984.3756,-2216.1398 1940.4728,-2043.3569"/>
<polygon fill="#000000" stroke="#000000" points="1943.8602,-2042.4758 1937.9751,-2033.6658 1937.0817,-2044.2229 1943.8602,-2042.4758"/>
<text text-anchor="middle" x="1895.3647" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- sample -->
<g id="node18" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M166.3647,-1301.5C166.3647,-1301.5 589.3647,-1301.5 589.3647,-1301.5 595.3647,-1301.5 601.3647,-1307.5 601.3647,-1313.5 601.3647,-1313.5 601.3647,-1703.5 601.3647,-1703.5 601.3647,-1709.5 595.3647,-1715.5 589.3647,-1715.5 589.3647,-1715.5 166.3647,-1715.5 166.3647,-1715.5 160.3647,-1715.5 154.3647,-1709.5 154.3647,-1703.5 154.3647,-1703.5 154.3647,-1313.5 154.3647,-1313.5 154.3647,-1307.5 160.3647,-1301.5 166.3647,-1301.5"/>
<text text-anchor="middle" x="188.3647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="222.3647,-1301.5 222.3647,-1715.5 "/>
<text text-anchor="middle" x="232.8647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="243.3647,-1301.5 243.3647,-1715.5 "/>
<text text-anchor="middle" x="411.8647" y="-1700.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1692.5 580.3647,-1692.5 "/>
<text text-anchor="middle" x="411.8647" y="-1677.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1669.5 580.3647,-1669.5 "/>
<text text-anchor="middle" x="411.8647" y="-1654.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1646.5 580.3647,-1646.5 "/>
<text text-anchor="middle" x="411.8647" y="-1631.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1623.5 580.3647,-1623.5 "/>
<text text-anchor="middle" x="411.8647" y="-1608.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1600.5 580.3647,-1600.5 "/>
<text text-anchor="middle" x="411.8647" y="-1585.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1577.5 580.3647,-1577.5 "/>
<text text-anchor="middle" x="411.8647" y="-1562.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1554.5 580.3647,-1554.5 "/>
<text text-anchor="middle" x="411.8647" y="-1539.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1531.5 580.3647,-1531.5 "/>
<text text-anchor="middle" x="411.8647" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1508.5 580.3647,-1508.5 "/>
<text text-anchor="middle" x="411.8647" y="-1493.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1485.5 580.3647,-1485.5 "/>
<text text-anchor="middle" x="411.8647" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1462.5 580.3647,-1462.5 "/>
<text text-anchor="middle" x="411.8647" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1439.5 580.3647,-1439.5 "/>
<text text-anchor="middle" x="411.8647" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1416.5 580.3647,-1416.5 "/>
<text text-anchor="middle" x="411.8647" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1393.5 580.3647,-1393.5 "/>
<text text-anchor="middle" x="411.8647" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1370.5 580.3647,-1370.5 "/>
<text text-anchor="middle" x="411.8647" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1347.5 580.3647,-1347.5 "/>
<text text-anchor="middle" x="411.8647" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="243.3647,-1324.5 580.3647,-1324.5 "/>
<text text-anchor="middle" x="411.8647" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="580.3647,-1301.5 580.3647,-1715.5 "/>
<text text-anchor="middle" x="590.8647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge26" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M446.382,-2702.3741C449.2997,-2471.1879 453.5493,-1919.091 430.8647,-1734 430.5266,-1731.2416 430.1682,-1728.4679 429.7907,-1725.6816"/>
<polygon fill="#000000" stroke="#000000" points="433.2216,-1724.9484 428.3434,-1715.5434 426.2919,-1725.9378 433.2216,-1724.9484"/>
<text text-anchor="middle" x="485.3647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge13" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M376.5816,-2702.4966C374.0169,-2696.3718 371.745,-2690.1848 369.8647,-2684 336.882,-2575.5104 346.8346,-2437.9165 353.2726,-2379.6272"/>
<polygon fill="#000000" stroke="#000000" points="356.7496,-2380.0272 354.4227,-2369.6911 349.796,-2379.2223 356.7496,-2380.0272"/>
<text text-anchor="middle" x="400.3647" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- program -->
<g id="node8" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M3389.8647,-.5C3389.8647,-.5 3697.8647,-.5 3697.8647,-.5 3703.8647,-.5 3709.8647,-6.5 3709.8647,-12.5 3709.8647,-12.5 3709.8647,-126.5 3709.8647,-126.5 3709.8647,-132.5 3703.8647,-138.5 3697.8647,-138.5 3697.8647,-138.5 3389.8647,-138.5 3389.8647,-138.5 3383.8647,-138.5 3377.8647,-132.5 3377.8647,-126.5 3377.8647,-126.5 3377.8647,-12.5 3377.8647,-12.5 3377.8647,-6.5 3383.8647,-.5 3389.8647,-.5"/>
<text text-anchor="middle" x="3416.8647" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="3455.8647,-.5 3455.8647,-138.5 "/>
<text text-anchor="middle" x="3466.3647" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3476.8647,-.5 3476.8647,-138.5 "/>
<text text-anchor="middle" x="3582.8647" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="3476.8647,-115.5 3688.8647,-115.5 "/>
<text text-anchor="middle" x="3582.8647" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="3476.8647,-92.5 3688.8647,-92.5 "/>
<text text-anchor="middle" x="3582.8647" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="3476.8647,-69.5 3688.8647,-69.5 "/>
<text text-anchor="middle" x="3582.8647" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="3476.8647,-46.5 3688.8647,-46.5 "/>
<text text-anchor="middle" x="3582.8647" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="3476.8647,-23.5 3688.8647,-23.5 "/>
<text text-anchor="middle" x="3582.8647" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="3688.8647,-.5 3688.8647,-138.5 "/>
<text text-anchor="middle" x="3699.3647" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort -->
<g id="node9" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M3040.3647,-524.5C3040.3647,-524.5 3273.3647,-524.5 3273.3647,-524.5 3279.3647,-524.5 3285.3647,-530.5 3285.3647,-536.5 3285.3647,-536.5 3285.3647,-558.5 3285.3647,-558.5 3285.3647,-564.5 3279.3647,-570.5 3273.3647,-570.5 3273.3647,-570.5 3040.3647,-570.5 3040.3647,-570.5 3034.3647,-570.5 3028.3647,-564.5 3028.3647,-558.5 3028.3647,-558.5 3028.3647,-536.5 3028.3647,-536.5 3028.3647,-530.5 3034.3647,-524.5 3040.3647,-524.5"/>
<text text-anchor="middle" x="3059.8647" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="3091.3647,-524.5 3091.3647,-570.5 "/>
<text text-anchor="middle" x="3101.8647" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3112.3647,-524.5 3112.3647,-570.5 "/>
<text text-anchor="middle" x="3188.3647" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="3112.3647,-547.5 3264.3647,-547.5 "/>
<text text-anchor="middle" x="3188.3647" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="3264.3647,-524.5 3264.3647,-570.5 "/>
<text text-anchor="middle" x="3274.8647" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge18" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M3156.2284,-524.2779C3155.8068,-508.8892 3155.2471,-488.4597 3154.7782,-471.3432"/>
<polygon fill="#000000" stroke="#000000" points="3158.2726,-471.089 3154.5,-461.1887 3151.2753,-471.2808 3158.2726,-471.089"/>
<text text-anchor="middle" x="3195.3647" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge17" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3285.4507,-539.6126C3445.1042,-528.4839 3700.0571,-505.8029 3728.8647,-473 3762.3892,-434.8259 3735.7127,-393.3333 3693.2433,-357.9406"/>
<polygon fill="#000000" stroke="#000000" points="3695.4115,-355.1927 3685.4324,-351.6335 3691.0138,-360.6389 3695.4115,-355.1927"/>
<text text-anchor="middle" x="3784.3647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- principal_investigator -->
<g id="node10" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M3380.3647,-403.5C3380.3647,-403.5 3707.3647,-403.5 3707.3647,-403.5 3713.3647,-403.5 3719.3647,-409.5 3719.3647,-415.5 3719.3647,-415.5 3719.3647,-460.5 3719.3647,-460.5 3719.3647,-466.5 3713.3647,-472.5 3707.3647,-472.5 3707.3647,-472.5 3380.3647,-472.5 3380.3647,-472.5 3374.3647,-472.5 3368.3647,-466.5 3368.3647,-460.5 3368.3647,-460.5 3368.3647,-415.5 3368.3647,-415.5 3368.3647,-409.5 3374.3647,-403.5 3380.3647,-403.5"/>
<text text-anchor="middle" x="3455.3647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="3542.3647,-403.5 3542.3647,-472.5 "/>
<text text-anchor="middle" x="3552.8647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3563.3647,-403.5 3563.3647,-472.5 "/>
<text text-anchor="middle" x="3630.8647" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="3563.3647,-449.5 3698.3647,-449.5 "/>
<text text-anchor="middle" x="3630.8647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="3563.3647,-426.5 3698.3647,-426.5 "/>
<text text-anchor="middle" x="3630.8647" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="3698.3647,-403.5 3698.3647,-472.5 "/>
<text text-anchor="middle" x="3708.8647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge41" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3543.8647,-403.3975C3543.8647,-391.1328 3543.8647,-376.6951 3543.8647,-361.945"/>
<polygon fill="#000000" stroke="#000000" points="3547.3648,-361.7063 3543.8647,-351.7063 3540.3648,-361.7064 3547.3648,-361.7063"/>
<text text-anchor="middle" x="3574.3647" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge19" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M3543.8647,-190.4932C3543.8647,-176.7786 3543.8647,-162.5421 3543.8647,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="3547.3648,-148.5183 3543.8647,-138.5184 3540.3648,-148.5184 3547.3648,-148.5183"/>
<text text-anchor="middle" x="3584.3647" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- vital_signs -->
<g id="node12" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1564.3647,-703C1564.3647,-703 1851.3647,-703 1851.3647,-703 1857.3647,-703 1863.3647,-709 1863.3647,-715 1863.3647,-715 1863.3647,-1013 1863.3647,-1013 1863.3647,-1019 1857.3647,-1025 1851.3647,-1025 1851.3647,-1025 1564.3647,-1025 1564.3647,-1025 1558.3647,-1025 1552.3647,-1019 1552.3647,-1013 1552.3647,-1013 1552.3647,-715 1552.3647,-715 1552.3647,-709 1558.3647,-703 1564.3647,-703"/>
<text text-anchor="middle" x="1598.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1645.3647,-703 1645.3647,-1025 "/>
<text text-anchor="middle" x="1655.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1666.3647,-703 1666.3647,-1025 "/>
<text text-anchor="middle" x="1754.3647" y="-1009.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1666.3647,-1002 1842.3647,-1002 "/>
<text text-anchor="middle" x="1754.3647" y="-986.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1666.3647,-979 1842.3647,-979 "/>
<text text-anchor="middle" x="1754.3647" y="-963.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1666.3647,-956 1842.3647,-956 "/>
<text text-anchor="middle" x="1754.3647" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1666.3647,-933 1842.3647,-933 "/>
<text text-anchor="middle" x="1754.3647" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1666.3647,-910 1842.3647,-910 "/>
<text text-anchor="middle" x="1754.3647" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1666.3647,-887 1842.3647,-887 "/>
<text text-anchor="middle" x="1754.3647" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1666.3647,-864 1842.3647,-864 "/>
<text text-anchor="middle" x="1754.3647" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1666.3647,-841 1842.3647,-841 "/>
<text text-anchor="middle" x="1754.3647" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1666.3647,-818 1842.3647,-818 "/>
<text text-anchor="middle" x="1754.3647" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1666.3647,-795 1842.3647,-795 "/>
<text text-anchor="middle" x="1754.3647" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1666.3647,-772 1842.3647,-772 "/>
<text text-anchor="middle" x="1754.3647" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1666.3647,-749 1842.3647,-749 "/>
<text text-anchor="middle" x="1754.3647" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1666.3647,-726 1842.3647,-726 "/>
<text text-anchor="middle" x="1754.3647" y="-710.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1842.3647,-703 1842.3647,-1025 "/>
<text text-anchor="middle" x="1852.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge4" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1625.1587,-702.777C1602.6166,-671.8522 1575.5034,-642.7037 1543.8647,-622 1519.6609,-606.1615 1362.9881,-580.1906 1252.8107,-563.4744"/>
<polygon fill="#000000" stroke="#000000" points="1253.0441,-559.97 1242.6334,-561.9365 1251.9982,-566.8914 1253.0441,-559.97"/>
<text text-anchor="middle" x="1506.8647" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- prior_therapy -->
<g id="node13" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M905.8647,-2052.5C905.8647,-2052.5 1361.8647,-2052.5 1361.8647,-2052.5 1367.8647,-2052.5 1373.8647,-2058.5 1373.8647,-2064.5 1373.8647,-2064.5 1373.8647,-2638.5 1373.8647,-2638.5 1373.8647,-2644.5 1367.8647,-2650.5 1361.8647,-2650.5 1361.8647,-2650.5 905.8647,-2650.5 905.8647,-2650.5 899.8647,-2650.5 893.8647,-2644.5 893.8647,-2638.5 893.8647,-2638.5 893.8647,-2064.5 893.8647,-2064.5 893.8647,-2058.5 899.8647,-2052.5 905.8647,-2052.5"/>
<text text-anchor="middle" x="951.3647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="1008.8647,-2052.5 1008.8647,-2650.5 "/>
<text text-anchor="middle" x="1019.3647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2052.5 1029.8647,-2650.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2635.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2627.5 1352.8647,-2627.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2612.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2604.5 1352.8647,-2604.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2589.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2581.5 1352.8647,-2581.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2566.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2558.5 1352.8647,-2558.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2543.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2535.5 1352.8647,-2535.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2520.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2512.5 1352.8647,-2512.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2497.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2489.5 1352.8647,-2489.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2474.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2466.5 1352.8647,-2466.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2451.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2443.5 1352.8647,-2443.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2428.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2420.5 1352.8647,-2420.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2405.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2397.5 1352.8647,-2397.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2382.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2374.5 1352.8647,-2374.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2359.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2351.5 1352.8647,-2351.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2336.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2328.5 1352.8647,-2328.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2313.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2305.5 1352.8647,-2305.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2290.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2282.5 1352.8647,-2282.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2267.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2259.5 1352.8647,-2259.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2244.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2236.5 1352.8647,-2236.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2221.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2213.5 1352.8647,-2213.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2198.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2190.5 1352.8647,-2190.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2175.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2167.5 1352.8647,-2167.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2152.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2144.5 1352.8647,-2144.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2129.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2121.5 1352.8647,-2121.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2106.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2098.5 1352.8647,-2098.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2083.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="1029.8647,-2075.5 1352.8647,-2075.5 "/>
<text text-anchor="middle" x="1191.3647" y="-2060.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1352.8647,-2052.5 1352.8647,-2650.5 "/>
<text text-anchor="middle" x="1363.3647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge11" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M1374.1031,-2389.6912C1385.3034,-2380.0507 1391.8647,-2367.3203 1391.8647,-2351.5 1391.8647,-2339.3876 1388.0186,-2329.0864 1381.1891,-2320.5965"/>
<polygon fill="#000000" stroke="#000000" points="1383.5836,-2318.0385 1374.1031,-2313.3088 1378.5649,-2322.9183 1383.5836,-2318.0385"/>
<text text-anchor="middle" x="1407.8647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge34" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1188.8937,-2052.213C1216.2809,-1903.2622 1247.7662,-1732.0225 1267.9671,-1622.1556"/>
<polygon fill="#000000" stroke="#000000" points="1271.4595,-1622.516 1269.8256,-1612.0479 1264.5749,-1621.2501 1271.4595,-1622.516"/>
<text text-anchor="middle" x="1296.8647" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- lab_exam -->
<g id="node14" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M119.8647,-846C119.8647,-846 179.8647,-846 179.8647,-846 185.8647,-846 191.8647,-852 191.8647,-858 191.8647,-858 191.8647,-870 191.8647,-870 191.8647,-876 185.8647,-882 179.8647,-882 179.8647,-882 119.8647,-882 119.8647,-882 113.8647,-882 107.8647,-876 107.8647,-870 107.8647,-870 107.8647,-858 107.8647,-858 107.8647,-852 113.8647,-846 119.8647,-846"/>
<text text-anchor="middle" x="149.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge2" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M147.4509,-845.8524C142.5535,-800.5957 136.8231,-682.0708 200.8647,-622 260.441,-566.1177 797.474,-552.0946 1032.9961,-548.6225"/>
<polygon fill="#000000" stroke="#000000" points="1033.349,-552.1179 1043.2976,-548.4745 1033.2484,-545.1186 1033.349,-552.1179"/>
<text text-anchor="middle" x="337.8647" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge24" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2748.719,-524.4785C2832.7634,-506.5392 2949.3189,-481.6604 3035.847,-463.1909"/>
<polygon fill="#000000" stroke="#000000" points="3036.6649,-466.5953 3045.7139,-461.0848 3035.2036,-459.7495 3036.6649,-466.5953"/>
<text text-anchor="middle" x="2945.3647" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- cycle -->
<g id="node16" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1740.8647,-403.5C1740.8647,-403.5 1968.8647,-403.5 1968.8647,-403.5 1974.8647,-403.5 1980.8647,-409.5 1980.8647,-415.5 1980.8647,-415.5 1980.8647,-460.5 1980.8647,-460.5 1980.8647,-466.5 1974.8647,-472.5 1968.8647,-472.5 1968.8647,-472.5 1740.8647,-472.5 1740.8647,-472.5 1734.8647,-472.5 1728.8647,-466.5 1728.8647,-460.5 1728.8647,-460.5 1728.8647,-415.5 1728.8647,-415.5 1728.8647,-409.5 1734.8647,-403.5 1740.8647,-403.5"/>
<text text-anchor="middle" x="1755.8647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1782.8647,-403.5 1782.8647,-472.5 "/>
<text text-anchor="middle" x="1793.3647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1803.8647,-403.5 1803.8647,-472.5 "/>
<text text-anchor="middle" x="1881.8647" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1803.8647,-449.5 1959.8647,-449.5 "/>
<text text-anchor="middle" x="1881.8647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1803.8647,-426.5 1959.8647,-426.5 "/>
<text text-anchor="middle" x="1881.8647" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1959.8647,-403.5 1959.8647,-472.5 "/>
<text text-anchor="middle" x="1970.3647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge28" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1860.6962,-472.7696C1880.3624,-594.4192 1939.3963,-999.3149 1872.8647,-1106 1856.8148,-1131.7364 1831.7772,-1150.8681 1804.8099,-1165.0222"/>
<polygon fill="#000000" stroke="#000000" points="1802.9751,-1162.0267 1795.6007,-1169.6339 1806.1094,-1168.2858 1802.9751,-1162.0267"/>
<text text-anchor="middle" x="1905.8647" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge23" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1242.6149,-532.1592C1366.8867,-513.0472 1579.7814,-480.3056 1718.9086,-458.909"/>
<polygon fill="#000000" stroke="#000000" points="1719.4443,-462.3678 1728.7961,-457.3884 1718.3802,-455.4492 1719.4443,-462.3678"/>
<text text-anchor="middle" x="1528.3647" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge8" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1242.7274,-555.0146C1253.4608,-553.5674 1260.3647,-551.0625 1260.3647,-547.5 1260.3647,-545.2178 1257.5313,-543.3696 1252.6729,-541.9555"/>
<polygon fill="#000000" stroke="#000000" points="1253.2169,-538.4953 1242.7274,-539.9854 1251.8567,-545.3619 1253.2169,-538.4953"/>
<text text-anchor="middle" x="1276.3647" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge6" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M487.341,-1301.4191C515.2397,-1240.0668 542.0577,-1171.6917 558.8647,-1106 585.6057,-1001.48 522.7923,-700.4398 596.8647,-622 626.3007,-590.8284 882.2212,-566.7828 1033.0158,-555.1674"/>
<polygon fill="#000000" stroke="#000000" points="1033.5354,-558.638 1043.2397,-554.3865 1033.0022,-551.6583 1033.5354,-558.638"/>
<text text-anchor="middle" x="581.8647" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge12" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M601.4602,-1536.6646C612.7218,-1529.6694 619.3647,-1520.2813 619.3647,-1508.5 619.3647,-1499.8481 615.7822,-1492.4869 609.4187,-1486.4162"/>
<polygon fill="#000000" stroke="#000000" points="611.5312,-1483.6256 601.4602,-1480.3354 607.2813,-1489.1879 611.5312,-1483.6256"/>
<text text-anchor="middle" x="635.3647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge29" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M601.6679,-1353.4003C639.4493,-1332.8338 679.2862,-1314.3004 718.8647,-1301 868.0341,-1250.8713 1316.8153,-1221.6435 1541.9946,-1209.759"/>
<polygon fill="#000000" stroke="#000000" points="1542.4137,-1213.242 1552.2168,-1209.2233 1542.0473,-1206.2516 1542.4137,-1213.242"/>
<text text-anchor="middle" x="880.8647" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- disease_extent -->
<g id="node19" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M221.8647,-714.5C221.8647,-714.5 537.8647,-714.5 537.8647,-714.5 543.8647,-714.5 549.8647,-720.5 549.8647,-726.5 549.8647,-726.5 549.8647,-1001.5 549.8647,-1001.5 549.8647,-1007.5 543.8647,-1013.5 537.8647,-1013.5 537.8647,-1013.5 221.8647,-1013.5 221.8647,-1013.5 215.8647,-1013.5 209.8647,-1007.5 209.8647,-1001.5 209.8647,-1001.5 209.8647,-726.5 209.8647,-726.5 209.8647,-720.5 215.8647,-714.5 221.8647,-714.5"/>
<text text-anchor="middle" x="271.3647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="332.8647,-714.5 332.8647,-1013.5 "/>
<text text-anchor="middle" x="343.3647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="353.8647,-714.5 353.8647,-1013.5 "/>
<text text-anchor="middle" x="441.3647" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="353.8647,-990.5 528.8647,-990.5 "/>
<text text-anchor="middle" x="441.3647" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="353.8647,-967.5 528.8647,-967.5 "/>
<text text-anchor="middle" x="441.3647" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="353.8647,-944.5 528.8647,-944.5 "/>
<text text-anchor="middle" x="441.3647" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="353.8647,-921.5 528.8647,-921.5 "/>
<text text-anchor="middle" x="441.3647" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="353.8647,-898.5 528.8647,-898.5 "/>
<text text-anchor="middle" x="441.3647" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="353.8647,-875.5 528.8647,-875.5 "/>
<text text-anchor="middle" x="441.3647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="353.8647,-852.5 528.8647,-852.5 "/>
<text text-anchor="middle" x="441.3647" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="353.8647,-829.5 528.8647,-829.5 "/>
<text text-anchor="middle" x="441.3647" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="353.8647,-806.5 528.8647,-806.5 "/>
<text text-anchor="middle" x="441.3647" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="353.8647,-783.5 528.8647,-783.5 "/>
<text text-anchor="middle" x="441.3647" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="353.8647,-760.5 528.8647,-760.5 "/>
<text text-anchor="middle" x="441.3647" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="353.8647,-737.5 528.8647,-737.5 "/>
<text text-anchor="middle" x="441.3647" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="528.8647,-714.5 528.8647,-1013.5 "/>
<text text-anchor="middle" x="539.3647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge7" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M416.5528,-714.1572C435.8066,-666.4864 464.7336,-618.5211 507.8647,-589 550.0445,-560.13 863.0853,-551.313 1033.3313,-548.6434"/>
<polygon fill="#000000" stroke="#000000" points="1033.3866,-552.143 1043.3321,-548.491 1033.2799,-545.1438 1033.3866,-552.143"/>
<text text-anchor="middle" x="535.8647" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge25" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M356.3174,-2333.3014C354.2026,-2258.9126 347.1973,-1970.6828 357.8647,-1734 357.989,-1731.2424 358.1215,-1728.4663 358.2617,-1725.675"/>
<polygon fill="#000000" stroke="#000000" points="361.7664,-1725.6783 358.802,-1715.5067 354.7762,-1725.3068 361.7664,-1725.6783"/>
<text text-anchor="middle" x="394.3647" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge33" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1795.5522,-1197.8645C1979.0779,-1187.6685 2316.5592,-1161.8155 2422.8647,-1106 2443.5637,-1095.132 2463.2629,-1081.4625 2481.7452,-1066.1799"/>
<polygon fill="#000000" stroke="#000000" points="2484.2222,-1068.6686 2489.5911,-1059.5349 2479.6981,-1063.327 2484.2222,-1068.6686"/>
<text text-anchor="middle" x="2433.8647" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge16" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1795.5176,-1200.9346C2104.288,-1193.9411 2897.2362,-1172.7756 2942.8647,-1139 3129.5792,-1000.7882 3153.7552,-683.8564 3156.5931,-580.6487"/>
<polygon fill="#000000" stroke="#000000" points="3160.0953,-580.5877 3156.8205,-570.5117 3153.097,-580.4307 3160.0953,-580.5877"/>
<text text-anchor="middle" x="3194.3647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge15" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1795.4558,-1198.1484C2099.4182,-1184.207 2870.8683,-1145.1273 2909.8647,-1106 2986.024,-1029.5849 2928.8647,-971.8865 2928.8647,-864 2928.8647,-864 2928.8647,-864 2928.8647,-438 2928.8647,-344.0277 3199.6665,-301.2354 3381.877,-283.0785"/>
<polygon fill="#000000" stroke="#000000" points="3382.2316,-286.5606 3391.8422,-282.1012 3381.5483,-279.5941 3382.2316,-286.5606"/>
<text text-anchor="middle" x="2969.3647" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_study -->
<g id="node23" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M618.3647,-760.5C618.3647,-760.5 1033.3647,-760.5 1033.3647,-760.5 1039.3647,-760.5 1045.3647,-766.5 1045.3647,-772.5 1045.3647,-772.5 1045.3647,-955.5 1045.3647,-955.5 1045.3647,-961.5 1039.3647,-967.5 1033.3647,-967.5 1033.3647,-967.5 618.3647,-967.5 618.3647,-967.5 612.3647,-967.5 606.3647,-961.5 606.3647,-955.5 606.3647,-955.5 606.3647,-772.5 606.3647,-772.5 606.3647,-766.5 612.3647,-760.5 618.3647,-760.5"/>
<text text-anchor="middle" x="647.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="689.3647,-760.5 689.3647,-967.5 "/>
<text text-anchor="middle" x="699.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="710.3647,-760.5 710.3647,-967.5 "/>
<text text-anchor="middle" x="867.3647" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="710.3647,-944.5 1024.3647,-944.5 "/>
<text text-anchor="middle" x="867.3647" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="710.3647,-921.5 1024.3647,-921.5 "/>
<text text-anchor="middle" x="867.3647" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="710.3647,-898.5 1024.3647,-898.5 "/>
<text text-anchor="middle" x="867.3647" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="710.3647,-875.5 1024.3647,-875.5 "/>
<text text-anchor="middle" x="867.3647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="710.3647,-852.5 1024.3647,-852.5 "/>
<text text-anchor="middle" x="867.3647" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="710.3647,-829.5 1024.3647,-829.5 "/>
<text text-anchor="middle" x="867.3647" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="710.3647,-806.5 1024.3647,-806.5 "/>
<text text-anchor="middle" x="867.3647" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="710.3647,-783.5 1024.3647,-783.5 "/>
<text text-anchor="middle" x="867.3647" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1024.3647,-760.5 1024.3647,-967.5 "/>
<text text-anchor="middle" x="1034.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge39" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1552.1357,-1193.6825C1397.057,-1179.5828 1139.0353,-1150.3145 1054.8647,-1106 996.1997,-1075.1138 944.1609,-1023.3729 904.575,-975.6435"/>
<polygon fill="#000000" stroke="#000000" points="907.1246,-973.2326 898.0806,-967.7138 901.709,-977.668 907.1246,-973.2326"/>
<text text-anchor="middle" x="1206.3647" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- off_treatment -->
<g id="node24" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1075.3647,-772C1075.3647,-772 1522.3647,-772 1522.3647,-772 1528.3647,-772 1534.3647,-778 1534.3647,-784 1534.3647,-784 1534.3647,-944 1534.3647,-944 1534.3647,-950 1528.3647,-956 1522.3647,-956 1522.3647,-956 1075.3647,-956 1075.3647,-956 1069.3647,-956 1063.3647,-950 1063.3647,-944 1063.3647,-944 1063.3647,-784 1063.3647,-784 1063.3647,-778 1069.3647,-772 1075.3647,-772"/>
<text text-anchor="middle" x="1120.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1178.3647,-772 1178.3647,-956 "/>
<text text-anchor="middle" x="1188.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1199.3647,-772 1199.3647,-956 "/>
<text text-anchor="middle" x="1356.3647" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1199.3647,-933 1513.3647,-933 "/>
<text text-anchor="middle" x="1356.3647" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1199.3647,-910 1513.3647,-910 "/>
<text text-anchor="middle" x="1356.3647" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1199.3647,-887 1513.3647,-887 "/>
<text text-anchor="middle" x="1356.3647" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1199.3647,-864 1513.3647,-864 "/>
<text text-anchor="middle" x="1356.3647" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1199.3647,-841 1513.3647,-841 "/>
<text text-anchor="middle" x="1356.3647" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1199.3647,-818 1513.3647,-818 "/>
<text text-anchor="middle" x="1356.3647" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1199.3647,-795 1513.3647,-795 "/>
<text text-anchor="middle" x="1356.3647" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1513.3647,-772 1513.3647,-956 "/>
<text text-anchor="middle" x="1523.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge22" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1608.706,-1157.3242C1587.5456,-1141.6245 1564.2726,-1123.5899 1543.8647,-1106 1492.0661,-1061.3542 1437.6453,-1008.2933 1393.2861,-963.2497"/>
<polygon fill="#000000" stroke="#000000" points="1395.7596,-960.7732 1386.255,-956.0919 1390.7657,-965.6786 1395.7596,-960.7732"/>
<text text-anchor="middle" x="1652.8647" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- demographic -->
<g id="node22" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M1505.8647,-1428C1505.8647,-1428 1841.8647,-1428 1841.8647,-1428 1847.8647,-1428 1853.8647,-1434 1853.8647,-1440 1853.8647,-1440 1853.8647,-1577 1853.8647,-1577 1853.8647,-1583 1847.8647,-1589 1841.8647,-1589 1841.8647,-1589 1505.8647,-1589 1505.8647,-1589 1499.8647,-1589 1493.8647,-1583 1493.8647,-1577 1493.8647,-1577 1493.8647,-1440 1493.8647,-1440 1493.8647,-1434 1499.8647,-1428 1505.8647,-1428"/>
<text text-anchor="middle" x="1548.8647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="1603.8647,-1428 1603.8647,-1589 "/>
<text text-anchor="middle" x="1614.3647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1624.8647,-1428 1624.8647,-1589 "/>
<text text-anchor="middle" x="1728.8647" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1624.8647,-1566 1832.8647,-1566 "/>
<text text-anchor="middle" x="1728.8647" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1624.8647,-1543 1832.8647,-1543 "/>
<text text-anchor="middle" x="1728.8647" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1624.8647,-1520 1832.8647,-1520 "/>
<text text-anchor="middle" x="1728.8647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1624.8647,-1497 1832.8647,-1497 "/>
<text text-anchor="middle" x="1728.8647" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1624.8647,-1474 1832.8647,-1474 "/>
<text text-anchor="middle" x="1728.8647" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1624.8647,-1451 1832.8647,-1451 "/>
<text text-anchor="middle" x="1728.8647" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="1832.8647,-1428 1832.8647,-1589 "/>
<text text-anchor="middle" x="1843.3647" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge32" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1673.8647,-1427.9659C1673.8647,-1375.0211 1673.8647,-1307.0604 1673.8647,-1259.8555"/>
<polygon fill="#000000" stroke="#000000" points="1677.3648,-1259.8138 1673.8647,-1249.8139 1670.3648,-1259.8139 1677.3648,-1259.8138"/>
<text text-anchor="middle" x="1700.8647" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge31" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1373.9128,-1404.974C1406.3134,-1369.3568 1445.0701,-1330.9441 1484.8647,-1301 1507.8245,-1283.7235 1534.2914,-1267.9406 1560.0112,-1254.3397"/>
<polygon fill="#000000" stroke="#000000" points="1561.8183,-1257.3448 1569.0705,-1249.621 1558.5846,-1251.1365 1561.8183,-1257.3448"/>
<text text-anchor="middle" x="1559.8647" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_site -->
<g id="node26" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M3867.3647,-403.5C3867.3647,-403.5 4184.3647,-403.5 4184.3647,-403.5 4190.3647,-403.5 4196.3647,-409.5 4196.3647,-415.5 4196.3647,-415.5 4196.3647,-460.5 4196.3647,-460.5 4196.3647,-466.5 4190.3647,-472.5 4184.3647,-472.5 4184.3647,-472.5 3867.3647,-472.5 3867.3647,-472.5 3861.3647,-472.5 3855.3647,-466.5 3855.3647,-460.5 3855.3647,-460.5 3855.3647,-415.5 3855.3647,-415.5 3855.3647,-409.5 3861.3647,-403.5 3867.3647,-403.5"/>
<text text-anchor="middle" x="3900.3647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="3945.3647,-403.5 3945.3647,-472.5 "/>
<text text-anchor="middle" x="3955.8647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3966.3647,-403.5 3966.3647,-472.5 "/>
<text text-anchor="middle" x="4070.8647" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="3966.3647,-449.5 4175.3647,-449.5 "/>
<text text-anchor="middle" x="4070.8647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="3966.3647,-426.5 4175.3647,-426.5 "/>
<text text-anchor="middle" x="4070.8647" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="4175.3647,-403.5 4175.3647,-472.5 "/>
<text text-anchor="middle" x="4185.8647" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge40" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3926.2863,-403.4988C3862.7058,-381.4699 3778.8036,-352.4 3705.7911,-327.1031"/>
<polygon fill="#000000" stroke="#000000" points="3706.6202,-323.6863 3696.0255,-323.7196 3704.3285,-330.3006 3706.6202,-323.6863"/>
<text text-anchor="middle" x="3900.3647" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- physical_exam -->
<g id="node27" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M547.8647,-2259.5C547.8647,-2259.5 863.8647,-2259.5 863.8647,-2259.5 869.8647,-2259.5 875.8647,-2265.5 875.8647,-2271.5 875.8647,-2271.5 875.8647,-2431.5 875.8647,-2431.5 875.8647,-2437.5 869.8647,-2443.5 863.8647,-2443.5 863.8647,-2443.5 547.8647,-2443.5 547.8647,-2443.5 541.8647,-2443.5 535.8647,-2437.5 535.8647,-2431.5 535.8647,-2431.5 535.8647,-2271.5 535.8647,-2271.5 535.8647,-2265.5 541.8647,-2259.5 547.8647,-2259.5"/>
<text text-anchor="middle" x="596.8647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="657.8647,-2259.5 657.8647,-2443.5 "/>
<text text-anchor="middle" x="668.3647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="678.8647,-2259.5 678.8647,-2443.5 "/>
<text text-anchor="middle" x="766.8647" y="-2428.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="678.8647,-2420.5 854.8647,-2420.5 "/>
<text text-anchor="middle" x="766.8647" y="-2405.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="678.8647,-2397.5 854.8647,-2397.5 "/>
<text text-anchor="middle" x="766.8647" y="-2382.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="678.8647,-2374.5 854.8647,-2374.5 "/>
<text text-anchor="middle" x="766.8647" y="-2359.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="678.8647,-2351.5 854.8647,-2351.5 "/>
<text text-anchor="middle" x="766.8647" y="-2336.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="678.8647,-2328.5 854.8647,-2328.5 "/>
<text text-anchor="middle" x="766.8647" y="-2313.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="678.8647,-2305.5 854.8647,-2305.5 "/>
<text text-anchor="middle" x="766.8647" y="-2290.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="678.8647,-2282.5 854.8647,-2282.5 "/>
<text text-anchor="middle" x="766.8647" y="-2267.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="854.8647,-2259.5 854.8647,-2443.5 "/>
<text text-anchor="middle" x="865.3647" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge3" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M708.5526,-2259.1881C714.9256,-2011.369 726.2045,-1344.9974 665.8647,-1268 504.2055,-1061.713 256.6905,-1315.2344 98.8647,-1106 -30.6743,-934.2663 -35.0531,-790.3414 98.8647,-622 139.4712,-570.9556 177.2447,-597.8701 241.8647,-589 391.4681,-568.4646 827.0614,-555.3162 1032.8027,-550.0801"/>
<polygon fill="#000000" stroke="#000000" points="1033.1152,-553.5734 1043.0235,-549.8217 1032.9382,-546.5756 1033.1152,-553.5734"/>
<text text-anchor="middle" x="676.8647" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge36" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M755.875,-2259.3522C824.6402,-2135.5454 955.1432,-1910.6482 1088.8647,-1734 1118.1299,-1695.3402 1152.4115,-1655.124 1184.2443,-1619.5428"/>
<polygon fill="#000000" stroke="#000000" points="1186.9199,-1621.8016 1190.9972,-1612.0227 1181.7117,-1617.1247 1186.9199,-1621.8016"/>
<text text-anchor="middle" x="1138.8647" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- agent_administration -->
<g id="node28" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M1932.3647,-622.5C1932.3647,-622.5 2401.3647,-622.5 2401.3647,-622.5 2407.3647,-622.5 2413.3647,-628.5 2413.3647,-634.5 2413.3647,-634.5 2413.3647,-1093.5 2413.3647,-1093.5 2413.3647,-1099.5 2407.3647,-1105.5 2401.3647,-1105.5 2401.3647,-1105.5 1932.3647,-1105.5 1932.3647,-1105.5 1926.3647,-1105.5 1920.3647,-1099.5 1920.3647,-1093.5 1920.3647,-1093.5 1920.3647,-634.5 1920.3647,-634.5 1920.3647,-628.5 1926.3647,-622.5 1932.3647,-622.5"/>
<text text-anchor="middle" x="2005.3647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="2090.3647,-622.5 2090.3647,-1105.5 "/>
<text text-anchor="middle" x="2100.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2111.3647,-622.5 2111.3647,-1105.5 "/>
<text text-anchor="middle" x="2251.8647" y="-1090.3" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-1082.5 2392.3647,-1082.5 "/>
<text text-anchor="middle" x="2251.8647" y="-1067.3" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-1059.5 2392.3647,-1059.5 "/>
<text text-anchor="middle" x="2251.8647" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-1036.5 2392.3647,-1036.5 "/>
<text text-anchor="middle" x="2251.8647" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-1013.5 2392.3647,-1013.5 "/>
<text text-anchor="middle" x="2251.8647" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-990.5 2392.3647,-990.5 "/>
<text text-anchor="middle" x="2251.8647" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-967.5 2392.3647,-967.5 "/>
<text text-anchor="middle" x="2251.8647" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-944.5 2392.3647,-944.5 "/>
<text text-anchor="middle" x="2251.8647" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-921.5 2392.3647,-921.5 "/>
<text text-anchor="middle" x="2251.8647" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-898.5 2392.3647,-898.5 "/>
<text text-anchor="middle" x="2251.8647" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-875.5 2392.3647,-875.5 "/>
<text text-anchor="middle" x="2251.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-852.5 2392.3647,-852.5 "/>
<text text-anchor="middle" x="2251.8647" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-829.5 2392.3647,-829.5 "/>
<text text-anchor="middle" x="2251.8647" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-806.5 2392.3647,-806.5 "/>
<text text-anchor="middle" x="2251.8647" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-783.5 2392.3647,-783.5 "/>
<text text-anchor="middle" x="2251.8647" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-760.5 2392.3647,-760.5 "/>
<text text-anchor="middle" x="2251.8647" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-737.5 2392.3647,-737.5 "/>
<text text-anchor="middle" x="2251.8647" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-714.5 2392.3647,-714.5 "/>
<text text-anchor="middle" x="2251.8647" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-691.5 2392.3647,-691.5 "/>
<text text-anchor="middle" x="2251.8647" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-668.5 2392.3647,-668.5 "/>
<text text-anchor="middle" x="2251.8647" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="2111.3647,-645.5 2392.3647,-645.5 "/>
<text text-anchor="middle" x="2251.8647" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2392.3647,-622.5 2392.3647,-1105.5 "/>
<text text-anchor="middle" x="2402.8647" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge38" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2413.4624,-627.82C2416.5889,-625.8381 2419.7235,-623.897 2422.8647,-622 2457.279,-601.2165 2498.2774,-585.2684 2535.3837,-573.5626"/>
<polygon fill="#000000" stroke="#000000" points="2536.7063,-576.8175 2545.2306,-570.5257 2534.6432,-570.1284 2536.7063,-576.8175"/>
<text text-anchor="middle" x="2521.8647" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge5" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1920.2041,-645.2547C1904.7034,-636.5362 1888.8807,-628.6809 1872.8647,-622 1763.5837,-576.4146 1428.097,-557.7497 1252.5391,-550.9454"/>
<polygon fill="#000000" stroke="#000000" points="1252.6247,-547.4462 1242.4986,-550.5624 1252.3579,-554.4411 1252.6247,-547.4462"/>
<text text-anchor="middle" x="1829.8647" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
</g>
</svg>
</div>
