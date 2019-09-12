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
<svg width="3854pt" height="2918pt"
 viewBox="0.00 0.00 3854.40 2918.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2914)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2914 3850.4028,-2914 3850.4028,4 -4,4"/>
<!-- prior_therapy -->
<g id="node1" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M876.9028,-2052.5C876.9028,-2052.5 1332.9028,-2052.5 1332.9028,-2052.5 1338.9028,-2052.5 1344.9028,-2058.5 1344.9028,-2064.5 1344.9028,-2064.5 1344.9028,-2638.5 1344.9028,-2638.5 1344.9028,-2644.5 1338.9028,-2650.5 1332.9028,-2650.5 1332.9028,-2650.5 876.9028,-2650.5 876.9028,-2650.5 870.9028,-2650.5 864.9028,-2644.5 864.9028,-2638.5 864.9028,-2638.5 864.9028,-2064.5 864.9028,-2064.5 864.9028,-2058.5 870.9028,-2052.5 876.9028,-2052.5"/>
<text text-anchor="middle" x="922.4028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="979.9028,-2052.5 979.9028,-2650.5 "/>
<text text-anchor="middle" x="990.4028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2052.5 1000.9028,-2650.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2635.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2627.5 1323.9028,-2627.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2612.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2604.5 1323.9028,-2604.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2589.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2581.5 1323.9028,-2581.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2566.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2558.5 1323.9028,-2558.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2543.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2535.5 1323.9028,-2535.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2520.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2512.5 1323.9028,-2512.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2497.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2489.5 1323.9028,-2489.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2474.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2466.5 1323.9028,-2466.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2451.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2443.5 1323.9028,-2443.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2428.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2420.5 1323.9028,-2420.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2405.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2397.5 1323.9028,-2397.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2382.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2374.5 1323.9028,-2374.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2359.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2351.5 1323.9028,-2351.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2336.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2328.5 1323.9028,-2328.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2313.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2305.5 1323.9028,-2305.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2290.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2282.5 1323.9028,-2282.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2267.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2259.5 1323.9028,-2259.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2244.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2236.5 1323.9028,-2236.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2221.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2213.5 1323.9028,-2213.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2198.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2190.5 1323.9028,-2190.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2175.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2167.5 1323.9028,-2167.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2152.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2144.5 1323.9028,-2144.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2129.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2121.5 1323.9028,-2121.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2106.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2098.5 1323.9028,-2098.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2083.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="1000.9028,-2075.5 1323.9028,-2075.5 "/>
<text text-anchor="middle" x="1162.4028" y="-2060.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1323.9028,-2052.5 1323.9028,-2650.5 "/>
<text text-anchor="middle" x="1334.4028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge35" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M1345.1412,-2389.6912C1356.3415,-2380.0507 1362.9028,-2367.3203 1362.9028,-2351.5 1362.9028,-2339.3876 1359.0567,-2329.0864 1352.2272,-2320.5965"/>
<polygon fill="#000000" stroke="#000000" points="1354.6217,-2318.0385 1345.1412,-2313.3088 1349.603,-2322.9183 1354.6217,-2318.0385"/>
<text text-anchor="middle" x="1378.9028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node26" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M1416.4028,-1405C1416.4028,-1405 1765.4028,-1405 1765.4028,-1405 1771.4028,-1405 1777.4028,-1411 1777.4028,-1417 1777.4028,-1417 1777.4028,-1600 1777.4028,-1600 1777.4028,-1606 1771.4028,-1612 1765.4028,-1612 1765.4028,-1612 1416.4028,-1612 1416.4028,-1612 1410.4028,-1612 1404.4028,-1606 1404.4028,-1600 1404.4028,-1600 1404.4028,-1417 1404.4028,-1417 1404.4028,-1411 1410.4028,-1405 1416.4028,-1405"/>
<text text-anchor="middle" x="1451.9028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="1499.4028,-1405 1499.4028,-1612 "/>
<text text-anchor="middle" x="1509.9028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1520.4028,-1405 1520.4028,-1612 "/>
<text text-anchor="middle" x="1638.4028" y="-1596.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="1520.4028,-1589 1756.4028,-1589 "/>
<text text-anchor="middle" x="1638.4028" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1520.4028,-1566 1756.4028,-1566 "/>
<text text-anchor="middle" x="1638.4028" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="1520.4028,-1543 1756.4028,-1543 "/>
<text text-anchor="middle" x="1638.4028" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="1520.4028,-1520 1756.4028,-1520 "/>
<text text-anchor="middle" x="1638.4028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="1520.4028,-1497 1756.4028,-1497 "/>
<text text-anchor="middle" x="1638.4028" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="1520.4028,-1474 1756.4028,-1474 "/>
<text text-anchor="middle" x="1638.4028" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="1520.4028,-1451 1756.4028,-1451 "/>
<text text-anchor="middle" x="1638.4028" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="1520.4028,-1428 1756.4028,-1428 "/>
<text text-anchor="middle" x="1638.4028" y="-1412.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1756.4028,-1405 1756.4028,-1612 "/>
<text text-anchor="middle" x="1766.9028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge9" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1277.4454,-2052.213C1363.6634,-1902.6622 1462.8348,-1730.6426 1526.1426,-1620.8309"/>
<polygon fill="#000000" stroke="#000000" points="1529.2437,-1622.4594 1531.2061,-1612.0479 1523.1793,-1618.9632 1529.2437,-1622.4594"/>
<text text-anchor="middle" x="1510.9028" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- cycle -->
<g id="node2" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1549.9028,-403.5C1549.9028,-403.5 1777.9028,-403.5 1777.9028,-403.5 1783.9028,-403.5 1789.9028,-409.5 1789.9028,-415.5 1789.9028,-415.5 1789.9028,-460.5 1789.9028,-460.5 1789.9028,-466.5 1783.9028,-472.5 1777.9028,-472.5 1777.9028,-472.5 1549.9028,-472.5 1549.9028,-472.5 1543.9028,-472.5 1537.9028,-466.5 1537.9028,-460.5 1537.9028,-460.5 1537.9028,-415.5 1537.9028,-415.5 1537.9028,-409.5 1543.9028,-403.5 1549.9028,-403.5"/>
<text text-anchor="middle" x="1564.9028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1591.9028,-403.5 1591.9028,-472.5 "/>
<text text-anchor="middle" x="1602.4028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1612.9028,-403.5 1612.9028,-472.5 "/>
<text text-anchor="middle" x="1690.9028" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1612.9028,-449.5 1768.9028,-449.5 "/>
<text text-anchor="middle" x="1690.9028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1612.9028,-426.5 1768.9028,-426.5 "/>
<text text-anchor="middle" x="1690.9028" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1768.9028,-403.5 1768.9028,-472.5 "/>
<text text-anchor="middle" x="1779.4028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node16" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1895.4028,-1157.5C1895.4028,-1157.5 2114.4028,-1157.5 2114.4028,-1157.5 2120.4028,-1157.5 2126.4028,-1163.5 2126.4028,-1169.5 2126.4028,-1169.5 2126.4028,-1237.5 2126.4028,-1237.5 2126.4028,-1243.5 2120.4028,-1249.5 2114.4028,-1249.5 2114.4028,-1249.5 1895.4028,-1249.5 1895.4028,-1249.5 1889.4028,-1249.5 1883.4028,-1243.5 1883.4028,-1237.5 1883.4028,-1237.5 1883.4028,-1169.5 1883.4028,-1169.5 1883.4028,-1163.5 1889.4028,-1157.5 1895.4028,-1157.5"/>
<text text-anchor="middle" x="1907.9028" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1932.4028,-1157.5 1932.4028,-1249.5 "/>
<text text-anchor="middle" x="1942.9028" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1953.4028,-1157.5 1953.4028,-1249.5 "/>
<text text-anchor="middle" x="2029.4028" y="-1234.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1953.4028,-1226.5 2105.4028,-1226.5 "/>
<text text-anchor="middle" x="2029.4028" y="-1211.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1953.4028,-1203.5 2105.4028,-1203.5 "/>
<text text-anchor="middle" x="2029.4028" y="-1188.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1953.4028,-1180.5 2105.4028,-1180.5 "/>
<text text-anchor="middle" x="2029.4028" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="2105.4028,-1157.5 2105.4028,-1249.5 "/>
<text text-anchor="middle" x="2115.9028" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge7" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1790.2072,-472.0214C1863.1733,-499.2518 1947.8441,-545.8281 1985.9028,-622 2031.242,-712.7435 2017.1322,-1019.0504 2008.9494,-1146.8063"/>
<polygon fill="#000000" stroke="#000000" points="2005.4332,-1146.9422 2008.2748,-1157.1488 2012.4183,-1147.3979 2005.4332,-1146.9422"/>
<text text-anchor="middle" x="2000.9028" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample -->
<g id="node3" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M208.4028,-1301.5C208.4028,-1301.5 631.4028,-1301.5 631.4028,-1301.5 637.4028,-1301.5 643.4028,-1307.5 643.4028,-1313.5 643.4028,-1313.5 643.4028,-1703.5 643.4028,-1703.5 643.4028,-1709.5 637.4028,-1715.5 631.4028,-1715.5 631.4028,-1715.5 208.4028,-1715.5 208.4028,-1715.5 202.4028,-1715.5 196.4028,-1709.5 196.4028,-1703.5 196.4028,-1703.5 196.4028,-1313.5 196.4028,-1313.5 196.4028,-1307.5 202.4028,-1301.5 208.4028,-1301.5"/>
<text text-anchor="middle" x="230.4028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="264.4028,-1301.5 264.4028,-1715.5 "/>
<text text-anchor="middle" x="274.9028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="285.4028,-1301.5 285.4028,-1715.5 "/>
<text text-anchor="middle" x="453.9028" y="-1700.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1692.5 622.4028,-1692.5 "/>
<text text-anchor="middle" x="453.9028" y="-1677.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1669.5 622.4028,-1669.5 "/>
<text text-anchor="middle" x="453.9028" y="-1654.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1646.5 622.4028,-1646.5 "/>
<text text-anchor="middle" x="453.9028" y="-1631.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1623.5 622.4028,-1623.5 "/>
<text text-anchor="middle" x="453.9028" y="-1608.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1600.5 622.4028,-1600.5 "/>
<text text-anchor="middle" x="453.9028" y="-1585.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1577.5 622.4028,-1577.5 "/>
<text text-anchor="middle" x="453.9028" y="-1562.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1554.5 622.4028,-1554.5 "/>
<text text-anchor="middle" x="453.9028" y="-1539.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1531.5 622.4028,-1531.5 "/>
<text text-anchor="middle" x="453.9028" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1508.5 622.4028,-1508.5 "/>
<text text-anchor="middle" x="453.9028" y="-1493.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1485.5 622.4028,-1485.5 "/>
<text text-anchor="middle" x="453.9028" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1462.5 622.4028,-1462.5 "/>
<text text-anchor="middle" x="453.9028" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1439.5 622.4028,-1439.5 "/>
<text text-anchor="middle" x="453.9028" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1416.5 622.4028,-1416.5 "/>
<text text-anchor="middle" x="453.9028" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1393.5 622.4028,-1393.5 "/>
<text text-anchor="middle" x="453.9028" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1370.5 622.4028,-1370.5 "/>
<text text-anchor="middle" x="453.9028" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1347.5 622.4028,-1347.5 "/>
<text text-anchor="middle" x="453.9028" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="285.4028,-1324.5 622.4028,-1324.5 "/>
<text text-anchor="middle" x="453.9028" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="622.4028,-1301.5 622.4028,-1715.5 "/>
<text text-anchor="middle" x="632.9028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge33" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M643.4983,-1536.6646C654.76,-1529.6694 661.4028,-1520.2813 661.4028,-1508.5 661.4028,-1499.8481 657.8203,-1492.4869 651.4568,-1486.4162"/>
<polygon fill="#000000" stroke="#000000" points="653.5693,-1483.6256 643.4983,-1480.3354 649.3194,-1489.1879 653.5693,-1483.6256"/>
<text text-anchor="middle" x="677.4028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge6" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M643.4221,-1416.7238C754.0143,-1374.9663 890.5787,-1328.7764 1016.9028,-1301 1318.7221,-1234.6354 1682.3946,-1213.4049 1873.2381,-1206.6403"/>
<polygon fill="#000000" stroke="#000000" points="1873.4421,-1210.1355 1883.3148,-1206.2909 1873.1995,-1203.1397 1873.4421,-1210.1355"/>
<text text-anchor="middle" x="1203.9028" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit -->
<g id="node23" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M627.4028,-524.5C627.4028,-524.5 802.4028,-524.5 802.4028,-524.5 808.4028,-524.5 814.4028,-530.5 814.4028,-536.5 814.4028,-536.5 814.4028,-558.5 814.4028,-558.5 814.4028,-564.5 808.4028,-570.5 802.4028,-570.5 802.4028,-570.5 627.4028,-570.5 627.4028,-570.5 621.4028,-570.5 615.4028,-564.5 615.4028,-558.5 615.4028,-558.5 615.4028,-536.5 615.4028,-536.5 615.4028,-530.5 621.4028,-524.5 627.4028,-524.5"/>
<text text-anchor="middle" x="638.9028" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="662.4028,-524.5 662.4028,-570.5 "/>
<text text-anchor="middle" x="672.9028" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="683.4028,-524.5 683.4028,-570.5 "/>
<text text-anchor="middle" x="738.4028" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="683.4028,-547.5 793.4028,-547.5 "/>
<text text-anchor="middle" x="738.4028" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="793.4028,-524.5 793.4028,-570.5 "/>
<text text-anchor="middle" x="803.9028" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge24" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M279.7395,-1301.2453C246.2212,-1240.8667 215.1655,-1173.0419 197.9028,-1106 171.0829,-1001.842 127.4817,-703.2962 197.9028,-622 224.1763,-591.669 461.2716,-567.6656 605.0982,-555.7396"/>
<polygon fill="#000000" stroke="#000000" points="605.6088,-559.2096 615.2884,-554.9019 605.0352,-552.2331 605.6088,-559.2096"/>
<text text-anchor="middle" x="235.9028" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- cohort -->
<g id="node4" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M2481.4028,-524.5C2481.4028,-524.5 2714.4028,-524.5 2714.4028,-524.5 2720.4028,-524.5 2726.4028,-530.5 2726.4028,-536.5 2726.4028,-536.5 2726.4028,-558.5 2726.4028,-558.5 2726.4028,-564.5 2720.4028,-570.5 2714.4028,-570.5 2714.4028,-570.5 2481.4028,-570.5 2481.4028,-570.5 2475.4028,-570.5 2469.4028,-564.5 2469.4028,-558.5 2469.4028,-558.5 2469.4028,-536.5 2469.4028,-536.5 2469.4028,-530.5 2475.4028,-524.5 2481.4028,-524.5"/>
<text text-anchor="middle" x="2500.9028" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="2532.4028,-524.5 2532.4028,-570.5 "/>
<text text-anchor="middle" x="2542.9028" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2553.4028,-524.5 2553.4028,-570.5 "/>
<text text-anchor="middle" x="2629.4028" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="2553.4028,-547.5 2705.4028,-547.5 "/>
<text text-anchor="middle" x="2629.4028" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2705.4028,-524.5 2705.4028,-570.5 "/>
<text text-anchor="middle" x="2715.9028" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm -->
<g id="node7" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M2413.4028,-415C2413.4028,-415 2782.4028,-415 2782.4028,-415 2788.4028,-415 2794.4028,-421 2794.4028,-427 2794.4028,-427 2794.4028,-449 2794.4028,-449 2794.4028,-455 2788.4028,-461 2782.4028,-461 2782.4028,-461 2413.4028,-461 2413.4028,-461 2407.4028,-461 2401.4028,-455 2401.4028,-449 2401.4028,-449 2401.4028,-427 2401.4028,-427 2401.4028,-421 2407.4028,-415 2413.4028,-415"/>
<text text-anchor="middle" x="2447.4028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="2493.4028,-415 2493.4028,-461 "/>
<text text-anchor="middle" x="2503.9028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2514.4028,-415 2514.4028,-461 "/>
<text text-anchor="middle" x="2643.9028" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="2514.4028,-438 2773.4028,-438 "/>
<text text-anchor="middle" x="2643.9028" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="2773.4028,-415 2773.4028,-461 "/>
<text text-anchor="middle" x="2783.9028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge18" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2597.9028,-524.2779C2597.9028,-508.8892 2597.9028,-488.4597 2597.9028,-471.3432"/>
<polygon fill="#000000" stroke="#000000" points="2601.4029,-471.1886 2597.9028,-461.1887 2594.4029,-471.1887 2601.4029,-471.1886"/>
<text text-anchor="middle" x="2638.4028" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study -->
<g id="node20" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M2967.9028,-190.5C2967.9028,-190.5 3247.9028,-190.5 3247.9028,-190.5 3253.9028,-190.5 3259.9028,-196.5 3259.9028,-202.5 3259.9028,-202.5 3259.9028,-339.5 3259.9028,-339.5 3259.9028,-345.5 3253.9028,-351.5 3247.9028,-351.5 3247.9028,-351.5 2967.9028,-351.5 2967.9028,-351.5 2961.9028,-351.5 2955.9028,-345.5 2955.9028,-339.5 2955.9028,-339.5 2955.9028,-202.5 2955.9028,-202.5 2955.9028,-196.5 2961.9028,-190.5 2967.9028,-190.5"/>
<text text-anchor="middle" x="2983.9028" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="3011.9028,-190.5 3011.9028,-351.5 "/>
<text text-anchor="middle" x="3022.4028" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3032.9028,-190.5 3032.9028,-351.5 "/>
<text text-anchor="middle" x="3135.9028" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="3032.9028,-328.5 3238.9028,-328.5 "/>
<text text-anchor="middle" x="3135.9028" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="3032.9028,-305.5 3238.9028,-305.5 "/>
<text text-anchor="middle" x="3135.9028" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="3032.9028,-282.5 3238.9028,-282.5 "/>
<text text-anchor="middle" x="3135.9028" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="3032.9028,-259.5 3238.9028,-259.5 "/>
<text text-anchor="middle" x="3135.9028" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="3032.9028,-236.5 3238.9028,-236.5 "/>
<text text-anchor="middle" x="3135.9028" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="3032.9028,-213.5 3238.9028,-213.5 "/>
<text text-anchor="middle" x="3135.9028" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="3238.9028,-190.5 3238.9028,-351.5 "/>
<text text-anchor="middle" x="3249.4028" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge17" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2675.059,-524.4728C2714.5391,-511.4832 2762.8077,-493.7071 2803.9028,-473 2868.8974,-440.2503 2936.7633,-396.2272 2991.8416,-357.6382"/>
<polygon fill="#000000" stroke="#000000" points="2994.0577,-360.3585 3000.2207,-351.7406 2990.0287,-354.6343 2994.0577,-360.3585"/>
<text text-anchor="middle" x="2964.4028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_study -->
<g id="node5" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M2652.4028,-760.5C2652.4028,-760.5 3067.4028,-760.5 3067.4028,-760.5 3073.4028,-760.5 3079.4028,-766.5 3079.4028,-772.5 3079.4028,-772.5 3079.4028,-955.5 3079.4028,-955.5 3079.4028,-961.5 3073.4028,-967.5 3067.4028,-967.5 3067.4028,-967.5 2652.4028,-967.5 2652.4028,-967.5 2646.4028,-967.5 2640.4028,-961.5 2640.4028,-955.5 2640.4028,-955.5 2640.4028,-772.5 2640.4028,-772.5 2640.4028,-766.5 2646.4028,-760.5 2652.4028,-760.5"/>
<text text-anchor="middle" x="2681.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="2723.4028,-760.5 2723.4028,-967.5 "/>
<text text-anchor="middle" x="2733.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2744.4028,-760.5 2744.4028,-967.5 "/>
<text text-anchor="middle" x="2901.4028" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="2744.4028,-944.5 3058.4028,-944.5 "/>
<text text-anchor="middle" x="2901.4028" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2744.4028,-921.5 3058.4028,-921.5 "/>
<text text-anchor="middle" x="2901.4028" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2744.4028,-898.5 3058.4028,-898.5 "/>
<text text-anchor="middle" x="2901.4028" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="2744.4028,-875.5 3058.4028,-875.5 "/>
<text text-anchor="middle" x="2901.4028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2744.4028,-852.5 3058.4028,-852.5 "/>
<text text-anchor="middle" x="2901.4028" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2744.4028,-829.5 3058.4028,-829.5 "/>
<text text-anchor="middle" x="2901.4028" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2744.4028,-806.5 3058.4028,-806.5 "/>
<text text-anchor="middle" x="2901.4028" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2744.4028,-783.5 3058.4028,-783.5 "/>
<text text-anchor="middle" x="2901.4028" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="3058.4028,-760.5 3058.4028,-967.5 "/>
<text text-anchor="middle" x="3068.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- program -->
<g id="node6" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M2953.9028,-.5C2953.9028,-.5 3261.9028,-.5 3261.9028,-.5 3267.9028,-.5 3273.9028,-6.5 3273.9028,-12.5 3273.9028,-12.5 3273.9028,-126.5 3273.9028,-126.5 3273.9028,-132.5 3267.9028,-138.5 3261.9028,-138.5 3261.9028,-138.5 2953.9028,-138.5 2953.9028,-138.5 2947.9028,-138.5 2941.9028,-132.5 2941.9028,-126.5 2941.9028,-126.5 2941.9028,-12.5 2941.9028,-12.5 2941.9028,-6.5 2947.9028,-.5 2953.9028,-.5"/>
<text text-anchor="middle" x="2980.9028" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="3019.9028,-.5 3019.9028,-138.5 "/>
<text text-anchor="middle" x="3030.4028" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3040.9028,-.5 3040.9028,-138.5 "/>
<text text-anchor="middle" x="3146.9028" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="3040.9028,-115.5 3252.9028,-115.5 "/>
<text text-anchor="middle" x="3146.9028" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="3040.9028,-92.5 3252.9028,-92.5 "/>
<text text-anchor="middle" x="3146.9028" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="3040.9028,-69.5 3252.9028,-69.5 "/>
<text text-anchor="middle" x="3146.9028" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="3040.9028,-46.5 3252.9028,-46.5 "/>
<text text-anchor="middle" x="3146.9028" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="3040.9028,-23.5 3252.9028,-23.5 "/>
<text text-anchor="middle" x="3146.9028" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="3252.9028,-.5 3252.9028,-138.5 "/>
<text text-anchor="middle" x="3263.4028" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge19" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2668.2806,-414.9547C2739.6758,-391.5763 2852.6872,-354.5706 2946.2487,-323.9338"/>
<polygon fill="#000000" stroke="#000000" points="2947.4028,-327.2388 2955.8171,-320.8006 2945.2244,-320.5864 2947.4028,-327.2388"/>
<text text-anchor="middle" x="2832.4028" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- principal_investigator -->
<g id="node8" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M3148.4028,-403.5C3148.4028,-403.5 3475.4028,-403.5 3475.4028,-403.5 3481.4028,-403.5 3487.4028,-409.5 3487.4028,-415.5 3487.4028,-415.5 3487.4028,-460.5 3487.4028,-460.5 3487.4028,-466.5 3481.4028,-472.5 3475.4028,-472.5 3475.4028,-472.5 3148.4028,-472.5 3148.4028,-472.5 3142.4028,-472.5 3136.4028,-466.5 3136.4028,-460.5 3136.4028,-460.5 3136.4028,-415.5 3136.4028,-415.5 3136.4028,-409.5 3142.4028,-403.5 3148.4028,-403.5"/>
<text text-anchor="middle" x="3223.4028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="3310.4028,-403.5 3310.4028,-472.5 "/>
<text text-anchor="middle" x="3320.9028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3331.4028,-403.5 3331.4028,-472.5 "/>
<text text-anchor="middle" x="3398.9028" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="3331.4028,-449.5 3466.4028,-449.5 "/>
<text text-anchor="middle" x="3398.9028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="3331.4028,-426.5 3466.4028,-426.5 "/>
<text text-anchor="middle" x="3398.9028" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="3466.4028,-403.5 3466.4028,-472.5 "/>
<text text-anchor="middle" x="3476.9028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge38" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3269.6338,-403.3975C3253.3553,-390.0715 3233.943,-374.18 3214.3124,-358.1098"/>
<polygon fill="#000000" stroke="#000000" points="3216.4451,-355.3326 3206.4902,-351.7063 3212.011,-360.7491 3216.4451,-355.3326"/>
<text text-anchor="middle" x="3276.4028" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- follow_up -->
<g id="node9" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1963.9028,-1405C1963.9028,-1405 2295.9028,-1405 2295.9028,-1405 2301.9028,-1405 2307.9028,-1411 2307.9028,-1417 2307.9028,-1417 2307.9028,-1600 2307.9028,-1600 2307.9028,-1606 2301.9028,-1612 2295.9028,-1612 2295.9028,-1612 1963.9028,-1612 1963.9028,-1612 1957.9028,-1612 1951.9028,-1606 1951.9028,-1600 1951.9028,-1600 1951.9028,-1417 1951.9028,-1417 1951.9028,-1411 1957.9028,-1405 1963.9028,-1405"/>
<text text-anchor="middle" x="1994.4028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="2036.9028,-1405 2036.9028,-1612 "/>
<text text-anchor="middle" x="2047.4028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2057.9028,-1405 2057.9028,-1612 "/>
<text text-anchor="middle" x="2172.4028" y="-1596.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="2057.9028,-1589 2286.9028,-1589 "/>
<text text-anchor="middle" x="2172.4028" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="2057.9028,-1566 2286.9028,-1566 "/>
<text text-anchor="middle" x="2172.4028" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="2057.9028,-1543 2286.9028,-1543 "/>
<text text-anchor="middle" x="2172.4028" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="2057.9028,-1520 2286.9028,-1520 "/>
<text text-anchor="middle" x="2172.4028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="2057.9028,-1497 2286.9028,-1497 "/>
<text text-anchor="middle" x="2172.4028" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2057.9028,-1474 2286.9028,-1474 "/>
<text text-anchor="middle" x="2172.4028" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="2057.9028,-1451 2286.9028,-1451 "/>
<text text-anchor="middle" x="2172.4028" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="2057.9028,-1428 2286.9028,-1428 "/>
<text text-anchor="middle" x="2172.4028" y="-1412.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2286.9028,-1405 2286.9028,-1612 "/>
<text text-anchor="middle" x="2297.4028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge5" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2087.4091,-1404.8153C2067.4243,-1356.0525 2044.3887,-1299.8457 2027.7455,-1259.2363"/>
<polygon fill="#000000" stroke="#000000" points="2030.9017,-1257.7079 2023.8709,-1249.7821 2024.4246,-1260.3625 2030.9017,-1257.7079"/>
<text text-anchor="middle" x="2061.9028" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- image -->
<g id="node10" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M492.9028,-2788C492.9028,-2788 528.9028,-2788 528.9028,-2788 534.9028,-2788 540.9028,-2794 540.9028,-2800 540.9028,-2800 540.9028,-2812 540.9028,-2812 540.9028,-2818 534.9028,-2824 528.9028,-2824 528.9028,-2824 492.9028,-2824 492.9028,-2824 486.9028,-2824 480.9028,-2818 480.9028,-2812 480.9028,-2812 480.9028,-2800 480.9028,-2800 480.9028,-2794 486.9028,-2788 492.9028,-2788"/>
<text text-anchor="middle" x="510.9028" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node18" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M553.9028,-2333.5C553.9028,-2333.5 585.9028,-2333.5 585.9028,-2333.5 591.9028,-2333.5 597.9028,-2339.5 597.9028,-2345.5 597.9028,-2345.5 597.9028,-2357.5 597.9028,-2357.5 597.9028,-2363.5 591.9028,-2369.5 585.9028,-2369.5 585.9028,-2369.5 553.9028,-2369.5 553.9028,-2369.5 547.9028,-2369.5 541.9028,-2363.5 541.9028,-2357.5 541.9028,-2357.5 541.9028,-2345.5 541.9028,-2345.5 541.9028,-2339.5 547.9028,-2333.5 553.9028,-2333.5"/>
<text text-anchor="middle" x="569.9028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge13" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M513.5831,-2787.8789C517.8363,-2758.9594 526.3228,-2700.5754 532.9028,-2651 546.1233,-2551.3928 560.3014,-2432.9354 566.5822,-2379.7766"/>
<polygon fill="#000000" stroke="#000000" points="570.0697,-2380.0881 567.765,-2369.747 563.1178,-2379.2682 570.0697,-2380.0881"/>
<text text-anchor="middle" x="561.4028" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- study_site -->
<g id="node11" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M3517.4028,-403.5C3517.4028,-403.5 3834.4028,-403.5 3834.4028,-403.5 3840.4028,-403.5 3846.4028,-409.5 3846.4028,-415.5 3846.4028,-415.5 3846.4028,-460.5 3846.4028,-460.5 3846.4028,-466.5 3840.4028,-472.5 3834.4028,-472.5 3834.4028,-472.5 3517.4028,-472.5 3517.4028,-472.5 3511.4028,-472.5 3505.4028,-466.5 3505.4028,-460.5 3505.4028,-460.5 3505.4028,-415.5 3505.4028,-415.5 3505.4028,-409.5 3511.4028,-403.5 3517.4028,-403.5"/>
<text text-anchor="middle" x="3550.4028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="3595.4028,-403.5 3595.4028,-472.5 "/>
<text text-anchor="middle" x="3605.9028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3616.4028,-403.5 3616.4028,-472.5 "/>
<text text-anchor="middle" x="3720.9028" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="3616.4028,-449.5 3825.4028,-449.5 "/>
<text text-anchor="middle" x="3720.9028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="3616.4028,-426.5 3825.4028,-426.5 "/>
<text text-anchor="middle" x="3720.9028" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="3825.4028,-403.5 3825.4028,-472.5 "/>
<text text-anchor="middle" x="3835.9028" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge39" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3558.5573,-403.4988C3475.0224,-378.9383 3361.7197,-345.6258 3269.6225,-318.5479"/>
<polygon fill="#000000" stroke="#000000" points="3270.5078,-315.1601 3259.9266,-315.6972 3268.5333,-321.8758 3270.5078,-315.1601"/>
<text text-anchor="middle" x="3522.4028" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- lab_exam -->
<g id="node12" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M576.9028,-846C576.9028,-846 636.9028,-846 636.9028,-846 642.9028,-846 648.9028,-852 648.9028,-858 648.9028,-858 648.9028,-870 648.9028,-870 648.9028,-876 642.9028,-882 636.9028,-882 636.9028,-882 576.9028,-882 576.9028,-882 570.9028,-882 564.9028,-876 564.9028,-870 564.9028,-870 564.9028,-858 564.9028,-858 564.9028,-852 570.9028,-846 576.9028,-846"/>
<text text-anchor="middle" x="606.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge27" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M607.9899,-845.8407C611.0448,-804.3675 621.9838,-700.2368 657.9028,-622 665.0374,-606.4598 675.9084,-591.1344 686.2505,-578.4619"/>
<polygon fill="#000000" stroke="#000000" points="689.1575,-580.4438 692.9258,-570.5418 683.805,-575.9326 689.1575,-580.4438"/>
<text text-anchor="middle" x="705.9028" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- disease_extent -->
<g id="node13" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M218.9028,-714.5C218.9028,-714.5 534.9028,-714.5 534.9028,-714.5 540.9028,-714.5 546.9028,-720.5 546.9028,-726.5 546.9028,-726.5 546.9028,-1001.5 546.9028,-1001.5 546.9028,-1007.5 540.9028,-1013.5 534.9028,-1013.5 534.9028,-1013.5 218.9028,-1013.5 218.9028,-1013.5 212.9028,-1013.5 206.9028,-1007.5 206.9028,-1001.5 206.9028,-1001.5 206.9028,-726.5 206.9028,-726.5 206.9028,-720.5 212.9028,-714.5 218.9028,-714.5"/>
<text text-anchor="middle" x="268.4028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="329.9028,-714.5 329.9028,-1013.5 "/>
<text text-anchor="middle" x="340.4028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="350.9028,-714.5 350.9028,-1013.5 "/>
<text text-anchor="middle" x="438.4028" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="350.9028,-990.5 525.9028,-990.5 "/>
<text text-anchor="middle" x="438.4028" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="350.9028,-967.5 525.9028,-967.5 "/>
<text text-anchor="middle" x="438.4028" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="350.9028,-944.5 525.9028,-944.5 "/>
<text text-anchor="middle" x="438.4028" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="350.9028,-921.5 525.9028,-921.5 "/>
<text text-anchor="middle" x="438.4028" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="350.9028,-898.5 525.9028,-898.5 "/>
<text text-anchor="middle" x="438.4028" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="350.9028,-875.5 525.9028,-875.5 "/>
<text text-anchor="middle" x="438.4028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="350.9028,-852.5 525.9028,-852.5 "/>
<text text-anchor="middle" x="438.4028" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="350.9028,-829.5 525.9028,-829.5 "/>
<text text-anchor="middle" x="438.4028" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="350.9028,-806.5 525.9028,-806.5 "/>
<text text-anchor="middle" x="438.4028" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="350.9028,-783.5 525.9028,-783.5 "/>
<text text-anchor="middle" x="438.4028" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="350.9028,-760.5 525.9028,-760.5 "/>
<text text-anchor="middle" x="438.4028" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="350.9028,-737.5 525.9028,-737.5 "/>
<text text-anchor="middle" x="438.4028" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="525.9028,-714.5 525.9028,-1013.5 "/>
<text text-anchor="middle" x="536.4028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge26" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M473.5283,-714.3604C498.2014,-681.8884 526.2215,-649.1695 555.9028,-622 577.928,-601.8387 606.3761,-586.1989 633.1075,-574.5722"/>
<polygon fill="#000000" stroke="#000000" points="634.62,-577.733 642.4778,-570.6263 631.9032,-571.2817 634.62,-577.733"/>
<text text-anchor="middle" x="631.9028" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- physical_exam -->
<g id="node14" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M195.9028,-2259.5C195.9028,-2259.5 511.9028,-2259.5 511.9028,-2259.5 517.9028,-2259.5 523.9028,-2265.5 523.9028,-2271.5 523.9028,-2271.5 523.9028,-2431.5 523.9028,-2431.5 523.9028,-2437.5 517.9028,-2443.5 511.9028,-2443.5 511.9028,-2443.5 195.9028,-2443.5 195.9028,-2443.5 189.9028,-2443.5 183.9028,-2437.5 183.9028,-2431.5 183.9028,-2431.5 183.9028,-2271.5 183.9028,-2271.5 183.9028,-2265.5 189.9028,-2259.5 195.9028,-2259.5"/>
<text text-anchor="middle" x="244.9028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="305.9028,-2259.5 305.9028,-2443.5 "/>
<text text-anchor="middle" x="316.4028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="326.9028,-2259.5 326.9028,-2443.5 "/>
<text text-anchor="middle" x="414.9028" y="-2428.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="326.9028,-2420.5 502.9028,-2420.5 "/>
<text text-anchor="middle" x="414.9028" y="-2405.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="326.9028,-2397.5 502.9028,-2397.5 "/>
<text text-anchor="middle" x="414.9028" y="-2382.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="326.9028,-2374.5 502.9028,-2374.5 "/>
<text text-anchor="middle" x="414.9028" y="-2359.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="326.9028,-2351.5 502.9028,-2351.5 "/>
<text text-anchor="middle" x="414.9028" y="-2336.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="326.9028,-2328.5 502.9028,-2328.5 "/>
<text text-anchor="middle" x="414.9028" y="-2313.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="326.9028,-2305.5 502.9028,-2305.5 "/>
<text text-anchor="middle" x="414.9028" y="-2290.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="326.9028,-2282.5 502.9028,-2282.5 "/>
<text text-anchor="middle" x="414.9028" y="-2267.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="502.9028,-2259.5 502.9028,-2443.5 "/>
<text text-anchor="middle" x="513.4028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge25" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M310.204,-2259.3658C241.9837,-2106.8294 117.9028,-1790.615 117.9028,-1508.5 117.9028,-1508.5 117.9028,-1508.5 117.9028,-864 117.9028,-755.1265 88.3078,-707.3484 155.9028,-622 180.0374,-591.5266 199.114,-598.117 236.9028,-589 304.274,-572.7458 486.0179,-560.0883 604.9855,-553.2192"/>
<polygon fill="#000000" stroke="#000000" points="605.4396,-556.699 615.2233,-552.6334 605.0397,-549.7105 605.4396,-556.699"/>
<text text-anchor="middle" x="145.9028" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge10" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M386.4415,-2259.4707C414.9062,-2192.1562 462.7772,-2103.8771 532.9028,-2052 559.767,-2032.1265 574.6192,-2045.7466 605.9028,-2034 877.9695,-1931.8424 907.726,-1814.727 1186.9028,-1734 1276.0409,-1708.2247 1311.3547,-1756.3694 1394.9028,-1716 1440.2035,-1694.1113 1480.4005,-1656.9473 1512.4168,-1620.067"/>
<polygon fill="#000000" stroke="#000000" points="1515.295,-1622.0861 1519.1234,-1612.2071 1509.97,-1617.5424 1515.295,-1622.0861"/>
<text text-anchor="middle" x="1236.9028" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- agent_administration -->
<g id="node15" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M1495.4028,-622.5C1495.4028,-622.5 1964.4028,-622.5 1964.4028,-622.5 1970.4028,-622.5 1976.4028,-628.5 1976.4028,-634.5 1976.4028,-634.5 1976.4028,-1093.5 1976.4028,-1093.5 1976.4028,-1099.5 1970.4028,-1105.5 1964.4028,-1105.5 1964.4028,-1105.5 1495.4028,-1105.5 1495.4028,-1105.5 1489.4028,-1105.5 1483.4028,-1099.5 1483.4028,-1093.5 1483.4028,-1093.5 1483.4028,-634.5 1483.4028,-634.5 1483.4028,-628.5 1489.4028,-622.5 1495.4028,-622.5"/>
<text text-anchor="middle" x="1568.4028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="1653.4028,-622.5 1653.4028,-1105.5 "/>
<text text-anchor="middle" x="1663.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1674.4028,-622.5 1674.4028,-1105.5 "/>
<text text-anchor="middle" x="1814.9028" y="-1090.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-1082.5 1955.4028,-1082.5 "/>
<text text-anchor="middle" x="1814.9028" y="-1067.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-1059.5 1955.4028,-1059.5 "/>
<text text-anchor="middle" x="1814.9028" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-1036.5 1955.4028,-1036.5 "/>
<text text-anchor="middle" x="1814.9028" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-1013.5 1955.4028,-1013.5 "/>
<text text-anchor="middle" x="1814.9028" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-990.5 1955.4028,-990.5 "/>
<text text-anchor="middle" x="1814.9028" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-967.5 1955.4028,-967.5 "/>
<text text-anchor="middle" x="1814.9028" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-944.5 1955.4028,-944.5 "/>
<text text-anchor="middle" x="1814.9028" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-921.5 1955.4028,-921.5 "/>
<text text-anchor="middle" x="1814.9028" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-898.5 1955.4028,-898.5 "/>
<text text-anchor="middle" x="1814.9028" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-875.5 1955.4028,-875.5 "/>
<text text-anchor="middle" x="1814.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-852.5 1955.4028,-852.5 "/>
<text text-anchor="middle" x="1814.9028" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-829.5 1955.4028,-829.5 "/>
<text text-anchor="middle" x="1814.9028" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-806.5 1955.4028,-806.5 "/>
<text text-anchor="middle" x="1814.9028" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-783.5 1955.4028,-783.5 "/>
<text text-anchor="middle" x="1814.9028" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-760.5 1955.4028,-760.5 "/>
<text text-anchor="middle" x="1814.9028" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-737.5 1955.4028,-737.5 "/>
<text text-anchor="middle" x="1814.9028" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-714.5 1955.4028,-714.5 "/>
<text text-anchor="middle" x="1814.9028" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-691.5 1955.4028,-691.5 "/>
<text text-anchor="middle" x="1814.9028" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-668.5 1955.4028,-668.5 "/>
<text text-anchor="middle" x="1814.9028" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1674.4028,-645.5 1955.4028,-645.5 "/>
<text text-anchor="middle" x="1814.9028" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1955.4028,-622.5 1955.4028,-1105.5 "/>
<text text-anchor="middle" x="1965.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent -->
<g id="node22" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M1616.9028,-524.5C1616.9028,-524.5 1842.9028,-524.5 1842.9028,-524.5 1848.9028,-524.5 1854.9028,-530.5 1854.9028,-536.5 1854.9028,-536.5 1854.9028,-558.5 1854.9028,-558.5 1854.9028,-564.5 1848.9028,-570.5 1842.9028,-570.5 1842.9028,-570.5 1616.9028,-570.5 1616.9028,-570.5 1610.9028,-570.5 1604.9028,-564.5 1604.9028,-558.5 1604.9028,-558.5 1604.9028,-536.5 1604.9028,-536.5 1604.9028,-530.5 1610.9028,-524.5 1616.9028,-524.5"/>
<text text-anchor="middle" x="1633.4028" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1661.9028,-524.5 1661.9028,-570.5 "/>
<text text-anchor="middle" x="1672.4028" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1682.9028,-524.5 1682.9028,-570.5 "/>
<text text-anchor="middle" x="1758.4028" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1682.9028,-547.5 1833.9028,-547.5 "/>
<text text-anchor="middle" x="1758.4028" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1833.9028,-524.5 1833.9028,-570.5 "/>
<text text-anchor="middle" x="1844.4028" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge30" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1729.9028,-622.1053C1729.9028,-606.5346 1729.9028,-592.48 1729.9028,-580.8773"/>
<polygon fill="#000000" stroke="#000000" points="1733.4029,-580.5348 1729.9028,-570.5348 1726.4029,-580.5348 1733.4029,-580.5348"/>
<text text-anchor="middle" x="1760.9028" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge23" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1508.6207,-622.2309C1489.4762,-609.4119 1469.5114,-598.0933 1448.9028,-589 1393.4073,-564.5133 1015.5925,-553.5092 824.7506,-549.4664"/>
<polygon fill="#000000" stroke="#000000" points="824.7601,-545.966 814.6891,-549.2561 824.6137,-552.9644 824.7601,-545.966"/>
<text text-anchor="middle" x="1505.9028" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge16" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M2126.4432,-1196.8192C2260.3886,-1186.7105 2463.6001,-1162.3319 2513.9028,-1106 2585.7505,-1025.5407 2517.0163,-724.4085 2550.9028,-622 2555.8991,-606.9006 2564.5927,-591.7741 2573.155,-579.1344"/>
<polygon fill="#000000" stroke="#000000" points="2576.1194,-581.0037 2579.0147,-570.8121 2570.3958,-576.9737 2576.1194,-581.0037"/>
<text text-anchor="middle" x="2591.4028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge11" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M2126.4265,-1193.7789C2263.3498,-1182.0275 2476.968,-1161.0659 2554.9028,-1139 2588.3841,-1129.5203 2597.5545,-1126.1801 2625.9028,-1106 2677.774,-1069.0748 2727.8758,-1019.7488 2768.3195,-975.2647"/>
<polygon fill="#000000" stroke="#000000" points="2771.1386,-977.365 2775.2402,-967.5963 2765.942,-972.6751 2771.1386,-977.365"/>
<text text-anchor="middle" x="2651.4028" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- off_treatment -->
<g id="node19" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M2045.4028,-772C2045.4028,-772 2492.4028,-772 2492.4028,-772 2498.4028,-772 2504.4028,-778 2504.4028,-784 2504.4028,-784 2504.4028,-944 2504.4028,-944 2504.4028,-950 2498.4028,-956 2492.4028,-956 2492.4028,-956 2045.4028,-956 2045.4028,-956 2039.4028,-956 2033.4028,-950 2033.4028,-944 2033.4028,-944 2033.4028,-784 2033.4028,-784 2033.4028,-778 2039.4028,-772 2045.4028,-772"/>
<text text-anchor="middle" x="2090.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="2148.4028,-772 2148.4028,-956 "/>
<text text-anchor="middle" x="2158.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2169.4028,-772 2169.4028,-956 "/>
<text text-anchor="middle" x="2326.4028" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2169.4028,-933 2483.4028,-933 "/>
<text text-anchor="middle" x="2326.4028" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2169.4028,-910 2483.4028,-910 "/>
<text text-anchor="middle" x="2326.4028" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2169.4028,-887 2483.4028,-887 "/>
<text text-anchor="middle" x="2326.4028" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2169.4028,-864 2483.4028,-864 "/>
<text text-anchor="middle" x="2326.4028" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2169.4028,-841 2483.4028,-841 "/>
<text text-anchor="middle" x="2326.4028" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2169.4028,-818 2483.4028,-818 "/>
<text text-anchor="middle" x="2326.4028" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2169.4028,-795 2483.4028,-795 "/>
<text text-anchor="middle" x="2326.4028" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2483.4028,-772 2483.4028,-956 "/>
<text text-anchor="middle" x="2493.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge37" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M2040.7817,-1157.3602C2079.1782,-1107.9829 2141.2741,-1028.1286 2190.9916,-964.1926"/>
<polygon fill="#000000" stroke="#000000" points="2193.9244,-966.1226 2197.3001,-956.0799 2188.3985,-961.8256 2193.9244,-966.1226"/>
<text text-anchor="middle" x="2132.9028" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge15" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2126.5205,-1201.2301C2395.4869,-1194.9969 3022.3323,-1173.3304 3088.9028,-1106 3164.7559,-1029.2809 3107.9028,-971.8865 3107.9028,-864 3107.9028,-864 3107.9028,-864 3107.9028,-438 3107.9028,-413.2823 3107.9028,-386.5067 3107.9028,-361.7851"/>
<polygon fill="#000000" stroke="#000000" points="3111.4029,-361.6946 3107.9028,-351.6946 3104.4029,-361.6947 3111.4029,-361.6946"/>
<text text-anchor="middle" x="3148.4028" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- adverse_event -->
<g id="node25" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1008.4028,-668.5C1008.4028,-668.5 1403.4028,-668.5 1403.4028,-668.5 1409.4028,-668.5 1415.4028,-674.5 1415.4028,-680.5 1415.4028,-680.5 1415.4028,-1047.5 1415.4028,-1047.5 1415.4028,-1053.5 1409.4028,-1059.5 1403.4028,-1059.5 1403.4028,-1059.5 1008.4028,-1059.5 1008.4028,-1059.5 1002.4028,-1059.5 996.4028,-1053.5 996.4028,-1047.5 996.4028,-1047.5 996.4028,-680.5 996.4028,-680.5 996.4028,-674.5 1002.4028,-668.5 1008.4028,-668.5"/>
<text text-anchor="middle" x="1056.4028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1116.4028,-668.5 1116.4028,-1059.5 "/>
<text text-anchor="middle" x="1126.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1137.4028,-668.5 1137.4028,-1059.5 "/>
<text text-anchor="middle" x="1265.9028" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-1036.5 1394.4028,-1036.5 "/>
<text text-anchor="middle" x="1265.9028" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-1013.5 1394.4028,-1013.5 "/>
<text text-anchor="middle" x="1265.9028" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-990.5 1394.4028,-990.5 "/>
<text text-anchor="middle" x="1265.9028" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-967.5 1394.4028,-967.5 "/>
<text text-anchor="middle" x="1265.9028" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-944.5 1394.4028,-944.5 "/>
<text text-anchor="middle" x="1265.9028" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-921.5 1394.4028,-921.5 "/>
<text text-anchor="middle" x="1265.9028" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-898.5 1394.4028,-898.5 "/>
<text text-anchor="middle" x="1265.9028" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-875.5 1394.4028,-875.5 "/>
<text text-anchor="middle" x="1265.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-852.5 1394.4028,-852.5 "/>
<text text-anchor="middle" x="1265.9028" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-829.5 1394.4028,-829.5 "/>
<text text-anchor="middle" x="1265.9028" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-806.5 1394.4028,-806.5 "/>
<text text-anchor="middle" x="1265.9028" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-783.5 1394.4028,-783.5 "/>
<text text-anchor="middle" x="1265.9028" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-760.5 1394.4028,-760.5 "/>
<text text-anchor="middle" x="1265.9028" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-737.5 1394.4028,-737.5 "/>
<text text-anchor="middle" x="1265.9028" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-714.5 1394.4028,-714.5 "/>
<text text-anchor="middle" x="1265.9028" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1137.4028,-691.5 1394.4028,-691.5 "/>
<text text-anchor="middle" x="1265.9028" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1394.4028,-668.5 1394.4028,-1059.5 "/>
<text text-anchor="middle" x="1404.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge1" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1883.2833,-1188.9247C1749.795,-1171.5656 1545.1025,-1140.5419 1474.9028,-1106 1451.9121,-1094.6874 1429.4187,-1080.8361 1407.8478,-1065.5423"/>
<polygon fill="#000000" stroke="#000000" points="1409.7845,-1062.6238 1399.6265,-1059.6125 1405.6895,-1068.3011 1409.7845,-1062.6238"/>
<text text-anchor="middle" x="1640.9028" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- diagnosis -->
<g id="node17" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M1708.4028,-1734.5C1708.4028,-1734.5 2051.4028,-1734.5 2051.4028,-1734.5 2057.4028,-1734.5 2063.4028,-1740.5 2063.4028,-1746.5 2063.4028,-1746.5 2063.4028,-2021.5 2063.4028,-2021.5 2063.4028,-2027.5 2057.4028,-2033.5 2051.4028,-2033.5 2051.4028,-2033.5 1708.4028,-2033.5 1708.4028,-2033.5 1702.4028,-2033.5 1696.4028,-2027.5 1696.4028,-2021.5 1696.4028,-2021.5 1696.4028,-1746.5 1696.4028,-1746.5 1696.4028,-1740.5 1702.4028,-1734.5 1708.4028,-1734.5"/>
<text text-anchor="middle" x="1738.4028" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="1780.4028,-1734.5 1780.4028,-2033.5 "/>
<text text-anchor="middle" x="1790.9028" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1801.4028,-1734.5 1801.4028,-2033.5 "/>
<text text-anchor="middle" x="1921.9028" y="-2018.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="1801.4028,-2010.5 2042.4028,-2010.5 "/>
<text text-anchor="middle" x="1921.9028" y="-1995.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="1801.4028,-1987.5 2042.4028,-1987.5 "/>
<text text-anchor="middle" x="1921.9028" y="-1972.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="1801.4028,-1964.5 2042.4028,-1964.5 "/>
<text text-anchor="middle" x="1921.9028" y="-1949.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="1801.4028,-1941.5 2042.4028,-1941.5 "/>
<text text-anchor="middle" x="1921.9028" y="-1926.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="1801.4028,-1918.5 2042.4028,-1918.5 "/>
<text text-anchor="middle" x="1921.9028" y="-1903.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="1801.4028,-1895.5 2042.4028,-1895.5 "/>
<text text-anchor="middle" x="1921.9028" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="1801.4028,-1872.5 2042.4028,-1872.5 "/>
<text text-anchor="middle" x="1921.9028" y="-1857.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="1801.4028,-1849.5 2042.4028,-1849.5 "/>
<text text-anchor="middle" x="1921.9028" y="-1834.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="1801.4028,-1826.5 2042.4028,-1826.5 "/>
<text text-anchor="middle" x="1921.9028" y="-1811.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="1801.4028,-1803.5 2042.4028,-1803.5 "/>
<text text-anchor="middle" x="1921.9028" y="-1788.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="1801.4028,-1780.5 2042.4028,-1780.5 "/>
<text text-anchor="middle" x="1921.9028" y="-1765.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="1801.4028,-1757.5 2042.4028,-1757.5 "/>
<text text-anchor="middle" x="1921.9028" y="-1742.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2042.4028,-1734.5 2042.4028,-2033.5 "/>
<text text-anchor="middle" x="2052.9028" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge3" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1849.287,-1734.3714C1831.7106,-1611.7879 1824.2719,-1436.9996 1888.9028,-1301 1896.8583,-1284.2595 1909.2208,-1269.3487 1922.9619,-1256.5283"/>
<polygon fill="#000000" stroke="#000000" points="1925.577,-1258.8863 1930.7185,-1249.6227 1920.9223,-1253.6581 1925.577,-1258.8863"/>
<text text-anchor="middle" x="1915.9028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge20" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M568.1697,-2333.1927C563.6138,-2286.2741 550.4332,-2157.9629 532.9028,-2052 515.0152,-1943.8779 490.7229,-1824.5734 469.2452,-1725.354"/>
<polygon fill="#000000" stroke="#000000" points="472.6502,-1724.5405 467.1093,-1715.5101 465.8094,-1726.0249 472.6502,-1724.5405"/>
<text text-anchor="middle" x="565.4028" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge14" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M3107.9028,-190.4932C3107.9028,-176.7786 3107.9028,-162.5421 3107.9028,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="3111.4029,-148.5183 3107.9028,-138.5184 3104.4029,-148.5184 3111.4029,-148.5183"/>
<text text-anchor="middle" x="3148.4028" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- prior_surgery -->
<g id="node21" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M1424.9028,-2271C1424.9028,-2271 1770.9028,-2271 1770.9028,-2271 1776.9028,-2271 1782.9028,-2277 1782.9028,-2283 1782.9028,-2283 1782.9028,-2420 1782.9028,-2420 1782.9028,-2426 1776.9028,-2432 1770.9028,-2432 1770.9028,-2432 1424.9028,-2432 1424.9028,-2432 1418.9028,-2432 1412.9028,-2426 1412.9028,-2420 1412.9028,-2420 1412.9028,-2283 1412.9028,-2283 1412.9028,-2277 1418.9028,-2271 1424.9028,-2271"/>
<text text-anchor="middle" x="1470.4028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="1527.9028,-2271 1527.9028,-2432 "/>
<text text-anchor="middle" x="1538.4028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1548.9028,-2271 1548.9028,-2432 "/>
<text text-anchor="middle" x="1655.4028" y="-2416.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="1548.9028,-2409 1761.9028,-2409 "/>
<text text-anchor="middle" x="1655.4028" y="-2393.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1548.9028,-2386 1761.9028,-2386 "/>
<text text-anchor="middle" x="1655.4028" y="-2370.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1548.9028,-2363 1761.9028,-2363 "/>
<text text-anchor="middle" x="1655.4028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1548.9028,-2340 1761.9028,-2340 "/>
<text text-anchor="middle" x="1655.4028" y="-2324.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="1548.9028,-2317 1761.9028,-2317 "/>
<text text-anchor="middle" x="1655.4028" y="-2301.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="1548.9028,-2294 1761.9028,-2294 "/>
<text text-anchor="middle" x="1655.4028" y="-2278.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="1761.9028,-2271 1761.9028,-2432 "/>
<text text-anchor="middle" x="1772.4028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge32" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M1783.0158,-2393.5585C1794.1935,-2383.5547 1800.9028,-2369.5352 1800.9028,-2351.5 1800.9028,-2337.5509 1796.8893,-2326.004 1789.899,-2316.8593"/>
<polygon fill="#000000" stroke="#000000" points="1792.3834,-2314.3911 1783.0158,-2309.4415 1787.2521,-2319.1525 1792.3834,-2314.3911"/>
<text text-anchor="middle" x="1816.9028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge8" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1594.6649,-2270.9374C1592.2551,-2206.7698 1589.1725,-2114.6452 1587.9028,-2034 1585.8038,-1900.6832 1587.0159,-1867.3304 1587.9028,-1734 1588.1439,-1697.742 1588.6032,-1658.207 1589.0912,-1622.5106"/>
<polygon fill="#000000" stroke="#000000" points="1592.5971,-1622.1064 1589.2364,-1612.0587 1585.5978,-1622.0091 1592.5971,-1622.1064"/>
<text text-anchor="middle" x="1637.9028" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge41" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1855.1904,-531.6947C1999.3839,-513.5044 2237.8414,-483.4225 2405.5846,-462.2613"/>
<polygon fill="#000000" stroke="#000000" points="2406.0403,-465.7317 2415.5236,-461.0075 2405.1641,-458.7867 2406.0403,-465.7317"/>
<text text-anchor="middle" x="2212.4028" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge22" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M814.6687,-535.9885C985.5465,-516.2719 1334.4388,-476.0151 1527.6098,-453.7261"/>
<polygon fill="#000000" stroke="#000000" points="1528.2945,-457.1704 1537.8274,-452.5472 1527.4921,-450.2166 1528.2945,-457.1704"/>
<text text-anchor="middle" x="1219.4028" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge34" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M814.7655,-555.0146C825.4989,-553.5674 832.4028,-551.0625 832.4028,-547.5 832.4028,-545.2178 829.5694,-543.3696 824.711,-541.9555"/>
<polygon fill="#000000" stroke="#000000" points="825.255,-538.4953 814.7655,-539.9854 823.8948,-545.3619 825.255,-538.4953"/>
<text text-anchor="middle" x="848.4028" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- vital_signs -->
<g id="node24" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M679.4028,-703C679.4028,-703 966.4028,-703 966.4028,-703 972.4028,-703 978.4028,-709 978.4028,-715 978.4028,-715 978.4028,-1013 978.4028,-1013 978.4028,-1019 972.4028,-1025 966.4028,-1025 966.4028,-1025 679.4028,-1025 679.4028,-1025 673.4028,-1025 667.4028,-1019 667.4028,-1013 667.4028,-1013 667.4028,-715 667.4028,-715 667.4028,-709 673.4028,-703 679.4028,-703"/>
<text text-anchor="middle" x="713.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="760.4028,-703 760.4028,-1025 "/>
<text text-anchor="middle" x="770.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="781.4028,-703 781.4028,-1025 "/>
<text text-anchor="middle" x="869.4028" y="-1009.8" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="781.4028,-1002 957.4028,-1002 "/>
<text text-anchor="middle" x="869.4028" y="-986.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="781.4028,-979 957.4028,-979 "/>
<text text-anchor="middle" x="869.4028" y="-963.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="781.4028,-956 957.4028,-956 "/>
<text text-anchor="middle" x="869.4028" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="781.4028,-933 957.4028,-933 "/>
<text text-anchor="middle" x="869.4028" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="781.4028,-910 957.4028,-910 "/>
<text text-anchor="middle" x="869.4028" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="781.4028,-887 957.4028,-887 "/>
<text text-anchor="middle" x="869.4028" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="781.4028,-864 957.4028,-864 "/>
<text text-anchor="middle" x="869.4028" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="781.4028,-841 957.4028,-841 "/>
<text text-anchor="middle" x="869.4028" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="781.4028,-818 957.4028,-818 "/>
<text text-anchor="middle" x="869.4028" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="781.4028,-795 957.4028,-795 "/>
<text text-anchor="middle" x="869.4028" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="781.4028,-772 957.4028,-772 "/>
<text text-anchor="middle" x="869.4028" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="781.4028,-749 957.4028,-749 "/>
<text text-anchor="middle" x="869.4028" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="781.4028,-726 957.4028,-726 "/>
<text text-anchor="middle" x="869.4028" y="-710.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="957.4028,-703 957.4028,-1025 "/>
<text text-anchor="middle" x="967.9028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge29" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M779.1625,-702.7605C767.2252,-664.8994 753.2844,-625.0863 737.9028,-589 736.6108,-585.9689 735.161,-582.8719 733.6343,-579.8034"/>
<polygon fill="#000000" stroke="#000000" points="736.6466,-578.0112 728.9043,-570.7788 730.4466,-581.2608 736.6466,-578.0112"/>
<text text-anchor="middle" x="771.9028" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge31" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1303.227,-668.2754C1326.6426,-637.3985 1354.4684,-609.0892 1386.9028,-589 1421.1954,-567.7598 1514.1314,-557.3829 1594.6248,-552.3175"/>
<polygon fill="#000000" stroke="#000000" points="1595.109,-555.7946 1604.879,-551.6962 1594.6856,-548.8074 1595.109,-555.7946"/>
<text text-anchor="middle" x="1417.9028" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- adverse_event&#45;&gt;visit -->
<g id="edge28" class="edge">
<title>adverse_event&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1048.4375,-668.4395C1029.0117,-651.1357 1008.3823,-635.2075 986.9028,-622 937.8268,-591.8238 876.401,-573.6485 824.3462,-562.8171"/>
<polygon fill="#000000" stroke="#000000" points="824.8986,-559.3582 814.4042,-560.8132 823.5154,-566.2201 824.8986,-559.3582"/>
<text text-anchor="middle" x="981.9028" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge36" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1415.6073,-896.9793C1426.7788,-888.8906 1433.4028,-877.8975 1433.4028,-864 1433.4028,-853.7941 1429.8304,-845.1544 1423.5081,-838.0812"/>
<polygon fill="#000000" stroke="#000000" points="1425.396,-835.0744 1415.6073,-831.0207 1420.7316,-840.2939 1425.396,-835.0744"/>
<text text-anchor="middle" x="1449.4028" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge4" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1666.3718,-1404.7023C1705.2831,-1357.421 1756.2294,-1304.0849 1811.9028,-1268 1830.7546,-1255.7811 1852.1493,-1245.6527 1873.6604,-1237.3303"/>
<polygon fill="#000000" stroke="#000000" points="1875.0731,-1240.5387 1883.21,-1233.7533 1872.6177,-1233.9834 1875.0731,-1240.5387"/>
<text text-anchor="middle" x="1838.9028" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- file -->
<g id="node27" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M571.4028,-2702.5C571.4028,-2702.5 756.4028,-2702.5 756.4028,-2702.5 762.4028,-2702.5 768.4028,-2708.5 768.4028,-2714.5 768.4028,-2714.5 768.4028,-2897.5 768.4028,-2897.5 768.4028,-2903.5 762.4028,-2909.5 756.4028,-2909.5 756.4028,-2909.5 571.4028,-2909.5 571.4028,-2909.5 565.4028,-2909.5 559.4028,-2903.5 559.4028,-2897.5 559.4028,-2897.5 559.4028,-2714.5 559.4028,-2714.5 559.4028,-2708.5 565.4028,-2702.5 571.4028,-2702.5"/>
<text text-anchor="middle" x="578.9028" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="598.4028,-2702.5 598.4028,-2909.5 "/>
<text text-anchor="middle" x="608.9028" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="619.4028,-2702.5 619.4028,-2909.5 "/>
<text text-anchor="middle" x="683.4028" y="-2894.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="619.4028,-2886.5 747.4028,-2886.5 "/>
<text text-anchor="middle" x="683.4028" y="-2871.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="619.4028,-2863.5 747.4028,-2863.5 "/>
<text text-anchor="middle" x="683.4028" y="-2848.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_locations</text>
<polyline fill="none" stroke="#000000" points="619.4028,-2840.5 747.4028,-2840.5 "/>
<text text-anchor="middle" x="683.4028" y="-2825.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="619.4028,-2817.5 747.4028,-2817.5 "/>
<text text-anchor="middle" x="683.4028" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="619.4028,-2794.5 747.4028,-2794.5 "/>
<text text-anchor="middle" x="683.4028" y="-2779.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="619.4028,-2771.5 747.4028,-2771.5 "/>
<text text-anchor="middle" x="683.4028" y="-2756.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="619.4028,-2748.5 747.4028,-2748.5 "/>
<text text-anchor="middle" x="683.4028" y="-2733.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="619.4028,-2725.5 747.4028,-2725.5 "/>
<text text-anchor="middle" x="683.4028" y="-2710.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="747.4028,-2702.5 747.4028,-2909.5 "/>
<text text-anchor="middle" x="757.9028" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge21" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M559.3257,-2706.6714C556.2163,-2705.0031 553.0736,-2703.4406 549.9028,-2702 458.6782,-2660.5533 168.6267,-2725.7507 101.9028,-2651 -130.0004,-2391.1993 83.3556,-1975.9616 254.8318,-1724.0962"/>
<polygon fill="#000000" stroke="#000000" points="257.9014,-1725.8079 260.6577,-1715.5779 252.1235,-1721.8562 257.9014,-1725.8079"/>
<text text-anchor="middle" x="138.4028" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge40" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M768.4044,-2799.796C1043.1247,-2782.4529 1769.5075,-2729.5358 1841.9028,-2651 1991.2656,-2488.9683 1963.5923,-2216.4208 1925.2287,-2043.62"/>
<polygon fill="#000000" stroke="#000000" points="1928.599,-2042.655 1922.9836,-2033.6707 1921.7707,-2044.1959 1928.599,-2042.655"/>
<text text-anchor="middle" x="1862.4028" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge12" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M642.4551,-2702.2982C620.7879,-2597.5352 588.7115,-2442.442 575.7006,-2379.5332"/>
<polygon fill="#000000" stroke="#000000" points="579.0926,-2378.6521 573.6397,-2369.5683 572.2376,-2380.0699 579.0926,-2378.6521"/>
<text text-anchor="middle" x="667.4028" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- demographic -->
<g id="node28" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M1037.9028,-1428C1037.9028,-1428 1373.9028,-1428 1373.9028,-1428 1379.9028,-1428 1385.9028,-1434 1385.9028,-1440 1385.9028,-1440 1385.9028,-1577 1385.9028,-1577 1385.9028,-1583 1379.9028,-1589 1373.9028,-1589 1373.9028,-1589 1037.9028,-1589 1037.9028,-1589 1031.9028,-1589 1025.9028,-1583 1025.9028,-1577 1025.9028,-1577 1025.9028,-1440 1025.9028,-1440 1025.9028,-1434 1031.9028,-1428 1037.9028,-1428"/>
<text text-anchor="middle" x="1080.9028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="1135.9028,-1428 1135.9028,-1589 "/>
<text text-anchor="middle" x="1146.4028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1156.9028,-1428 1156.9028,-1589 "/>
<text text-anchor="middle" x="1260.9028" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1156.9028,-1566 1364.9028,-1566 "/>
<text text-anchor="middle" x="1260.9028" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1156.9028,-1543 1364.9028,-1543 "/>
<text text-anchor="middle" x="1260.9028" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1156.9028,-1520 1364.9028,-1520 "/>
<text text-anchor="middle" x="1260.9028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1156.9028,-1497 1364.9028,-1497 "/>
<text text-anchor="middle" x="1260.9028" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1156.9028,-1474 1364.9028,-1474 "/>
<text text-anchor="middle" x="1260.9028" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="1156.9028,-1451 1364.9028,-1451 "/>
<text text-anchor="middle" x="1260.9028" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1364.9028,-1428 1364.9028,-1589 "/>
<text text-anchor="middle" x="1375.4028" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge2" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1258.6567,-1427.7629C1292.2218,-1383.1264 1339.7037,-1330.8165 1394.9028,-1301 1475.3484,-1257.5463 1719.2359,-1228.7245 1873.1611,-1214.3202"/>
<polygon fill="#000000" stroke="#000000" points="1873.533,-1217.8008 1883.1671,-1213.3923 1872.8866,-1210.8307 1873.533,-1217.8008"/>
<text text-anchor="middle" x="1518.9028" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
</g>
</svg>
</div>
