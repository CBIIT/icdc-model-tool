<link rel='stylesheet' href="assets/style.css">
<link rel='stylesheet' href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"  src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"></script>
<script type="text/javascript" src="assets/actions.js"></script>

Zoom to Node: <select id="node_select">
  <option value="">Zoom to Node</option>
</select>
<div id="model"></div>

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
<svg width="3361pt" height="2918pt"
 viewBox="0.00 0.00 3360.50 2918.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2914)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2914 3356.5,-2914 3356.5,4 -4,4"/>
<!-- agent -->
<g id="node1" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M2337.5,-524.5C2337.5,-524.5 2563.5,-524.5 2563.5,-524.5 2569.5,-524.5 2575.5,-530.5 2575.5,-536.5 2575.5,-536.5 2575.5,-558.5 2575.5,-558.5 2575.5,-564.5 2569.5,-570.5 2563.5,-570.5 2563.5,-570.5 2337.5,-570.5 2337.5,-570.5 2331.5,-570.5 2325.5,-564.5 2325.5,-558.5 2325.5,-558.5 2325.5,-536.5 2325.5,-536.5 2325.5,-530.5 2331.5,-524.5 2337.5,-524.5"/>
<text text-anchor="middle" x="2354" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="2382.5,-524.5 2382.5,-570.5 "/>
<text text-anchor="middle" x="2393" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2403.5,-524.5 2403.5,-570.5 "/>
<text text-anchor="middle" x="2479" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2403.5,-547.5 2554.5,-547.5 "/>
<text text-anchor="middle" x="2479" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2554.5,-524.5 2554.5,-570.5 "/>
<text text-anchor="middle" x="2565" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm -->
<g id="node27" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M2766,-415C2766,-415 3135,-415 3135,-415 3141,-415 3147,-421 3147,-427 3147,-427 3147,-449 3147,-449 3147,-455 3141,-461 3135,-461 3135,-461 2766,-461 2766,-461 2760,-461 2754,-455 2754,-449 2754,-449 2754,-427 2754,-427 2754,-421 2760,-415 2766,-415"/>
<text text-anchor="middle" x="2800" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="2846,-415 2846,-461 "/>
<text text-anchor="middle" x="2856.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2867,-415 2867,-461 "/>
<text text-anchor="middle" x="2996.5" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="2867,-438 3126,-438 "/>
<text text-anchor="middle" x="2996.5" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="3126,-415 3126,-461 "/>
<text text-anchor="middle" x="3136.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge15" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2555.6211,-524.4785C2637.4527,-506.5574 2750.9072,-481.7108 2835.2164,-463.2471"/>
<polygon fill="#000000" stroke="#000000" points="2836.0702,-466.6432 2845.0899,-461.0848 2834.5726,-459.8052 2836.0702,-466.6432"/>
<text text-anchor="middle" x="2749" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- prior_therapy -->
<g id="node2" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M962.5,-2052.5C962.5,-2052.5 1418.5,-2052.5 1418.5,-2052.5 1424.5,-2052.5 1430.5,-2058.5 1430.5,-2064.5 1430.5,-2064.5 1430.5,-2638.5 1430.5,-2638.5 1430.5,-2644.5 1424.5,-2650.5 1418.5,-2650.5 1418.5,-2650.5 962.5,-2650.5 962.5,-2650.5 956.5,-2650.5 950.5,-2644.5 950.5,-2638.5 950.5,-2638.5 950.5,-2064.5 950.5,-2064.5 950.5,-2058.5 956.5,-2052.5 962.5,-2052.5"/>
<text text-anchor="middle" x="1008" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="1065.5,-2052.5 1065.5,-2650.5 "/>
<text text-anchor="middle" x="1076" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1086.5,-2052.5 1086.5,-2650.5 "/>
<text text-anchor="middle" x="1248" y="-2635.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2627.5 1409.5,-2627.5 "/>
<text text-anchor="middle" x="1248" y="-2612.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2604.5 1409.5,-2604.5 "/>
<text text-anchor="middle" x="1248" y="-2589.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2581.5 1409.5,-2581.5 "/>
<text text-anchor="middle" x="1248" y="-2566.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2558.5 1409.5,-2558.5 "/>
<text text-anchor="middle" x="1248" y="-2543.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2535.5 1409.5,-2535.5 "/>
<text text-anchor="middle" x="1248" y="-2520.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2512.5 1409.5,-2512.5 "/>
<text text-anchor="middle" x="1248" y="-2497.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2489.5 1409.5,-2489.5 "/>
<text text-anchor="middle" x="1248" y="-2474.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2466.5 1409.5,-2466.5 "/>
<text text-anchor="middle" x="1248" y="-2451.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2443.5 1409.5,-2443.5 "/>
<text text-anchor="middle" x="1248" y="-2428.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2420.5 1409.5,-2420.5 "/>
<text text-anchor="middle" x="1248" y="-2405.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2397.5 1409.5,-2397.5 "/>
<text text-anchor="middle" x="1248" y="-2382.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2374.5 1409.5,-2374.5 "/>
<text text-anchor="middle" x="1248" y="-2359.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2351.5 1409.5,-2351.5 "/>
<text text-anchor="middle" x="1248" y="-2336.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2328.5 1409.5,-2328.5 "/>
<text text-anchor="middle" x="1248" y="-2313.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2305.5 1409.5,-2305.5 "/>
<text text-anchor="middle" x="1248" y="-2290.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2282.5 1409.5,-2282.5 "/>
<text text-anchor="middle" x="1248" y="-2267.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2259.5 1409.5,-2259.5 "/>
<text text-anchor="middle" x="1248" y="-2244.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2236.5 1409.5,-2236.5 "/>
<text text-anchor="middle" x="1248" y="-2221.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2213.5 1409.5,-2213.5 "/>
<text text-anchor="middle" x="1248" y="-2198.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2190.5 1409.5,-2190.5 "/>
<text text-anchor="middle" x="1248" y="-2175.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2167.5 1409.5,-2167.5 "/>
<text text-anchor="middle" x="1248" y="-2152.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2144.5 1409.5,-2144.5 "/>
<text text-anchor="middle" x="1248" y="-2129.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2121.5 1409.5,-2121.5 "/>
<text text-anchor="middle" x="1248" y="-2106.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2098.5 1409.5,-2098.5 "/>
<text text-anchor="middle" x="1248" y="-2083.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="1086.5,-2075.5 1409.5,-2075.5 "/>
<text text-anchor="middle" x="1248" y="-2060.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="1409.5,-2052.5 1409.5,-2650.5 "/>
<text text-anchor="middle" x="1420" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge3" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M1430.7384,-2389.6912C1441.9387,-2380.0507 1448.5,-2367.3203 1448.5,-2351.5 1448.5,-2339.3876 1444.6539,-2329.0864 1437.8244,-2320.5965"/>
<polygon fill="#000000" stroke="#000000" points="1440.219,-2318.0385 1430.7384,-2313.3088 1435.2002,-2322.9183 1440.219,-2318.0385"/>
<text text-anchor="middle" x="1464.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node26" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M1042,-1405C1042,-1405 1391,-1405 1391,-1405 1397,-1405 1403,-1411 1403,-1417 1403,-1417 1403,-1600 1403,-1600 1403,-1606 1397,-1612 1391,-1612 1391,-1612 1042,-1612 1042,-1612 1036,-1612 1030,-1606 1030,-1600 1030,-1600 1030,-1417 1030,-1417 1030,-1411 1036,-1405 1042,-1405"/>
<text text-anchor="middle" x="1077.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="1125,-1405 1125,-1612 "/>
<text text-anchor="middle" x="1135.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1146,-1405 1146,-1612 "/>
<text text-anchor="middle" x="1264" y="-1596.8" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1146,-1589 1382,-1589 "/>
<text text-anchor="middle" x="1264" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1146,-1566 1382,-1566 "/>
<text text-anchor="middle" x="1264" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="1146,-1543 1382,-1543 "/>
<text text-anchor="middle" x="1264" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="1146,-1520 1382,-1520 "/>
<text text-anchor="middle" x="1264" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="1146,-1497 1382,-1497 "/>
<text text-anchor="middle" x="1264" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="1146,-1474 1382,-1474 "/>
<text text-anchor="middle" x="1264" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="1146,-1451 1382,-1451 "/>
<text text-anchor="middle" x="1264" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="1146,-1428 1382,-1428 "/>
<text text-anchor="middle" x="1264" y="-1412.8" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="1382,-1405 1382,-1612 "/>
<text text-anchor="middle" x="1392.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge19" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1199.7307,-2052.213C1204.3247,-1903.2622 1209.6061,-1732.0225 1212.9946,-1622.1556"/>
<polygon fill="#000000" stroke="#000000" points="1216.4963,-1622.1511 1213.3064,-1612.0479 1209.4996,-1621.9352 1216.4963,-1622.1511"/>
<text text-anchor="middle" x="1260.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- image -->
<g id="node3" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M191.5,-2788C191.5,-2788 227.5,-2788 227.5,-2788 233.5,-2788 239.5,-2794 239.5,-2800 239.5,-2800 239.5,-2812 239.5,-2812 239.5,-2818 233.5,-2824 227.5,-2824 227.5,-2824 191.5,-2824 191.5,-2824 185.5,-2824 179.5,-2818 179.5,-2812 179.5,-2812 179.5,-2800 179.5,-2800 179.5,-2794 185.5,-2788 191.5,-2788"/>
<text text-anchor="middle" x="209.5" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node16" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M207.5,-2333.5C207.5,-2333.5 239.5,-2333.5 239.5,-2333.5 245.5,-2333.5 251.5,-2339.5 251.5,-2345.5 251.5,-2345.5 251.5,-2357.5 251.5,-2357.5 251.5,-2363.5 245.5,-2369.5 239.5,-2369.5 239.5,-2369.5 207.5,-2369.5 207.5,-2369.5 201.5,-2369.5 195.5,-2363.5 195.5,-2357.5 195.5,-2357.5 195.5,-2345.5 195.5,-2345.5 195.5,-2339.5 201.5,-2333.5 207.5,-2333.5"/>
<text text-anchor="middle" x="223.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge18" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M209.4384,-2787.8251C209.3936,-2761.5848 209.4736,-2711.5634 210.5,-2669 213.0748,-2562.2298 219.1897,-2435.3733 222.0181,-2379.8695"/>
<polygon fill="#000000" stroke="#000000" points="225.5203,-2379.9136 222.5379,-2369.7472 218.5295,-2379.5545 225.5203,-2379.9136"/>
<text text-anchor="middle" x="241" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- prior_surgery -->
<g id="node4" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M1510.5,-2271C1510.5,-2271 1856.5,-2271 1856.5,-2271 1862.5,-2271 1868.5,-2277 1868.5,-2283 1868.5,-2283 1868.5,-2420 1868.5,-2420 1868.5,-2426 1862.5,-2432 1856.5,-2432 1856.5,-2432 1510.5,-2432 1510.5,-2432 1504.5,-2432 1498.5,-2426 1498.5,-2420 1498.5,-2420 1498.5,-2283 1498.5,-2283 1498.5,-2277 1504.5,-2271 1510.5,-2271"/>
<text text-anchor="middle" x="1556" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="1613.5,-2271 1613.5,-2432 "/>
<text text-anchor="middle" x="1624" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1634.5,-2271 1634.5,-2432 "/>
<text text-anchor="middle" x="1741" y="-2416.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1634.5,-2409 1847.5,-2409 "/>
<text text-anchor="middle" x="1741" y="-2393.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="1634.5,-2386 1847.5,-2386 "/>
<text text-anchor="middle" x="1741" y="-2370.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1634.5,-2363 1847.5,-2363 "/>
<text text-anchor="middle" x="1741" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1634.5,-2340 1847.5,-2340 "/>
<text text-anchor="middle" x="1741" y="-2324.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="1634.5,-2317 1847.5,-2317 "/>
<text text-anchor="middle" x="1741" y="-2301.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="1634.5,-2294 1847.5,-2294 "/>
<text text-anchor="middle" x="1741" y="-2278.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="1847.5,-2271 1847.5,-2432 "/>
<text text-anchor="middle" x="1858" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge4" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M1868.613,-2393.5585C1879.7907,-2383.5547 1886.5,-2369.5352 1886.5,-2351.5 1886.5,-2337.5509 1882.4865,-2326.004 1875.4962,-2316.8593"/>
<polygon fill="#000000" stroke="#000000" points="1877.9806,-2314.3911 1868.613,-2309.4415 1872.8494,-2319.1525 1877.9806,-2314.3911"/>
<text text-anchor="middle" x="1902.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge20" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1638.7221,-2270.6696C1554.9677,-2119.4813 1374.4564,-1793.6333 1278.8523,-1621.0545"/>
<polygon fill="#000000" stroke="#000000" points="1281.8509,-1619.2447 1273.9434,-1612.1933 1275.7277,-1622.6369 1281.8509,-1619.2447"/>
<text text-anchor="middle" x="1556.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- program -->
<g id="node5" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M2571.5,-.5C2571.5,-.5 2879.5,-.5 2879.5,-.5 2885.5,-.5 2891.5,-6.5 2891.5,-12.5 2891.5,-12.5 2891.5,-126.5 2891.5,-126.5 2891.5,-132.5 2885.5,-138.5 2879.5,-138.5 2879.5,-138.5 2571.5,-138.5 2571.5,-138.5 2565.5,-138.5 2559.5,-132.5 2559.5,-126.5 2559.5,-126.5 2559.5,-12.5 2559.5,-12.5 2559.5,-6.5 2565.5,-.5 2571.5,-.5"/>
<text text-anchor="middle" x="2598.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="2637.5,-.5 2637.5,-138.5 "/>
<text text-anchor="middle" x="2648" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2658.5,-.5 2658.5,-138.5 "/>
<text text-anchor="middle" x="2764.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="2658.5,-115.5 2870.5,-115.5 "/>
<text text-anchor="middle" x="2764.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="2658.5,-92.5 2870.5,-92.5 "/>
<text text-anchor="middle" x="2764.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="2658.5,-69.5 2870.5,-69.5 "/>
<text text-anchor="middle" x="2764.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="2658.5,-46.5 2870.5,-46.5 "/>
<text text-anchor="middle" x="2764.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="2658.5,-23.5 2870.5,-23.5 "/>
<text text-anchor="middle" x="2764.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="2870.5,-.5 2870.5,-138.5 "/>
<text text-anchor="middle" x="2881" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event -->
<g id="node6" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1729,-668.5C1729,-668.5 2124,-668.5 2124,-668.5 2130,-668.5 2136,-674.5 2136,-680.5 2136,-680.5 2136,-1047.5 2136,-1047.5 2136,-1053.5 2130,-1059.5 2124,-1059.5 2124,-1059.5 1729,-1059.5 1729,-1059.5 1723,-1059.5 1717,-1053.5 1717,-1047.5 1717,-1047.5 1717,-680.5 1717,-680.5 1717,-674.5 1723,-668.5 1729,-668.5"/>
<text text-anchor="middle" x="1777" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1837,-668.5 1837,-1059.5 "/>
<text text-anchor="middle" x="1847.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1858,-668.5 1858,-1059.5 "/>
<text text-anchor="middle" x="1986.5" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1858,-1036.5 2115,-1036.5 "/>
<text text-anchor="middle" x="1986.5" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1858,-1013.5 2115,-1013.5 "/>
<text text-anchor="middle" x="1986.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1858,-990.5 2115,-990.5 "/>
<text text-anchor="middle" x="1986.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1858,-967.5 2115,-967.5 "/>
<text text-anchor="middle" x="1986.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1858,-944.5 2115,-944.5 "/>
<text text-anchor="middle" x="1986.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1858,-921.5 2115,-921.5 "/>
<text text-anchor="middle" x="1986.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1858,-898.5 2115,-898.5 "/>
<text text-anchor="middle" x="1986.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1858,-875.5 2115,-875.5 "/>
<text text-anchor="middle" x="1986.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1858,-852.5 2115,-852.5 "/>
<text text-anchor="middle" x="1986.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1858,-829.5 2115,-829.5 "/>
<text text-anchor="middle" x="1986.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1858,-806.5 2115,-806.5 "/>
<text text-anchor="middle" x="1986.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1858,-783.5 2115,-783.5 "/>
<text text-anchor="middle" x="1986.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1858,-760.5 2115,-760.5 "/>
<text text-anchor="middle" x="1986.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1858,-737.5 2115,-737.5 "/>
<text text-anchor="middle" x="1986.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1858,-714.5 2115,-714.5 "/>
<text text-anchor="middle" x="1986.5" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1858,-691.5 2115,-691.5 "/>
<text text-anchor="middle" x="1986.5" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="2115,-668.5 2115,-1059.5 "/>
<text text-anchor="middle" x="2125.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge26" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2102.1464,-668.1745C2137.6387,-637.7049 2176.6843,-609.5639 2217.5,-589 2235.5936,-579.8841 2274.3243,-571.6329 2315.1071,-564.9331"/>
<polygon fill="#000000" stroke="#000000" points="2315.908,-568.3494 2325.2264,-563.3079 2314.7979,-561.438 2315.908,-568.3494"/>
<text text-anchor="middle" x="2248.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge5" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2136.2046,-896.9793C2147.376,-888.8906 2154,-877.8975 2154,-864 2154,-853.7941 2150.4277,-845.1544 2144.1053,-838.0812"/>
<polygon fill="#000000" stroke="#000000" points="2145.9933,-835.0744 2136.2046,-831.0207 2141.3288,-840.2939 2145.9933,-835.0744"/>
<text text-anchor="middle" x="2170" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- visit -->
<g id="node12" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M879,-524.5C879,-524.5 1054,-524.5 1054,-524.5 1060,-524.5 1066,-530.5 1066,-536.5 1066,-536.5 1066,-558.5 1066,-558.5 1066,-564.5 1060,-570.5 1054,-570.5 1054,-570.5 879,-570.5 879,-570.5 873,-570.5 867,-564.5 867,-558.5 867,-558.5 867,-536.5 867,-536.5 867,-530.5 873,-524.5 879,-524.5"/>
<text text-anchor="middle" x="890.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="914,-524.5 914,-570.5 "/>
<text text-anchor="middle" x="924.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="935,-524.5 935,-570.5 "/>
<text text-anchor="middle" x="990" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="935,-547.5 1045,-547.5 "/>
<text text-anchor="middle" x="990" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1045,-524.5 1045,-570.5 "/>
<text text-anchor="middle" x="1055.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;visit -->
<g id="edge12" class="edge">
<title>adverse_event&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1775.4603,-668.3348C1754.4115,-650.2662 1731.6508,-634.1988 1707.5,-622 1652.5466,-594.2426 1269.1819,-566.5491 1076.5094,-554.1897"/>
<polygon fill="#000000" stroke="#000000" points="1076.556,-550.6856 1066.3532,-553.541 1076.1098,-557.6714 1076.556,-550.6856"/>
<text text-anchor="middle" x="1645.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- principal_investigator -->
<g id="node7" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M716,-403.5C716,-403.5 1043,-403.5 1043,-403.5 1049,-403.5 1055,-409.5 1055,-415.5 1055,-415.5 1055,-460.5 1055,-460.5 1055,-466.5 1049,-472.5 1043,-472.5 1043,-472.5 716,-472.5 716,-472.5 710,-472.5 704,-466.5 704,-460.5 704,-460.5 704,-415.5 704,-415.5 704,-409.5 710,-403.5 716,-403.5"/>
<text text-anchor="middle" x="791" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="878,-403.5 878,-472.5 "/>
<text text-anchor="middle" x="888.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="899,-403.5 899,-472.5 "/>
<text text-anchor="middle" x="966.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="899,-449.5 1034,-449.5 "/>
<text text-anchor="middle" x="966.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="899,-426.5 1034,-426.5 "/>
<text text-anchor="middle" x="966.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="1034,-403.5 1034,-472.5 "/>
<text text-anchor="middle" x="1044.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node8" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M2585.5,-190.5C2585.5,-190.5 2865.5,-190.5 2865.5,-190.5 2871.5,-190.5 2877.5,-196.5 2877.5,-202.5 2877.5,-202.5 2877.5,-339.5 2877.5,-339.5 2877.5,-345.5 2871.5,-351.5 2865.5,-351.5 2865.5,-351.5 2585.5,-351.5 2585.5,-351.5 2579.5,-351.5 2573.5,-345.5 2573.5,-339.5 2573.5,-339.5 2573.5,-202.5 2573.5,-202.5 2573.5,-196.5 2579.5,-190.5 2585.5,-190.5"/>
<text text-anchor="middle" x="2601.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="2629.5,-190.5 2629.5,-351.5 "/>
<text text-anchor="middle" x="2640" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2650.5,-190.5 2650.5,-351.5 "/>
<text text-anchor="middle" x="2753.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="2650.5,-328.5 2856.5,-328.5 "/>
<text text-anchor="middle" x="2753.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="2650.5,-305.5 2856.5,-305.5 "/>
<text text-anchor="middle" x="2753.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="2650.5,-282.5 2856.5,-282.5 "/>
<text text-anchor="middle" x="2753.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="2650.5,-259.5 2856.5,-259.5 "/>
<text text-anchor="middle" x="2753.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="2650.5,-236.5 2856.5,-236.5 "/>
<text text-anchor="middle" x="2753.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="2650.5,-213.5 2856.5,-213.5 "/>
<text text-anchor="middle" x="2753.5" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="2856.5,-190.5 2856.5,-351.5 "/>
<text text-anchor="middle" x="2867" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge23" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1055.1936,-404.2876C1058.318,-403.8421 1061.4221,-403.4122 1064.5,-403 1611.4722,-329.742 2265.626,-292.3652 2563.4736,-278.074"/>
<polygon fill="#000000" stroke="#000000" points="2563.6623,-281.5691 2573.4839,-277.596 2563.3283,-274.577 2563.6623,-281.5691"/>
<text text-anchor="middle" x="1366" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge37" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M2725.5,-190.4932C2725.5,-176.7786 2725.5,-162.5421 2725.5,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="2729.0001,-148.5183 2725.5,-138.5184 2722.0001,-148.5184 2729.0001,-148.5183"/>
<text text-anchor="middle" x="2766" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- agent_administration -->
<g id="node9" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M2216,-622.5C2216,-622.5 2685,-622.5 2685,-622.5 2691,-622.5 2697,-628.5 2697,-634.5 2697,-634.5 2697,-1093.5 2697,-1093.5 2697,-1099.5 2691,-1105.5 2685,-1105.5 2685,-1105.5 2216,-1105.5 2216,-1105.5 2210,-1105.5 2204,-1099.5 2204,-1093.5 2204,-1093.5 2204,-634.5 2204,-634.5 2204,-628.5 2210,-622.5 2216,-622.5"/>
<text text-anchor="middle" x="2289" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="2374,-622.5 2374,-1105.5 "/>
<text text-anchor="middle" x="2384.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2395,-622.5 2395,-1105.5 "/>
<text text-anchor="middle" x="2535.5" y="-1090.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="2395,-1082.5 2676,-1082.5 "/>
<text text-anchor="middle" x="2535.5" y="-1067.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2395,-1059.5 2676,-1059.5 "/>
<text text-anchor="middle" x="2535.5" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2395,-1036.5 2676,-1036.5 "/>
<text text-anchor="middle" x="2535.5" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="2395,-1013.5 2676,-1013.5 "/>
<text text-anchor="middle" x="2535.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="2395,-990.5 2676,-990.5 "/>
<text text-anchor="middle" x="2535.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="2395,-967.5 2676,-967.5 "/>
<text text-anchor="middle" x="2535.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="2395,-944.5 2676,-944.5 "/>
<text text-anchor="middle" x="2535.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2395,-921.5 2676,-921.5 "/>
<text text-anchor="middle" x="2535.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="2395,-898.5 2676,-898.5 "/>
<text text-anchor="middle" x="2535.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2395,-875.5 2676,-875.5 "/>
<text text-anchor="middle" x="2535.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="2395,-852.5 2676,-852.5 "/>
<text text-anchor="middle" x="2535.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2395,-829.5 2676,-829.5 "/>
<text text-anchor="middle" x="2535.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="2395,-806.5 2676,-806.5 "/>
<text text-anchor="middle" x="2535.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="2395,-783.5 2676,-783.5 "/>
<text text-anchor="middle" x="2535.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2395,-760.5 2676,-760.5 "/>
<text text-anchor="middle" x="2535.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="2395,-737.5 2676,-737.5 "/>
<text text-anchor="middle" x="2535.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2395,-714.5 2676,-714.5 "/>
<text text-anchor="middle" x="2535.5" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="2395,-691.5 2676,-691.5 "/>
<text text-anchor="middle" x="2535.5" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2395,-668.5 2676,-668.5 "/>
<text text-anchor="middle" x="2535.5" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2395,-645.5 2676,-645.5 "/>
<text text-anchor="middle" x="2535.5" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2676,-622.5 2676,-1105.5 "/>
<text text-anchor="middle" x="2686.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge25" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2450.5,-622.1053C2450.5,-606.5346 2450.5,-592.48 2450.5,-580.8773"/>
<polygon fill="#000000" stroke="#000000" points="2454.0001,-580.5348 2450.5,-570.5348 2447.0001,-580.5348 2454.0001,-580.5348"/>
<text text-anchor="middle" x="2481.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge8" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2323.5713,-622.3341C2310.1186,-609.5419 2295.4506,-598.1972 2279.5,-589 2227.8073,-559.1935 1382.9054,-550.385 1076.4347,-548.1634"/>
<polygon fill="#000000" stroke="#000000" points="1076.2271,-544.6619 1066.2023,-548.0902 1076.177,-551.6617 1076.2271,-544.6619"/>
<text text-anchor="middle" x="2329.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- cohort -->
<g id="node10" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M3067,-524.5C3067,-524.5 3300,-524.5 3300,-524.5 3306,-524.5 3312,-530.5 3312,-536.5 3312,-536.5 3312,-558.5 3312,-558.5 3312,-564.5 3306,-570.5 3300,-570.5 3300,-570.5 3067,-570.5 3067,-570.5 3061,-570.5 3055,-564.5 3055,-558.5 3055,-558.5 3055,-536.5 3055,-536.5 3055,-530.5 3061,-524.5 3067,-524.5"/>
<text text-anchor="middle" x="3086.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="3118,-524.5 3118,-570.5 "/>
<text text-anchor="middle" x="3128.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3139,-524.5 3139,-570.5 "/>
<text text-anchor="middle" x="3215" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="3139,-547.5 3291,-547.5 "/>
<text text-anchor="middle" x="3215" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="3291,-524.5 3291,-570.5 "/>
<text text-anchor="middle" x="3301.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge39" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3185.9713,-524.3346C3187.9818,-492.868 3186.5957,-436.6864 3156.5,-403 3119.9073,-362.0414 2993.8645,-326.3137 2887.4662,-302.3946"/>
<polygon fill="#000000" stroke="#000000" points="2888.0839,-298.9465 2877.5622,-300.1892 2886.5623,-305.7792 2888.0839,-298.9465"/>
<text text-anchor="middle" x="3225" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge35" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M3129.5492,-524.4447C3116.0873,-518.5512 3101.7217,-512.1415 3088.5,-506 3060.7775,-493.1229 3030.2617,-478.1691 3004.9907,-465.5689"/>
<polygon fill="#000000" stroke="#000000" points="3006.4422,-462.3817 2995.9325,-461.0415 3003.3126,-468.6431 3006.4422,-462.3817"/>
<text text-anchor="middle" x="3129" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cycle -->
<g id="node11" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1085.5,-403.5C1085.5,-403.5 1313.5,-403.5 1313.5,-403.5 1319.5,-403.5 1325.5,-409.5 1325.5,-415.5 1325.5,-415.5 1325.5,-460.5 1325.5,-460.5 1325.5,-466.5 1319.5,-472.5 1313.5,-472.5 1313.5,-472.5 1085.5,-472.5 1085.5,-472.5 1079.5,-472.5 1073.5,-466.5 1073.5,-460.5 1073.5,-460.5 1073.5,-415.5 1073.5,-415.5 1073.5,-409.5 1079.5,-403.5 1085.5,-403.5"/>
<text text-anchor="middle" x="1100.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1127.5,-403.5 1127.5,-472.5 "/>
<text text-anchor="middle" x="1138" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1148.5,-403.5 1148.5,-472.5 "/>
<text text-anchor="middle" x="1226.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1148.5,-449.5 1304.5,-449.5 "/>
<text text-anchor="middle" x="1226.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1148.5,-426.5 1304.5,-426.5 "/>
<text text-anchor="middle" x="1226.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1304.5,-403.5 1304.5,-472.5 "/>
<text text-anchor="middle" x="1315" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node18" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1354,-1157.5C1354,-1157.5 1573,-1157.5 1573,-1157.5 1579,-1157.5 1585,-1163.5 1585,-1169.5 1585,-1169.5 1585,-1237.5 1585,-1237.5 1585,-1243.5 1579,-1249.5 1573,-1249.5 1573,-1249.5 1354,-1249.5 1354,-1249.5 1348,-1249.5 1342,-1243.5 1342,-1237.5 1342,-1237.5 1342,-1169.5 1342,-1169.5 1342,-1163.5 1348,-1157.5 1354,-1157.5"/>
<text text-anchor="middle" x="1366.5" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1391,-1157.5 1391,-1249.5 "/>
<text text-anchor="middle" x="1401.5" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1412,-1157.5 1412,-1249.5 "/>
<text text-anchor="middle" x="1488" y="-1234.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1412,-1226.5 1564,-1226.5 "/>
<text text-anchor="middle" x="1488" y="-1211.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1412,-1203.5 1564,-1203.5 "/>
<text text-anchor="middle" x="1488" y="-1188.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1412,-1180.5 1564,-1180.5 "/>
<text text-anchor="middle" x="1488" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1564,-1157.5 1564,-1249.5 "/>
<text text-anchor="middle" x="1574.5" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge31" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1198.2948,-472.5663C1194.073,-602.0924 1182.0985,-1053.9444 1218.5,-1106 1245.024,-1143.9304 1288.8111,-1167.1081 1332.0886,-1181.2698"/>
<polygon fill="#000000" stroke="#000000" points="1331.3028,-1184.691 1341.8915,-1184.3307 1333.3892,-1178.0091 1331.3028,-1184.691"/>
<text text-anchor="middle" x="1222.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge7" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1015.6286,-524.4117C1044.9184,-510.6467 1082.8646,-492.8136 1116.6721,-476.9256"/>
<polygon fill="#000000" stroke="#000000" points="1118.5254,-479.9219 1126.0872,-472.5009 1115.5481,-473.5866 1118.5254,-479.9219"/>
<text text-anchor="middle" x="1113" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge1" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1066.3627,-555.0146C1077.0961,-553.5674 1084,-551.0625 1084,-547.5 1084,-545.2178 1081.1666,-543.3696 1076.3082,-541.9555"/>
<polygon fill="#000000" stroke="#000000" points="1076.8522,-538.4953 1066.3627,-539.9854 1075.492,-545.3619 1076.8522,-538.4953"/>
<text text-anchor="middle" x="1100" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- study_site -->
<g id="node13" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M2368,-403.5C2368,-403.5 2685,-403.5 2685,-403.5 2691,-403.5 2697,-409.5 2697,-415.5 2697,-415.5 2697,-460.5 2697,-460.5 2697,-466.5 2691,-472.5 2685,-472.5 2685,-472.5 2368,-472.5 2368,-472.5 2362,-472.5 2356,-466.5 2356,-460.5 2356,-460.5 2356,-415.5 2356,-415.5 2356,-409.5 2362,-403.5 2368,-403.5"/>
<text text-anchor="middle" x="2401" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="2446,-403.5 2446,-472.5 "/>
<text text-anchor="middle" x="2456.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2467,-403.5 2467,-472.5 "/>
<text text-anchor="middle" x="2571.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2467,-449.5 2676,-449.5 "/>
<text text-anchor="middle" x="2571.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2467,-426.5 2676,-426.5 "/>
<text text-anchor="middle" x="2571.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2676,-403.5 2676,-472.5 "/>
<text text-anchor="middle" x="2686.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge22" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2567.7329,-403.3975C2583.5422,-390.1304 2602.3815,-374.3205 2621.4443,-358.3231"/>
<polygon fill="#000000" stroke="#000000" points="2623.9188,-360.8157 2629.329,-351.7063 2619.4189,-355.4537 2623.9188,-360.8157"/>
<text text-anchor="middle" x="2632" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file -->
<g id="node14" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M277,-2702.5C277,-2702.5 462,-2702.5 462,-2702.5 468,-2702.5 474,-2708.5 474,-2714.5 474,-2714.5 474,-2897.5 474,-2897.5 474,-2903.5 468,-2909.5 462,-2909.5 462,-2909.5 277,-2909.5 277,-2909.5 271,-2909.5 265,-2903.5 265,-2897.5 265,-2897.5 265,-2714.5 265,-2714.5 265,-2708.5 271,-2702.5 277,-2702.5"/>
<text text-anchor="middle" x="284.5" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="304,-2702.5 304,-2909.5 "/>
<text text-anchor="middle" x="314.5" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="325,-2702.5 325,-2909.5 "/>
<text text-anchor="middle" x="389" y="-2894.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="325,-2886.5 453,-2886.5 "/>
<text text-anchor="middle" x="389" y="-2871.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="325,-2863.5 453,-2863.5 "/>
<text text-anchor="middle" x="389" y="-2848.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="325,-2840.5 453,-2840.5 "/>
<text text-anchor="middle" x="389" y="-2825.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_locations</text>
<polyline fill="none" stroke="#000000" points="325,-2817.5 453,-2817.5 "/>
<text text-anchor="middle" x="389" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="325,-2794.5 453,-2794.5 "/>
<text text-anchor="middle" x="389" y="-2779.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="325,-2771.5 453,-2771.5 "/>
<text text-anchor="middle" x="389" y="-2756.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="325,-2748.5 453,-2748.5 "/>
<text text-anchor="middle" x="389" y="-2733.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="325,-2725.5 453,-2725.5 "/>
<text text-anchor="middle" x="389" y="-2710.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="453,-2702.5 453,-2909.5 "/>
<text text-anchor="middle" x="463.5" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis -->
<g id="node15" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M594,-1734.5C594,-1734.5 937,-1734.5 937,-1734.5 943,-1734.5 949,-1740.5 949,-1746.5 949,-1746.5 949,-2021.5 949,-2021.5 949,-2027.5 943,-2033.5 937,-2033.5 937,-2033.5 594,-2033.5 594,-2033.5 588,-2033.5 582,-2027.5 582,-2021.5 582,-2021.5 582,-1746.5 582,-1746.5 582,-1740.5 588,-1734.5 594,-1734.5"/>
<text text-anchor="middle" x="624" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="666,-1734.5 666,-2033.5 "/>
<text text-anchor="middle" x="676.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="687,-1734.5 687,-2033.5 "/>
<text text-anchor="middle" x="807.5" y="-2018.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="687,-2010.5 928,-2010.5 "/>
<text text-anchor="middle" x="807.5" y="-1995.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="687,-1987.5 928,-1987.5 "/>
<text text-anchor="middle" x="807.5" y="-1972.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="687,-1964.5 928,-1964.5 "/>
<text text-anchor="middle" x="807.5" y="-1949.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="687,-1941.5 928,-1941.5 "/>
<text text-anchor="middle" x="807.5" y="-1926.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="687,-1918.5 928,-1918.5 "/>
<text text-anchor="middle" x="807.5" y="-1903.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="687,-1895.5 928,-1895.5 "/>
<text text-anchor="middle" x="807.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="687,-1872.5 928,-1872.5 "/>
<text text-anchor="middle" x="807.5" y="-1857.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="687,-1849.5 928,-1849.5 "/>
<text text-anchor="middle" x="807.5" y="-1834.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="687,-1826.5 928,-1826.5 "/>
<text text-anchor="middle" x="807.5" y="-1811.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="687,-1803.5 928,-1803.5 "/>
<text text-anchor="middle" x="807.5" y="-1788.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="687,-1780.5 928,-1780.5 "/>
<text text-anchor="middle" x="807.5" y="-1765.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="687,-1757.5 928,-1757.5 "/>
<text text-anchor="middle" x="807.5" y="-1742.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="928,-1734.5 928,-2033.5 "/>
<text text-anchor="middle" x="938.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge27" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M425.6376,-2702.0954C433.3795,-2685.3147 440.6628,-2667.8984 446.5,-2651 535.2639,-2394.0321 432.6204,-2286.309 570.5,-2052 572.4564,-2048.6753 574.5027,-2045.3838 576.6304,-2042.127"/>
<polygon fill="#000000" stroke="#000000" points="579.7098,-2043.8233 582.4474,-2033.5883 573.9246,-2039.8822 579.7098,-2043.8233"/>
<text text-anchor="middle" x="495" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge17" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M302.6485,-2702.3989C299.694,-2696.2744 296.9487,-2690.1167 294.5,-2684 251.4405,-2576.4385 232.6719,-2438.3495 226.2587,-2379.7787"/>
<polygon fill="#000000" stroke="#000000" points="229.7349,-2379.369 225.2019,-2369.7929 222.7738,-2380.1057 229.7349,-2379.369"/>
<text text-anchor="middle" x="325" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- sample -->
<g id="node23" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M12,-1301.5C12,-1301.5 435,-1301.5 435,-1301.5 441,-1301.5 447,-1307.5 447,-1313.5 447,-1313.5 447,-1703.5 447,-1703.5 447,-1709.5 441,-1715.5 435,-1715.5 435,-1715.5 12,-1715.5 12,-1715.5 6,-1715.5 0,-1709.5 0,-1703.5 0,-1703.5 0,-1313.5 0,-1313.5 0,-1307.5 6,-1301.5 12,-1301.5"/>
<text text-anchor="middle" x="34" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="68,-1301.5 68,-1715.5 "/>
<text text-anchor="middle" x="78.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="89,-1301.5 89,-1715.5 "/>
<text text-anchor="middle" x="257.5" y="-1700.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-1692.5 426,-1692.5 "/>
<text text-anchor="middle" x="257.5" y="-1677.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="89,-1669.5 426,-1669.5 "/>
<text text-anchor="middle" x="257.5" y="-1654.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="89,-1646.5 426,-1646.5 "/>
<text text-anchor="middle" x="257.5" y="-1631.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="89,-1623.5 426,-1623.5 "/>
<text text-anchor="middle" x="257.5" y="-1608.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="89,-1600.5 426,-1600.5 "/>
<text text-anchor="middle" x="257.5" y="-1585.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="89,-1577.5 426,-1577.5 "/>
<text text-anchor="middle" x="257.5" y="-1562.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="89,-1554.5 426,-1554.5 "/>
<text text-anchor="middle" x="257.5" y="-1539.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="89,-1531.5 426,-1531.5 "/>
<text text-anchor="middle" x="257.5" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="89,-1508.5 426,-1508.5 "/>
<text text-anchor="middle" x="257.5" y="-1493.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-1485.5 426,-1485.5 "/>
<text text-anchor="middle" x="257.5" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-1462.5 426,-1462.5 "/>
<text text-anchor="middle" x="257.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-1439.5 426,-1439.5 "/>
<text text-anchor="middle" x="257.5" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="89,-1416.5 426,-1416.5 "/>
<text text-anchor="middle" x="257.5" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="89,-1393.5 426,-1393.5 "/>
<text text-anchor="middle" x="257.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="89,-1370.5 426,-1370.5 "/>
<text text-anchor="middle" x="257.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="89,-1347.5 426,-1347.5 "/>
<text text-anchor="middle" x="257.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="89,-1324.5 426,-1324.5 "/>
<text text-anchor="middle" x="257.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="426,-1301.5 426,-1715.5 "/>
<text text-anchor="middle" x="436.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge41" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M366.3138,-2702.1125C358.6382,-2470.3853 337.0093,-1917.2443 300.5,-1734 299.9316,-1731.1473 299.3364,-1728.2812 298.7162,-1725.4046"/>
<polygon fill="#000000" stroke="#000000" points="302.1181,-1724.5793 296.5142,-1715.5879 295.2879,-1726.1115 302.1181,-1724.5793"/>
<text text-anchor="middle" x="401" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge30" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M920.9698,-1734.3618C924.4411,-1728.3454 927.6363,-1722.2201 930.5,-1716 969.2119,-1631.9148 904.6444,-1369.8682 966.5,-1301 1014.2079,-1247.8834 1201.383,-1222.9218 1331.8847,-1211.7691"/>
<polygon fill="#000000" stroke="#000000" points="1332.2922,-1215.2473 1341.9653,-1210.9253 1331.7082,-1208.2717 1332.2922,-1215.2473"/>
<text text-anchor="middle" x="993.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge40" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M223.5,-2333.1088C223.5,-2254.7737 223.5,-1943.0456 223.5,-1726.159"/>
<polygon fill="#000000" stroke="#000000" points="227.0001,-1725.9041 223.5,-1715.9041 220.0001,-1725.9041 227.0001,-1725.9041"/>
<text text-anchor="middle" x="260" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- off_study -->
<g id="node17" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M2766,-760.5C2766,-760.5 3181,-760.5 3181,-760.5 3187,-760.5 3193,-766.5 3193,-772.5 3193,-772.5 3193,-955.5 3193,-955.5 3193,-961.5 3187,-967.5 3181,-967.5 3181,-967.5 2766,-967.5 2766,-967.5 2760,-967.5 2754,-961.5 2754,-955.5 2754,-955.5 2754,-772.5 2754,-772.5 2754,-766.5 2760,-760.5 2766,-760.5"/>
<text text-anchor="middle" x="2795.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="2837,-760.5 2837,-967.5 "/>
<text text-anchor="middle" x="2847.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2858,-760.5 2858,-967.5 "/>
<text text-anchor="middle" x="3015" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2858,-944.5 3172,-944.5 "/>
<text text-anchor="middle" x="3015" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2858,-921.5 3172,-921.5 "/>
<text text-anchor="middle" x="3015" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="2858,-898.5 3172,-898.5 "/>
<text text-anchor="middle" x="3015" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2858,-875.5 3172,-875.5 "/>
<text text-anchor="middle" x="3015" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2858,-852.5 3172,-852.5 "/>
<text text-anchor="middle" x="3015" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2858,-829.5 3172,-829.5 "/>
<text text-anchor="middle" x="3015" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2858,-806.5 3172,-806.5 "/>
<text text-anchor="middle" x="3015" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="2858,-783.5 3172,-783.5 "/>
<text text-anchor="middle" x="3015" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="3172,-760.5 3172,-967.5 "/>
<text text-anchor="middle" x="3182.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge24" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1585.0403,-1167.3291C1625.9866,-1152.0036 1670.6112,-1131.6562 1707.5,-1106 1724.4902,-1094.1833 1741.0901,-1080.8125 1757.0652,-1066.5717"/>
<polygon fill="#000000" stroke="#000000" points="1759.7949,-1068.8215 1764.8563,-1059.5138 1755.0953,-1063.6336 1759.7949,-1068.8215"/>
<text text-anchor="middle" x="1746.5" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge38" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1585.2142,-1198.1918C1890.4926,-1184.315 2667.1929,-1145.3043 2706.5,-1106 2744.645,-1067.8577 2725.5,-917.9433 2725.5,-864 2725.5,-864 2725.5,-864 2725.5,-438 2725.5,-413.2823 2725.5,-386.5067 2725.5,-361.7851"/>
<polygon fill="#000000" stroke="#000000" points="2729.0001,-361.6946 2725.5,-351.6946 2722.0001,-361.6947 2729.0001,-361.6946"/>
<text text-anchor="middle" x="2766" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge34" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1585.2002,-1201.3145C1971.572,-1193.7761 3148.3171,-1165.9631 3202.5,-1106 3339.2939,-954.6129 3238.509,-675.0361 3198.1736,-580.0574"/>
<polygon fill="#000000" stroke="#000000" points="3201.3044,-578.4787 3194.1316,-570.6812 3194.8763,-581.2498 3201.3044,-578.4787"/>
<text text-anchor="middle" x="3312" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge16" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1585.0204,-1202.8109C1883.8692,-1200.3455 2637.7625,-1189.1703 2739.5,-1139 2811.0523,-1103.7151 2869.2929,-1035.5504 2909.7741,-975.9169"/>
<polygon fill="#000000" stroke="#000000" points="2912.712,-977.8198 2915.3678,-967.5632 2906.8956,-973.925 2912.712,-977.8198"/>
<text text-anchor="middle" x="2819" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- off_treatment -->
<g id="node19" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1240,-772C1240,-772 1687,-772 1687,-772 1693,-772 1699,-778 1699,-784 1699,-784 1699,-944 1699,-944 1699,-950 1693,-956 1687,-956 1687,-956 1240,-956 1240,-956 1234,-956 1228,-950 1228,-944 1228,-944 1228,-784 1228,-784 1228,-778 1234,-772 1240,-772"/>
<text text-anchor="middle" x="1285.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1343,-772 1343,-956 "/>
<text text-anchor="middle" x="1353.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1364,-772 1364,-956 "/>
<text text-anchor="middle" x="1521" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1364,-933 1678,-933 "/>
<text text-anchor="middle" x="1521" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1364,-910 1678,-910 "/>
<text text-anchor="middle" x="1521" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1364,-887 1678,-887 "/>
<text text-anchor="middle" x="1521" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1364,-864 1678,-864 "/>
<text text-anchor="middle" x="1521" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1364,-841 1678,-841 "/>
<text text-anchor="middle" x="1521" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1364,-818 1678,-818 "/>
<text text-anchor="middle" x="1521" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1364,-795 1678,-795 "/>
<text text-anchor="middle" x="1521" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1678,-772 1678,-956 "/>
<text text-anchor="middle" x="1688.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge6" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1463.5,-1157.3602C1463.5,-1108.4857 1463.5,-1029.7518 1463.5,-966.1507"/>
<polygon fill="#000000" stroke="#000000" points="1467.0001,-966.0799 1463.5,-956.0799 1460.0001,-966.08 1467.0001,-966.0799"/>
<text text-anchor="middle" x="1534.5" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- demographic -->
<g id="node20" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M1433.5,-1428C1433.5,-1428 1769.5,-1428 1769.5,-1428 1775.5,-1428 1781.5,-1434 1781.5,-1440 1781.5,-1440 1781.5,-1577 1781.5,-1577 1781.5,-1583 1775.5,-1589 1769.5,-1589 1769.5,-1589 1433.5,-1589 1433.5,-1589 1427.5,-1589 1421.5,-1583 1421.5,-1577 1421.5,-1577 1421.5,-1440 1421.5,-1440 1421.5,-1434 1427.5,-1428 1433.5,-1428"/>
<text text-anchor="middle" x="1476.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="1531.5,-1428 1531.5,-1589 "/>
<text text-anchor="middle" x="1542" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1552.5,-1428 1552.5,-1589 "/>
<text text-anchor="middle" x="1656.5" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="1552.5,-1566 1760.5,-1566 "/>
<text text-anchor="middle" x="1656.5" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1552.5,-1543 1760.5,-1543 "/>
<text text-anchor="middle" x="1656.5" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1552.5,-1520 1760.5,-1520 "/>
<text text-anchor="middle" x="1656.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1552.5,-1497 1760.5,-1497 "/>
<text text-anchor="middle" x="1656.5" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1552.5,-1474 1760.5,-1474 "/>
<text text-anchor="middle" x="1656.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1552.5,-1451 1760.5,-1451 "/>
<text text-anchor="middle" x="1656.5" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1760.5,-1428 1760.5,-1589 "/>
<text text-anchor="middle" x="1771" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge29" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1565.0616,-1427.9659C1540.9556,-1374.6881 1509.9698,-1306.2049 1488.5967,-1258.9673"/>
<polygon fill="#000000" stroke="#000000" points="1491.7662,-1257.4819 1484.4551,-1249.8139 1485.3887,-1260.3675 1491.7662,-1257.4819"/>
<text text-anchor="middle" x="1524.5" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- physical_exam -->
<g id="node21" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M591.5,-2259.5C591.5,-2259.5 907.5,-2259.5 907.5,-2259.5 913.5,-2259.5 919.5,-2265.5 919.5,-2271.5 919.5,-2271.5 919.5,-2431.5 919.5,-2431.5 919.5,-2437.5 913.5,-2443.5 907.5,-2443.5 907.5,-2443.5 591.5,-2443.5 591.5,-2443.5 585.5,-2443.5 579.5,-2437.5 579.5,-2431.5 579.5,-2431.5 579.5,-2271.5 579.5,-2271.5 579.5,-2265.5 585.5,-2259.5 591.5,-2259.5"/>
<text text-anchor="middle" x="640.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="701.5,-2259.5 701.5,-2443.5 "/>
<text text-anchor="middle" x="712" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="722.5,-2259.5 722.5,-2443.5 "/>
<text text-anchor="middle" x="810.5" y="-2428.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="722.5,-2420.5 898.5,-2420.5 "/>
<text text-anchor="middle" x="810.5" y="-2405.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="722.5,-2397.5 898.5,-2397.5 "/>
<text text-anchor="middle" x="810.5" y="-2382.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="722.5,-2374.5 898.5,-2374.5 "/>
<text text-anchor="middle" x="810.5" y="-2359.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="722.5,-2351.5 898.5,-2351.5 "/>
<text text-anchor="middle" x="810.5" y="-2336.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="722.5,-2328.5 898.5,-2328.5 "/>
<text text-anchor="middle" x="810.5" y="-2313.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="722.5,-2305.5 898.5,-2305.5 "/>
<text text-anchor="middle" x="810.5" y="-2290.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="722.5,-2282.5 898.5,-2282.5 "/>
<text text-anchor="middle" x="810.5" y="-2267.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="898.5,-2259.5 898.5,-2443.5 "/>
<text text-anchor="middle" x="909" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge10" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M684.4581,-2259.2911C644.9808,-2198.3059 597.526,-2114.9424 572.5,-2034 475.8685,-1721.4616 605.9178,-1612.3425 505.5,-1301 474.615,-1205.2421 416.9902,-1203.0656 390.5,-1106 333.8653,-898.4782 248.4836,-783.5678 390.5,-622 420.7289,-587.6095 698.0304,-564.5158 856.5812,-554.0011"/>
<polygon fill="#000000" stroke="#000000" points="857.1,-557.4747 866.8491,-553.3268 856.6412,-550.4897 857.1,-557.4747"/>
<text text-anchor="middle" x="510.5" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge21" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M803.4801,-2259.2358C840.1331,-2198.7051 890.9617,-2118.7072 941.5,-2052 947.9637,-2043.4684 951.6318,-2042.9516 957.5,-2034 1038.0646,-1911.1032 1031.0695,-1865.5793 1096.5,-1734 1114.9309,-1696.9358 1135.8744,-1656.9217 1155.0481,-1621.0359"/>
<polygon fill="#000000" stroke="#000000" points="1158.2483,-1622.4738 1159.882,-1612.0057 1152.0768,-1619.1702 1158.2483,-1622.4738"/>
<text text-anchor="middle" x="1146.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- follow_up -->
<g id="node22" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M577.5,-1405C577.5,-1405 909.5,-1405 909.5,-1405 915.5,-1405 921.5,-1411 921.5,-1417 921.5,-1417 921.5,-1600 921.5,-1600 921.5,-1606 915.5,-1612 909.5,-1612 909.5,-1612 577.5,-1612 577.5,-1612 571.5,-1612 565.5,-1606 565.5,-1600 565.5,-1600 565.5,-1417 565.5,-1417 565.5,-1411 571.5,-1405 577.5,-1405"/>
<text text-anchor="middle" x="608" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="650.5,-1405 650.5,-1612 "/>
<text text-anchor="middle" x="661" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="671.5,-1405 671.5,-1612 "/>
<text text-anchor="middle" x="786" y="-1596.8" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="671.5,-1589 900.5,-1589 "/>
<text text-anchor="middle" x="786" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="671.5,-1566 900.5,-1566 "/>
<text text-anchor="middle" x="786" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="671.5,-1543 900.5,-1543 "/>
<text text-anchor="middle" x="786" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="671.5,-1520 900.5,-1520 "/>
<text text-anchor="middle" x="786" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="671.5,-1497 900.5,-1497 "/>
<text text-anchor="middle" x="786" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="671.5,-1474 900.5,-1474 "/>
<text text-anchor="middle" x="786" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="671.5,-1451 900.5,-1451 "/>
<text text-anchor="middle" x="786" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="671.5,-1428 900.5,-1428 "/>
<text text-anchor="middle" x="786" y="-1412.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="900.5,-1405 900.5,-1612 "/>
<text text-anchor="middle" x="911" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge32" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M780.9315,-1404.9433C804.3547,-1355.2902 839.6953,-1299.8213 889.5,-1268 925.9347,-1244.7211 1173.7892,-1223.534 1331.6668,-1212.1855"/>
<polygon fill="#000000" stroke="#000000" points="1332.2074,-1215.6559 1341.9326,-1211.4523 1331.7086,-1208.6737 1332.2074,-1215.6559"/>
<text text-anchor="middle" x="916.5" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge9" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M187.0979,-1301.4082C163.0132,-1089.6069 165.1652,-767.1256 357.5,-589 375.5102,-572.3204 686.5478,-558.0432 856.9533,-551.4302"/>
<polygon fill="#000000" stroke="#000000" points="857.1084,-554.9269 866.9661,-551.0441 856.8386,-547.9321 857.1084,-554.9269"/>
<text text-anchor="middle" x="205.5" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge33" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M447.104,-1351.4268C482.4872,-1331.8662 519.6069,-1314.1534 556.5,-1301 696.002,-1251.2638 1115.7892,-1222.1594 1331.8531,-1210.0872"/>
<polygon fill="#000000" stroke="#000000" points="1332.1951,-1213.5737 1341.9859,-1209.5252 1331.8074,-1206.5845 1332.1951,-1213.5737"/>
<text text-anchor="middle" x="710.5" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge2" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M447.0955,-1536.6646C458.3572,-1529.6694 465,-1520.2813 465,-1508.5 465,-1499.8481 461.4175,-1492.4869 455.0541,-1486.4162"/>
<polygon fill="#000000" stroke="#000000" points="457.1666,-1483.6256 447.0955,-1480.3354 452.9167,-1489.1879 457.1666,-1483.6256"/>
<text text-anchor="middle" x="481" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- disease_extent -->
<g id="node24" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M411.5,-714.5C411.5,-714.5 727.5,-714.5 727.5,-714.5 733.5,-714.5 739.5,-720.5 739.5,-726.5 739.5,-726.5 739.5,-1001.5 739.5,-1001.5 739.5,-1007.5 733.5,-1013.5 727.5,-1013.5 727.5,-1013.5 411.5,-1013.5 411.5,-1013.5 405.5,-1013.5 399.5,-1007.5 399.5,-1001.5 399.5,-1001.5 399.5,-726.5 399.5,-726.5 399.5,-720.5 405.5,-714.5 411.5,-714.5"/>
<text text-anchor="middle" x="461" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="522.5,-714.5 522.5,-1013.5 "/>
<text text-anchor="middle" x="533" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="543.5,-714.5 543.5,-1013.5 "/>
<text text-anchor="middle" x="631" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="543.5,-990.5 718.5,-990.5 "/>
<text text-anchor="middle" x="631" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="543.5,-967.5 718.5,-967.5 "/>
<text text-anchor="middle" x="631" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="543.5,-944.5 718.5,-944.5 "/>
<text text-anchor="middle" x="631" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="543.5,-921.5 718.5,-921.5 "/>
<text text-anchor="middle" x="631" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="543.5,-898.5 718.5,-898.5 "/>
<text text-anchor="middle" x="631" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="543.5,-875.5 718.5,-875.5 "/>
<text text-anchor="middle" x="631" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="543.5,-852.5 718.5,-852.5 "/>
<text text-anchor="middle" x="631" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="543.5,-829.5 718.5,-829.5 "/>
<text text-anchor="middle" x="631" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="543.5,-806.5 718.5,-806.5 "/>
<text text-anchor="middle" x="631" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="543.5,-783.5 718.5,-783.5 "/>
<text text-anchor="middle" x="631" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="543.5,-760.5 718.5,-760.5 "/>
<text text-anchor="middle" x="631" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="543.5,-737.5 718.5,-737.5 "/>
<text text-anchor="middle" x="631" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="718.5,-714.5 718.5,-1013.5 "/>
<text text-anchor="middle" x="729" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge13" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M658.1869,-714.3888C683.8731,-680.3979 714.3374,-646.9933 748.5,-622 780.4284,-598.6412 820.228,-582.2112 857.0501,-570.8429"/>
<polygon fill="#000000" stroke="#000000" points="858.2641,-574.133 866.8425,-567.9151 856.2589,-567.4264 858.2641,-574.133"/>
<text text-anchor="middle" x="831.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- vital_signs -->
<g id="node25" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M770,-703C770,-703 1057,-703 1057,-703 1063,-703 1069,-709 1069,-715 1069,-715 1069,-1013 1069,-1013 1069,-1019 1063,-1025 1057,-1025 1057,-1025 770,-1025 770,-1025 764,-1025 758,-1019 758,-1013 758,-1013 758,-715 758,-715 758,-709 764,-703 770,-703"/>
<text text-anchor="middle" x="804.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="851,-703 851,-1025 "/>
<text text-anchor="middle" x="861.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="872,-703 872,-1025 "/>
<text text-anchor="middle" x="960" y="-1009.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="872,-1002 1048,-1002 "/>
<text text-anchor="middle" x="960" y="-986.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="872,-979 1048,-979 "/>
<text text-anchor="middle" x="960" y="-963.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="872,-956 1048,-956 "/>
<text text-anchor="middle" x="960" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="872,-933 1048,-933 "/>
<text text-anchor="middle" x="960" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="872,-910 1048,-910 "/>
<text text-anchor="middle" x="960" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="872,-887 1048,-887 "/>
<text text-anchor="middle" x="960" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="872,-864 1048,-864 "/>
<text text-anchor="middle" x="960" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="872,-841 1048,-841 "/>
<text text-anchor="middle" x="960" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="872,-818 1048,-818 "/>
<text text-anchor="middle" x="960" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="872,-795 1048,-795 "/>
<text text-anchor="middle" x="960" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="872,-772 1048,-772 "/>
<text text-anchor="middle" x="960" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="872,-749 1048,-749 "/>
<text text-anchor="middle" x="960" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="872,-726 1048,-726 "/>
<text text-anchor="middle" x="960" y="-710.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1048,-703 1048,-1025 "/>
<text text-anchor="middle" x="1058.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge14" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M940.4658,-702.9684C948.2321,-656.5902 955.9451,-610.5306 960.9354,-580.7299"/>
<polygon fill="#000000" stroke="#000000" points="964.4461,-580.9566 962.6458,-570.5158 957.5423,-579.8004 964.4461,-580.9566"/>
<text text-anchor="middle" x="987.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge28" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1300.4676,-1404.8153C1340.4573,-1355.4353 1386.6291,-1298.4216 1419.6055,-1257.7018"/>
<polygon fill="#000000" stroke="#000000" points="1422.4455,-1259.7561 1426.0191,-1249.7821 1417.0056,-1255.3507 1422.4455,-1259.7561"/>
<text text-anchor="middle" x="1437.5" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge36" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2919.2147,-414.7794C2898.7406,-399.583 2870.582,-378.6831 2842.0741,-357.5239"/>
<polygon fill="#000000" stroke="#000000" points="2844.1461,-354.7031 2834.0302,-351.5535 2839.9741,-360.324 2844.1461,-354.7031"/>
<text text-anchor="middle" x="2918" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- lab_exam -->
<g id="node28" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1099.5,-846C1099.5,-846 1159.5,-846 1159.5,-846 1165.5,-846 1171.5,-852 1171.5,-858 1171.5,-858 1171.5,-870 1171.5,-870 1171.5,-876 1165.5,-882 1159.5,-882 1159.5,-882 1099.5,-882 1099.5,-882 1093.5,-882 1087.5,-876 1087.5,-870 1087.5,-870 1087.5,-858 1087.5,-858 1087.5,-852 1093.5,-846 1099.5,-846"/>
<text text-anchor="middle" x="1129.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge11" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1130.036,-845.831C1130.4229,-802.9878 1126.2032,-693.855 1077.5,-622 1064.6269,-603.0074 1045.1431,-587.5736 1026.074,-575.7823"/>
<polygon fill="#000000" stroke="#000000" points="1027.754,-572.7094 1017.367,-570.6212 1024.1847,-578.7311 1027.754,-572.7094"/>
<text text-anchor="middle" x="1089.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
</g>
</svg>
</div>
