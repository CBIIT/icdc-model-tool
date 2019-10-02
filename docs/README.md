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
<svg width="3762pt" height="2918pt"
 viewBox="0.00 0.00 3762.00 2918.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2914)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2914 3758,-2914 3758,4 -4,4"/>
<!-- prior_therapy -->
<g id="node1" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M1795.5,-2052.5C1795.5,-2052.5 2251.5,-2052.5 2251.5,-2052.5 2257.5,-2052.5 2263.5,-2058.5 2263.5,-2064.5 2263.5,-2064.5 2263.5,-2638.5 2263.5,-2638.5 2263.5,-2644.5 2257.5,-2650.5 2251.5,-2650.5 2251.5,-2650.5 1795.5,-2650.5 1795.5,-2650.5 1789.5,-2650.5 1783.5,-2644.5 1783.5,-2638.5 1783.5,-2638.5 1783.5,-2064.5 1783.5,-2064.5 1783.5,-2058.5 1789.5,-2052.5 1795.5,-2052.5"/>
<text text-anchor="middle" x="1841" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="1898.5,-2052.5 1898.5,-2650.5 "/>
<text text-anchor="middle" x="1909" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1919.5,-2052.5 1919.5,-2650.5 "/>
<text text-anchor="middle" x="2081" y="-2635.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2627.5 2242.5,-2627.5 "/>
<text text-anchor="middle" x="2081" y="-2612.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2604.5 2242.5,-2604.5 "/>
<text text-anchor="middle" x="2081" y="-2589.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2581.5 2242.5,-2581.5 "/>
<text text-anchor="middle" x="2081" y="-2566.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2558.5 2242.5,-2558.5 "/>
<text text-anchor="middle" x="2081" y="-2543.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2535.5 2242.5,-2535.5 "/>
<text text-anchor="middle" x="2081" y="-2520.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2512.5 2242.5,-2512.5 "/>
<text text-anchor="middle" x="2081" y="-2497.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2489.5 2242.5,-2489.5 "/>
<text text-anchor="middle" x="2081" y="-2474.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2466.5 2242.5,-2466.5 "/>
<text text-anchor="middle" x="2081" y="-2451.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2443.5 2242.5,-2443.5 "/>
<text text-anchor="middle" x="2081" y="-2428.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2420.5 2242.5,-2420.5 "/>
<text text-anchor="middle" x="2081" y="-2405.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2397.5 2242.5,-2397.5 "/>
<text text-anchor="middle" x="2081" y="-2382.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2374.5 2242.5,-2374.5 "/>
<text text-anchor="middle" x="2081" y="-2359.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2351.5 2242.5,-2351.5 "/>
<text text-anchor="middle" x="2081" y="-2336.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2328.5 2242.5,-2328.5 "/>
<text text-anchor="middle" x="2081" y="-2313.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2305.5 2242.5,-2305.5 "/>
<text text-anchor="middle" x="2081" y="-2290.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2282.5 2242.5,-2282.5 "/>
<text text-anchor="middle" x="2081" y="-2267.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2259.5 2242.5,-2259.5 "/>
<text text-anchor="middle" x="2081" y="-2244.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2236.5 2242.5,-2236.5 "/>
<text text-anchor="middle" x="2081" y="-2221.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2213.5 2242.5,-2213.5 "/>
<text text-anchor="middle" x="2081" y="-2198.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2190.5 2242.5,-2190.5 "/>
<text text-anchor="middle" x="2081" y="-2175.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2167.5 2242.5,-2167.5 "/>
<text text-anchor="middle" x="2081" y="-2152.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2144.5 2242.5,-2144.5 "/>
<text text-anchor="middle" x="2081" y="-2129.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2121.5 2242.5,-2121.5 "/>
<text text-anchor="middle" x="2081" y="-2106.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2098.5 2242.5,-2098.5 "/>
<text text-anchor="middle" x="2081" y="-2083.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="1919.5,-2075.5 2242.5,-2075.5 "/>
<text text-anchor="middle" x="2081" y="-2060.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="2242.5,-2052.5 2242.5,-2650.5 "/>
<text text-anchor="middle" x="2253" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge4" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M2263.7384,-2389.6912C2274.9387,-2380.0507 2281.5,-2367.3203 2281.5,-2351.5 2281.5,-2339.3876 2277.6539,-2329.0864 2270.8244,-2320.5965"/>
<polygon fill="#000000" stroke="#000000" points="2273.219,-2318.0385 2263.7384,-2313.3088 2268.2002,-2322.9183 2273.219,-2318.0385"/>
<text text-anchor="middle" x="2297.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node6" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M1402,-1405C1402,-1405 1751,-1405 1751,-1405 1757,-1405 1763,-1411 1763,-1417 1763,-1417 1763,-1600 1763,-1600 1763,-1606 1757,-1612 1751,-1612 1751,-1612 1402,-1612 1402,-1612 1396,-1612 1390,-1606 1390,-1600 1390,-1600 1390,-1417 1390,-1417 1390,-1411 1396,-1405 1402,-1405"/>
<text text-anchor="middle" x="1437.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="1485,-1405 1485,-1612 "/>
<text text-anchor="middle" x="1495.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1506,-1405 1506,-1612 "/>
<text text-anchor="middle" x="1624" y="-1596.8" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1506,-1589 1742,-1589 "/>
<text text-anchor="middle" x="1624" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="1506,-1566 1742,-1566 "/>
<text text-anchor="middle" x="1624" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="1506,-1543 1742,-1543 "/>
<text text-anchor="middle" x="1624" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="1506,-1520 1742,-1520 "/>
<text text-anchor="middle" x="1624" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1506,-1497 1742,-1497 "/>
<text text-anchor="middle" x="1624" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="1506,-1474 1742,-1474 "/>
<text text-anchor="middle" x="1624" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="1506,-1451 1742,-1451 "/>
<text text-anchor="middle" x="1624" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="1506,-1428 1742,-1428 "/>
<text text-anchor="middle" x="1624" y="-1412.8" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="1742,-1405 1742,-1612 "/>
<text text-anchor="middle" x="1752.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge32" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1864.8033,-2052.213C1785.5837,-1902.8122 1694.4739,-1730.9876 1636.2387,-1621.1615"/>
<polygon fill="#000000" stroke="#000000" points="1639.1831,-1619.2431 1631.4062,-1612.0479 1632.9987,-1622.5224 1639.1831,-1619.2431"/>
<text text-anchor="middle" x="1902.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- sample -->
<g id="node2" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M2588,-1301.5C2588,-1301.5 3011,-1301.5 3011,-1301.5 3017,-1301.5 3023,-1307.5 3023,-1313.5 3023,-1313.5 3023,-1703.5 3023,-1703.5 3023,-1709.5 3017,-1715.5 3011,-1715.5 3011,-1715.5 2588,-1715.5 2588,-1715.5 2582,-1715.5 2576,-1709.5 2576,-1703.5 2576,-1703.5 2576,-1313.5 2576,-1313.5 2576,-1307.5 2582,-1301.5 2588,-1301.5"/>
<text text-anchor="middle" x="2610" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="2644,-1301.5 2644,-1715.5 "/>
<text text-anchor="middle" x="2654.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2665,-1301.5 2665,-1715.5 "/>
<text text-anchor="middle" x="2833.5" y="-1700.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2665,-1692.5 3002,-1692.5 "/>
<text text-anchor="middle" x="2833.5" y="-1677.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="2665,-1669.5 3002,-1669.5 "/>
<text text-anchor="middle" x="2833.5" y="-1654.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="2665,-1646.5 3002,-1646.5 "/>
<text text-anchor="middle" x="2833.5" y="-1631.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="2665,-1623.5 3002,-1623.5 "/>
<text text-anchor="middle" x="2833.5" y="-1608.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="2665,-1600.5 3002,-1600.5 "/>
<text text-anchor="middle" x="2833.5" y="-1585.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2665,-1577.5 3002,-1577.5 "/>
<text text-anchor="middle" x="2833.5" y="-1562.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="2665,-1554.5 3002,-1554.5 "/>
<text text-anchor="middle" x="2833.5" y="-1539.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="2665,-1531.5 3002,-1531.5 "/>
<text text-anchor="middle" x="2833.5" y="-1516.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="2665,-1508.5 3002,-1508.5 "/>
<text text-anchor="middle" x="2833.5" y="-1493.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2665,-1485.5 3002,-1485.5 "/>
<text text-anchor="middle" x="2833.5" y="-1470.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="2665,-1462.5 3002,-1462.5 "/>
<text text-anchor="middle" x="2833.5" y="-1447.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="2665,-1439.5 3002,-1439.5 "/>
<text text-anchor="middle" x="2833.5" y="-1424.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="2665,-1416.5 3002,-1416.5 "/>
<text text-anchor="middle" x="2833.5" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="2665,-1393.5 3002,-1393.5 "/>
<text text-anchor="middle" x="2833.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="2665,-1370.5 3002,-1370.5 "/>
<text text-anchor="middle" x="2833.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2665,-1347.5 3002,-1347.5 "/>
<text text-anchor="middle" x="2833.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="2665,-1324.5 3002,-1324.5 "/>
<text text-anchor="middle" x="2833.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="3002,-1301.5 3002,-1715.5 "/>
<text text-anchor="middle" x="3012.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge5" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M3023.0955,-1536.6646C3034.3572,-1529.6694 3041,-1520.2813 3041,-1508.5 3041,-1499.8481 3037.4175,-1492.4869 3031.0541,-1486.4162"/>
<polygon fill="#000000" stroke="#000000" points="3033.1666,-1483.6256 3023.0955,-1480.3354 3028.9167,-1489.1879 3033.1666,-1483.6256"/>
<text text-anchor="middle" x="3057" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- case -->
<g id="node20" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1467,-1157.5C1467,-1157.5 1686,-1157.5 1686,-1157.5 1692,-1157.5 1698,-1163.5 1698,-1169.5 1698,-1169.5 1698,-1237.5 1698,-1237.5 1698,-1243.5 1692,-1249.5 1686,-1249.5 1686,-1249.5 1467,-1249.5 1467,-1249.5 1461,-1249.5 1455,-1243.5 1455,-1237.5 1455,-1237.5 1455,-1169.5 1455,-1169.5 1455,-1163.5 1461,-1157.5 1467,-1157.5"/>
<text text-anchor="middle" x="1479.5" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1504,-1157.5 1504,-1249.5 "/>
<text text-anchor="middle" x="1514.5" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1525,-1157.5 1525,-1249.5 "/>
<text text-anchor="middle" x="1601" y="-1234.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1525,-1226.5 1677,-1226.5 "/>
<text text-anchor="middle" x="1601" y="-1211.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1525,-1203.5 1677,-1203.5 "/>
<text text-anchor="middle" x="1601" y="-1188.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1525,-1180.5 1677,-1180.5 "/>
<text text-anchor="middle" x="1601" y="-1165.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1677,-1157.5 1677,-1249.5 "/>
<text text-anchor="middle" x="1687.5" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge18" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2575.6109,-1325.1068C2558.8657,-1315.9632 2541.7562,-1307.7815 2524.5,-1301 2379.194,-1243.8967 1932.9182,-1217.9986 1708.3949,-1208.3305"/>
<polygon fill="#000000" stroke="#000000" points="1708.3415,-1204.8251 1698.2016,-1207.8962 1708.0435,-1211.8188 1708.3415,-1204.8251"/>
<text text-anchor="middle" x="2476.5" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- visit -->
<g id="node23" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M2359,-524.5C2359,-524.5 2534,-524.5 2534,-524.5 2540,-524.5 2546,-530.5 2546,-536.5 2546,-536.5 2546,-558.5 2546,-558.5 2546,-564.5 2540,-570.5 2534,-570.5 2534,-570.5 2359,-570.5 2359,-570.5 2353,-570.5 2347,-564.5 2347,-558.5 2347,-558.5 2347,-536.5 2347,-536.5 2347,-530.5 2353,-524.5 2359,-524.5"/>
<text text-anchor="middle" x="2370.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="2394,-524.5 2394,-570.5 "/>
<text text-anchor="middle" x="2404.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2415,-524.5 2415,-570.5 "/>
<text text-anchor="middle" x="2470" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="2415,-547.5 2525,-547.5 "/>
<text text-anchor="middle" x="2470" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="2525,-524.5 2525,-570.5 "/>
<text text-anchor="middle" x="2535.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge9" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2956.1423,-1301.2281C2986.3327,-1250.6606 3013.5112,-1194.9425 3029.5,-1139 3092.7725,-917.619 3153.5961,-790.3264 2996.5,-622 2966.9968,-590.3877 2708.4625,-566.4793 2556.5835,-555.0133"/>
<polygon fill="#000000" stroke="#000000" points="2556.5207,-551.4989 2546.2874,-554.2427 2555.9982,-558.4793 2556.5207,-551.4989"/>
<text text-anchor="middle" x="3059.5" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- demographic -->
<g id="node3" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M1793.5,-1428C1793.5,-1428 2129.5,-1428 2129.5,-1428 2135.5,-1428 2141.5,-1434 2141.5,-1440 2141.5,-1440 2141.5,-1577 2141.5,-1577 2141.5,-1583 2135.5,-1589 2129.5,-1589 2129.5,-1589 1793.5,-1589 1793.5,-1589 1787.5,-1589 1781.5,-1583 1781.5,-1577 1781.5,-1577 1781.5,-1440 1781.5,-1440 1781.5,-1434 1787.5,-1428 1793.5,-1428"/>
<text text-anchor="middle" x="1836.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="1891.5,-1428 1891.5,-1589 "/>
<text text-anchor="middle" x="1902" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1912.5,-1428 1912.5,-1589 "/>
<text text-anchor="middle" x="2016.5" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="1912.5,-1566 2120.5,-1566 "/>
<text text-anchor="middle" x="2016.5" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="1912.5,-1543 2120.5,-1543 "/>
<text text-anchor="middle" x="2016.5" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="1912.5,-1520 2120.5,-1520 "/>
<text text-anchor="middle" x="2016.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="1912.5,-1497 2120.5,-1497 "/>
<text text-anchor="middle" x="2016.5" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="1912.5,-1474 2120.5,-1474 "/>
<text text-anchor="middle" x="2016.5" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="1912.5,-1451 2120.5,-1451 "/>
<text text-anchor="middle" x="2016.5" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2120.5,-1428 2120.5,-1589 "/>
<text text-anchor="middle" x="2131" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge19" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1900.1946,-1427.9216C1865.8279,-1386.4322 1820.3289,-1337.1198 1772.5,-1301 1749.3039,-1283.4826 1722.4735,-1267.7295 1696.2508,-1254.2502"/>
<polygon fill="#000000" stroke="#000000" points="1697.5114,-1250.9657 1687.0078,-1249.5781 1694.3535,-1257.213 1697.5114,-1250.9657"/>
<text text-anchor="middle" x="1769.5" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- lab_exam -->
<g id="node4" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M2585.5,-846C2585.5,-846 2645.5,-846 2645.5,-846 2651.5,-846 2657.5,-852 2657.5,-858 2657.5,-858 2657.5,-870 2657.5,-870 2657.5,-876 2651.5,-882 2645.5,-882 2645.5,-882 2585.5,-882 2585.5,-882 2579.5,-882 2573.5,-876 2573.5,-870 2573.5,-870 2573.5,-858 2573.5,-858 2573.5,-852 2579.5,-846 2585.5,-846"/>
<text text-anchor="middle" x="2615.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge8" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2617.3833,-845.6903C2621.2955,-797.4445 2625.0722,-665.31 2559.5,-589 2555.3436,-584.1629 2550.5724,-579.8894 2545.3922,-576.1137"/>
<polygon fill="#000000" stroke="#000000" points="2547.2277,-573.132 2536.9446,-570.5809 2543.3924,-578.9879 2547.2277,-573.132"/>
<text text-anchor="middle" x="2596.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- principal_investigator -->
<g id="node5" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M3056,-403.5C3056,-403.5 3383,-403.5 3383,-403.5 3389,-403.5 3395,-409.5 3395,-415.5 3395,-415.5 3395,-460.5 3395,-460.5 3395,-466.5 3389,-472.5 3383,-472.5 3383,-472.5 3056,-472.5 3056,-472.5 3050,-472.5 3044,-466.5 3044,-460.5 3044,-460.5 3044,-415.5 3044,-415.5 3044,-409.5 3050,-403.5 3056,-403.5"/>
<text text-anchor="middle" x="3131" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="3218,-403.5 3218,-472.5 "/>
<text text-anchor="middle" x="3228.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3239,-403.5 3239,-472.5 "/>
<text text-anchor="middle" x="3306.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="3239,-449.5 3374,-449.5 "/>
<text text-anchor="middle" x="3306.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="3239,-426.5 3374,-426.5 "/>
<text text-anchor="middle" x="3306.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="3374,-403.5 3374,-472.5 "/>
<text text-anchor="middle" x="3384.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node7" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M2875.5,-190.5C2875.5,-190.5 3155.5,-190.5 3155.5,-190.5 3161.5,-190.5 3167.5,-196.5 3167.5,-202.5 3167.5,-202.5 3167.5,-339.5 3167.5,-339.5 3167.5,-345.5 3161.5,-351.5 3155.5,-351.5 3155.5,-351.5 2875.5,-351.5 2875.5,-351.5 2869.5,-351.5 2863.5,-345.5 2863.5,-339.5 2863.5,-339.5 2863.5,-202.5 2863.5,-202.5 2863.5,-196.5 2869.5,-190.5 2875.5,-190.5"/>
<text text-anchor="middle" x="2891.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="2919.5,-190.5 2919.5,-351.5 "/>
<text text-anchor="middle" x="2930" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2940.5,-190.5 2940.5,-351.5 "/>
<text text-anchor="middle" x="3043.5" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="2940.5,-328.5 3146.5,-328.5 "/>
<text text-anchor="middle" x="3043.5" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="2940.5,-305.5 3146.5,-305.5 "/>
<text text-anchor="middle" x="3043.5" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="2940.5,-282.5 3146.5,-282.5 "/>
<text text-anchor="middle" x="3043.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="2940.5,-259.5 3146.5,-259.5 "/>
<text text-anchor="middle" x="3043.5" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="2940.5,-236.5 3146.5,-236.5 "/>
<text text-anchor="middle" x="3043.5" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="2940.5,-213.5 3146.5,-213.5 "/>
<text text-anchor="middle" x="3043.5" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="3146.5,-190.5 3146.5,-351.5 "/>
<text text-anchor="middle" x="3157" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge23" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3177.2311,-403.3975C3160.9526,-390.0715 3141.5402,-374.18 3121.9096,-358.1098"/>
<polygon fill="#000000" stroke="#000000" points="3124.0424,-355.3326 3114.0874,-351.7063 3119.6082,-360.7491 3124.0424,-355.3326"/>
<text text-anchor="middle" x="3184" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge16" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1576.5,-1404.8153C1576.5,-1356.3611 1576.5,-1300.5569 1576.5,-1260.0093"/>
<polygon fill="#000000" stroke="#000000" points="1580.0001,-1259.7821 1576.5,-1249.7821 1573.0001,-1259.7822 1580.0001,-1259.7821"/>
<text text-anchor="middle" x="1603.5" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- program -->
<g id="node11" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M2861.5,-.5C2861.5,-.5 3169.5,-.5 3169.5,-.5 3175.5,-.5 3181.5,-6.5 3181.5,-12.5 3181.5,-12.5 3181.5,-126.5 3181.5,-126.5 3181.5,-132.5 3175.5,-138.5 3169.5,-138.5 3169.5,-138.5 2861.5,-138.5 2861.5,-138.5 2855.5,-138.5 2849.5,-132.5 2849.5,-126.5 2849.5,-126.5 2849.5,-12.5 2849.5,-12.5 2849.5,-6.5 2855.5,-.5 2861.5,-.5"/>
<text text-anchor="middle" x="2888.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="2927.5,-.5 2927.5,-138.5 "/>
<text text-anchor="middle" x="2938" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2948.5,-.5 2948.5,-138.5 "/>
<text text-anchor="middle" x="3054.5" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="2948.5,-115.5 3160.5,-115.5 "/>
<text text-anchor="middle" x="3054.5" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="2948.5,-92.5 3160.5,-92.5 "/>
<text text-anchor="middle" x="3054.5" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="2948.5,-69.5 3160.5,-69.5 "/>
<text text-anchor="middle" x="3054.5" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="2948.5,-46.5 3160.5,-46.5 "/>
<text text-anchor="middle" x="3054.5" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="2948.5,-23.5 3160.5,-23.5 "/>
<text text-anchor="middle" x="3054.5" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="3160.5,-.5 3160.5,-138.5 "/>
<text text-anchor="middle" x="3171" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge34" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M3015.5,-190.4932C3015.5,-176.7786 3015.5,-162.5421 3015.5,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="3019.0001,-148.5183 3015.5,-138.5184 3012.0001,-148.5184 3019.0001,-148.5183"/>
<text text-anchor="middle" x="3056" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- vital_signs -->
<g id="node8" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M2688,-703C2688,-703 2975,-703 2975,-703 2981,-703 2987,-709 2987,-715 2987,-715 2987,-1013 2987,-1013 2987,-1019 2981,-1025 2975,-1025 2975,-1025 2688,-1025 2688,-1025 2682,-1025 2676,-1019 2676,-1013 2676,-1013 2676,-715 2676,-715 2676,-709 2682,-703 2688,-703"/>
<text text-anchor="middle" x="2722.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="2769,-703 2769,-1025 "/>
<text text-anchor="middle" x="2779.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2790,-703 2790,-1025 "/>
<text text-anchor="middle" x="2878" y="-1009.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2790,-1002 2966,-1002 "/>
<text text-anchor="middle" x="2878" y="-986.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="2790,-979 2966,-979 "/>
<text text-anchor="middle" x="2878" y="-963.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="2790,-956 2966,-956 "/>
<text text-anchor="middle" x="2878" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="2790,-933 2966,-933 "/>
<text text-anchor="middle" x="2878" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="2790,-910 2966,-910 "/>
<text text-anchor="middle" x="2878" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="2790,-887 2966,-887 "/>
<text text-anchor="middle" x="2878" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="2790,-864 2966,-864 "/>
<text text-anchor="middle" x="2878" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="2790,-841 2966,-841 "/>
<text text-anchor="middle" x="2878" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="2790,-818 2966,-818 "/>
<text text-anchor="middle" x="2878" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="2790,-795 2966,-795 "/>
<text text-anchor="middle" x="2878" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="2790,-772 2966,-772 "/>
<text text-anchor="middle" x="2878" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="2790,-749 2966,-749 "/>
<text text-anchor="middle" x="2878" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="2790,-726 2966,-726 "/>
<text text-anchor="middle" x="2878" y="-710.8" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="2966,-703 2966,-1025 "/>
<text text-anchor="middle" x="2976.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge12" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2750.0166,-702.9698C2718.6087,-657.795 2678.1098,-614.1776 2628.5,-589 2606.1763,-577.6704 2580.7538,-569.3996 2556.1351,-563.3731"/>
<polygon fill="#000000" stroke="#000000" points="2556.9174,-559.9617 2546.3828,-561.0899 2555.3217,-566.7774 2556.9174,-559.9617"/>
<text text-anchor="middle" x="2679.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent -->
<g id="node9" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M293.5,-524.5C293.5,-524.5 519.5,-524.5 519.5,-524.5 525.5,-524.5 531.5,-530.5 531.5,-536.5 531.5,-536.5 531.5,-558.5 531.5,-558.5 531.5,-564.5 525.5,-570.5 519.5,-570.5 519.5,-570.5 293.5,-570.5 293.5,-570.5 287.5,-570.5 281.5,-564.5 281.5,-558.5 281.5,-558.5 281.5,-536.5 281.5,-536.5 281.5,-530.5 287.5,-524.5 293.5,-524.5"/>
<text text-anchor="middle" x="310" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="338.5,-524.5 338.5,-570.5 "/>
<text text-anchor="middle" x="349" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="359.5,-524.5 359.5,-570.5 "/>
<text text-anchor="middle" x="435" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="359.5,-547.5 510.5,-547.5 "/>
<text text-anchor="middle" x="435" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="510.5,-524.5 510.5,-570.5 "/>
<text text-anchor="middle" x="521" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm -->
<g id="node16" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M240,-415C240,-415 609,-415 609,-415 615,-415 621,-421 621,-427 621,-427 621,-449 621,-449 621,-455 615,-461 609,-461 609,-461 240,-461 240,-461 234,-461 228,-455 228,-449 228,-449 228,-427 228,-427 228,-421 234,-415 240,-415"/>
<text text-anchor="middle" x="274" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="320,-415 320,-461 "/>
<text text-anchor="middle" x="330.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="341,-415 341,-461 "/>
<text text-anchor="middle" x="470.5" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="341,-438 600,-438 "/>
<text text-anchor="middle" x="470.5" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="600,-415 600,-461 "/>
<text text-anchor="middle" x="610.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge24" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M410.3173,-524.2779C412.847,-508.8892 416.2053,-488.4597 419.0189,-471.3432"/>
<polygon fill="#000000" stroke="#000000" points="422.5197,-471.624 420.6882,-461.1887 415.6124,-470.4885 422.5197,-471.624"/>
<text text-anchor="middle" x="464" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- image -->
<g id="node10" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M2823.5,-2788C2823.5,-2788 2859.5,-2788 2859.5,-2788 2865.5,-2788 2871.5,-2794 2871.5,-2800 2871.5,-2800 2871.5,-2812 2871.5,-2812 2871.5,-2818 2865.5,-2824 2859.5,-2824 2859.5,-2824 2823.5,-2824 2823.5,-2824 2817.5,-2824 2811.5,-2818 2811.5,-2812 2811.5,-2812 2811.5,-2800 2811.5,-2800 2811.5,-2794 2817.5,-2788 2823.5,-2788"/>
<text text-anchor="middle" x="2841.5" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node26" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M2701.5,-2333.5C2701.5,-2333.5 2733.5,-2333.5 2733.5,-2333.5 2739.5,-2333.5 2745.5,-2339.5 2745.5,-2345.5 2745.5,-2345.5 2745.5,-2357.5 2745.5,-2357.5 2745.5,-2363.5 2739.5,-2369.5 2733.5,-2369.5 2733.5,-2369.5 2701.5,-2369.5 2701.5,-2369.5 2695.5,-2369.5 2689.5,-2363.5 2689.5,-2357.5 2689.5,-2357.5 2689.5,-2345.5 2689.5,-2345.5 2689.5,-2339.5 2695.5,-2333.5 2701.5,-2333.5"/>
<text text-anchor="middle" x="2717.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge41" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2835.176,-2787.7883C2827.8018,-2766.8872 2815.0199,-2731.6698 2802.5,-2702 2792.7607,-2678.9197 2786.3893,-2674.7763 2778.5,-2651 2746.3713,-2554.173 2728.096,-2433.863 2720.9868,-2379.9511"/>
<polygon fill="#000000" stroke="#000000" points="2724.4259,-2379.2536 2719.6756,-2369.7834 2717.4834,-2380.149 2724.4259,-2379.2536"/>
<text text-anchor="middle" x="2824" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- cycle -->
<g id="node12" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1015.5,-403.5C1015.5,-403.5 1243.5,-403.5 1243.5,-403.5 1249.5,-403.5 1255.5,-409.5 1255.5,-415.5 1255.5,-415.5 1255.5,-460.5 1255.5,-460.5 1255.5,-466.5 1249.5,-472.5 1243.5,-472.5 1243.5,-472.5 1015.5,-472.5 1015.5,-472.5 1009.5,-472.5 1003.5,-466.5 1003.5,-460.5 1003.5,-460.5 1003.5,-415.5 1003.5,-415.5 1003.5,-409.5 1009.5,-403.5 1015.5,-403.5"/>
<text text-anchor="middle" x="1030.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1057.5,-403.5 1057.5,-472.5 "/>
<text text-anchor="middle" x="1068" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1078.5,-403.5 1078.5,-472.5 "/>
<text text-anchor="middle" x="1156.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1078.5,-449.5 1234.5,-449.5 "/>
<text text-anchor="middle" x="1156.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1078.5,-426.5 1234.5,-426.5 "/>
<text text-anchor="middle" x="1156.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1234.5,-403.5 1234.5,-472.5 "/>
<text text-anchor="middle" x="1245" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge20" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1020.8359,-472.5493C893.8443,-511.3905 676.6971,-573.0597 485.5,-604 456.695,-608.6613 243.4135,-600.6714 223.5,-622 186.7997,-661.3082 186.8654,-1066.6305 223.5,-1106 264.7347,-1150.3131 1112.5957,-1186.342 1444.7131,-1198.8066"/>
<polygon fill="#000000" stroke="#000000" points="1444.7441,-1202.3101 1454.8679,-1199.1864 1445.0058,-1195.315 1444.7441,-1202.3101"/>
<text text-anchor="middle" x="595.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent_administration -->
<g id="node13" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M245,-622.5C245,-622.5 714,-622.5 714,-622.5 720,-622.5 726,-628.5 726,-634.5 726,-634.5 726,-1093.5 726,-1093.5 726,-1099.5 720,-1105.5 714,-1105.5 714,-1105.5 245,-1105.5 245,-1105.5 239,-1105.5 233,-1099.5 233,-1093.5 233,-1093.5 233,-634.5 233,-634.5 233,-628.5 239,-622.5 245,-622.5"/>
<text text-anchor="middle" x="318" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="403,-622.5 403,-1105.5 "/>
<text text-anchor="middle" x="413.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="424,-622.5 424,-1105.5 "/>
<text text-anchor="middle" x="564.5" y="-1090.3" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="424,-1082.5 705,-1082.5 "/>
<text text-anchor="middle" x="564.5" y="-1067.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="424,-1059.5 705,-1059.5 "/>
<text text-anchor="middle" x="564.5" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="424,-1036.5 705,-1036.5 "/>
<text text-anchor="middle" x="564.5" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="424,-1013.5 705,-1013.5 "/>
<text text-anchor="middle" x="564.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="424,-990.5 705,-990.5 "/>
<text text-anchor="middle" x="564.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="424,-967.5 705,-967.5 "/>
<text text-anchor="middle" x="564.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="424,-944.5 705,-944.5 "/>
<text text-anchor="middle" x="564.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="424,-921.5 705,-921.5 "/>
<text text-anchor="middle" x="564.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="424,-898.5 705,-898.5 "/>
<text text-anchor="middle" x="564.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="424,-875.5 705,-875.5 "/>
<text text-anchor="middle" x="564.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="424,-852.5 705,-852.5 "/>
<text text-anchor="middle" x="564.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="424,-829.5 705,-829.5 "/>
<text text-anchor="middle" x="564.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="424,-806.5 705,-806.5 "/>
<text text-anchor="middle" x="564.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="424,-783.5 705,-783.5 "/>
<text text-anchor="middle" x="564.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="424,-760.5 705,-760.5 "/>
<text text-anchor="middle" x="564.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="424,-737.5 705,-737.5 "/>
<text text-anchor="middle" x="564.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="424,-714.5 705,-714.5 "/>
<text text-anchor="middle" x="564.5" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="424,-691.5 705,-691.5 "/>
<text text-anchor="middle" x="564.5" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="424,-668.5 705,-668.5 "/>
<text text-anchor="middle" x="564.5" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="424,-645.5 705,-645.5 "/>
<text text-anchor="middle" x="564.5" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="705,-622.5 705,-1105.5 "/>
<text text-anchor="middle" x="715.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge6" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M423.7075,-622.1053C420.0792,-606.3741 416.8077,-592.1904 414.1158,-580.5192"/>
<polygon fill="#000000" stroke="#000000" points="417.4709,-579.4923 411.8129,-570.5348 410.65,-581.0656 417.4709,-579.4923"/>
<text text-anchor="middle" x="450.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge13" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M726.1162,-625.725C728.898,-624.4392 731.6928,-623.1968 734.5,-622 808.1923,-590.5815 1970.1258,-559.2862 2336.641,-550.1541"/>
<polygon fill="#000000" stroke="#000000" points="2336.8167,-553.6509 2346.7266,-549.9034 2336.6427,-546.653 2336.8167,-553.6509"/>
<text text-anchor="middle" x="1171.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- disease_extent -->
<g id="node14" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M2189.5,-714.5C2189.5,-714.5 2505.5,-714.5 2505.5,-714.5 2511.5,-714.5 2517.5,-720.5 2517.5,-726.5 2517.5,-726.5 2517.5,-1001.5 2517.5,-1001.5 2517.5,-1007.5 2511.5,-1013.5 2505.5,-1013.5 2505.5,-1013.5 2189.5,-1013.5 2189.5,-1013.5 2183.5,-1013.5 2177.5,-1007.5 2177.5,-1001.5 2177.5,-1001.5 2177.5,-726.5 2177.5,-726.5 2177.5,-720.5 2183.5,-714.5 2189.5,-714.5"/>
<text text-anchor="middle" x="2239" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="2300.5,-714.5 2300.5,-1013.5 "/>
<text text-anchor="middle" x="2311" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2321.5,-714.5 2321.5,-1013.5 "/>
<text text-anchor="middle" x="2409" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="2321.5,-990.5 2496.5,-990.5 "/>
<text text-anchor="middle" x="2409" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="2321.5,-967.5 2496.5,-967.5 "/>
<text text-anchor="middle" x="2409" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="2321.5,-944.5 2496.5,-944.5 "/>
<text text-anchor="middle" x="2409" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="2321.5,-921.5 2496.5,-921.5 "/>
<text text-anchor="middle" x="2409" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="2321.5,-898.5 2496.5,-898.5 "/>
<text text-anchor="middle" x="2409" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="2321.5,-875.5 2496.5,-875.5 "/>
<text text-anchor="middle" x="2409" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="2321.5,-852.5 2496.5,-852.5 "/>
<text text-anchor="middle" x="2409" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="2321.5,-829.5 2496.5,-829.5 "/>
<text text-anchor="middle" x="2409" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="2321.5,-806.5 2496.5,-806.5 "/>
<text text-anchor="middle" x="2409" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="2321.5,-783.5 2496.5,-783.5 "/>
<text text-anchor="middle" x="2409" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="2321.5,-760.5 2496.5,-760.5 "/>
<text text-anchor="middle" x="2409" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2321.5,-737.5 2496.5,-737.5 "/>
<text text-anchor="middle" x="2409" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="2496.5,-714.5 2496.5,-1013.5 "/>
<text text-anchor="middle" x="2507" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge10" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2394.3907,-714.0918C2410.0844,-663.9195 2426.1288,-612.626 2436.1906,-580.459"/>
<polygon fill="#000000" stroke="#000000" points="2439.5941,-581.3017 2439.2391,-570.7129 2432.9133,-579.212 2439.5941,-581.3017"/>
<text text-anchor="middle" x="2459.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- cohort -->
<g id="node15" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M12,-524.5C12,-524.5 245,-524.5 245,-524.5 251,-524.5 257,-530.5 257,-536.5 257,-536.5 257,-558.5 257,-558.5 257,-564.5 251,-570.5 245,-570.5 245,-570.5 12,-570.5 12,-570.5 6,-570.5 0,-564.5 0,-558.5 0,-558.5 0,-536.5 0,-536.5 0,-530.5 6,-524.5 12,-524.5"/>
<text text-anchor="middle" x="31.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="63,-524.5 63,-570.5 "/>
<text text-anchor="middle" x="73.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="84,-524.5 84,-570.5 "/>
<text text-anchor="middle" x="160" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="84,-547.5 236,-547.5 "/>
<text text-anchor="middle" x="160" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="236,-524.5 236,-570.5 "/>
<text text-anchor="middle" x="246.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge38" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M121.6812,-524.4399C113.759,-492.3039 105.5158,-434.4648 137.5,-403 234.7862,-307.2935 2258.4667,-278.83 2852.7707,-272.5195"/>
<polygon fill="#000000" stroke="#000000" points="2853.1669,-276.0157 2863.1294,-272.4103 2853.093,-269.016 2853.1669,-276.0157"/>
<text text-anchor="middle" x="178" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge39" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M190.9123,-524.4117C238.1396,-506.9408 303.0824,-482.9163 352.5053,-464.6332"/>
<polygon fill="#000000" stroke="#000000" points="354.0086,-467.8089 362.1731,-461.0567 351.5799,-461.2438 354.0086,-467.8089"/>
<text text-anchor="middle" x="317" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge37" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M621.1064,-425.328C1114.6062,-393.52 2398.5755,-310.7632 2853.1106,-281.4666"/>
<polygon fill="#000000" stroke="#000000" points="2853.61,-284.9418 2863.3641,-280.8057 2853.1597,-277.9563 2853.61,-284.9418"/>
<text text-anchor="middle" x="1453" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_study -->
<g id="node17" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M756,-760.5C756,-760.5 1171,-760.5 1171,-760.5 1177,-760.5 1183,-766.5 1183,-772.5 1183,-772.5 1183,-955.5 1183,-955.5 1183,-961.5 1177,-967.5 1171,-967.5 1171,-967.5 756,-967.5 756,-967.5 750,-967.5 744,-961.5 744,-955.5 744,-955.5 744,-772.5 744,-772.5 744,-766.5 750,-760.5 756,-760.5"/>
<text text-anchor="middle" x="785.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="827,-760.5 827,-967.5 "/>
<text text-anchor="middle" x="837.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="848,-760.5 848,-967.5 "/>
<text text-anchor="middle" x="1005" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="848,-944.5 1162,-944.5 "/>
<text text-anchor="middle" x="1005" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="848,-921.5 1162,-921.5 "/>
<text text-anchor="middle" x="1005" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="848,-898.5 1162,-898.5 "/>
<text text-anchor="middle" x="1005" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="848,-875.5 1162,-875.5 "/>
<text text-anchor="middle" x="1005" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="848,-852.5 1162,-852.5 "/>
<text text-anchor="middle" x="1005" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="848,-829.5 1162,-829.5 "/>
<text text-anchor="middle" x="1005" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="848,-806.5 1162,-806.5 "/>
<text text-anchor="middle" x="1005" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="848,-783.5 1162,-783.5 "/>
<text text-anchor="middle" x="1005" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1162,-760.5 1162,-967.5 "/>
<text text-anchor="middle" x="1172.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis -->
<g id="node18" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M1146,-1734.5C1146,-1734.5 1489,-1734.5 1489,-1734.5 1495,-1734.5 1501,-1740.5 1501,-1746.5 1501,-1746.5 1501,-2021.5 1501,-2021.5 1501,-2027.5 1495,-2033.5 1489,-2033.5 1489,-2033.5 1146,-2033.5 1146,-2033.5 1140,-2033.5 1134,-2027.5 1134,-2021.5 1134,-2021.5 1134,-1746.5 1134,-1746.5 1134,-1740.5 1140,-1734.5 1146,-1734.5"/>
<text text-anchor="middle" x="1176" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="1218,-1734.5 1218,-2033.5 "/>
<text text-anchor="middle" x="1228.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1239,-1734.5 1239,-2033.5 "/>
<text text-anchor="middle" x="1359.5" y="-2018.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="1239,-2010.5 1480,-2010.5 "/>
<text text-anchor="middle" x="1359.5" y="-1995.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="1239,-1987.5 1480,-1987.5 "/>
<text text-anchor="middle" x="1359.5" y="-1972.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="1239,-1964.5 1480,-1964.5 "/>
<text text-anchor="middle" x="1359.5" y="-1949.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="1239,-1941.5 1480,-1941.5 "/>
<text text-anchor="middle" x="1359.5" y="-1926.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1239,-1918.5 1480,-1918.5 "/>
<text text-anchor="middle" x="1359.5" y="-1903.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="1239,-1895.5 1480,-1895.5 "/>
<text text-anchor="middle" x="1359.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="1239,-1872.5 1480,-1872.5 "/>
<text text-anchor="middle" x="1359.5" y="-1857.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="1239,-1849.5 1480,-1849.5 "/>
<text text-anchor="middle" x="1359.5" y="-1834.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="1239,-1826.5 1480,-1826.5 "/>
<text text-anchor="middle" x="1359.5" y="-1811.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="1239,-1803.5 1480,-1803.5 "/>
<text text-anchor="middle" x="1359.5" y="-1788.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="1239,-1780.5 1480,-1780.5 "/>
<text text-anchor="middle" x="1359.5" y="-1765.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="1239,-1757.5 1480,-1757.5 "/>
<text text-anchor="middle" x="1359.5" y="-1742.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="1480,-1734.5 1480,-2033.5 "/>
<text text-anchor="middle" x="1490.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge21" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1276.9097,-1734.2058C1251.8694,-1607.4071 1239.1436,-1426.7394 1326.5,-1301 1341.639,-1279.2092 1392.8031,-1257.5064 1444.9354,-1240.1277"/>
<polygon fill="#000000" stroke="#000000" points="1446.2614,-1243.3764 1454.6725,-1236.934 1444.0797,-1236.725 1446.2614,-1243.3764"/>
<text text-anchor="middle" x="1353.5" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- follow_up -->
<g id="node19" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M2171.5,-1405C2171.5,-1405 2503.5,-1405 2503.5,-1405 2509.5,-1405 2515.5,-1411 2515.5,-1417 2515.5,-1417 2515.5,-1600 2515.5,-1600 2515.5,-1606 2509.5,-1612 2503.5,-1612 2503.5,-1612 2171.5,-1612 2171.5,-1612 2165.5,-1612 2159.5,-1606 2159.5,-1600 2159.5,-1600 2159.5,-1417 2159.5,-1417 2159.5,-1411 2165.5,-1405 2171.5,-1405"/>
<text text-anchor="middle" x="2202" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="2244.5,-1405 2244.5,-1612 "/>
<text text-anchor="middle" x="2255" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2265.5,-1405 2265.5,-1612 "/>
<text text-anchor="middle" x="2380" y="-1596.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="2265.5,-1589 2494.5,-1589 "/>
<text text-anchor="middle" x="2380" y="-1573.8" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="2265.5,-1566 2494.5,-1566 "/>
<text text-anchor="middle" x="2380" y="-1550.8" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="2265.5,-1543 2494.5,-1543 "/>
<text text-anchor="middle" x="2380" y="-1527.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2265.5,-1520 2494.5,-1520 "/>
<text text-anchor="middle" x="2380" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="2265.5,-1497 2494.5,-1497 "/>
<text text-anchor="middle" x="2380" y="-1481.8" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="2265.5,-1474 2494.5,-1474 "/>
<text text-anchor="middle" x="2380" y="-1458.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="2265.5,-1451 2494.5,-1451 "/>
<text text-anchor="middle" x="2380" y="-1435.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="2265.5,-1428 2494.5,-1428 "/>
<text text-anchor="middle" x="2380" y="-1412.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2494.5,-1405 2494.5,-1612 "/>
<text text-anchor="middle" x="2505" y="-1504.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge17" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2267.4047,-1404.8578C2236.0959,-1366.3559 2195.9678,-1326.0039 2150.5,-1301 2076.3305,-1260.2124 1853.5328,-1231.0625 1708.3231,-1215.7804"/>
<polygon fill="#000000" stroke="#000000" points="1708.3144,-1212.2606 1698.0052,-1214.7041 1707.588,-1219.2228 1708.3144,-1212.2606"/>
<text text-anchor="middle" x="2122.5" y="-1271.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge35" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1698.0599,-1197.2557C2037.7154,-1179.5373 2973.5161,-1128.7598 2996.5,-1106 3073.1601,-1030.0873 3015.5,-971.8865 3015.5,-864 3015.5,-864 3015.5,-864 3015.5,-438 3015.5,-413.2823 3015.5,-386.5067 3015.5,-361.7851"/>
<polygon fill="#000000" stroke="#000000" points="3019.0001,-361.6946 3015.5,-351.6946 3012.0001,-361.6947 3019.0001,-361.6946"/>
<text text-anchor="middle" x="3056" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge36" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1454.9893,-1200.205C1139.7948,-1191.3231 311.9857,-1165.7446 190.5,-1139 152.5361,-1130.6424 131.1907,-1138.2587 109.5,-1106 -3.5977,-937.7996 80.5536,-672.1718 115.3321,-580.1561"/>
<polygon fill="#000000" stroke="#000000" points="118.702,-581.144 119.0223,-570.554 112.1679,-578.6329 118.702,-581.144"/>
<text text-anchor="middle" x="150" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge26" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1454.8678,-1190.5789C1375.5558,-1177.9907 1272.1828,-1153.4475 1191.5,-1106 1135.2933,-1072.9463 1084.2966,-1021.9439 1044.8558,-975.2685"/>
<polygon fill="#000000" stroke="#000000" points="1047.4759,-972.9456 1038.3773,-967.5173 1042.1048,-977.4348 1047.4759,-972.9456"/>
<text text-anchor="middle" x="1314" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- off_treatment -->
<g id="node21" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1213,-772C1213,-772 1660,-772 1660,-772 1666,-772 1672,-778 1672,-784 1672,-784 1672,-944 1672,-944 1672,-950 1666,-956 1660,-956 1660,-956 1213,-956 1213,-956 1207,-956 1201,-950 1201,-944 1201,-944 1201,-784 1201,-784 1201,-778 1207,-772 1213,-772"/>
<text text-anchor="middle" x="1258.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1316,-772 1316,-956 "/>
<text text-anchor="middle" x="1326.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1337,-772 1337,-956 "/>
<text text-anchor="middle" x="1494" y="-940.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1337,-933 1651,-933 "/>
<text text-anchor="middle" x="1494" y="-917.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1337,-910 1651,-910 "/>
<text text-anchor="middle" x="1494" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1337,-887 1651,-887 "/>
<text text-anchor="middle" x="1494" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1337,-864 1651,-864 "/>
<text text-anchor="middle" x="1494" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1337,-841 1651,-841 "/>
<text text-anchor="middle" x="1494" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1337,-818 1651,-818 "/>
<text text-anchor="middle" x="1494" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1337,-795 1651,-795 "/>
<text text-anchor="middle" x="1494" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1651,-772 1651,-956 "/>
<text text-anchor="middle" x="1661.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge15" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1557.4733,-1157.3602C1537.2359,-1108.2846 1504.5838,-1029.1032 1478.3005,-965.3663"/>
<polygon fill="#000000" stroke="#000000" points="1481.5191,-963.9904 1474.4711,-956.0799 1475.0478,-966.6591 1481.5191,-963.9904"/>
<text text-anchor="middle" x="1620.5" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- adverse_event -->
<g id="node24" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1702,-668.5C1702,-668.5 2097,-668.5 2097,-668.5 2103,-668.5 2109,-674.5 2109,-680.5 2109,-680.5 2109,-1047.5 2109,-1047.5 2109,-1053.5 2103,-1059.5 2097,-1059.5 2097,-1059.5 1702,-1059.5 1702,-1059.5 1696,-1059.5 1690,-1053.5 1690,-1047.5 1690,-1047.5 1690,-680.5 1690,-680.5 1690,-674.5 1696,-668.5 1702,-668.5"/>
<text text-anchor="middle" x="1750" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1810,-668.5 1810,-1059.5 "/>
<text text-anchor="middle" x="1820.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1831,-668.5 1831,-1059.5 "/>
<text text-anchor="middle" x="1959.5" y="-1044.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="1831,-1036.5 2088,-1036.5 "/>
<text text-anchor="middle" x="1959.5" y="-1021.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1831,-1013.5 2088,-1013.5 "/>
<text text-anchor="middle" x="1959.5" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1831,-990.5 2088,-990.5 "/>
<text text-anchor="middle" x="1959.5" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1831,-967.5 2088,-967.5 "/>
<text text-anchor="middle" x="1959.5" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1831,-944.5 2088,-944.5 "/>
<text text-anchor="middle" x="1959.5" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1831,-921.5 2088,-921.5 "/>
<text text-anchor="middle" x="1959.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1831,-898.5 2088,-898.5 "/>
<text text-anchor="middle" x="1959.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1831,-875.5 2088,-875.5 "/>
<text text-anchor="middle" x="1959.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1831,-852.5 2088,-852.5 "/>
<text text-anchor="middle" x="1959.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1831,-829.5 2088,-829.5 "/>
<text text-anchor="middle" x="1959.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1831,-806.5 2088,-806.5 "/>
<text text-anchor="middle" x="1959.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1831,-783.5 2088,-783.5 "/>
<text text-anchor="middle" x="1959.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1831,-760.5 2088,-760.5 "/>
<text text-anchor="middle" x="1959.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1831,-737.5 2088,-737.5 "/>
<text text-anchor="middle" x="1959.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1831,-714.5 2088,-714.5 "/>
<text text-anchor="middle" x="1959.5" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1831,-691.5 2088,-691.5 "/>
<text text-anchor="middle" x="1959.5" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="2088,-668.5 2088,-1059.5 "/>
<text text-anchor="middle" x="2098.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge25" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1671.009,-1157.3994C1679.6375,-1151.6945 1687.9563,-1145.5449 1695.5,-1139 1719.9151,-1117.8174 1743.162,-1093.2268 1764.6355,-1067.6314"/>
<polygon fill="#000000" stroke="#000000" points="1767.5566,-1069.5917 1771.242,-1059.6585 1762.1666,-1065.1254 1767.5566,-1069.5917"/>
<text text-anchor="middle" x="1777.5" y="-1127.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- physical_exam -->
<g id="node22" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M2343.5,-2259.5C2343.5,-2259.5 2659.5,-2259.5 2659.5,-2259.5 2665.5,-2259.5 2671.5,-2265.5 2671.5,-2271.5 2671.5,-2271.5 2671.5,-2431.5 2671.5,-2431.5 2671.5,-2437.5 2665.5,-2443.5 2659.5,-2443.5 2659.5,-2443.5 2343.5,-2443.5 2343.5,-2443.5 2337.5,-2443.5 2331.5,-2437.5 2331.5,-2431.5 2331.5,-2431.5 2331.5,-2271.5 2331.5,-2271.5 2331.5,-2265.5 2337.5,-2259.5 2343.5,-2259.5"/>
<text text-anchor="middle" x="2392.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="2453.5,-2259.5 2453.5,-2443.5 "/>
<text text-anchor="middle" x="2464" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2474.5,-2259.5 2474.5,-2443.5 "/>
<text text-anchor="middle" x="2562.5" y="-2428.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="2474.5,-2420.5 2650.5,-2420.5 "/>
<text text-anchor="middle" x="2562.5" y="-2405.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="2474.5,-2397.5 2650.5,-2397.5 "/>
<text text-anchor="middle" x="2562.5" y="-2382.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2474.5,-2374.5 2650.5,-2374.5 "/>
<text text-anchor="middle" x="2562.5" y="-2359.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="2474.5,-2351.5 2650.5,-2351.5 "/>
<text text-anchor="middle" x="2562.5" y="-2336.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="2474.5,-2328.5 2650.5,-2328.5 "/>
<text text-anchor="middle" x="2562.5" y="-2313.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="2474.5,-2305.5 2650.5,-2305.5 "/>
<text text-anchor="middle" x="2562.5" y="-2290.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="2474.5,-2282.5 2650.5,-2282.5 "/>
<text text-anchor="middle" x="2562.5" y="-2267.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="2650.5,-2259.5 2650.5,-2443.5 "/>
<text text-anchor="middle" x="2661" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge30" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M2456.3171,-2259.4409C2423.6419,-2197.5231 2375.9713,-2115.8611 2322.5,-2052 2184.1601,-1886.78 2154.4352,-1819.1892 1956.5,-1734 1881.0253,-1701.5165 1846.283,-1752.1617 1772.5,-1716 1727.4263,-1693.909 1687.3357,-1656.8128 1655.3416,-1620.0447"/>
<polygon fill="#000000" stroke="#000000" points="1657.7987,-1617.5327 1648.6384,-1612.2092 1652.4796,-1622.0833 1657.7987,-1617.5327"/>
<text text-anchor="middle" x="2355.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge11" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2509.4681,-2259.2737C2522.1477,-2104.315 2545.5,-1781.8221 2545.5,-1508.5 2545.5,-1508.5 2545.5,-1508.5 2545.5,-864 2545.5,-756.1135 2573.0941,-719.3062 2526.5,-622 2518.1319,-604.5241 2503.7147,-589.1384 2489.4041,-576.955"/>
<polygon fill="#000000" stroke="#000000" points="2491.4685,-574.1225 2481.5038,-570.523 2487.0489,-579.5509 2491.4685,-574.1225"/>
<text text-anchor="middle" x="2573.5" y="-1199.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge27" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M2346.9711,-539.2248C2113.7181,-519.8313 1531.4607,-471.4204 1265.6693,-449.3216"/>
<polygon fill="#000000" stroke="#000000" points="1265.8302,-445.823 1255.5746,-448.4823 1265.2502,-452.7989 1265.8302,-445.823"/>
<text text-anchor="middle" x="1974" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge1" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2546.3627,-555.0146C2557.0961,-553.5674 2564,-551.0625 2564,-547.5 2564,-545.2178 2561.1666,-543.3696 2556.3082,-541.9555"/>
<polygon fill="#000000" stroke="#000000" points="2556.8522,-538.4953 2546.3627,-539.9854 2555.492,-545.3619 2556.8522,-538.4953"/>
<text text-anchor="middle" x="2580" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge7" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1749.4317,-668.2779C1728.1432,-650.0896 1705.061,-634.0101 1680.5,-622 1580.2851,-572.9958 849.2399,-554.9866 541.9621,-549.5337"/>
<polygon fill="#000000" stroke="#000000" points="541.7174,-546.029 531.6574,-549.3528 541.5944,-553.0279 541.7174,-546.029"/>
<text text-anchor="middle" x="1624.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- adverse_event&#45;&gt;visit -->
<g id="edge14" class="edge">
<title>adverse_event&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2097.0213,-668.4058C2120.0462,-651.1645 2144.0687,-635.2589 2168.5,-622 2220.3813,-593.844 2283.5806,-575.8092 2336.6037,-564.5503"/>
<polygon fill="#000000" stroke="#000000" points="2337.6394,-567.9102 2346.723,-562.4569 2336.2213,-561.0554 2337.6394,-567.9102"/>
<text text-anchor="middle" x="2268.5" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge2" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2109.2046,-896.9793C2120.376,-888.8906 2127,-877.8975 2127,-864 2127,-853.7941 2123.4277,-845.1544 2117.1053,-838.0812"/>
<polygon fill="#000000" stroke="#000000" points="2118.9933,-835.0744 2109.2046,-831.0207 2114.3288,-840.2939 2118.9933,-835.0744"/>
<text text-anchor="middle" x="2143" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- study_site -->
<g id="node25" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M3425,-403.5C3425,-403.5 3742,-403.5 3742,-403.5 3748,-403.5 3754,-409.5 3754,-415.5 3754,-415.5 3754,-460.5 3754,-460.5 3754,-466.5 3748,-472.5 3742,-472.5 3742,-472.5 3425,-472.5 3425,-472.5 3419,-472.5 3413,-466.5 3413,-460.5 3413,-460.5 3413,-415.5 3413,-415.5 3413,-409.5 3419,-403.5 3425,-403.5"/>
<text text-anchor="middle" x="3458" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="3503,-403.5 3503,-472.5 "/>
<text text-anchor="middle" x="3513.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3524,-403.5 3524,-472.5 "/>
<text text-anchor="middle" x="3628.5" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="3524,-449.5 3733,-449.5 "/>
<text text-anchor="middle" x="3628.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="3524,-426.5 3733,-426.5 "/>
<text text-anchor="middle" x="3628.5" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="3733,-403.5 3733,-472.5 "/>
<text text-anchor="middle" x="3743.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge22" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3466.1546,-403.4988C3382.6196,-378.9383 3269.317,-345.6258 3177.2197,-318.5479"/>
<polygon fill="#000000" stroke="#000000" points="3178.1051,-315.1601 3167.5238,-315.6972 3176.1305,-321.8758 3178.1051,-315.1601"/>
<text text-anchor="middle" x="3430" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge28" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2714.9235,-2333.3496C2704.8215,-2258.5658 2670.5278,-1967.2707 2713.5,-1734 2714.0248,-1731.151 2714.5841,-1728.2913 2715.1754,-1725.4238"/>
<polygon fill="#000000" stroke="#000000" points="2718.5963,-1726.1633 2717.3066,-1715.6473 2711.757,-1724.6723 2718.5963,-1726.1633"/>
<text text-anchor="middle" x="2750" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- prior_surgery -->
<g id="node27" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M1357.5,-2271C1357.5,-2271 1703.5,-2271 1703.5,-2271 1709.5,-2271 1715.5,-2277 1715.5,-2283 1715.5,-2283 1715.5,-2420 1715.5,-2420 1715.5,-2426 1709.5,-2432 1703.5,-2432 1703.5,-2432 1357.5,-2432 1357.5,-2432 1351.5,-2432 1345.5,-2426 1345.5,-2420 1345.5,-2420 1345.5,-2283 1345.5,-2283 1345.5,-2277 1351.5,-2271 1357.5,-2271"/>
<text text-anchor="middle" x="1403" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="1460.5,-2271 1460.5,-2432 "/>
<text text-anchor="middle" x="1471" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1481.5,-2271 1481.5,-2432 "/>
<text text-anchor="middle" x="1588" y="-2416.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="1481.5,-2409 1694.5,-2409 "/>
<text text-anchor="middle" x="1588" y="-2393.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="1481.5,-2386 1694.5,-2386 "/>
<text text-anchor="middle" x="1588" y="-2370.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1481.5,-2363 1694.5,-2363 "/>
<text text-anchor="middle" x="1588" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1481.5,-2340 1694.5,-2340 "/>
<text text-anchor="middle" x="1588" y="-2324.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="1481.5,-2317 1694.5,-2317 "/>
<text text-anchor="middle" x="1588" y="-2301.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="1481.5,-2294 1694.5,-2294 "/>
<text text-anchor="middle" x="1588" y="-2278.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="1694.5,-2271 1694.5,-2432 "/>
<text text-anchor="middle" x="1705" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge31" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1534.9107,-2270.6696C1543.1401,-2119.8569 1560.8529,-1795.251 1570.2879,-1622.3433"/>
<polygon fill="#000000" stroke="#000000" points="1573.7916,-1622.3692 1570.8418,-1612.1933 1566.802,-1621.9878 1573.7916,-1622.3692"/>
<text text-anchor="middle" x="1613.5" y="-1880.3" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge3" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M1715.613,-2393.5585C1726.7907,-2383.5547 1733.5,-2369.5352 1733.5,-2351.5 1733.5,-2337.5509 1729.4865,-2326.004 1722.4962,-2316.8593"/>
<polygon fill="#000000" stroke="#000000" points="1724.9806,-2314.3911 1715.613,-2309.4415 1719.8494,-2319.1525 1724.9806,-2314.3911"/>
<text text-anchor="middle" x="1749.5" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- file -->
<g id="node28" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M2596,-2702.5C2596,-2702.5 2781,-2702.5 2781,-2702.5 2787,-2702.5 2793,-2708.5 2793,-2714.5 2793,-2714.5 2793,-2897.5 2793,-2897.5 2793,-2903.5 2787,-2909.5 2781,-2909.5 2781,-2909.5 2596,-2909.5 2596,-2909.5 2590,-2909.5 2584,-2903.5 2584,-2897.5 2584,-2897.5 2584,-2714.5 2584,-2714.5 2584,-2708.5 2590,-2702.5 2596,-2702.5"/>
<text text-anchor="middle" x="2603.5" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="2623,-2702.5 2623,-2909.5 "/>
<text text-anchor="middle" x="2633.5" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2644,-2702.5 2644,-2909.5 "/>
<text text-anchor="middle" x="2708" y="-2894.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="2644,-2886.5 2772,-2886.5 "/>
<text text-anchor="middle" x="2708" y="-2871.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="2644,-2863.5 2772,-2863.5 "/>
<text text-anchor="middle" x="2708" y="-2848.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="2644,-2840.5 2772,-2840.5 "/>
<text text-anchor="middle" x="2708" y="-2825.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="2644,-2817.5 2772,-2817.5 "/>
<text text-anchor="middle" x="2708" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="2644,-2794.5 2772,-2794.5 "/>
<text text-anchor="middle" x="2708" y="-2779.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_locations</text>
<polyline fill="none" stroke="#000000" points="2644,-2771.5 2772,-2771.5 "/>
<text text-anchor="middle" x="2708" y="-2756.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="2644,-2748.5 2772,-2748.5 "/>
<text text-anchor="middle" x="2708" y="-2733.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="2644,-2725.5 2772,-2725.5 "/>
<text text-anchor="middle" x="2708" y="-2710.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="2772,-2702.5 2772,-2909.5 "/>
<text text-anchor="middle" x="2782.5" y="-2802.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge29" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2754.9676,-2702.4164C2757.4625,-2696.3122 2759.6721,-2690.1517 2761.5,-2684 2857.4997,-2360.9173 2845.4986,-1965.7555 2824.8602,-1725.7901"/>
<polygon fill="#000000" stroke="#000000" points="2828.3225,-1725.2042 2823.9658,-1715.5465 2821.349,-1725.8131 2828.3225,-1725.2042"/>
<text text-anchor="middle" x="2875" y="-2347.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge33" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M2583.7756,-2801.7588C2280.95,-2788.4421 1420.4253,-2742.7829 1336.5,-2651 1187.9277,-2488.5174 1223.2915,-2216.1013 1267.0059,-2043.4501"/>
<polygon fill="#000000" stroke="#000000" points="1270.4613,-2044.066 1269.5599,-2033.5096 1263.6815,-2042.3241 1270.4613,-2044.066"/>
<text text-anchor="middle" x="1454" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge40" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2695.1168,-2702.2982C2701.7876,-2597.7517 2711.6564,-2443.0826 2715.6863,-2379.9243"/>
<polygon fill="#000000" stroke="#000000" points="2719.2032,-2379.7709 2716.3471,-2369.5683 2712.2174,-2379.3251 2719.2032,-2379.7709"/>
<text text-anchor="middle" x="2727" y="-2672.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
</g>
</svg>
</div>
