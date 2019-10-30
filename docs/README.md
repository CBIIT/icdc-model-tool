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
<svg width="3283pt" height="2966pt"
 viewBox="0.00 0.00 3283.00 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 3279,-2962 3279,4 -4,4"/>
<!-- enrollment -->
<g id="node1" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M2178.5,-1468.5C2178.5,-1468.5 2527.5,-1468.5 2527.5,-1468.5 2533.5,-1468.5 2539.5,-1474.5 2539.5,-1480.5 2539.5,-1480.5 2539.5,-1663.5 2539.5,-1663.5 2539.5,-1669.5 2533.5,-1675.5 2527.5,-1675.5 2527.5,-1675.5 2178.5,-1675.5 2178.5,-1675.5 2172.5,-1675.5 2166.5,-1669.5 2166.5,-1663.5 2166.5,-1663.5 2166.5,-1480.5 2166.5,-1480.5 2166.5,-1474.5 2172.5,-1468.5 2178.5,-1468.5"/>
<text text-anchor="middle" x="2214" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="2261.5,-1468.5 2261.5,-1675.5 "/>
<text text-anchor="middle" x="2272" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2282.5,-1468.5 2282.5,-1675.5 "/>
<text text-anchor="middle" x="2400.5" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1652.5 2518.5,-1652.5 "/>
<text text-anchor="middle" x="2400.5" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1629.5 2518.5,-1629.5 "/>
<text text-anchor="middle" x="2400.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1606.5 2518.5,-1606.5 "/>
<text text-anchor="middle" x="2400.5" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1583.5 2518.5,-1583.5 "/>
<text text-anchor="middle" x="2400.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1560.5 2518.5,-1560.5 "/>
<text text-anchor="middle" x="2400.5" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1537.5 2518.5,-1537.5 "/>
<text text-anchor="middle" x="2400.5" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1514.5 2518.5,-1514.5 "/>
<text text-anchor="middle" x="2400.5" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="2282.5,-1491.5 2518.5,-1491.5 "/>
<text text-anchor="middle" x="2400.5" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2518.5,-1468.5 2518.5,-1675.5 "/>
<text text-anchor="middle" x="2529" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node4" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M2232.5,-1065.5C2232.5,-1065.5 2451.5,-1065.5 2451.5,-1065.5 2457.5,-1065.5 2463.5,-1071.5 2463.5,-1077.5 2463.5,-1077.5 2463.5,-1145.5 2463.5,-1145.5 2463.5,-1151.5 2457.5,-1157.5 2451.5,-1157.5 2451.5,-1157.5 2232.5,-1157.5 2232.5,-1157.5 2226.5,-1157.5 2220.5,-1151.5 2220.5,-1145.5 2220.5,-1145.5 2220.5,-1077.5 2220.5,-1077.5 2220.5,-1071.5 2226.5,-1065.5 2232.5,-1065.5"/>
<text text-anchor="middle" x="2245" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="2269.5,-1065.5 2269.5,-1157.5 "/>
<text text-anchor="middle" x="2280" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2290.5,-1065.5 2290.5,-1157.5 "/>
<text text-anchor="middle" x="2366.5" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2290.5,-1134.5 2442.5,-1134.5 "/>
<text text-anchor="middle" x="2366.5" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="2290.5,-1111.5 2442.5,-1111.5 "/>
<text text-anchor="middle" x="2366.5" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="2290.5,-1088.5 2442.5,-1088.5 "/>
<text text-anchor="middle" x="2366.5" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="2442.5,-1065.5 2442.5,-1157.5 "/>
<text text-anchor="middle" x="2453" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge17" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2350.5245,-1468.3678C2348.3039,-1375.4027 2345.1285,-1242.4705 2343.3464,-1167.8642"/>
<polygon fill="#000000" stroke="#000000" points="2346.8423,-1167.6478 2343.1044,-1157.7343 2339.8443,-1167.815 2346.8423,-1167.6478"/>
<text text-anchor="middle" x="2376" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- prior_therapy -->
<g id="node2" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M2624,-1727.5C2624,-1727.5 3080,-1727.5 3080,-1727.5 3086,-1727.5 3092,-1733.5 3092,-1739.5 3092,-1739.5 3092,-2313.5 3092,-2313.5 3092,-2319.5 3086,-2325.5 3080,-2325.5 3080,-2325.5 2624,-2325.5 2624,-2325.5 2618,-2325.5 2612,-2319.5 2612,-2313.5 2612,-2313.5 2612,-1739.5 2612,-1739.5 2612,-1733.5 2618,-1727.5 2624,-1727.5"/>
<text text-anchor="middle" x="2669.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="2727,-1727.5 2727,-2325.5 "/>
<text text-anchor="middle" x="2737.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2748,-1727.5 2748,-2325.5 "/>
<text text-anchor="middle" x="2909.5" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="2748,-2302.5 3071,-2302.5 "/>
<text text-anchor="middle" x="2909.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="2748,-2279.5 3071,-2279.5 "/>
<text text-anchor="middle" x="2909.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748,-2256.5 3071,-2256.5 "/>
<text text-anchor="middle" x="2909.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2748,-2233.5 3071,-2233.5 "/>
<text text-anchor="middle" x="2909.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="2748,-2210.5 3071,-2210.5 "/>
<text text-anchor="middle" x="2909.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2748,-2187.5 3071,-2187.5 "/>
<text text-anchor="middle" x="2909.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748,-2164.5 3071,-2164.5 "/>
<text text-anchor="middle" x="2909.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="2748,-2141.5 3071,-2141.5 "/>
<text text-anchor="middle" x="2909.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748,-2118.5 3071,-2118.5 "/>
<text text-anchor="middle" x="2909.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="2748,-2095.5 3071,-2095.5 "/>
<text text-anchor="middle" x="2909.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748,-2072.5 3071,-2072.5 "/>
<text text-anchor="middle" x="2909.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="2748,-2049.5 3071,-2049.5 "/>
<text text-anchor="middle" x="2909.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="2748,-2026.5 3071,-2026.5 "/>
<text text-anchor="middle" x="2909.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2748,-2003.5 3071,-2003.5 "/>
<text text-anchor="middle" x="2909.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="2748,-1980.5 3071,-1980.5 "/>
<text text-anchor="middle" x="2909.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="2748,-1957.5 3071,-1957.5 "/>
<text text-anchor="middle" x="2909.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="2748,-1934.5 3071,-1934.5 "/>
<text text-anchor="middle" x="2909.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="2748,-1911.5 3071,-1911.5 "/>
<text text-anchor="middle" x="2909.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748,-1888.5 3071,-1888.5 "/>
<text text-anchor="middle" x="2909.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748,-1865.5 3071,-1865.5 "/>
<text text-anchor="middle" x="2909.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="2748,-1842.5 3071,-1842.5 "/>
<text text-anchor="middle" x="2909.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="2748,-1819.5 3071,-1819.5 "/>
<text text-anchor="middle" x="2909.5" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="2748,-1796.5 3071,-1796.5 "/>
<text text-anchor="middle" x="2909.5" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="2748,-1773.5 3071,-1773.5 "/>
<text text-anchor="middle" x="2909.5" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="2748,-1750.5 3071,-1750.5 "/>
<text text-anchor="middle" x="2909.5" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="3071,-1727.5 3071,-2325.5 "/>
<text text-anchor="middle" x="3081.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge26" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2611.7796,-1734.7635C2608.86,-1732.1411 2605.9331,-1729.5524 2603,-1727 2584.7198,-1711.0927 2564.6271,-1695.7571 2544.0219,-1681.3278"/>
<polygon fill="#000000" stroke="#000000" points="2546.0064,-1678.4448 2535.7922,-1675.6303 2542.0219,-1684.2002 2546.0064,-1678.4448"/>
<text text-anchor="middle" x="2628" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge34" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M3092.2384,-2064.6912C3103.4387,-2055.0507 3110,-2042.3203 3110,-2026.5 3110,-2014.3876 3106.1539,-2004.0864 3099.3244,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="3101.719,-1993.0385 3092.2384,-1988.3088 3096.7002,-1997.9183 3101.719,-1993.0385"/>
<text text-anchor="middle" x="3126" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- vital_signs -->
<g id="node3" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M983.5,-1865.5C983.5,-1865.5 1270.5,-1865.5 1270.5,-1865.5 1276.5,-1865.5 1282.5,-1871.5 1282.5,-1877.5 1282.5,-1877.5 1282.5,-2175.5 1282.5,-2175.5 1282.5,-2181.5 1276.5,-2187.5 1270.5,-2187.5 1270.5,-2187.5 983.5,-2187.5 983.5,-2187.5 977.5,-2187.5 971.5,-2181.5 971.5,-2175.5 971.5,-2175.5 971.5,-1877.5 971.5,-1877.5 971.5,-1871.5 977.5,-1865.5 983.5,-1865.5"/>
<text text-anchor="middle" x="1018" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1064.5,-1865.5 1064.5,-2187.5 "/>
<text text-anchor="middle" x="1075" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1085.5,-1865.5 1085.5,-2187.5 "/>
<text text-anchor="middle" x="1173.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1085.5,-2164.5 1261.5,-2164.5 "/>
<text text-anchor="middle" x="1173.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1085.5,-2141.5 1261.5,-2141.5 "/>
<text text-anchor="middle" x="1173.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1085.5,-2118.5 1261.5,-2118.5 "/>
<text text-anchor="middle" x="1173.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1085.5,-2095.5 1261.5,-2095.5 "/>
<text text-anchor="middle" x="1173.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1085.5,-2072.5 1261.5,-2072.5 "/>
<text text-anchor="middle" x="1173.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1085.5,-2049.5 1261.5,-2049.5 "/>
<text text-anchor="middle" x="1173.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1085.5,-2026.5 1261.5,-2026.5 "/>
<text text-anchor="middle" x="1173.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1085.5,-2003.5 1261.5,-2003.5 "/>
<text text-anchor="middle" x="1173.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1085.5,-1980.5 1261.5,-1980.5 "/>
<text text-anchor="middle" x="1173.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1085.5,-1957.5 1261.5,-1957.5 "/>
<text text-anchor="middle" x="1173.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1085.5,-1934.5 1261.5,-1934.5 "/>
<text text-anchor="middle" x="1173.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1085.5,-1911.5 1261.5,-1911.5 "/>
<text text-anchor="middle" x="1173.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1085.5,-1888.5 1261.5,-1888.5 "/>
<text text-anchor="middle" x="1173.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1261.5,-1865.5 1261.5,-2187.5 "/>
<text text-anchor="middle" x="1272" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit -->
<g id="node20" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1115.5,-1549C1115.5,-1549 1290.5,-1549 1290.5,-1549 1296.5,-1549 1302.5,-1555 1302.5,-1561 1302.5,-1561 1302.5,-1583 1302.5,-1583 1302.5,-1589 1296.5,-1595 1290.5,-1595 1290.5,-1595 1115.5,-1595 1115.5,-1595 1109.5,-1595 1103.5,-1589 1103.5,-1583 1103.5,-1583 1103.5,-1561 1103.5,-1561 1103.5,-1555 1109.5,-1549 1115.5,-1549"/>
<text text-anchor="middle" x="1127" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1150.5,-1549 1150.5,-1595 "/>
<text text-anchor="middle" x="1161" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1171.5,-1549 1171.5,-1595 "/>
<text text-anchor="middle" x="1226.5" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1171.5,-1572 1281.5,-1572 "/>
<text text-anchor="middle" x="1226.5" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1281.5,-1549 1281.5,-1595 "/>
<text text-anchor="middle" x="1292" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge7" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1153.9552,-1865.3007C1169.7613,-1770.7762 1188.3594,-1659.5546 1197.4424,-1605.236"/>
<polygon fill="#000000" stroke="#000000" points="1200.9312,-1605.5932 1199.1285,-1595.1528 1194.027,-1604.4386 1200.9312,-1605.5932"/>
<text text-anchor="middle" x="1209" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- off_study -->
<g id="node6" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M2624.5,-714.5C2624.5,-714.5 3039.5,-714.5 3039.5,-714.5 3045.5,-714.5 3051.5,-720.5 3051.5,-726.5 3051.5,-726.5 3051.5,-909.5 3051.5,-909.5 3051.5,-915.5 3045.5,-921.5 3039.5,-921.5 3039.5,-921.5 2624.5,-921.5 2624.5,-921.5 2618.5,-921.5 2612.5,-915.5 2612.5,-909.5 2612.5,-909.5 2612.5,-726.5 2612.5,-726.5 2612.5,-720.5 2618.5,-714.5 2624.5,-714.5"/>
<text text-anchor="middle" x="2654" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="2695.5,-714.5 2695.5,-921.5 "/>
<text text-anchor="middle" x="2706" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2716.5,-714.5 2716.5,-921.5 "/>
<text text-anchor="middle" x="2873.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2716.5,-898.5 3030.5,-898.5 "/>
<text text-anchor="middle" x="2873.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2716.5,-875.5 3030.5,-875.5 "/>
<text text-anchor="middle" x="2873.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2716.5,-852.5 3030.5,-852.5 "/>
<text text-anchor="middle" x="2873.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="2716.5,-829.5 3030.5,-829.5 "/>
<text text-anchor="middle" x="2873.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="2716.5,-806.5 3030.5,-806.5 "/>
<text text-anchor="middle" x="2873.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2716.5,-783.5 3030.5,-783.5 "/>
<text text-anchor="middle" x="2873.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2716.5,-760.5 3030.5,-760.5 "/>
<text text-anchor="middle" x="2873.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2716.5,-737.5 3030.5,-737.5 "/>
<text text-anchor="middle" x="2873.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="3030.5,-714.5 3030.5,-921.5 "/>
<text text-anchor="middle" x="3041" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge1" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M2463.5382,-1094.5083C2507.8104,-1084.8781 2557.0154,-1069.9632 2598,-1047 2651.5569,-1016.9927 2701.5728,-971.546 2741.5032,-929.0279"/>
<polygon fill="#000000" stroke="#000000" points="2744.0867,-931.3894 2748.3308,-921.6817 2738.9592,-926.6239 2744.0867,-931.3894"/>
<text text-anchor="middle" x="2674.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- cohort -->
<g id="node7" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M1998.5,-524.5C1998.5,-524.5 2231.5,-524.5 2231.5,-524.5 2237.5,-524.5 2243.5,-530.5 2243.5,-536.5 2243.5,-536.5 2243.5,-558.5 2243.5,-558.5 2243.5,-564.5 2237.5,-570.5 2231.5,-570.5 2231.5,-570.5 1998.5,-570.5 1998.5,-570.5 1992.5,-570.5 1986.5,-564.5 1986.5,-558.5 1986.5,-558.5 1986.5,-536.5 1986.5,-536.5 1986.5,-530.5 1992.5,-524.5 1998.5,-524.5"/>
<text text-anchor="middle" x="2018" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="2049.5,-524.5 2049.5,-570.5 "/>
<text text-anchor="middle" x="2060" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2070.5,-524.5 2070.5,-570.5 "/>
<text text-anchor="middle" x="2146.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="2070.5,-547.5 2222.5,-547.5 "/>
<text text-anchor="middle" x="2146.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2222.5,-524.5 2222.5,-570.5 "/>
<text text-anchor="middle" x="2233" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge12" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M2439.5044,-1065.4885C2445.1204,-1059.9447 2450.0696,-1053.7991 2454,-1047 2477.6367,-1006.1117 2476.8277,-658.6176 2447,-622 2422.1794,-591.5293 2333.4697,-572.6072 2253.9906,-561.4605"/>
<polygon fill="#000000" stroke="#000000" points="2254.2313,-557.9609 2243.849,-560.0726 2253.2821,-564.8962 2254.2313,-557.9609"/>
<text text-anchor="middle" x="2510.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study -->
<g id="node13" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M2344,-190.5C2344,-190.5 2624,-190.5 2624,-190.5 2630,-190.5 2636,-196.5 2636,-202.5 2636,-202.5 2636,-339.5 2636,-339.5 2636,-345.5 2630,-351.5 2624,-351.5 2624,-351.5 2344,-351.5 2344,-351.5 2338,-351.5 2332,-345.5 2332,-339.5 2332,-339.5 2332,-202.5 2332,-202.5 2332,-196.5 2338,-190.5 2344,-190.5"/>
<text text-anchor="middle" x="2360" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="2388,-190.5 2388,-351.5 "/>
<text text-anchor="middle" x="2398.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2409,-190.5 2409,-351.5 "/>
<text text-anchor="middle" x="2512" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="2409,-328.5 2615,-328.5 "/>
<text text-anchor="middle" x="2512" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="2409,-305.5 2615,-305.5 "/>
<text text-anchor="middle" x="2512" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="2409,-282.5 2615,-282.5 "/>
<text text-anchor="middle" x="2512" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="2409,-259.5 2615,-259.5 "/>
<text text-anchor="middle" x="2512" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="2409,-236.5 2615,-236.5 "/>
<text text-anchor="middle" x="2512" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="2409,-213.5 2615,-213.5 "/>
<text text-anchor="middle" x="2512" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="2615,-190.5 2615,-351.5 "/>
<text text-anchor="middle" x="2625.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge11" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2463.7448,-1079.916C2498.1483,-1065.2648 2532.3463,-1044.1606 2555,-1014 2607.8853,-943.5897 2584,-906.0595 2584,-818 2584,-818 2584,-818 2584,-438 2584,-410.7619 2574.087,-384.1208 2560.5031,-360.4009"/>
<polygon fill="#000000" stroke="#000000" points="2563.4889,-358.5743 2555.344,-351.7985 2557.4857,-362.1746 2563.4889,-358.5743"/>
<text text-anchor="middle" x="2624.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_treatment -->
<g id="node25" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1979.5,-726C1979.5,-726 2426.5,-726 2426.5,-726 2432.5,-726 2438.5,-732 2438.5,-738 2438.5,-738 2438.5,-898 2438.5,-898 2438.5,-904 2432.5,-910 2426.5,-910 2426.5,-910 1979.5,-910 1979.5,-910 1973.5,-910 1967.5,-904 1967.5,-898 1967.5,-898 1967.5,-738 1967.5,-738 1967.5,-732 1973.5,-726 1979.5,-726"/>
<text text-anchor="middle" x="2025" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="2082.5,-726 2082.5,-910 "/>
<text text-anchor="middle" x="2093" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2103.5,-726 2103.5,-910 "/>
<text text-anchor="middle" x="2260.5" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2103.5,-887 2417.5,-887 "/>
<text text-anchor="middle" x="2260.5" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2103.5,-864 2417.5,-864 "/>
<text text-anchor="middle" x="2260.5" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2103.5,-841 2417.5,-841 "/>
<text text-anchor="middle" x="2260.5" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2103.5,-818 2417.5,-818 "/>
<text text-anchor="middle" x="2260.5" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2103.5,-795 2417.5,-795 "/>
<text text-anchor="middle" x="2260.5" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2103.5,-772 2417.5,-772 "/>
<text text-anchor="middle" x="2260.5" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2103.5,-749 2417.5,-749 "/>
<text text-anchor="middle" x="2260.5" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2417.5,-726 2417.5,-910 "/>
<text text-anchor="middle" x="2428" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge41" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M2320.1283,-1065.3178C2301.631,-1026.2604 2274.4609,-968.8906 2250.945,-919.2363"/>
<polygon fill="#000000" stroke="#000000" points="2254.0429,-917.6004 2246.5995,-910.0607 2247.7165,-920.5965 2254.0429,-917.6004"/>
<text text-anchor="middle" x="2379" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- adverse_event -->
<g id="node28" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1492.5,-622.5C1492.5,-622.5 1887.5,-622.5 1887.5,-622.5 1893.5,-622.5 1899.5,-628.5 1899.5,-634.5 1899.5,-634.5 1899.5,-1001.5 1899.5,-1001.5 1899.5,-1007.5 1893.5,-1013.5 1887.5,-1013.5 1887.5,-1013.5 1492.5,-1013.5 1492.5,-1013.5 1486.5,-1013.5 1480.5,-1007.5 1480.5,-1001.5 1480.5,-1001.5 1480.5,-634.5 1480.5,-634.5 1480.5,-628.5 1486.5,-622.5 1492.5,-622.5"/>
<text text-anchor="middle" x="1540.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1600.5,-622.5 1600.5,-1013.5 "/>
<text text-anchor="middle" x="1611" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1621.5,-622.5 1621.5,-1013.5 "/>
<text text-anchor="middle" x="1750" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1621.5,-990.5 1878.5,-990.5 "/>
<text text-anchor="middle" x="1750" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1621.5,-967.5 1878.5,-967.5 "/>
<text text-anchor="middle" x="1750" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1621.5,-944.5 1878.5,-944.5 "/>
<text text-anchor="middle" x="1750" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1621.5,-921.5 1878.5,-921.5 "/>
<text text-anchor="middle" x="1750" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1621.5,-898.5 1878.5,-898.5 "/>
<text text-anchor="middle" x="1750" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1621.5,-875.5 1878.5,-875.5 "/>
<text text-anchor="middle" x="1750" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1621.5,-852.5 1878.5,-852.5 "/>
<text text-anchor="middle" x="1750" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1621.5,-829.5 1878.5,-829.5 "/>
<text text-anchor="middle" x="1750" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1621.5,-806.5 1878.5,-806.5 "/>
<text text-anchor="middle" x="1750" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1621.5,-783.5 1878.5,-783.5 "/>
<text text-anchor="middle" x="1750" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1621.5,-760.5 1878.5,-760.5 "/>
<text text-anchor="middle" x="1750" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1621.5,-737.5 1878.5,-737.5 "/>
<text text-anchor="middle" x="1750" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1621.5,-714.5 1878.5,-714.5 "/>
<text text-anchor="middle" x="1750" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1621.5,-691.5 1878.5,-691.5 "/>
<text text-anchor="middle" x="1750" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1621.5,-668.5 1878.5,-668.5 "/>
<text text-anchor="middle" x="1750" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1621.5,-645.5 1878.5,-645.5 "/>
<text text-anchor="middle" x="1750" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1878.5,-622.5 1878.5,-1013.5 "/>
<text text-anchor="middle" x="1889" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge15" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2220.2124,-1092.7449C2142.8653,-1077.9056 2042.0503,-1053.0455 1959,-1014 1942.0785,-1006.0445 1925.1368,-996.9685 1908.4505,-987.1825"/>
<polygon fill="#000000" stroke="#000000" points="1910.1323,-984.1105 1899.7493,-982.0024 1906.5515,-990.1253 1910.1323,-984.1105"/>
<text text-anchor="middle" x="2109" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- assay -->
<g id="node5" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M2204,-2662.5C2204,-2662.5 2236,-2662.5 2236,-2662.5 2242,-2662.5 2248,-2668.5 2248,-2674.5 2248,-2674.5 2248,-2686.5 2248,-2686.5 2248,-2692.5 2242,-2698.5 2236,-2698.5 2236,-2698.5 2204,-2698.5 2204,-2698.5 2198,-2698.5 2192,-2692.5 2192,-2686.5 2192,-2686.5 2192,-2674.5 2192,-2674.5 2192,-2668.5 2198,-2662.5 2204,-2662.5"/>
<text text-anchor="middle" x="2220" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- sample -->
<g id="node27" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M1312.5,-1796.5C1312.5,-1796.5 1735.5,-1796.5 1735.5,-1796.5 1741.5,-1796.5 1747.5,-1802.5 1747.5,-1808.5 1747.5,-1808.5 1747.5,-2244.5 1747.5,-2244.5 1747.5,-2250.5 1741.5,-2256.5 1735.5,-2256.5 1735.5,-2256.5 1312.5,-2256.5 1312.5,-2256.5 1306.5,-2256.5 1300.5,-2250.5 1300.5,-2244.5 1300.5,-2244.5 1300.5,-1808.5 1300.5,-1808.5 1300.5,-1802.5 1306.5,-1796.5 1312.5,-1796.5"/>
<text text-anchor="middle" x="1334.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="1368.5,-1796.5 1368.5,-2256.5 "/>
<text text-anchor="middle" x="1379" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1389.5,-1796.5 1389.5,-2256.5 "/>
<text text-anchor="middle" x="1558" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1389.5,-2233.5 1726.5,-2233.5 "/>
<text text-anchor="middle" x="1558" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1389.5,-2210.5 1726.5,-2210.5 "/>
<text text-anchor="middle" x="1558" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1389.5,-2187.5 1726.5,-2187.5 "/>
<text text-anchor="middle" x="1558" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1389.5,-2164.5 1726.5,-2164.5 "/>
<text text-anchor="middle" x="1558" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1389.5,-2141.5 1726.5,-2141.5 "/>
<text text-anchor="middle" x="1558" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1389.5,-2118.5 1726.5,-2118.5 "/>
<text text-anchor="middle" x="1558" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="1389.5,-2095.5 1726.5,-2095.5 "/>
<text text-anchor="middle" x="1558" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1389.5,-2072.5 1726.5,-2072.5 "/>
<text text-anchor="middle" x="1558" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="1389.5,-2049.5 1726.5,-2049.5 "/>
<text text-anchor="middle" x="1558" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1389.5,-2026.5 1726.5,-2026.5 "/>
<text text-anchor="middle" x="1558" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="1389.5,-2003.5 1726.5,-2003.5 "/>
<text text-anchor="middle" x="1558" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1389.5,-1980.5 1726.5,-1980.5 "/>
<text text-anchor="middle" x="1558" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="1389.5,-1957.5 1726.5,-1957.5 "/>
<text text-anchor="middle" x="1558" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_site</text>
<polyline fill="none" stroke="#000000" points="1389.5,-1934.5 1726.5,-1934.5 "/>
<text text-anchor="middle" x="1558" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1389.5,-1911.5 1726.5,-1911.5 "/>
<text text-anchor="middle" x="1558" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">specific_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1389.5,-1888.5 1726.5,-1888.5 "/>
<text text-anchor="middle" x="1558" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="1389.5,-1865.5 1726.5,-1865.5 "/>
<text text-anchor="middle" x="1558" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="1389.5,-1842.5 1726.5,-1842.5 "/>
<text text-anchor="middle" x="1558" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="1389.5,-1819.5 1726.5,-1819.5 "/>
<text text-anchor="middle" x="1558" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1726.5,-1796.5 1726.5,-2256.5 "/>
<text text-anchor="middle" x="1737" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge39" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2196.075,-2662.37C2190.392,-2657.0184 2184.8646,-2650.7636 2181,-2644 2113.2224,-2525.3801 2218.0661,-2432.5141 2114,-2344 2061.9438,-2299.7233 1868.942,-2354.8696 1807,-2326 1773.0727,-2310.1873 1741.1917,-2288.3267 1711.9378,-2263.5511"/>
<polygon fill="#000000" stroke="#000000" points="1714.0171,-2260.7225 1704.1587,-2256.8415 1709.4452,-2266.0232 1714.0171,-2260.7225"/>
<text text-anchor="middle" x="2217.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge10" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2109.5367,-524.3565C2103.6705,-493.4235 2098.4354,-438.3995 2125,-403 2150.3523,-369.216 2239.1581,-336.4128 2322.0936,-311.9581"/>
<polygon fill="#000000" stroke="#000000" points="2323.2935,-315.254 2331.9129,-309.0931 2321.3328,-308.5342 2323.2935,-315.254"/>
<text text-anchor="middle" x="2165.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_arm -->
<g id="node19" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M1697.5,-403.5C1697.5,-403.5 2066.5,-403.5 2066.5,-403.5 2072.5,-403.5 2078.5,-409.5 2078.5,-415.5 2078.5,-415.5 2078.5,-460.5 2078.5,-460.5 2078.5,-466.5 2072.5,-472.5 2066.5,-472.5 2066.5,-472.5 1697.5,-472.5 1697.5,-472.5 1691.5,-472.5 1685.5,-466.5 1685.5,-460.5 1685.5,-460.5 1685.5,-415.5 1685.5,-415.5 1685.5,-409.5 1691.5,-403.5 1697.5,-403.5"/>
<text text-anchor="middle" x="1731.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="1777.5,-403.5 1777.5,-472.5 "/>
<text text-anchor="middle" x="1788" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1798.5,-403.5 1798.5,-472.5 "/>
<text text-anchor="middle" x="1928" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="1798.5,-449.5 2057.5,-449.5 "/>
<text text-anchor="middle" x="1928" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="1798.5,-426.5 2057.5,-426.5 "/>
<text text-anchor="middle" x="1928" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">arm_description</text>
<polyline fill="none" stroke="#000000" points="2057.5,-403.5 2057.5,-472.5 "/>
<text text-anchor="middle" x="2068" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge9" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2061.0492,-524.4447C2047.5873,-518.5512 2033.2217,-512.1415 2020,-506 2000.3431,-496.8694 1979.2819,-486.6947 1959.6818,-477.0553"/>
<polygon fill="#000000" stroke="#000000" points="1961.0075,-473.8066 1950.4908,-472.522 1957.911,-480.0845 1961.0075,-473.8066"/>
<text text-anchor="middle" x="2060.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- program -->
<g id="node8" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M2330,-.5C2330,-.5 2638,-.5 2638,-.5 2644,-.5 2650,-6.5 2650,-12.5 2650,-12.5 2650,-126.5 2650,-126.5 2650,-132.5 2644,-138.5 2638,-138.5 2638,-138.5 2330,-138.5 2330,-138.5 2324,-138.5 2318,-132.5 2318,-126.5 2318,-126.5 2318,-12.5 2318,-12.5 2318,-6.5 2324,-.5 2330,-.5"/>
<text text-anchor="middle" x="2357" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="2396,-.5 2396,-138.5 "/>
<text text-anchor="middle" x="2406.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2417,-.5 2417,-138.5 "/>
<text text-anchor="middle" x="2523" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="2417,-115.5 2629,-115.5 "/>
<text text-anchor="middle" x="2523" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="2417,-92.5 2629,-92.5 "/>
<text text-anchor="middle" x="2523" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="2417,-69.5 2629,-69.5 "/>
<text text-anchor="middle" x="2523" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="2417,-46.5 2629,-46.5 "/>
<text text-anchor="middle" x="2523" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="2417,-23.5 2629,-23.5 "/>
<text text-anchor="middle" x="2523" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="2629,-.5 2629,-138.5 "/>
<text text-anchor="middle" x="2639.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis -->
<g id="node9" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M2274.5,-2344.5C2274.5,-2344.5 2617.5,-2344.5 2617.5,-2344.5 2623.5,-2344.5 2629.5,-2350.5 2629.5,-2356.5 2629.5,-2356.5 2629.5,-2631.5 2629.5,-2631.5 2629.5,-2637.5 2623.5,-2643.5 2617.5,-2643.5 2617.5,-2643.5 2274.5,-2643.5 2274.5,-2643.5 2268.5,-2643.5 2262.5,-2637.5 2262.5,-2631.5 2262.5,-2631.5 2262.5,-2356.5 2262.5,-2356.5 2262.5,-2350.5 2268.5,-2344.5 2274.5,-2344.5"/>
<text text-anchor="middle" x="2304.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2346.5,-2344.5 2346.5,-2643.5 "/>
<text text-anchor="middle" x="2357" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2367.5,-2344.5 2367.5,-2643.5 "/>
<text text-anchor="middle" x="2488" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2367.5,-2620.5 2608.5,-2620.5 "/>
<text text-anchor="middle" x="2488" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2367.5,-2597.5 2608.5,-2597.5 "/>
<text text-anchor="middle" x="2488" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="2367.5,-2574.5 2608.5,-2574.5 "/>
<text text-anchor="middle" x="2488" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="2367.5,-2551.5 2608.5,-2551.5 "/>
<text text-anchor="middle" x="2488" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2367.5,-2528.5 2608.5,-2528.5 "/>
<text text-anchor="middle" x="2488" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="2367.5,-2505.5 2608.5,-2505.5 "/>
<text text-anchor="middle" x="2488" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2367.5,-2482.5 2608.5,-2482.5 "/>
<text text-anchor="middle" x="2488" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="2367.5,-2459.5 2608.5,-2459.5 "/>
<text text-anchor="middle" x="2488" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2367.5,-2436.5 2608.5,-2436.5 "/>
<text text-anchor="middle" x="2488" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2367.5,-2413.5 2608.5,-2413.5 "/>
<text text-anchor="middle" x="2488" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2367.5,-2390.5 2608.5,-2390.5 "/>
<text text-anchor="middle" x="2488" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2367.5,-2367.5 2608.5,-2367.5 "/>
<text text-anchor="middle" x="2488" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2608.5,-2344.5 2608.5,-2643.5 "/>
<text text-anchor="middle" x="2619" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge23" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2629.79,-2475.7714C2816.5354,-2453.0044 3087.1543,-2406.8477 3151,-2326 3192.2481,-2273.7675 3187.4208,-1782.7061 3151,-1727 3139.2515,-1709.0305 2456.2433,-1433.898 2443,-1417 2385.1278,-1343.157 2441.7724,-1296.137 2407,-1209 2401.1859,-1194.4302 2392.9771,-1179.7917 2384.3436,-1166.4477"/>
<polygon fill="#000000" stroke="#000000" points="2387.0899,-1164.2574 2378.6298,-1157.8795 2381.2661,-1168.1411 2387.0899,-1164.2574"/>
<text text-anchor="middle" x="3066" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- lab_exam -->
<g id="node10" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M12,-2008.5C12,-2008.5 72,-2008.5 72,-2008.5 78,-2008.5 84,-2014.5 84,-2020.5 84,-2020.5 84,-2032.5 84,-2032.5 84,-2038.5 78,-2044.5 72,-2044.5 72,-2044.5 12,-2044.5 12,-2044.5 6,-2044.5 0,-2038.5 0,-2032.5 0,-2032.5 0,-2020.5 0,-2020.5 0,-2014.5 6,-2008.5 12,-2008.5"/>
<text text-anchor="middle" x="42" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge3" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M38.5797,-2008.4449C29.8483,-1956.2895 12.6786,-1804.2235 92,-1727 163.2101,-1657.6732 827.2218,-1600.3564 1093.4029,-1579.9742"/>
<polygon fill="#000000" stroke="#000000" points="1093.7667,-1583.4567 1103.4715,-1579.2063 1093.2343,-1576.477 1093.7667,-1583.4567"/>
<text text-anchor="middle" x="190" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent -->
<g id="node11" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M1577,-524.5C1577,-524.5 1803,-524.5 1803,-524.5 1809,-524.5 1815,-530.5 1815,-536.5 1815,-536.5 1815,-558.5 1815,-558.5 1815,-564.5 1809,-570.5 1803,-570.5 1803,-570.5 1577,-570.5 1577,-570.5 1571,-570.5 1565,-564.5 1565,-558.5 1565,-558.5 1565,-536.5 1565,-536.5 1565,-530.5 1571,-524.5 1577,-524.5"/>
<text text-anchor="middle" x="1593.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1622,-524.5 1622,-570.5 "/>
<text text-anchor="middle" x="1632.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1643,-524.5 1643,-570.5 "/>
<text text-anchor="middle" x="1718.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1643,-547.5 1794,-547.5 "/>
<text text-anchor="middle" x="1718.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1794,-524.5 1794,-570.5 "/>
<text text-anchor="middle" x="1804.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge24" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1730.7183,-524.2779C1754.4577,-510.739 1785.0387,-493.2982 1812.486,-477.6447"/>
<polygon fill="#000000" stroke="#000000" points="1814.322,-480.6268 1821.2747,-472.6324 1810.8542,-474.5462 1814.322,-480.6268"/>
<text text-anchor="middle" x="1834.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- study_site -->
<g id="node12" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M2226.5,-403.5C2226.5,-403.5 2543.5,-403.5 2543.5,-403.5 2549.5,-403.5 2555.5,-409.5 2555.5,-415.5 2555.5,-415.5 2555.5,-460.5 2555.5,-460.5 2555.5,-466.5 2549.5,-472.5 2543.5,-472.5 2543.5,-472.5 2226.5,-472.5 2226.5,-472.5 2220.5,-472.5 2214.5,-466.5 2214.5,-460.5 2214.5,-460.5 2214.5,-415.5 2214.5,-415.5 2214.5,-409.5 2220.5,-403.5 2226.5,-403.5"/>
<text text-anchor="middle" x="2259.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="2304.5,-403.5 2304.5,-472.5 "/>
<text text-anchor="middle" x="2315" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2325.5,-403.5 2325.5,-472.5 "/>
<text text-anchor="middle" x="2430" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2325.5,-449.5 2534.5,-449.5 "/>
<text text-anchor="middle" x="2430" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2325.5,-426.5 2534.5,-426.5 "/>
<text text-anchor="middle" x="2430" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2534.5,-403.5 2534.5,-472.5 "/>
<text text-anchor="middle" x="2545" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge30" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2405.5129,-403.3975C2412.9933,-390.779 2421.8373,-375.8603 2430.8436,-360.6678"/>
<polygon fill="#000000" stroke="#000000" points="2434.0674,-362.0933 2436.1561,-351.7063 2428.0459,-358.5236 2434.0674,-362.0933"/>
<text text-anchor="middle" x="2452.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge14" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M2484,-190.4932C2484,-176.7786 2484,-162.5421 2484,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="2487.5001,-148.5183 2484,-138.5184 2480.5001,-148.5184 2487.5001,-148.5183"/>
<text text-anchor="middle" x="2524.5" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- follow_up -->
<g id="node14" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M2464,-1209.5C2464,-1209.5 2796,-1209.5 2796,-1209.5 2802,-1209.5 2808,-1215.5 2808,-1221.5 2808,-1221.5 2808,-1404.5 2808,-1404.5 2808,-1410.5 2802,-1416.5 2796,-1416.5 2796,-1416.5 2464,-1416.5 2464,-1416.5 2458,-1416.5 2452,-1410.5 2452,-1404.5 2452,-1404.5 2452,-1221.5 2452,-1221.5 2452,-1215.5 2458,-1209.5 2464,-1209.5"/>
<text text-anchor="middle" x="2494.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="2537,-1209.5 2537,-1416.5 "/>
<text text-anchor="middle" x="2547.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2558,-1209.5 2558,-1416.5 "/>
<text text-anchor="middle" x="2672.5" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="2558,-1393.5 2787,-1393.5 "/>
<text text-anchor="middle" x="2672.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="2558,-1370.5 2787,-1370.5 "/>
<text text-anchor="middle" x="2672.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2558,-1347.5 2787,-1347.5 "/>
<text text-anchor="middle" x="2672.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="2558,-1324.5 2787,-1324.5 "/>
<text text-anchor="middle" x="2672.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="2558,-1301.5 2787,-1301.5 "/>
<text text-anchor="middle" x="2672.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="2558,-1278.5 2787,-1278.5 "/>
<text text-anchor="middle" x="2672.5" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="2558,-1255.5 2787,-1255.5 "/>
<text text-anchor="middle" x="2672.5" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="2558,-1232.5 2787,-1232.5 "/>
<text text-anchor="middle" x="2672.5" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2787,-1209.5 2787,-1416.5 "/>
<text text-anchor="middle" x="2797.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge19" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2485.6317,-1209.3295C2469.6057,-1198.0175 2453.4858,-1186.724 2438,-1176 2432.0419,-1171.874 2425.8555,-1167.6292 2419.6237,-1163.3813"/>
<polygon fill="#000000" stroke="#000000" points="2421.3526,-1160.3245 2411.1147,-1157.5975 2417.4175,-1166.1137 2421.3526,-1160.3245"/>
<text text-anchor="middle" x="2485" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent_administration -->
<g id="node15" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M113.5,-1785C113.5,-1785 582.5,-1785 582.5,-1785 588.5,-1785 594.5,-1791 594.5,-1797 594.5,-1797 594.5,-2256 594.5,-2256 594.5,-2262 588.5,-2268 582.5,-2268 582.5,-2268 113.5,-2268 113.5,-2268 107.5,-2268 101.5,-2262 101.5,-2256 101.5,-2256 101.5,-1797 101.5,-1797 101.5,-1791 107.5,-1785 113.5,-1785"/>
<text text-anchor="middle" x="186.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="271.5,-1785 271.5,-2268 "/>
<text text-anchor="middle" x="282" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="292.5,-1785 292.5,-2268 "/>
<text text-anchor="middle" x="433" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="292.5,-2245 573.5,-2245 "/>
<text text-anchor="middle" x="433" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="292.5,-2222 573.5,-2222 "/>
<text text-anchor="middle" x="433" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="292.5,-2199 573.5,-2199 "/>
<text text-anchor="middle" x="433" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="292.5,-2176 573.5,-2176 "/>
<text text-anchor="middle" x="433" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="292.5,-2153 573.5,-2153 "/>
<text text-anchor="middle" x="433" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="292.5,-2130 573.5,-2130 "/>
<text text-anchor="middle" x="433" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="292.5,-2107 573.5,-2107 "/>
<text text-anchor="middle" x="433" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="292.5,-2084 573.5,-2084 "/>
<text text-anchor="middle" x="433" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="292.5,-2061 573.5,-2061 "/>
<text text-anchor="middle" x="433" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="292.5,-2038 573.5,-2038 "/>
<text text-anchor="middle" x="433" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="292.5,-2015 573.5,-2015 "/>
<text text-anchor="middle" x="433" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="292.5,-1992 573.5,-1992 "/>
<text text-anchor="middle" x="433" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="292.5,-1969 573.5,-1969 "/>
<text text-anchor="middle" x="433" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="292.5,-1946 573.5,-1946 "/>
<text text-anchor="middle" x="433" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="292.5,-1923 573.5,-1923 "/>
<text text-anchor="middle" x="433" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="292.5,-1900 573.5,-1900 "/>
<text text-anchor="middle" x="433" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="292.5,-1877 573.5,-1877 "/>
<text text-anchor="middle" x="433" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="292.5,-1854 573.5,-1854 "/>
<text text-anchor="middle" x="433" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="292.5,-1831 573.5,-1831 "/>
<text text-anchor="middle" x="433" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="292.5,-1808 573.5,-1808 "/>
<text text-anchor="middle" x="433" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="573.5,-1785 573.5,-2268 "/>
<text text-anchor="middle" x="584" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge42" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M407.2935,-1784.9641C419.645,-1716.5575 429,-1641.7301 429,-1572 429,-1572 429,-1572 429,-818 429,-703.8372 1229.3513,-599.8912 1554.8095,-562.3416"/>
<polygon fill="#000000" stroke="#000000" points="1555.236,-565.8157 1564.7705,-561.196 1554.4361,-558.8616 1555.236,-565.8157"/>
<text text-anchor="middle" x="460" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge2" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M529.846,-1784.7458C553.0556,-1763.1374 577.8939,-1743.3083 604,-1727 756.8983,-1631.4855 966.7665,-1594.589 1093.1928,-1580.5037"/>
<polygon fill="#000000" stroke="#000000" points="1093.7139,-1583.9678 1103.2777,-1579.4089 1092.9583,-1577.0087 1093.7139,-1583.9678"/>
<text text-anchor="middle" x="691" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- demographic -->
<g id="node16" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M2838,-1232.5C2838,-1232.5 3174,-1232.5 3174,-1232.5 3180,-1232.5 3186,-1238.5 3186,-1244.5 3186,-1244.5 3186,-1381.5 3186,-1381.5 3186,-1387.5 3180,-1393.5 3174,-1393.5 3174,-1393.5 2838,-1393.5 2838,-1393.5 2832,-1393.5 2826,-1387.5 2826,-1381.5 2826,-1381.5 2826,-1244.5 2826,-1244.5 2826,-1238.5 2832,-1232.5 2838,-1232.5"/>
<text text-anchor="middle" x="2881" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="2936,-1232.5 2936,-1393.5 "/>
<text text-anchor="middle" x="2946.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2957,-1232.5 2957,-1393.5 "/>
<text text-anchor="middle" x="3061" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="2957,-1370.5 3165,-1370.5 "/>
<text text-anchor="middle" x="3061" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="2957,-1347.5 3165,-1347.5 "/>
<text text-anchor="middle" x="3061" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="2957,-1324.5 3165,-1324.5 "/>
<text text-anchor="middle" x="3061" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2957,-1301.5 3165,-1301.5 "/>
<text text-anchor="middle" x="3061" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="2957,-1278.5 3165,-1278.5 "/>
<text text-anchor="middle" x="3061" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="2957,-1255.5 3165,-1255.5 "/>
<text text-anchor="middle" x="3061" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="3165,-1232.5 3165,-1393.5 "/>
<text text-anchor="middle" x="3175.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge18" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2870.9968,-1232.4327C2853.2083,-1223.696 2834.9245,-1215.5988 2817,-1209 2704.8378,-1167.7079 2570.9872,-1142.228 2474.0027,-1127.722"/>
<polygon fill="#000000" stroke="#000000" points="2474.2511,-1124.2208 2463.8472,-1126.223 2473.2288,-1131.1458 2474.2511,-1124.2208"/>
<text text-anchor="middle" x="2781" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- image -->
<g id="node17" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M2202,-2836C2202,-2836 2238,-2836 2238,-2836 2244,-2836 2250,-2842 2250,-2848 2250,-2848 2250,-2860 2250,-2860 2250,-2866 2244,-2872 2238,-2872 2238,-2872 2202,-2872 2202,-2872 2196,-2872 2190,-2866 2190,-2860 2190,-2860 2190,-2848 2190,-2848 2190,-2842 2196,-2836 2202,-2836"/>
<text text-anchor="middle" x="2220" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge36" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2220,-2835.7604C2220,-2805.5622 2220,-2744.9545 2220,-2709.0457"/>
<polygon fill="#000000" stroke="#000000" points="2223.5001,-2708.7555 2220,-2698.7556 2216.5001,-2708.7556 2223.5001,-2708.7555"/>
<text text-anchor="middle" x="2250.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- prior_surgery -->
<g id="node18" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M2186,-1946C2186,-1946 2532,-1946 2532,-1946 2538,-1946 2544,-1952 2544,-1958 2544,-1958 2544,-2095 2544,-2095 2544,-2101 2538,-2107 2532,-2107 2532,-2107 2186,-2107 2186,-2107 2180,-2107 2174,-2101 2174,-2095 2174,-2095 2174,-1958 2174,-1958 2174,-1952 2180,-1946 2186,-1946"/>
<text text-anchor="middle" x="2231.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="2289,-1946 2289,-2107 "/>
<text text-anchor="middle" x="2299.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2310,-1946 2310,-2107 "/>
<text text-anchor="middle" x="2416.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="2310,-2084 2523,-2084 "/>
<text text-anchor="middle" x="2416.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="2310,-2061 2523,-2061 "/>
<text text-anchor="middle" x="2416.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2310,-2038 2523,-2038 "/>
<text text-anchor="middle" x="2416.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="2310,-2015 2523,-2015 "/>
<text text-anchor="middle" x="2416.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="2310,-1992 2523,-1992 "/>
<text text-anchor="middle" x="2416.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="2310,-1969 2523,-1969 "/>
<text text-anchor="middle" x="2416.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2523,-1946 2523,-2107 "/>
<text text-anchor="middle" x="2533.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge25" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2357.9342,-1945.7682C2356.98,-1873.4814 2355.5705,-1766.714 2354.502,-1685.7784"/>
<polygon fill="#000000" stroke="#000000" points="2357.9987,-1685.493 2354.3669,-1675.5401 2350.9993,-1685.5854 2357.9987,-1685.493"/>
<text text-anchor="middle" x="2404" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge35" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M2544.113,-2068.5585C2555.2907,-2058.5547 2562,-2044.5352 2562,-2026.5 2562,-2012.5509 2557.9865,-2001.004 2550.9962,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="2553.4806,-1989.3911 2544.113,-1984.4415 2548.3494,-1994.1525 2553.4806,-1989.3911"/>
<text text-anchor="middle" x="2578" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge13" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1943.7928,-403.4795C1967.1267,-391.541 1994.2625,-378.9316 2020,-370 2117.7873,-336.0654 2231.3767,-311.5912 2321.6918,-295.4665"/>
<polygon fill="#000000" stroke="#000000" points="2322.5108,-298.876 2331.7486,-293.6882 2321.2919,-291.983 2322.5108,-298.876"/>
<text text-anchor="middle" x="2060.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- visit&#45;&gt;case -->
<g id="edge16" class="edge">
<title>visit&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1294.5681,-1548.9643C1366.2539,-1526.4848 1463.6189,-1485.4579 1524,-1417 1588.5202,-1343.8493 1533.167,-1285.2445 1594,-1209 1611.542,-1187.0139 1621.3066,-1184.864 1648,-1176 1748.9848,-1142.4662 2038.7618,-1124.5659 2210.2696,-1116.6455"/>
<polygon fill="#000000" stroke="#000000" points="2210.5459,-1120.1366 2220.3758,-1116.184 2210.2266,-1113.1439 2210.5459,-1120.1366"/>
<text text-anchor="middle" x="1621" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge31" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1261.0376,-1595.0098C1292.1529,-1598.9199 1320.5,-1591.25 1320.5,-1572 1320.5,-1554.8555 1298.0147,-1546.8964 1271.1145,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="1270.7006,-1544.6454 1261.0376,-1548.9902 1271.301,-1551.6196 1270.7006,-1544.6454"/>
<text text-anchor="middle" x="1336.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cycle -->
<g id="node24" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1275,-1278.5C1275,-1278.5 1503,-1278.5 1503,-1278.5 1509,-1278.5 1515,-1284.5 1515,-1290.5 1515,-1290.5 1515,-1335.5 1515,-1335.5 1515,-1341.5 1509,-1347.5 1503,-1347.5 1503,-1347.5 1275,-1347.5 1275,-1347.5 1269,-1347.5 1263,-1341.5 1263,-1335.5 1263,-1335.5 1263,-1290.5 1263,-1290.5 1263,-1284.5 1269,-1278.5 1275,-1278.5"/>
<text text-anchor="middle" x="1290" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1317,-1278.5 1317,-1347.5 "/>
<text text-anchor="middle" x="1327.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1338,-1278.5 1338,-1347.5 "/>
<text text-anchor="middle" x="1416" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1338,-1324.5 1494,-1324.5 "/>
<text text-anchor="middle" x="1416" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1338,-1301.5 1494,-1301.5 "/>
<text text-anchor="middle" x="1416" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1494,-1278.5 1494,-1347.5 "/>
<text text-anchor="middle" x="1504.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge40" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1219.8343,-1548.5587C1251.1358,-1504.9721 1318.7038,-1410.8856 1358.3209,-1355.7198"/>
<polygon fill="#000000" stroke="#000000" points="1361.2022,-1357.7079 1364.1925,-1347.5438 1355.5164,-1353.6247 1361.2022,-1357.7079"/>
<text text-anchor="middle" x="1325.5" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- physical_exam -->
<g id="node21" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1828,-1934.5C1828,-1934.5 2144,-1934.5 2144,-1934.5 2150,-1934.5 2156,-1940.5 2156,-1946.5 2156,-1946.5 2156,-2106.5 2156,-2106.5 2156,-2112.5 2150,-2118.5 2144,-2118.5 2144,-2118.5 1828,-2118.5 1828,-2118.5 1822,-2118.5 1816,-2112.5 1816,-2106.5 1816,-2106.5 1816,-1946.5 1816,-1946.5 1816,-1940.5 1822,-1934.5 1828,-1934.5"/>
<text text-anchor="middle" x="1877" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1938,-1934.5 1938,-2118.5 "/>
<text text-anchor="middle" x="1948.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1959,-1934.5 1959,-2118.5 "/>
<text text-anchor="middle" x="2047" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1959,-2095.5 2135,-2095.5 "/>
<text text-anchor="middle" x="2047" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1959,-2072.5 2135,-2072.5 "/>
<text text-anchor="middle" x="2047" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1959,-2049.5 2135,-2049.5 "/>
<text text-anchor="middle" x="2047" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1959,-2026.5 2135,-2026.5 "/>
<text text-anchor="middle" x="2047" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1959,-2003.5 2135,-2003.5 "/>
<text text-anchor="middle" x="2047" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1959,-1980.5 2135,-1980.5 "/>
<text text-anchor="middle" x="2047" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1959,-1957.5 2135,-1957.5 "/>
<text text-anchor="middle" x="2047" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="2135,-1934.5 2135,-2118.5 "/>
<text text-anchor="middle" x="2145.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge27" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2030.4783,-1934.3318C2062.9249,-1872.1754 2110.6089,-1790.2794 2165,-1727 2178.1514,-1711.6994 2192.9281,-1696.7199 2208.2679,-1682.4729"/>
<polygon fill="#000000" stroke="#000000" points="2210.8279,-1684.8744 2215.839,-1675.5395 2206.1003,-1679.712 2210.8279,-1684.8744"/>
<text text-anchor="middle" x="2243" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge5" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1952.8533,-1934.3132C1924.0675,-1867.1436 1875.9148,-1779.1221 1806,-1727 1728.488,-1669.2141 1464.8574,-1616.5012 1313.0724,-1589.9885"/>
<polygon fill="#000000" stroke="#000000" points="1313.2419,-1586.4656 1302.7905,-1588.2027 1312.044,-1593.3624 1313.2419,-1586.4656"/>
<text text-anchor="middle" x="1801" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- principal_investigator -->
<g id="node22" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M2624.5,-403.5C2624.5,-403.5 2951.5,-403.5 2951.5,-403.5 2957.5,-403.5 2963.5,-409.5 2963.5,-415.5 2963.5,-415.5 2963.5,-460.5 2963.5,-460.5 2963.5,-466.5 2957.5,-472.5 2951.5,-472.5 2951.5,-472.5 2624.5,-472.5 2624.5,-472.5 2618.5,-472.5 2612.5,-466.5 2612.5,-460.5 2612.5,-460.5 2612.5,-415.5 2612.5,-415.5 2612.5,-409.5 2618.5,-403.5 2624.5,-403.5"/>
<text text-anchor="middle" x="2699.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="2786.5,-403.5 2786.5,-472.5 "/>
<text text-anchor="middle" x="2797" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2807.5,-403.5 2807.5,-472.5 "/>
<text text-anchor="middle" x="2875" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="2807.5,-449.5 2942.5,-449.5 "/>
<text text-anchor="middle" x="2875" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="2807.5,-426.5 2942.5,-426.5 "/>
<text text-anchor="middle" x="2875" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="2942.5,-403.5 2942.5,-472.5 "/>
<text text-anchor="middle" x="2953" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge28" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2725.011,-403.3975C2699.9223,-389.6152 2669.8383,-373.0888 2639.5656,-356.4587"/>
<polygon fill="#000000" stroke="#000000" points="2641.0496,-353.2807 2630.5999,-351.5335 2637.6793,-359.4159 2641.0496,-353.2807"/>
<text text-anchor="middle" x="2719.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file -->
<g id="node23" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M2314.5,-2750.5C2314.5,-2750.5 2499.5,-2750.5 2499.5,-2750.5 2505.5,-2750.5 2511.5,-2756.5 2511.5,-2762.5 2511.5,-2762.5 2511.5,-2945.5 2511.5,-2945.5 2511.5,-2951.5 2505.5,-2957.5 2499.5,-2957.5 2499.5,-2957.5 2314.5,-2957.5 2314.5,-2957.5 2308.5,-2957.5 2302.5,-2951.5 2302.5,-2945.5 2302.5,-2945.5 2302.5,-2762.5 2302.5,-2762.5 2302.5,-2756.5 2308.5,-2750.5 2314.5,-2750.5"/>
<text text-anchor="middle" x="2322" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="2341.5,-2750.5 2341.5,-2957.5 "/>
<text text-anchor="middle" x="2352" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2362.5,-2750.5 2362.5,-2957.5 "/>
<text text-anchor="middle" x="2426.5" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="2362.5,-2934.5 2490.5,-2934.5 "/>
<text text-anchor="middle" x="2426.5" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="2362.5,-2911.5 2490.5,-2911.5 "/>
<text text-anchor="middle" x="2426.5" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="2362.5,-2888.5 2490.5,-2888.5 "/>
<text text-anchor="middle" x="2426.5" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="2362.5,-2865.5 2490.5,-2865.5 "/>
<text text-anchor="middle" x="2426.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="2362.5,-2842.5 2490.5,-2842.5 "/>
<text text-anchor="middle" x="2426.5" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="2362.5,-2819.5 2490.5,-2819.5 "/>
<text text-anchor="middle" x="2426.5" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="2362.5,-2796.5 2490.5,-2796.5 "/>
<text text-anchor="middle" x="2426.5" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_location</text>
<polyline fill="none" stroke="#000000" points="2362.5,-2773.5 2490.5,-2773.5 "/>
<text text-anchor="middle" x="2426.5" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="2490.5,-2750.5 2490.5,-2957.5 "/>
<text text-anchor="middle" x="2501" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge37" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2321.5952,-2750.3789C2309.8669,-2738.5164 2297.5318,-2727.0813 2285,-2717 2276.5175,-2710.1762 2266.5915,-2703.8959 2257.0866,-2698.5388"/>
<polygon fill="#000000" stroke="#000000" points="2258.6223,-2695.3901 2248.1634,-2693.6979 2255.2842,-2701.5429 2258.6223,-2695.3901"/>
<text text-anchor="middle" x="2330.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge8" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M2418.2281,-2750.3561C2421.491,-2720.2371 2425.1332,-2686.6169 2428.6781,-2653.8943"/>
<polygon fill="#000000" stroke="#000000" points="2432.1771,-2654.0915 2429.7746,-2643.7727 2425.2179,-2653.3375 2432.1771,-2654.0915"/>
<text text-anchor="middle" x="2475.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;study -->
<g id="edge29" class="edge">
<title>file&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2511.6738,-2842.3391C2730.0283,-2816.5958 3214,-2751.5258 3214,-2680.5 3214,-2680.5 3214,-2680.5 3214,-438 3214,-322.3392 2861.3688,-286.7817 2646.2798,-275.851"/>
<polygon fill="#000000" stroke="#000000" points="2646.3043,-272.348 2636.1433,-275.3489 2645.9579,-279.3395 2646.3043,-272.348"/>
<text text-anchor="middle" x="3244.5" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge38" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2302.1467,-2774.9872C2288.0132,-2765.9377 2273.4109,-2757.3413 2259,-2750 2196.6324,-2718.2283 2168.0867,-2738.0525 2110,-2699 1939.5659,-2584.4146 1788.4534,-2408.0739 1682.3823,-2264.7117"/>
<polygon fill="#000000" stroke="#000000" points="1685.1658,-2262.5891 1676.4148,-2256.6167 1679.5314,-2266.7428 1685.1658,-2262.5891"/>
<text text-anchor="middle" x="2146.5" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge22" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1406.8144,-1278.3186C1425.6466,-1245.6687 1458.6289,-1198.5172 1502,-1176 1563.1661,-1144.2441 1989.5911,-1124.2858 2210.2811,-1115.9668"/>
<polygon fill="#000000" stroke="#000000" points="2210.4468,-1119.4631 2220.3088,-1115.5914 2210.1849,-1112.468 2210.4468,-1119.4631"/>
<text text-anchor="middle" x="1529" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- disease_extent -->
<g id="node26" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M625,-1877C625,-1877 941,-1877 941,-1877 947,-1877 953,-1883 953,-1889 953,-1889 953,-2164 953,-2164 953,-2170 947,-2176 941,-2176 941,-2176 625,-2176 625,-2176 619,-2176 613,-2170 613,-2164 613,-2164 613,-1889 613,-1889 613,-1883 619,-1877 625,-1877"/>
<text text-anchor="middle" x="674.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="736,-1877 736,-2176 "/>
<text text-anchor="middle" x="746.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="757,-1877 757,-2176 "/>
<text text-anchor="middle" x="844.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="757,-2153 932,-2153 "/>
<text text-anchor="middle" x="844.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="757,-2130 932,-2130 "/>
<text text-anchor="middle" x="844.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="757,-2107 932,-2107 "/>
<text text-anchor="middle" x="844.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="757,-2084 932,-2084 "/>
<text text-anchor="middle" x="844.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="757,-2061 932,-2061 "/>
<text text-anchor="middle" x="844.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="757,-2038 932,-2038 "/>
<text text-anchor="middle" x="844.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="757,-2015 932,-2015 "/>
<text text-anchor="middle" x="844.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="757,-1992 932,-1992 "/>
<text text-anchor="middle" x="844.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="757,-1969 932,-1969 "/>
<text text-anchor="middle" x="844.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="757,-1946 932,-1946 "/>
<text text-anchor="middle" x="844.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="757,-1923 932,-1923 "/>
<text text-anchor="middle" x="844.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="757,-1900 932,-1900 "/>
<text text-anchor="middle" x="844.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="932,-1877 932,-2176 "/>
<text text-anchor="middle" x="942.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge6" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M854.472,-1876.8911C883.3481,-1825.7534 919.876,-1770.531 962,-1727 1015.3573,-1671.8606 1091.903,-1626.8984 1144.3264,-1599.8658"/>
<polygon fill="#000000" stroke="#000000" points="1146.1772,-1602.8509 1153.498,-1595.1921 1142.999,-1596.614 1146.1772,-1602.8509"/>
<text text-anchor="middle" x="1025" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge20" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1729.6239,-1796.4928C1918.7996,-1584.8843 2185.8409,-1286.1768 2293.8627,-1165.3455"/>
<polygon fill="#000000" stroke="#000000" points="2296.6898,-1167.4346 2300.7454,-1157.6467 2291.4712,-1162.7692 2296.6898,-1167.4346"/>
<text text-anchor="middle" x="2072" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge4" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1361.3841,-1796.2541C1307.577,-1720.0693 1254.0871,-1644.3335 1225.1094,-1603.3045"/>
<polygon fill="#000000" stroke="#000000" points="1227.9345,-1601.2375 1219.3067,-1595.0884 1222.2168,-1605.2758 1227.9345,-1601.2375"/>
<text text-anchor="middle" x="1326" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge32" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1747.5955,-2065.8333C1758.8572,-2056.0642 1765.5,-2042.9531 1765.5,-2026.5 1765.5,-2013.9031 1761.6061,-2003.2652 1754.7267,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="1757.0485,-1991.9513 1747.5955,-1987.1667 1752.0016,-1996.802 1757.0485,-1991.9513"/>
<text text-anchor="middle" x="1781.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- adverse_event&#45;&gt;case -->
<g id="edge21" class="edge">
<title>adverse_event&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1892.7286,-1013.6115C1911.5865,-1026.2109 1931.1103,-1037.5916 1951,-1047 1996.05,-1068.3099 2115.331,-1086.1572 2210.3993,-1097.6364"/>
<polygon fill="#000000" stroke="#000000" points="2210.0525,-1101.1198 2220.3972,-1098.831 2210.8831,-1094.1692 2210.0525,-1101.1198"/>
<text text-anchor="middle" x="1978" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge43" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1690,-622.4901C1690,-606.8636 1690,-592.5861 1690,-580.7798"/>
<polygon fill="#000000" stroke="#000000" points="1693.5001,-580.664 1690,-570.6641 1686.5001,-580.6641 1693.5001,-580.664"/>
<text text-anchor="middle" x="1721" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge33" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1899.7046,-845.2761C1910.876,-838.5862 1917.5,-829.4941 1917.5,-818 1917.5,-809.7386 1914.0781,-802.7181 1908.0052,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="1909.8073,-793.9155 1899.7046,-790.7239 1905.6119,-799.519 1909.8073,-793.9155"/>
<text text-anchor="middle" x="1933.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
</g>
</svg>
</div>
