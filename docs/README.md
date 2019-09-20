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
<svg width="3758pt" height="2966pt"
 viewBox="0.00 0.00 3757.50 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 3753.5,-2962 3753.5,4 -4,4"/>
<!-- cohort -->
<g id="node1" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M2150.5,-795C2150.5,-795 2383.5,-795 2383.5,-795 2389.5,-795 2395.5,-801 2395.5,-807 2395.5,-807 2395.5,-829 2395.5,-829 2395.5,-835 2389.5,-841 2383.5,-841 2383.5,-841 2150.5,-841 2150.5,-841 2144.5,-841 2138.5,-835 2138.5,-829 2138.5,-829 2138.5,-807 2138.5,-807 2138.5,-801 2144.5,-795 2150.5,-795"/>
<text text-anchor="middle" x="2170" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="2201.5,-795 2201.5,-841 "/>
<text text-anchor="middle" x="2212" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2222.5,-795 2222.5,-841 "/>
<text text-anchor="middle" x="2298.5" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2222.5,-818 2374.5,-818 "/>
<text text-anchor="middle" x="2298.5" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="2374.5,-795 2374.5,-841 "/>
<text text-anchor="middle" x="2385" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node4" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M2884,-190.5C2884,-190.5 3164,-190.5 3164,-190.5 3170,-190.5 3176,-196.5 3176,-202.5 3176,-202.5 3176,-339.5 3176,-339.5 3176,-345.5 3170,-351.5 3164,-351.5 3164,-351.5 2884,-351.5 2884,-351.5 2878,-351.5 2872,-345.5 2872,-339.5 2872,-339.5 2872,-202.5 2872,-202.5 2872,-196.5 2878,-190.5 2884,-190.5"/>
<text text-anchor="middle" x="2900" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="2928,-190.5 2928,-351.5 "/>
<text text-anchor="middle" x="2938.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2949,-190.5 2949,-351.5 "/>
<text text-anchor="middle" x="3052" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="2949,-328.5 3155,-328.5 "/>
<text text-anchor="middle" x="3052" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="2949,-305.5 3155,-305.5 "/>
<text text-anchor="middle" x="3052" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="2949,-282.5 3155,-282.5 "/>
<text text-anchor="middle" x="3052" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="2949,-259.5 3155,-259.5 "/>
<text text-anchor="middle" x="3052" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="2949,-236.5 3155,-236.5 "/>
<text text-anchor="middle" x="3052" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="2949,-213.5 3155,-213.5 "/>
<text text-anchor="middle" x="3052" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="3155,-190.5 3155,-351.5 "/>
<text text-anchor="middle" x="3165.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge32" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2258.7398,-794.8451C2235.1475,-724.1007 2175.971,-509.1742 2286,-403 2366.226,-325.5846 2669.5576,-292.6691 2861.4745,-279.3633"/>
<polygon fill="#000000" stroke="#000000" points="2861.9288,-282.8405 2871.6673,-278.6678 2861.4522,-275.8568 2861.9288,-282.8405"/>
<text text-anchor="middle" x="2275.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_arm -->
<g id="node7" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M2307.5,-415C2307.5,-415 2676.5,-415 2676.5,-415 2682.5,-415 2688.5,-421 2688.5,-427 2688.5,-427 2688.5,-449 2688.5,-449 2688.5,-455 2682.5,-461 2676.5,-461 2676.5,-461 2307.5,-461 2307.5,-461 2301.5,-461 2295.5,-455 2295.5,-449 2295.5,-449 2295.5,-427 2295.5,-427 2295.5,-421 2301.5,-415 2307.5,-415"/>
<text text-anchor="middle" x="2341.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="2387.5,-415 2387.5,-461 "/>
<text text-anchor="middle" x="2398" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2408.5,-415 2408.5,-461 "/>
<text text-anchor="middle" x="2538" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="2408.5,-438 2667.5,-438 "/>
<text text-anchor="middle" x="2538" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="2667.5,-415 2667.5,-461 "/>
<text text-anchor="middle" x="2678" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge33" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2283.0627,-794.9048C2329.4402,-728.0866 2461.1404,-537.3303 2475,-506 2479.8622,-495.0087 2483.503,-482.377 2486.1412,-471.0066"/>
<polygon fill="#000000" stroke="#000000" points="2489.612,-471.514 2488.2884,-461.0022 2482.7678,-470.045 2489.612,-471.514"/>
<text text-anchor="middle" x="2504.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- lab_exam -->
<g id="node2" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M2555,-2008.5C2555,-2008.5 2615,-2008.5 2615,-2008.5 2621,-2008.5 2627,-2014.5 2627,-2020.5 2627,-2020.5 2627,-2032.5 2627,-2032.5 2627,-2038.5 2621,-2044.5 2615,-2044.5 2615,-2044.5 2555,-2044.5 2555,-2044.5 2549,-2044.5 2543,-2038.5 2543,-2032.5 2543,-2032.5 2543,-2020.5 2543,-2020.5 2543,-2014.5 2549,-2008.5 2555,-2008.5"/>
<text text-anchor="middle" x="2585" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- visit -->
<g id="node13" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M2095.5,-1549C2095.5,-1549 2270.5,-1549 2270.5,-1549 2276.5,-1549 2282.5,-1555 2282.5,-1561 2282.5,-1561 2282.5,-1583 2282.5,-1583 2282.5,-1589 2276.5,-1595 2270.5,-1595 2270.5,-1595 2095.5,-1595 2095.5,-1595 2089.5,-1595 2083.5,-1589 2083.5,-1583 2083.5,-1583 2083.5,-1561 2083.5,-1561 2083.5,-1555 2089.5,-1549 2095.5,-1549"/>
<text text-anchor="middle" x="2107" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="2130.5,-1549 2130.5,-1595 "/>
<text text-anchor="middle" x="2141" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2151.5,-1549 2151.5,-1595 "/>
<text text-anchor="middle" x="2206.5" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="2151.5,-1572 2261.5,-1572 "/>
<text text-anchor="middle" x="2206.5" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="2261.5,-1549 2261.5,-1595 "/>
<text text-anchor="middle" x="2272" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge15" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2587.3644,-2008.3535C2592.9099,-1957.8631 2601.5836,-1813.7559 2534,-1727 2475.2102,-1651.5325 2371.9242,-1611.9585 2292.5642,-1591.7563"/>
<polygon fill="#000000" stroke="#000000" points="2293.0663,-1588.275 2282.5182,-1589.2692 2291.384,-1595.0699 2293.0663,-1588.275"/>
<text text-anchor="middle" x="2542" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent_administration -->
<g id="node3" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M997.5,-1785C997.5,-1785 1466.5,-1785 1466.5,-1785 1472.5,-1785 1478.5,-1791 1478.5,-1797 1478.5,-1797 1478.5,-2256 1478.5,-2256 1478.5,-2262 1472.5,-2268 1466.5,-2268 1466.5,-2268 997.5,-2268 997.5,-2268 991.5,-2268 985.5,-2262 985.5,-2256 985.5,-2256 985.5,-1797 985.5,-1797 985.5,-1791 991.5,-1785 997.5,-1785"/>
<text text-anchor="middle" x="1070.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="1155.5,-1785 1155.5,-2268 "/>
<text text-anchor="middle" x="1166" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1176.5,-1785 1176.5,-2268 "/>
<text text-anchor="middle" x="1317" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1176.5,-2245 1457.5,-2245 "/>
<text text-anchor="middle" x="1317" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="1176.5,-2222 1457.5,-2222 "/>
<text text-anchor="middle" x="1317" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="1176.5,-2199 1457.5,-2199 "/>
<text text-anchor="middle" x="1317" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1176.5,-2176 1457.5,-2176 "/>
<text text-anchor="middle" x="1317" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1176.5,-2153 1457.5,-2153 "/>
<text text-anchor="middle" x="1317" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1176.5,-2130 1457.5,-2130 "/>
<text text-anchor="middle" x="1317" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="1176.5,-2107 1457.5,-2107 "/>
<text text-anchor="middle" x="1317" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1176.5,-2084 1457.5,-2084 "/>
<text text-anchor="middle" x="1317" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="1176.5,-2061 1457.5,-2061 "/>
<text text-anchor="middle" x="1317" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="1176.5,-2038 1457.5,-2038 "/>
<text text-anchor="middle" x="1317" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1176.5,-2015 1457.5,-2015 "/>
<text text-anchor="middle" x="1317" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="1176.5,-1992 1457.5,-1992 "/>
<text text-anchor="middle" x="1317" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1176.5,-1969 1457.5,-1969 "/>
<text text-anchor="middle" x="1317" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="1176.5,-1946 1457.5,-1946 "/>
<text text-anchor="middle" x="1317" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="1176.5,-1923 1457.5,-1923 "/>
<text text-anchor="middle" x="1317" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="1176.5,-1900 1457.5,-1900 "/>
<text text-anchor="middle" x="1317" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1176.5,-1877 1457.5,-1877 "/>
<text text-anchor="middle" x="1317" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="1176.5,-1854 1457.5,-1854 "/>
<text text-anchor="middle" x="1317" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="1176.5,-1831 1457.5,-1831 "/>
<text text-anchor="middle" x="1317" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="1176.5,-1808 1457.5,-1808 "/>
<text text-anchor="middle" x="1317" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="1457.5,-1785 1457.5,-2268 "/>
<text text-anchor="middle" x="1468" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent -->
<g id="node11" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M1748,-524.5C1748,-524.5 1974,-524.5 1974,-524.5 1980,-524.5 1986,-530.5 1986,-536.5 1986,-536.5 1986,-558.5 1986,-558.5 1986,-564.5 1980,-570.5 1974,-570.5 1974,-570.5 1748,-570.5 1748,-570.5 1742,-570.5 1736,-564.5 1736,-558.5 1736,-558.5 1736,-536.5 1736,-536.5 1736,-530.5 1742,-524.5 1748,-524.5"/>
<text text-anchor="middle" x="1764.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="1793,-524.5 1793,-570.5 "/>
<text text-anchor="middle" x="1803.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1814,-524.5 1814,-570.5 "/>
<text text-anchor="middle" x="1889.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1814,-547.5 1965,-547.5 "/>
<text text-anchor="middle" x="1889.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1965,-524.5 1965,-570.5 "/>
<text text-anchor="middle" x="1975.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge8" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1412.0734,-1784.825C1435.73,-1762.9855 1461.1556,-1743.0846 1488,-1727 1520.0065,-1707.8224 1541.5998,-1733.1997 1570,-1709 1619.8159,-1666.552 1624,-1637.4481 1624,-1572 1624,-1572 1624,-1572 1624,-818 1624,-730.5223 1587.8672,-690.7167 1642,-622 1656.5314,-603.5536 1703.4866,-586.4139 1750.2101,-573.2364"/>
<polygon fill="#000000" stroke="#000000" points="1751.1474,-576.6086 1759.853,-570.5701 1749.2818,-569.8618 1751.1474,-576.6086"/>
<text text-anchor="middle" x="1655" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge16" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1407.436,-1784.9742C1432.2435,-1762.4987 1459.2038,-1742.4146 1488,-1727 1547.1971,-1695.3117 1571.9744,-1721.2092 1638,-1709 1801.0368,-1678.8518 1987.7878,-1628.3564 2094.919,-1597.8146"/>
<polygon fill="#000000" stroke="#000000" points="2096.0637,-1601.1277 2104.7165,-1595.0138 2094.1396,-1594.3973 2096.0637,-1601.1277"/>
<text text-anchor="middle" x="1741" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- program -->
<g id="node5" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M2870,-.5C2870,-.5 3178,-.5 3178,-.5 3184,-.5 3190,-6.5 3190,-12.5 3190,-12.5 3190,-126.5 3190,-126.5 3190,-132.5 3184,-138.5 3178,-138.5 3178,-138.5 2870,-138.5 2870,-138.5 2864,-138.5 2858,-132.5 2858,-126.5 2858,-126.5 2858,-12.5 2858,-12.5 2858,-6.5 2864,-.5 2870,-.5"/>
<text text-anchor="middle" x="2897" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="2936,-.5 2936,-138.5 "/>
<text text-anchor="middle" x="2946.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2957,-.5 2957,-138.5 "/>
<text text-anchor="middle" x="3063" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="2957,-115.5 3169,-115.5 "/>
<text text-anchor="middle" x="3063" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="2957,-92.5 3169,-92.5 "/>
<text text-anchor="middle" x="3063" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="2957,-69.5 3169,-69.5 "/>
<text text-anchor="middle" x="3063" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="2957,-46.5 3169,-46.5 "/>
<text text-anchor="middle" x="3063" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="2957,-23.5 3169,-23.5 "/>
<text text-anchor="middle" x="3063" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="3169,-.5 3169,-138.5 "/>
<text text-anchor="middle" x="3179.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge36" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M3024,-190.4932C3024,-176.7786 3024,-162.5421 3024,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="3027.5001,-148.5183 3024,-138.5184 3020.5001,-148.5184 3027.5001,-148.5183"/>
<text text-anchor="middle" x="3064.5" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- follow_up -->
<g id="node6" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M2793,-1209.5C2793,-1209.5 3125,-1209.5 3125,-1209.5 3131,-1209.5 3137,-1215.5 3137,-1221.5 3137,-1221.5 3137,-1404.5 3137,-1404.5 3137,-1410.5 3131,-1416.5 3125,-1416.5 3125,-1416.5 2793,-1416.5 2793,-1416.5 2787,-1416.5 2781,-1410.5 2781,-1404.5 2781,-1404.5 2781,-1221.5 2781,-1221.5 2781,-1215.5 2787,-1209.5 2793,-1209.5"/>
<text text-anchor="middle" x="2823.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="2866,-1209.5 2866,-1416.5 "/>
<text text-anchor="middle" x="2876.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2887,-1209.5 2887,-1416.5 "/>
<text text-anchor="middle" x="3001.5" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="2887,-1393.5 3116,-1393.5 "/>
<text text-anchor="middle" x="3001.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="2887,-1370.5 3116,-1370.5 "/>
<text text-anchor="middle" x="3001.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="2887,-1347.5 3116,-1347.5 "/>
<text text-anchor="middle" x="3001.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="2887,-1324.5 3116,-1324.5 "/>
<text text-anchor="middle" x="3001.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="2887,-1301.5 3116,-1301.5 "/>
<text text-anchor="middle" x="3001.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2887,-1278.5 3116,-1278.5 "/>
<text text-anchor="middle" x="3001.5" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="2887,-1255.5 3116,-1255.5 "/>
<text text-anchor="middle" x="3001.5" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="2887,-1232.5 3116,-1232.5 "/>
<text text-anchor="middle" x="3001.5" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="3116,-1209.5 3116,-1416.5 "/>
<text text-anchor="middle" x="3126.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node12" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M2523.5,-1065.5C2523.5,-1065.5 2742.5,-1065.5 2742.5,-1065.5 2748.5,-1065.5 2754.5,-1071.5 2754.5,-1077.5 2754.5,-1077.5 2754.5,-1145.5 2754.5,-1145.5 2754.5,-1151.5 2748.5,-1157.5 2742.5,-1157.5 2742.5,-1157.5 2523.5,-1157.5 2523.5,-1157.5 2517.5,-1157.5 2511.5,-1151.5 2511.5,-1145.5 2511.5,-1145.5 2511.5,-1077.5 2511.5,-1077.5 2511.5,-1071.5 2517.5,-1065.5 2523.5,-1065.5"/>
<text text-anchor="middle" x="2536" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="2560.5,-1065.5 2560.5,-1157.5 "/>
<text text-anchor="middle" x="2571" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2581.5,-1065.5 2581.5,-1157.5 "/>
<text text-anchor="middle" x="2657.5" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2581.5,-1134.5 2733.5,-1134.5 "/>
<text text-anchor="middle" x="2657.5" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="2581.5,-1111.5 2733.5,-1111.5 "/>
<text text-anchor="middle" x="2657.5" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="2581.5,-1088.5 2733.5,-1088.5 "/>
<text text-anchor="middle" x="2657.5" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="2733.5,-1065.5 2733.5,-1157.5 "/>
<text text-anchor="middle" x="2744" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge6" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2819.5488,-1209.3524C2802.143,-1197.6558 2784.3578,-1186.268 2767,-1176 2759.1669,-1171.3663 2750.9502,-1166.7857 2742.6043,-1162.3316"/>
<polygon fill="#000000" stroke="#000000" points="2743.9895,-1159.1057 2733.5093,-1157.5514 2740.7328,-1165.302 2743.9895,-1159.1057"/>
<text text-anchor="middle" x="2816" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge31" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2565.4138,-414.9547C2641.619,-391.0331 2763.2766,-352.8436 2862.1418,-321.8089"/>
<polygon fill="#000000" stroke="#000000" points="2863.4473,-325.0675 2871.94,-318.7331 2861.3507,-318.3889 2863.4473,-325.0675"/>
<text text-anchor="middle" x="2735.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_site -->
<g id="node8" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M2865.5,-403.5C2865.5,-403.5 3182.5,-403.5 3182.5,-403.5 3188.5,-403.5 3194.5,-409.5 3194.5,-415.5 3194.5,-415.5 3194.5,-460.5 3194.5,-460.5 3194.5,-466.5 3188.5,-472.5 3182.5,-472.5 3182.5,-472.5 2865.5,-472.5 2865.5,-472.5 2859.5,-472.5 2853.5,-466.5 2853.5,-460.5 2853.5,-460.5 2853.5,-415.5 2853.5,-415.5 2853.5,-409.5 2859.5,-403.5 2865.5,-403.5"/>
<text text-anchor="middle" x="2898.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="2943.5,-403.5 2943.5,-472.5 "/>
<text text-anchor="middle" x="2954" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2964.5,-403.5 2964.5,-472.5 "/>
<text text-anchor="middle" x="3069" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2964.5,-449.5 3173.5,-449.5 "/>
<text text-anchor="middle" x="3069" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="2964.5,-426.5 3173.5,-426.5 "/>
<text text-anchor="middle" x="3069" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="3173.5,-403.5 3173.5,-472.5 "/>
<text text-anchor="middle" x="3184" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge29" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3024,-403.3975C3024,-391.1328 3024,-376.6951 3024,-361.945"/>
<polygon fill="#000000" stroke="#000000" points="3027.5001,-361.7063 3024,-351.7063 3020.5001,-361.7064 3027.5001,-361.7063"/>
<text text-anchor="middle" x="3054.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- file -->
<g id="node9" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M2871.5,-2750.5C2871.5,-2750.5 3056.5,-2750.5 3056.5,-2750.5 3062.5,-2750.5 3068.5,-2756.5 3068.5,-2762.5 3068.5,-2762.5 3068.5,-2945.5 3068.5,-2945.5 3068.5,-2951.5 3062.5,-2957.5 3056.5,-2957.5 3056.5,-2957.5 2871.5,-2957.5 2871.5,-2957.5 2865.5,-2957.5 2859.5,-2951.5 2859.5,-2945.5 2859.5,-2945.5 2859.5,-2762.5 2859.5,-2762.5 2859.5,-2756.5 2865.5,-2750.5 2871.5,-2750.5"/>
<text text-anchor="middle" x="2879" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="2898.5,-2750.5 2898.5,-2957.5 "/>
<text text-anchor="middle" x="2909" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2919.5,-2750.5 2919.5,-2957.5 "/>
<text text-anchor="middle" x="2983.5" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="2919.5,-2934.5 3047.5,-2934.5 "/>
<text text-anchor="middle" x="2983.5" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="2919.5,-2911.5 3047.5,-2911.5 "/>
<text text-anchor="middle" x="2983.5" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_locations</text>
<polyline fill="none" stroke="#000000" points="2919.5,-2888.5 3047.5,-2888.5 "/>
<text text-anchor="middle" x="2983.5" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="2919.5,-2865.5 3047.5,-2865.5 "/>
<text text-anchor="middle" x="2983.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="2919.5,-2842.5 3047.5,-2842.5 "/>
<text text-anchor="middle" x="2983.5" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="2919.5,-2819.5 3047.5,-2819.5 "/>
<text text-anchor="middle" x="2983.5" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="2919.5,-2796.5 3047.5,-2796.5 "/>
<text text-anchor="middle" x="2983.5" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="2919.5,-2773.5 3047.5,-2773.5 "/>
<text text-anchor="middle" x="2983.5" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="3047.5,-2750.5 3047.5,-2957.5 "/>
<text text-anchor="middle" x="3058" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis -->
<g id="node17" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M2995.5,-2344.5C2995.5,-2344.5 3338.5,-2344.5 3338.5,-2344.5 3344.5,-2344.5 3350.5,-2350.5 3350.5,-2356.5 3350.5,-2356.5 3350.5,-2631.5 3350.5,-2631.5 3350.5,-2637.5 3344.5,-2643.5 3338.5,-2643.5 3338.5,-2643.5 2995.5,-2643.5 2995.5,-2643.5 2989.5,-2643.5 2983.5,-2637.5 2983.5,-2631.5 2983.5,-2631.5 2983.5,-2356.5 2983.5,-2356.5 2983.5,-2350.5 2989.5,-2344.5 2995.5,-2344.5"/>
<text text-anchor="middle" x="3025.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="3067.5,-2344.5 3067.5,-2643.5 "/>
<text text-anchor="middle" x="3078" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3088.5,-2344.5 3088.5,-2643.5 "/>
<text text-anchor="middle" x="3209" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="3088.5,-2620.5 3329.5,-2620.5 "/>
<text text-anchor="middle" x="3209" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="3088.5,-2597.5 3329.5,-2597.5 "/>
<text text-anchor="middle" x="3209" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="3088.5,-2574.5 3329.5,-2574.5 "/>
<text text-anchor="middle" x="3209" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="3088.5,-2551.5 3329.5,-2551.5 "/>
<text text-anchor="middle" x="3209" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="3088.5,-2528.5 3329.5,-2528.5 "/>
<text text-anchor="middle" x="3209" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="3088.5,-2505.5 3329.5,-2505.5 "/>
<text text-anchor="middle" x="3209" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="3088.5,-2482.5 3329.5,-2482.5 "/>
<text text-anchor="middle" x="3209" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="3088.5,-2459.5 3329.5,-2459.5 "/>
<text text-anchor="middle" x="3209" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="3088.5,-2436.5 3329.5,-2436.5 "/>
<text text-anchor="middle" x="3209" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="3088.5,-2413.5 3329.5,-2413.5 "/>
<text text-anchor="middle" x="3209" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="3088.5,-2390.5 3329.5,-2390.5 "/>
<text text-anchor="middle" x="3209" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="3088.5,-2367.5 3329.5,-2367.5 "/>
<text text-anchor="middle" x="3209" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="3329.5,-2344.5 3329.5,-2643.5 "/>
<text text-anchor="middle" x="3340" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge1" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M3022.4437,-2750.3561C3039.647,-2719.8476 3058.8761,-2685.7468 3077.5529,-2652.6253"/>
<polygon fill="#000000" stroke="#000000" points="3080.6817,-2654.2024 3082.5449,-2643.7727 3074.5843,-2650.7641 3080.6817,-2654.2024"/>
<text text-anchor="middle" x="3094.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- assay -->
<g id="node19" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M2853,-2662.5C2853,-2662.5 2885,-2662.5 2885,-2662.5 2891,-2662.5 2897,-2668.5 2897,-2674.5 2897,-2674.5 2897,-2686.5 2897,-2686.5 2897,-2692.5 2891,-2698.5 2885,-2698.5 2885,-2698.5 2853,-2698.5 2853,-2698.5 2847,-2698.5 2841,-2692.5 2841,-2686.5 2841,-2686.5 2841,-2674.5 2841,-2674.5 2841,-2668.5 2847,-2662.5 2853,-2662.5"/>
<text text-anchor="middle" x="2869" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge23" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2898.4927,-2750.2189C2895.1748,-2744.1143 2891.9851,-2738.0127 2889,-2732 2885.2814,-2724.5097 2881.7758,-2716.1478 2878.7696,-2708.3769"/>
<polygon fill="#000000" stroke="#000000" points="2882.0296,-2707.1018 2875.2503,-2698.9598 2875.4725,-2709.5523 2882.0296,-2707.1018"/>
<text text-anchor="middle" x="2919.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- sample -->
<g id="node25" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M2657.5,-1819.5C2657.5,-1819.5 3080.5,-1819.5 3080.5,-1819.5 3086.5,-1819.5 3092.5,-1825.5 3092.5,-1831.5 3092.5,-1831.5 3092.5,-2221.5 3092.5,-2221.5 3092.5,-2227.5 3086.5,-2233.5 3080.5,-2233.5 3080.5,-2233.5 2657.5,-2233.5 2657.5,-2233.5 2651.5,-2233.5 2645.5,-2227.5 2645.5,-2221.5 2645.5,-2221.5 2645.5,-1831.5 2645.5,-1831.5 2645.5,-1825.5 2651.5,-1819.5 2657.5,-1819.5"/>
<text text-anchor="middle" x="2679.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="2713.5,-1819.5 2713.5,-2233.5 "/>
<text text-anchor="middle" x="2724" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2734.5,-1819.5 2734.5,-2233.5 "/>
<text text-anchor="middle" x="2903" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2734.5,-2210.5 3071.5,-2210.5 "/>
<text text-anchor="middle" x="2903" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="2734.5,-2187.5 3071.5,-2187.5 "/>
<text text-anchor="middle" x="2903" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="2734.5,-2164.5 3071.5,-2164.5 "/>
<text text-anchor="middle" x="2903" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="2734.5,-2141.5 3071.5,-2141.5 "/>
<text text-anchor="middle" x="2903" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="2734.5,-2118.5 3071.5,-2118.5 "/>
<text text-anchor="middle" x="2903" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="2734.5,-2095.5 3071.5,-2095.5 "/>
<text text-anchor="middle" x="2903" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="2734.5,-2072.5 3071.5,-2072.5 "/>
<text text-anchor="middle" x="2903" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="2734.5,-2049.5 3071.5,-2049.5 "/>
<text text-anchor="middle" x="2903" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="2734.5,-2026.5 3071.5,-2026.5 "/>
<text text-anchor="middle" x="2903" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2734.5,-2003.5 3071.5,-2003.5 "/>
<text text-anchor="middle" x="2903" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="2734.5,-1980.5 3071.5,-1980.5 "/>
<text text-anchor="middle" x="2903" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="2734.5,-1957.5 3071.5,-1957.5 "/>
<text text-anchor="middle" x="2903" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="2734.5,-1934.5 3071.5,-1934.5 "/>
<text text-anchor="middle" x="2903" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="2734.5,-1911.5 3071.5,-1911.5 "/>
<text text-anchor="middle" x="2903" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="2734.5,-1888.5 3071.5,-1888.5 "/>
<text text-anchor="middle" x="2903" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2734.5,-1865.5 3071.5,-1865.5 "/>
<text text-anchor="middle" x="2903" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="2734.5,-1842.5 3071.5,-1842.5 "/>
<text text-anchor="middle" x="2903" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="3071.5,-1819.5 3071.5,-2233.5 "/>
<text text-anchor="middle" x="3082" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge28" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2966.4632,-2750.4214C2967.4882,-2647.0065 2965.2135,-2483.776 2946,-2344 2941.5008,-2311.2687 2935.0625,-2276.9945 2927.8005,-2243.5741"/>
<polygon fill="#000000" stroke="#000000" points="2931.1958,-2242.7176 2925.6269,-2233.7043 2924.3596,-2244.2231 2931.1958,-2242.7176"/>
<text text-anchor="middle" x="3003.5" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- prior_surgery -->
<g id="node10" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M560,-1946C560,-1946 906,-1946 906,-1946 912,-1946 918,-1952 918,-1958 918,-1958 918,-2095 918,-2095 918,-2101 912,-2107 906,-2107 906,-2107 560,-2107 560,-2107 554,-2107 548,-2101 548,-2095 548,-2095 548,-1958 548,-1958 548,-1952 554,-1946 560,-1946"/>
<text text-anchor="middle" x="605.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="663,-1946 663,-2107 "/>
<text text-anchor="middle" x="673.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="684,-1946 684,-2107 "/>
<text text-anchor="middle" x="790.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="684,-2084 897,-2084 "/>
<text text-anchor="middle" x="790.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="684,-2061 897,-2061 "/>
<text text-anchor="middle" x="790.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="684,-2038 897,-2038 "/>
<text text-anchor="middle" x="790.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="684,-2015 897,-2015 "/>
<text text-anchor="middle" x="790.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="684,-1992 897,-1992 "/>
<text text-anchor="middle" x="790.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="684,-1969 897,-1969 "/>
<text text-anchor="middle" x="790.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="897,-1946 897,-2107 "/>
<text text-anchor="middle" x="907.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge38" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M918.113,-2068.5585C929.2907,-2058.5547 936,-2044.5352 936,-2026.5 936,-2012.5509 931.9865,-2001.004 924.9962,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="927.4806,-1989.3911 918.113,-1984.4415 922.3494,-1994.1525 927.4806,-1989.3911"/>
<text text-anchor="middle" x="952" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- enrollment -->
<g id="node21" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M999.5,-1468.5C999.5,-1468.5 1348.5,-1468.5 1348.5,-1468.5 1354.5,-1468.5 1360.5,-1474.5 1360.5,-1480.5 1360.5,-1480.5 1360.5,-1663.5 1360.5,-1663.5 1360.5,-1669.5 1354.5,-1675.5 1348.5,-1675.5 1348.5,-1675.5 999.5,-1675.5 999.5,-1675.5 993.5,-1675.5 987.5,-1669.5 987.5,-1663.5 987.5,-1663.5 987.5,-1480.5 987.5,-1480.5 987.5,-1474.5 993.5,-1468.5 999.5,-1468.5"/>
<text text-anchor="middle" x="1035" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="1082.5,-1468.5 1082.5,-1675.5 "/>
<text text-anchor="middle" x="1093" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1103.5,-1468.5 1103.5,-1675.5 "/>
<text text-anchor="middle" x="1221.5" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1652.5 1339.5,-1652.5 "/>
<text text-anchor="middle" x="1221.5" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1629.5 1339.5,-1629.5 "/>
<text text-anchor="middle" x="1221.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1606.5 1339.5,-1606.5 "/>
<text text-anchor="middle" x="1221.5" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1583.5 1339.5,-1583.5 "/>
<text text-anchor="middle" x="1221.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1560.5 1339.5,-1560.5 "/>
<text text-anchor="middle" x="1221.5" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1537.5 1339.5,-1537.5 "/>
<text text-anchor="middle" x="1221.5" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1514.5 1339.5,-1514.5 "/>
<text text-anchor="middle" x="1221.5" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="1103.5,-1491.5 1339.5,-1491.5 "/>
<text text-anchor="middle" x="1221.5" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1339.5,-1468.5 1339.5,-1675.5 "/>
<text text-anchor="middle" x="1350" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge22" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M790.6587,-1945.7602C837.2786,-1882.9987 906.393,-1795.4034 976,-1727 991.4584,-1711.8089 1008.3677,-1696.6805 1025.5838,-1682.1616"/>
<polygon fill="#000000" stroke="#000000" points="1028.0831,-1684.6343 1033.5114,-1675.5357 1023.5939,-1679.2632 1028.0831,-1684.6343"/>
<text text-anchor="middle" x="1062" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge25" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1986.2311,-543.1201C2108.7524,-537.7212 2286.2372,-526.6169 2352,-506 2364.7298,-502.0091 2366.1621,-497.1514 2378,-491 2394.8314,-482.2538 2413.373,-473.3379 2430.5238,-465.3755"/>
<polygon fill="#000000" stroke="#000000" points="2432.2737,-468.4228 2439.8893,-461.0571 2429.3426,-462.066 2432.2737,-468.4228"/>
<text text-anchor="middle" x="2426.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge34" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M2511.2529,-1074.2882C2474.3776,-1059.323 2435.3737,-1039.4557 2404,-1014 2347.3523,-968.0376 2303.9259,-892.8331 2282.2583,-850.1815"/>
<polygon fill="#000000" stroke="#000000" points="2285.3175,-848.4732 2277.7193,-841.0896 2279.0546,-851.6 2285.3175,-848.4732"/>
<text text-anchor="middle" x="2489.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge35" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2754.6191,-1103.0946C2948.324,-1088.5208 3309.3363,-1056.0478 3350,-1014 3410.8721,-951.056 3370,-905.5635 3370,-818 3370,-818 3370,-818 3370,-438 3370,-393.429 3275.7016,-349.8809 3185.5623,-318.4349"/>
<polygon fill="#000000" stroke="#000000" points="3186.6071,-315.093 3176.0124,-315.1423 3184.3254,-321.7107 3186.6071,-315.093"/>
<text text-anchor="middle" x="3410.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- off_study -->
<g id="node14" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M2425.5,-714.5C2425.5,-714.5 2840.5,-714.5 2840.5,-714.5 2846.5,-714.5 2852.5,-720.5 2852.5,-726.5 2852.5,-726.5 2852.5,-909.5 2852.5,-909.5 2852.5,-915.5 2846.5,-921.5 2840.5,-921.5 2840.5,-921.5 2425.5,-921.5 2425.5,-921.5 2419.5,-921.5 2413.5,-915.5 2413.5,-909.5 2413.5,-909.5 2413.5,-726.5 2413.5,-726.5 2413.5,-720.5 2419.5,-714.5 2425.5,-714.5"/>
<text text-anchor="middle" x="2455" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="2496.5,-714.5 2496.5,-921.5 "/>
<text text-anchor="middle" x="2507" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2517.5,-714.5 2517.5,-921.5 "/>
<text text-anchor="middle" x="2674.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2517.5,-898.5 2831.5,-898.5 "/>
<text text-anchor="middle" x="2674.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2517.5,-875.5 2831.5,-875.5 "/>
<text text-anchor="middle" x="2674.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2517.5,-852.5 2831.5,-852.5 "/>
<text text-anchor="middle" x="2674.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2517.5,-829.5 2831.5,-829.5 "/>
<text text-anchor="middle" x="2674.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2517.5,-806.5 2831.5,-806.5 "/>
<text text-anchor="middle" x="2674.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2517.5,-783.5 2831.5,-783.5 "/>
<text text-anchor="middle" x="2674.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="2517.5,-760.5 2831.5,-760.5 "/>
<text text-anchor="middle" x="2674.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2517.5,-737.5 2831.5,-737.5 "/>
<text text-anchor="middle" x="2674.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="2831.5,-714.5 2831.5,-921.5 "/>
<text text-anchor="middle" x="2842" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge10" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M2633,-1065.3178C2633,-1029.5232 2633,-978.3477 2633,-931.8265"/>
<polygon fill="#000000" stroke="#000000" points="2636.5001,-931.669 2633,-921.6691 2629.5001,-931.6691 2636.5001,-931.669"/>
<text text-anchor="middle" x="2687.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- adverse_event -->
<g id="node15" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M1663.5,-622.5C1663.5,-622.5 2058.5,-622.5 2058.5,-622.5 2064.5,-622.5 2070.5,-628.5 2070.5,-634.5 2070.5,-634.5 2070.5,-1001.5 2070.5,-1001.5 2070.5,-1007.5 2064.5,-1013.5 2058.5,-1013.5 2058.5,-1013.5 1663.5,-1013.5 1663.5,-1013.5 1657.5,-1013.5 1651.5,-1007.5 1651.5,-1001.5 1651.5,-1001.5 1651.5,-634.5 1651.5,-634.5 1651.5,-628.5 1657.5,-622.5 1663.5,-622.5"/>
<text text-anchor="middle" x="1711.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="1771.5,-622.5 1771.5,-1013.5 "/>
<text text-anchor="middle" x="1782" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1792.5,-622.5 1792.5,-1013.5 "/>
<text text-anchor="middle" x="1921" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="1792.5,-990.5 2049.5,-990.5 "/>
<text text-anchor="middle" x="1921" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="1792.5,-967.5 2049.5,-967.5 "/>
<text text-anchor="middle" x="1921" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="1792.5,-944.5 2049.5,-944.5 "/>
<text text-anchor="middle" x="1921" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="1792.5,-921.5 2049.5,-921.5 "/>
<text text-anchor="middle" x="1921" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="1792.5,-898.5 2049.5,-898.5 "/>
<text text-anchor="middle" x="1921" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1792.5,-875.5 2049.5,-875.5 "/>
<text text-anchor="middle" x="1921" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="1792.5,-852.5 2049.5,-852.5 "/>
<text text-anchor="middle" x="1921" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="1792.5,-829.5 2049.5,-829.5 "/>
<text text-anchor="middle" x="1921" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1792.5,-806.5 2049.5,-806.5 "/>
<text text-anchor="middle" x="1921" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="1792.5,-783.5 2049.5,-783.5 "/>
<text text-anchor="middle" x="1921" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="1792.5,-760.5 2049.5,-760.5 "/>
<text text-anchor="middle" x="1921" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="1792.5,-737.5 2049.5,-737.5 "/>
<text text-anchor="middle" x="1921" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="1792.5,-714.5 2049.5,-714.5 "/>
<text text-anchor="middle" x="1921" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="1792.5,-691.5 2049.5,-691.5 "/>
<text text-anchor="middle" x="1921" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="1792.5,-668.5 2049.5,-668.5 "/>
<text text-anchor="middle" x="1921" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1792.5,-645.5 2049.5,-645.5 "/>
<text text-anchor="middle" x="1921" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="2049.5,-622.5 2049.5,-1013.5 "/>
<text text-anchor="middle" x="2060" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge11" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2511.3353,-1103.3496C2406.3065,-1092.7736 2252.4604,-1068.6625 2129,-1014 2112.4341,-1006.6654 2095.8962,-998.1774 2079.6293,-988.9299"/>
<polygon fill="#000000" stroke="#000000" points="2081.0297,-985.6965 2070.6215,-983.7167 2077.5234,-991.755 2081.0297,-985.6965"/>
<text text-anchor="middle" x="2277" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- off_treatment -->
<g id="node27" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M2882.5,-726C2882.5,-726 3329.5,-726 3329.5,-726 3335.5,-726 3341.5,-732 3341.5,-738 3341.5,-738 3341.5,-898 3341.5,-898 3341.5,-904 3335.5,-910 3329.5,-910 3329.5,-910 2882.5,-910 2882.5,-910 2876.5,-910 2870.5,-904 2870.5,-898 2870.5,-898 2870.5,-738 2870.5,-738 2870.5,-732 2876.5,-726 2882.5,-726"/>
<text text-anchor="middle" x="2928" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="2985.5,-726 2985.5,-910 "/>
<text text-anchor="middle" x="2996" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3006.5,-726 3006.5,-910 "/>
<text text-anchor="middle" x="3163.5" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="3006.5,-887 3320.5,-887 "/>
<text text-anchor="middle" x="3163.5" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="3006.5,-864 3320.5,-864 "/>
<text text-anchor="middle" x="3163.5" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="3006.5,-841 3320.5,-841 "/>
<text text-anchor="middle" x="3163.5" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="3006.5,-818 3320.5,-818 "/>
<text text-anchor="middle" x="3163.5" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="3006.5,-795 3320.5,-795 "/>
<text text-anchor="middle" x="3163.5" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="3006.5,-772 3320.5,-772 "/>
<text text-anchor="middle" x="3163.5" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="3006.5,-749 3320.5,-749 "/>
<text text-anchor="middle" x="3163.5" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="3320.5,-726 3320.5,-910 "/>
<text text-anchor="middle" x="3331" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge26" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M2754.6345,-1066.6581C2789.918,-1051.7603 2827.8483,-1033.846 2861,-1014 2907.6509,-986.0729 2955.1698,-950.126 2995.7875,-916.6592"/>
<polygon fill="#000000" stroke="#000000" points="2998.0876,-919.2987 3003.5527,-910.2222 2993.6202,-913.9096 2998.0876,-919.2987"/>
<text text-anchor="middle" x="2897" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge41" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2241.0376,-1595.0098C2272.1529,-1598.9199 2300.5,-1591.25 2300.5,-1572 2300.5,-1554.8555 2278.0147,-1546.8964 2251.1145,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="2250.7006,-1544.6454 2241.0376,-1548.9902 2251.301,-1551.6196 2250.7006,-1544.6454"/>
<text text-anchor="middle" x="2316.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cycle -->
<g id="node28" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M2485,-1278.5C2485,-1278.5 2713,-1278.5 2713,-1278.5 2719,-1278.5 2725,-1284.5 2725,-1290.5 2725,-1290.5 2725,-1335.5 2725,-1335.5 2725,-1341.5 2719,-1347.5 2713,-1347.5 2713,-1347.5 2485,-1347.5 2485,-1347.5 2479,-1347.5 2473,-1341.5 2473,-1335.5 2473,-1335.5 2473,-1290.5 2473,-1290.5 2473,-1284.5 2479,-1278.5 2485,-1278.5"/>
<text text-anchor="middle" x="2500" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="2527,-1278.5 2527,-1347.5 "/>
<text text-anchor="middle" x="2537.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2548,-1278.5 2548,-1347.5 "/>
<text text-anchor="middle" x="2626" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="2548,-1324.5 2704,-1324.5 "/>
<text text-anchor="middle" x="2626" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="2548,-1301.5 2704,-1301.5 "/>
<text text-anchor="middle" x="2626" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="2704,-1278.5 2704,-1347.5 "/>
<text text-anchor="middle" x="2714.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge12" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M2230.0111,-1548.8554C2286.864,-1520.2387 2384.7876,-1468.9248 2464,-1417 2493.3602,-1397.754 2524.5064,-1374.006 2549.4752,-1354.0642"/>
<polygon fill="#000000" stroke="#000000" points="2551.7511,-1356.7255 2557.3548,-1347.7339 2547.3669,-1351.2684 2551.7511,-1356.7255"/>
<text text-anchor="middle" x="2464.5" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge9" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M1861,-622.4901C1861,-606.8636 1861,-592.5861 1861,-580.7798"/>
<polygon fill="#000000" stroke="#000000" points="1864.5001,-580.664 1861,-570.6641 1857.5001,-580.6641 1864.5001,-580.664"/>
<text text-anchor="middle" x="1892" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- adverse_event&#45;&gt;visit -->
<g id="edge19" class="edge">
<title>adverse_event&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1923.4063,-1013.6703C1964.0868,-1132.7594 2021.4925,-1286.5538 2086,-1417 2108.0928,-1461.6757 2139.571,-1509.8523 2160.6131,-1540.4321"/>
<polygon fill="#000000" stroke="#000000" points="2157.9465,-1542.7289 2166.5203,-1548.9532 2163.6994,-1538.7408 2157.9465,-1542.7289"/>
<text text-anchor="middle" x="2015" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge40" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2070.7046,-845.2761C2081.876,-838.5862 2088.5,-829.4941 2088.5,-818 2088.5,-809.7386 2085.0781,-802.7181 2079.0052,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="2080.8073,-793.9155 2070.7046,-790.7239 2076.6119,-799.519 2080.8073,-793.9155"/>
<text text-anchor="middle" x="2104.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_therapy -->
<g id="node16" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M12,-1727.5C12,-1727.5 468,-1727.5 468,-1727.5 474,-1727.5 480,-1733.5 480,-1739.5 480,-1739.5 480,-2313.5 480,-2313.5 480,-2319.5 474,-2325.5 468,-2325.5 468,-2325.5 12,-2325.5 12,-2325.5 6,-2325.5 0,-2319.5 0,-2313.5 0,-2313.5 0,-1739.5 0,-1739.5 0,-1733.5 6,-1727.5 12,-1727.5"/>
<text text-anchor="middle" x="57.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="115,-1727.5 115,-2325.5 "/>
<text text-anchor="middle" x="125.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="136,-1727.5 136,-2325.5 "/>
<text text-anchor="middle" x="297.5" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="136,-2302.5 459,-2302.5 "/>
<text text-anchor="middle" x="297.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="136,-2279.5 459,-2279.5 "/>
<text text-anchor="middle" x="297.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="136,-2256.5 459,-2256.5 "/>
<text text-anchor="middle" x="297.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="136,-2233.5 459,-2233.5 "/>
<text text-anchor="middle" x="297.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="136,-2210.5 459,-2210.5 "/>
<text text-anchor="middle" x="297.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="136,-2187.5 459,-2187.5 "/>
<text text-anchor="middle" x="297.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="136,-2164.5 459,-2164.5 "/>
<text text-anchor="middle" x="297.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="136,-2141.5 459,-2141.5 "/>
<text text-anchor="middle" x="297.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="136,-2118.5 459,-2118.5 "/>
<text text-anchor="middle" x="297.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="136,-2095.5 459,-2095.5 "/>
<text text-anchor="middle" x="297.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="136,-2072.5 459,-2072.5 "/>
<text text-anchor="middle" x="297.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="136,-2049.5 459,-2049.5 "/>
<text text-anchor="middle" x="297.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="136,-2026.5 459,-2026.5 "/>
<text text-anchor="middle" x="297.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="136,-2003.5 459,-2003.5 "/>
<text text-anchor="middle" x="297.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="136,-1980.5 459,-1980.5 "/>
<text text-anchor="middle" x="297.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="136,-1957.5 459,-1957.5 "/>
<text text-anchor="middle" x="297.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="136,-1934.5 459,-1934.5 "/>
<text text-anchor="middle" x="297.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="136,-1911.5 459,-1911.5 "/>
<text text-anchor="middle" x="297.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="136,-1888.5 459,-1888.5 "/>
<text text-anchor="middle" x="297.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="136,-1865.5 459,-1865.5 "/>
<text text-anchor="middle" x="297.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="136,-1842.5 459,-1842.5 "/>
<text text-anchor="middle" x="297.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="136,-1819.5 459,-1819.5 "/>
<text text-anchor="middle" x="297.5" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="136,-1796.5 459,-1796.5 "/>
<text text-anchor="middle" x="297.5" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="136,-1773.5 459,-1773.5 "/>
<text text-anchor="middle" x="297.5" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="136,-1750.5 459,-1750.5 "/>
<text text-anchor="middle" x="297.5" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="459,-1727.5 459,-2325.5 "/>
<text text-anchor="middle" x="469.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge37" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M480.2384,-2064.6912C491.4387,-2055.0507 498,-2042.3203 498,-2026.5 498,-2014.3876 494.1539,-2004.0864 487.3244,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="489.719,-1993.0385 480.2384,-1988.3088 484.7002,-1997.9183 489.719,-1993.0385"/>
<text text-anchor="middle" x="514" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge21" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M480.0054,-1765.6862C499.1024,-1751.4508 518.8332,-1738.3553 539,-1727 674.2813,-1650.827 846.3264,-1611.802 977.2043,-1591.9752"/>
<polygon fill="#000000" stroke="#000000" points="977.9728,-1595.3994 987.348,-1590.4643 976.9415,-1588.4758 977.9728,-1595.3994"/>
<text text-anchor="middle" x="652" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge4" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M3168.2056,-2344.2829C3169.3833,-2184.9364 3171,-1925.4254 3171,-1701.5 3171,-1701.5 3171,-1701.5 3171,-1313 3171,-1265.4611 3180.4136,-1241.7972 3146,-1209 3092.3932,-1157.9111 2898.2876,-1132.3213 2764.8359,-1120.4914"/>
<polygon fill="#000000" stroke="#000000" points="2764.7987,-1116.975 2754.5328,-1119.5947 2764.1917,-1123.9487 2764.7987,-1116.975"/>
<text text-anchor="middle" x="3198" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- image -->
<g id="node18" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M2786,-2836C2786,-2836 2822,-2836 2822,-2836 2828,-2836 2834,-2842 2834,-2848 2834,-2848 2834,-2860 2834,-2860 2834,-2866 2828,-2872 2822,-2872 2822,-2872 2786,-2872 2786,-2872 2780,-2872 2774,-2866 2774,-2860 2774,-2860 2774,-2848 2774,-2848 2774,-2842 2780,-2836 2786,-2836"/>
<text text-anchor="middle" x="2804" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge24" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M2798.7176,-2835.6392C2791.845,-2807.8387 2783.1197,-2754.3526 2805,-2717 2811.0505,-2706.671 2821.2303,-2699.016 2831.7117,-2693.4604"/>
<polygon fill="#000000" stroke="#000000" points="2833.3663,-2696.5495 2840.904,-2689.1041 2830.3685,-2690.2238 2833.3663,-2696.5495"/>
<text text-anchor="middle" x="2835.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge27" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2869,-2662.3257C2869,-2602.0681 2869,-2403.6328 2869,-2244.2865"/>
<polygon fill="#000000" stroke="#000000" points="2872.5001,-2243.849 2869,-2233.849 2865.5001,-2243.8491 2872.5001,-2243.849"/>
<text text-anchor="middle" x="2905.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- demographic -->
<g id="node20" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M2107,-1232.5C2107,-1232.5 2443,-1232.5 2443,-1232.5 2449,-1232.5 2455,-1238.5 2455,-1244.5 2455,-1244.5 2455,-1381.5 2455,-1381.5 2455,-1387.5 2449,-1393.5 2443,-1393.5 2443,-1393.5 2107,-1393.5 2107,-1393.5 2101,-1393.5 2095,-1387.5 2095,-1381.5 2095,-1381.5 2095,-1244.5 2095,-1244.5 2095,-1238.5 2101,-1232.5 2107,-1232.5"/>
<text text-anchor="middle" x="2150" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="2205,-1232.5 2205,-1393.5 "/>
<text text-anchor="middle" x="2215.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2226,-1232.5 2226,-1393.5 "/>
<text text-anchor="middle" x="2330" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2226,-1370.5 2434,-1370.5 "/>
<text text-anchor="middle" x="2330" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="2226,-1347.5 2434,-1347.5 "/>
<text text-anchor="middle" x="2330" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="2226,-1324.5 2434,-1324.5 "/>
<text text-anchor="middle" x="2330" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="2226,-1301.5 2434,-1301.5 "/>
<text text-anchor="middle" x="2330" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="2226,-1278.5 2434,-1278.5 "/>
<text text-anchor="middle" x="2330" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="2226,-1255.5 2434,-1255.5 "/>
<text text-anchor="middle" x="2330" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="2434,-1232.5 2434,-1393.5 "/>
<text text-anchor="middle" x="2444.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge7" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2418.0345,-1232.4932C2459.9554,-1208.898 2504.6212,-1183.7579 2542.3152,-1162.5419"/>
<polygon fill="#000000" stroke="#000000" points="2544.2437,-1165.4728 2551.2414,-1157.5177 2540.8102,-1159.3727 2544.2437,-1165.4728"/>
<text text-anchor="middle" x="2545" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge5" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1360.5131,-1477.6832C1531.2068,-1395.1259 1792.85,-1277.907 2032,-1209 2190.0717,-1163.4543 2378.059,-1137.2524 2501.1738,-1123.7073"/>
<polygon fill="#000000" stroke="#000000" points="2501.8382,-1127.1558 2511.401,-1122.5949 2501.0812,-1120.1969 2501.8382,-1127.1558"/>
<text text-anchor="middle" x="2059" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- vital_signs -->
<g id="node22" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1867.5,-1865.5C1867.5,-1865.5 2154.5,-1865.5 2154.5,-1865.5 2160.5,-1865.5 2166.5,-1871.5 2166.5,-1877.5 2166.5,-1877.5 2166.5,-2175.5 2166.5,-2175.5 2166.5,-2181.5 2160.5,-2187.5 2154.5,-2187.5 2154.5,-2187.5 1867.5,-2187.5 1867.5,-2187.5 1861.5,-2187.5 1855.5,-2181.5 1855.5,-2175.5 1855.5,-2175.5 1855.5,-1877.5 1855.5,-1877.5 1855.5,-1871.5 1861.5,-1865.5 1867.5,-1865.5"/>
<text text-anchor="middle" x="1902" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1948.5,-1865.5 1948.5,-2187.5 "/>
<text text-anchor="middle" x="1959" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1969.5,-1865.5 1969.5,-2187.5 "/>
<text text-anchor="middle" x="2057.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1969.5,-2164.5 2145.5,-2164.5 "/>
<text text-anchor="middle" x="2057.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1969.5,-2141.5 2145.5,-2141.5 "/>
<text text-anchor="middle" x="2057.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1969.5,-2118.5 2145.5,-2118.5 "/>
<text text-anchor="middle" x="2057.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1969.5,-2095.5 2145.5,-2095.5 "/>
<text text-anchor="middle" x="2057.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1969.5,-2072.5 2145.5,-2072.5 "/>
<text text-anchor="middle" x="2057.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1969.5,-2049.5 2145.5,-2049.5 "/>
<text text-anchor="middle" x="2057.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1969.5,-2026.5 2145.5,-2026.5 "/>
<text text-anchor="middle" x="2057.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1969.5,-2003.5 2145.5,-2003.5 "/>
<text text-anchor="middle" x="2057.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1969.5,-1980.5 2145.5,-1980.5 "/>
<text text-anchor="middle" x="2057.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1969.5,-1957.5 2145.5,-1957.5 "/>
<text text-anchor="middle" x="2057.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1969.5,-1934.5 2145.5,-1934.5 "/>
<text text-anchor="middle" x="2057.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1969.5,-1911.5 2145.5,-1911.5 "/>
<text text-anchor="middle" x="2057.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1969.5,-1888.5 2145.5,-1888.5 "/>
<text text-anchor="middle" x="2057.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="2145.5,-1865.5 2145.5,-2187.5 "/>
<text text-anchor="middle" x="2156" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge14" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2072.0039,-1865.3007C2107.9246,-1770.3823 2150.2169,-1658.6275 2170.6781,-1604.56"/>
<polygon fill="#000000" stroke="#000000" points="2173.9721,-1605.7443 2174.2381,-1595.1528 2167.4252,-1603.2667 2173.9721,-1605.7443"/>
<text text-anchor="middle" x="2161" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- physical_exam -->
<g id="node23" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M1509,-1934.5C1509,-1934.5 1825,-1934.5 1825,-1934.5 1831,-1934.5 1837,-1940.5 1837,-1946.5 1837,-1946.5 1837,-2106.5 1837,-2106.5 1837,-2112.5 1831,-2118.5 1825,-2118.5 1825,-2118.5 1509,-2118.5 1509,-2118.5 1503,-2118.5 1497,-2112.5 1497,-2106.5 1497,-2106.5 1497,-1946.5 1497,-1946.5 1497,-1940.5 1503,-1934.5 1509,-1934.5"/>
<text text-anchor="middle" x="1558" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1619,-1934.5 1619,-2118.5 "/>
<text text-anchor="middle" x="1629.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1640,-1934.5 1640,-2118.5 "/>
<text text-anchor="middle" x="1728" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1640,-2095.5 1816,-2095.5 "/>
<text text-anchor="middle" x="1728" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1640,-2072.5 1816,-2072.5 "/>
<text text-anchor="middle" x="1728" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1640,-2049.5 1816,-2049.5 "/>
<text text-anchor="middle" x="1728" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1640,-2026.5 1816,-2026.5 "/>
<text text-anchor="middle" x="1728" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1640,-2003.5 1816,-2003.5 "/>
<text text-anchor="middle" x="1728" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1640,-1980.5 1816,-1980.5 "/>
<text text-anchor="middle" x="1728" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1640,-1957.5 1816,-1957.5 "/>
<text text-anchor="middle" x="1728" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1816,-1934.5 1816,-2118.5 "/>
<text text-anchor="middle" x="1826.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge13" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1704.2758,-1934.3735C1734.4283,-1869.4225 1782.3318,-1784.1607 1846,-1727 1916.2816,-1663.9018 2016.6453,-1622.2278 2089.5542,-1598.1401"/>
<polygon fill="#000000" stroke="#000000" points="2090.7763,-1601.4232 2099.2033,-1595.0017 2088.6111,-1594.7664 2090.7763,-1601.4232"/>
<text text-anchor="middle" x="1914" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge20" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1628.5759,-1934.2383C1597.9395,-1869.6415 1549.7819,-1784.8716 1487,-1727 1452.9389,-1695.6028 1411.3332,-1669.1414 1369.719,-1647.4659"/>
<polygon fill="#000000" stroke="#000000" points="1371.0571,-1644.2188 1360.5615,-1642.7718 1367.8639,-1650.4481 1371.0571,-1644.2188"/>
<text text-anchor="middle" x="1516" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- principal_investigator -->
<g id="node24" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M3410.5,-403.5C3410.5,-403.5 3737.5,-403.5 3737.5,-403.5 3743.5,-403.5 3749.5,-409.5 3749.5,-415.5 3749.5,-415.5 3749.5,-460.5 3749.5,-460.5 3749.5,-466.5 3743.5,-472.5 3737.5,-472.5 3737.5,-472.5 3410.5,-472.5 3410.5,-472.5 3404.5,-472.5 3398.5,-466.5 3398.5,-460.5 3398.5,-460.5 3398.5,-415.5 3398.5,-415.5 3398.5,-409.5 3404.5,-403.5 3410.5,-403.5"/>
<text text-anchor="middle" x="3485.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="3572.5,-403.5 3572.5,-472.5 "/>
<text text-anchor="middle" x="3583" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3593.5,-403.5 3593.5,-472.5 "/>
<text text-anchor="middle" x="3661" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="3593.5,-449.5 3728.5,-449.5 "/>
<text text-anchor="middle" x="3661" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="3593.5,-426.5 3728.5,-426.5 "/>
<text text-anchor="middle" x="3661" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="3728.5,-403.5 3728.5,-472.5 "/>
<text text-anchor="middle" x="3739" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge30" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3481.7003,-403.3902C3450.8074,-392.2287 3416.0709,-380.1329 3384,-370 3319.7566,-349.702 3248.3356,-329.5667 3186.1559,-312.808"/>
<polygon fill="#000000" stroke="#000000" points="3186.824,-309.3635 3176.2582,-310.1478 3185.007,-316.1236 3186.824,-309.3635"/>
<text text-anchor="middle" x="3456.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge3" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2836.4321,-1819.4324C2798.8103,-1581.7413 2741.1345,-1222.5928 2734,-1209 2725.5421,-1192.8858 2713.4252,-1177.8767 2700.5033,-1164.6992"/>
<polygon fill="#000000" stroke="#000000" points="2702.8425,-1162.0906 2693.2598,-1157.5713 2697.9327,-1167.08 2702.8425,-1162.0906"/>
<text text-anchor="middle" x="2804" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge17" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2726.5252,-1819.2096C2698.719,-1786.1789 2668.1382,-1754.0355 2636,-1727 2537.4517,-1644.0985 2392.27,-1604.7698 2292.9934,-1586.6373"/>
<polygon fill="#000000" stroke="#000000" points="2293.3902,-1583.1529 2282.931,-1584.8432 2292.1614,-1590.0442 2293.3902,-1583.1529"/>
<text text-anchor="middle" x="2634" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge39" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M3092.5955,-2065.8333C3103.8572,-2056.0642 3110.5,-2042.9531 3110.5,-2026.5 3110.5,-2013.9031 3106.6061,-2003.2652 3099.7267,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="3102.0485,-1991.9513 3092.5955,-1987.1667 3097.0016,-1996.802 3102.0485,-1991.9513"/>
<text text-anchor="middle" x="3126.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- disease_extent -->
<g id="node26" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M2197,-1877C2197,-1877 2513,-1877 2513,-1877 2519,-1877 2525,-1883 2525,-1889 2525,-1889 2525,-2164 2525,-2164 2525,-2170 2519,-2176 2513,-2176 2513,-2176 2197,-2176 2197,-2176 2191,-2176 2185,-2170 2185,-2164 2185,-2164 2185,-1889 2185,-1889 2185,-1883 2191,-1877 2197,-1877"/>
<text text-anchor="middle" x="2246.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="2308,-1877 2308,-2176 "/>
<text text-anchor="middle" x="2318.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2329,-1877 2329,-2176 "/>
<text text-anchor="middle" x="2416.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="2329,-2153 2504,-2153 "/>
<text text-anchor="middle" x="2416.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2329,-2130 2504,-2130 "/>
<text text-anchor="middle" x="2416.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="2329,-2107 2504,-2107 "/>
<text text-anchor="middle" x="2416.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="2329,-2084 2504,-2084 "/>
<text text-anchor="middle" x="2416.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="2329,-2061 2504,-2061 "/>
<text text-anchor="middle" x="2416.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="2329,-2038 2504,-2038 "/>
<text text-anchor="middle" x="2416.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="2329,-2015 2504,-2015 "/>
<text text-anchor="middle" x="2416.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="2329,-1992 2504,-1992 "/>
<text text-anchor="middle" x="2416.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="2329,-1969 2504,-1969 "/>
<text text-anchor="middle" x="2416.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="2329,-1946 2504,-1946 "/>
<text text-anchor="middle" x="2416.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="2329,-1923 2504,-1923 "/>
<text text-anchor="middle" x="2416.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="2329,-1900 2504,-1900 "/>
<text text-anchor="middle" x="2416.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="2504,-1877 2504,-2176 "/>
<text text-anchor="middle" x="2514.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge18" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2298.3233,-1876.7352C2261.5728,-1779.624 2216.7065,-1661.0675 2195.3899,-1604.7396"/>
<polygon fill="#000000" stroke="#000000" points="2198.6247,-1603.3985 2191.8118,-1595.2846 2192.0778,-1605.8761 2198.6247,-1603.3985"/>
<text text-anchor="middle" x="2262" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge2" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2604.8448,-1278.3609C2609.9599,-1248.0465 2617.4873,-1203.4353 2623.4723,-1167.9659"/>
<polygon fill="#000000" stroke="#000000" points="2626.983,-1168.1949 2625.1957,-1157.7519 2620.0806,-1167.0301 2626.983,-1168.1949"/>
<text text-anchor="middle" x="2650" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
</g>
</svg>
</div>
