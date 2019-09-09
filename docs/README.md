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
<svg width="5453pt" height="2966pt"
 viewBox="0.00 0.00 5452.97 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 5448.9672,-2962 5448.9672,4 -4,4"/>
<!-- disease_extent -->
<g id="node1" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M2674.9672,-1877C2674.9672,-1877 2990.9672,-1877 2990.9672,-1877 2996.9672,-1877 3002.9672,-1883 3002.9672,-1889 3002.9672,-1889 3002.9672,-2164 3002.9672,-2164 3002.9672,-2170 2996.9672,-2176 2990.9672,-2176 2990.9672,-2176 2674.9672,-2176 2674.9672,-2176 2668.9672,-2176 2662.9672,-2170 2662.9672,-2164 2662.9672,-2164 2662.9672,-1889 2662.9672,-1889 2662.9672,-1883 2668.9672,-1877 2674.9672,-1877"/>
<text text-anchor="middle" x="2724.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="2785.9672,-1877 2785.9672,-2176 "/>
<text text-anchor="middle" x="2796.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2806.9672,-1877 2806.9672,-2176 "/>
<text text-anchor="middle" x="2894.4672" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="2806.9672,-2153 2981.9672,-2153 "/>
<text text-anchor="middle" x="2894.4672" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="2806.9672,-2130 2981.9672,-2130 "/>
<text text-anchor="middle" x="2894.4672" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="2806.9672,-2107 2981.9672,-2107 "/>
<text text-anchor="middle" x="2894.4672" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="2806.9672,-2084 2981.9672,-2084 "/>
<text text-anchor="middle" x="2894.4672" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="2806.9672,-2061 2981.9672,-2061 "/>
<text text-anchor="middle" x="2894.4672" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="2806.9672,-2038 2981.9672,-2038 "/>
<text text-anchor="middle" x="2894.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="2806.9672,-2015 2981.9672,-2015 "/>
<text text-anchor="middle" x="2894.4672" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="2806.9672,-1992 2981.9672,-1992 "/>
<text text-anchor="middle" x="2894.4672" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="2806.9672,-1969 2981.9672,-1969 "/>
<text text-anchor="middle" x="2894.4672" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="2806.9672,-1946 2981.9672,-1946 "/>
<text text-anchor="middle" x="2894.4672" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="2806.9672,-1923 2981.9672,-1923 "/>
<text text-anchor="middle" x="2894.4672" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="2806.9672,-1900 2981.9672,-1900 "/>
<text text-anchor="middle" x="2894.4672" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2981.9672,-1877 2981.9672,-2176 "/>
<text text-anchor="middle" x="2992.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit -->
<g id="node5" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M1582.4672,-1549C1582.4672,-1549 1757.4672,-1549 1757.4672,-1549 1763.4672,-1549 1769.4672,-1555 1769.4672,-1561 1769.4672,-1561 1769.4672,-1583 1769.4672,-1583 1769.4672,-1589 1763.4672,-1595 1757.4672,-1595 1757.4672,-1595 1582.4672,-1595 1582.4672,-1595 1576.4672,-1595 1570.4672,-1589 1570.4672,-1583 1570.4672,-1583 1570.4672,-1561 1570.4672,-1561 1570.4672,-1555 1576.4672,-1549 1582.4672,-1549"/>
<text text-anchor="middle" x="1593.9672" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="1617.4672,-1549 1617.4672,-1595 "/>
<text text-anchor="middle" x="1627.9672" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1638.4672,-1549 1638.4672,-1595 "/>
<text text-anchor="middle" x="1693.4672" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="1638.4672,-1572 1748.4672,-1572 "/>
<text text-anchor="middle" x="1693.4672" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="1748.4672,-1549 1748.4672,-1595 "/>
<text text-anchor="middle" x="1758.9672" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge40" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2776.9374,-1876.7161C2748.5371,-1820.941 2708.3103,-1762.6026 2653.9672,-1727 2601.4916,-1692.6209 2574.7215,-1724.6371 2513.9672,-1709 2496.3832,-1704.4742 2493.4995,-1698.7221 2475.9672,-1694 2232.0977,-1628.3172 1936.5586,-1594.9238 1779.8943,-1580.7202"/>
<polygon fill="#000000" stroke="#000000" points="1780.0508,-1577.2203 1769.778,-1579.8123 1779.425,-1584.1923 1780.0508,-1577.2203"/>
<text text-anchor="middle" x="2742.4672" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d103c00)</text>
</g>
<!-- program -->
<g id="node2" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M2630.9672,-.5C2630.9672,-.5 2938.9672,-.5 2938.9672,-.5 2944.9672,-.5 2950.9672,-6.5 2950.9672,-12.5 2950.9672,-12.5 2950.9672,-126.5 2950.9672,-126.5 2950.9672,-132.5 2944.9672,-138.5 2938.9672,-138.5 2938.9672,-138.5 2630.9672,-138.5 2630.9672,-138.5 2624.9672,-138.5 2618.9672,-132.5 2618.9672,-126.5 2618.9672,-126.5 2618.9672,-12.5 2618.9672,-12.5 2618.9672,-6.5 2624.9672,-.5 2630.9672,-.5"/>
<text text-anchor="middle" x="2657.9672" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="2696.9672,-.5 2696.9672,-138.5 "/>
<text text-anchor="middle" x="2707.4672" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2717.9672,-.5 2717.9672,-138.5 "/>
<text text-anchor="middle" x="2823.9672" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="2717.9672,-115.5 2929.9672,-115.5 "/>
<text text-anchor="middle" x="2823.9672" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="2717.9672,-92.5 2929.9672,-92.5 "/>
<text text-anchor="middle" x="2823.9672" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="2717.9672,-69.5 2929.9672,-69.5 "/>
<text text-anchor="middle" x="2823.9672" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="2717.9672,-46.5 2929.9672,-46.5 "/>
<text text-anchor="middle" x="2823.9672" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="2717.9672,-23.5 2929.9672,-23.5 "/>
<text text-anchor="middle" x="2823.9672" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="2929.9672,-.5 2929.9672,-138.5 "/>
<text text-anchor="middle" x="2940.4672" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node3" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M2644.9672,-190.5C2644.9672,-190.5 2924.9672,-190.5 2924.9672,-190.5 2930.9672,-190.5 2936.9672,-196.5 2936.9672,-202.5 2936.9672,-202.5 2936.9672,-339.5 2936.9672,-339.5 2936.9672,-345.5 2930.9672,-351.5 2924.9672,-351.5 2924.9672,-351.5 2644.9672,-351.5 2644.9672,-351.5 2638.9672,-351.5 2632.9672,-345.5 2632.9672,-339.5 2632.9672,-339.5 2632.9672,-202.5 2632.9672,-202.5 2632.9672,-196.5 2638.9672,-190.5 2644.9672,-190.5"/>
<text text-anchor="middle" x="2660.9672" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="2688.9672,-190.5 2688.9672,-351.5 "/>
<text text-anchor="middle" x="2699.4672" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2709.9672,-190.5 2709.9672,-351.5 "/>
<text text-anchor="middle" x="2812.9672" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="2709.9672,-328.5 2915.9672,-328.5 "/>
<text text-anchor="middle" x="2812.9672" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="2709.9672,-305.5 2915.9672,-305.5 "/>
<text text-anchor="middle" x="2812.9672" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="2709.9672,-282.5 2915.9672,-282.5 "/>
<text text-anchor="middle" x="2812.9672" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="2709.9672,-259.5 2915.9672,-259.5 "/>
<text text-anchor="middle" x="2812.9672" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="2709.9672,-236.5 2915.9672,-236.5 "/>
<text text-anchor="middle" x="2812.9672" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="2709.9672,-213.5 2915.9672,-213.5 "/>
<text text-anchor="middle" x="2812.9672" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="2915.9672,-190.5 2915.9672,-351.5 "/>
<text text-anchor="middle" x="2926.4672" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge8" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M2784.9672,-190.4932C2784.9672,-176.7786 2784.9672,-162.5421 2784.9672,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="2788.4673,-148.5183 2784.9672,-138.5184 2781.4673,-148.5184 2788.4673,-148.5183"/>
<text text-anchor="middle" x="3011.9672" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fb510)</text>
</g>
<!-- lab_exam -->
<g id="node4" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M1042.9672,-2008.5C1042.9672,-2008.5 1102.9672,-2008.5 1102.9672,-2008.5 1108.9672,-2008.5 1114.9672,-2014.5 1114.9672,-2020.5 1114.9672,-2020.5 1114.9672,-2032.5 1114.9672,-2032.5 1114.9672,-2038.5 1108.9672,-2044.5 1102.9672,-2044.5 1102.9672,-2044.5 1042.9672,-2044.5 1042.9672,-2044.5 1036.9672,-2044.5 1030.9672,-2038.5 1030.9672,-2032.5 1030.9672,-2032.5 1030.9672,-2020.5 1030.9672,-2020.5 1030.9672,-2014.5 1036.9672,-2008.5 1042.9672,-2008.5"/>
<text text-anchor="middle" x="1072.9672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge38" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1067.0612,-2008.2841C1050.4776,-1953.2892 1009.6687,-1787.0172 1088.9672,-1694 1148.8163,-1623.7969 1409.0571,-1592.1204 1560.1713,-1579.4172"/>
<polygon fill="#000000" stroke="#000000" points="1560.7332,-1582.8828 1570.4111,-1578.5714 1560.1569,-1575.9066 1560.7332,-1582.8828"/>
<text text-anchor="middle" x="1317.4672" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d103c00)</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge12" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1728.0048,-1595.0098C1759.1201,-1598.9199 1787.4672,-1591.25 1787.4672,-1572 1787.4672,-1554.8555 1764.9819,-1546.8964 1738.0817,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="1737.6677,-1544.6454 1728.0048,-1548.9902 1738.2681,-1551.6196 1737.6677,-1544.6454"/>
<text text-anchor="middle" x="2013.9672" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fdda0)</text>
</g>
<!-- cycle -->
<g id="node22" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1986.9672,-1278.5C1986.9672,-1278.5 2214.9672,-1278.5 2214.9672,-1278.5 2220.9672,-1278.5 2226.9672,-1284.5 2226.9672,-1290.5 2226.9672,-1290.5 2226.9672,-1335.5 2226.9672,-1335.5 2226.9672,-1341.5 2220.9672,-1347.5 2214.9672,-1347.5 2214.9672,-1347.5 1986.9672,-1347.5 1986.9672,-1347.5 1980.9672,-1347.5 1974.9672,-1341.5 1974.9672,-1335.5 1974.9672,-1335.5 1974.9672,-1290.5 1974.9672,-1290.5 1974.9672,-1284.5 1980.9672,-1278.5 1986.9672,-1278.5"/>
<text text-anchor="middle" x="2001.9672" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="2028.9672,-1278.5 2028.9672,-1347.5 "/>
<text text-anchor="middle" x="2039.4672" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2049.9672,-1278.5 2049.9672,-1347.5 "/>
<text text-anchor="middle" x="2127.9672" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="2049.9672,-1324.5 2205.9672,-1324.5 "/>
<text text-anchor="middle" x="2127.9672" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="2049.9672,-1301.5 2205.9672,-1301.5 "/>
<text text-anchor="middle" x="2127.9672" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="2205.9672,-1278.5 2205.9672,-1347.5 "/>
<text text-anchor="middle" x="2216.4672" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge4" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M1708.5948,-1548.7875C1782.2548,-1504.5232 1943.5669,-1407.5862 2034.7569,-1352.7876"/>
<polygon fill="#000000" stroke="#000000" points="2036.5889,-1355.7701 2043.3576,-1347.6192 2032.9833,-1349.7701 2036.5889,-1355.7701"/>
<text text-anchor="middle" x="2111.9672" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fb270)</text>
</g>
<!-- vital_signs -->
<g id="node6" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1409.4672,-1865.5C1409.4672,-1865.5 1696.4672,-1865.5 1696.4672,-1865.5 1702.4672,-1865.5 1708.4672,-1871.5 1708.4672,-1877.5 1708.4672,-1877.5 1708.4672,-2175.5 1708.4672,-2175.5 1708.4672,-2181.5 1702.4672,-2187.5 1696.4672,-2187.5 1696.4672,-2187.5 1409.4672,-2187.5 1409.4672,-2187.5 1403.4672,-2187.5 1397.4672,-2181.5 1397.4672,-2175.5 1397.4672,-2175.5 1397.4672,-1877.5 1397.4672,-1877.5 1397.4672,-1871.5 1403.4672,-1865.5 1409.4672,-1865.5"/>
<text text-anchor="middle" x="1443.9672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1490.4672,-1865.5 1490.4672,-2187.5 "/>
<text text-anchor="middle" x="1500.9672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1511.4672,-1865.5 1511.4672,-2187.5 "/>
<text text-anchor="middle" x="1599.4672" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1511.4672,-2164.5 1687.4672,-2164.5 "/>
<text text-anchor="middle" x="1599.4672" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1511.4672,-2141.5 1687.4672,-2141.5 "/>
<text text-anchor="middle" x="1599.4672" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1511.4672,-2118.5 1687.4672,-2118.5 "/>
<text text-anchor="middle" x="1599.4672" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1511.4672,-2095.5 1687.4672,-2095.5 "/>
<text text-anchor="middle" x="1599.4672" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1511.4672,-2072.5 1687.4672,-2072.5 "/>
<text text-anchor="middle" x="1599.4672" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1511.4672,-2049.5 1687.4672,-2049.5 "/>
<text text-anchor="middle" x="1599.4672" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1511.4672,-2026.5 1687.4672,-2026.5 "/>
<text text-anchor="middle" x="1599.4672" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1511.4672,-2003.5 1687.4672,-2003.5 "/>
<text text-anchor="middle" x="1599.4672" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1511.4672,-1980.5 1687.4672,-1980.5 "/>
<text text-anchor="middle" x="1599.4672" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1511.4672,-1957.5 1687.4672,-1957.5 "/>
<text text-anchor="middle" x="1599.4672" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1511.4672,-1934.5 1687.4672,-1934.5 "/>
<text text-anchor="middle" x="1599.4672" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="1511.4672,-1911.5 1687.4672,-1911.5 "/>
<text text-anchor="middle" x="1599.4672" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1511.4672,-1888.5 1687.4672,-1888.5 "/>
<text text-anchor="middle" x="1599.4672" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1687.4672,-1865.5 1687.4672,-2187.5 "/>
<text text-anchor="middle" x="1697.9672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge41" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1529.6496,-1865.4074C1527.6635,-1809.4041 1532.5771,-1747.3058 1553.9672,-1694 1569.0587,-1656.3905 1601.8319,-1623.7318 1628.7059,-1601.694"/>
<polygon fill="#000000" stroke="#000000" points="1631.2031,-1604.1787 1636.8306,-1595.202 1626.8334,-1598.7101 1631.2031,-1604.1787"/>
<text text-anchor="middle" x="1782.4672" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d103c00)</text>
</g>
<!-- study_arm -->
<g id="node7" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M1649.4672,-415C1649.4672,-415 2018.4672,-415 2018.4672,-415 2024.4672,-415 2030.4672,-421 2030.4672,-427 2030.4672,-427 2030.4672,-449 2030.4672,-449 2030.4672,-455 2024.4672,-461 2018.4672,-461 2018.4672,-461 1649.4672,-461 1649.4672,-461 1643.4672,-461 1637.4672,-455 1637.4672,-449 1637.4672,-449 1637.4672,-427 1637.4672,-427 1637.4672,-421 1643.4672,-415 1649.4672,-415"/>
<text text-anchor="middle" x="1683.4672" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="1729.4672,-415 1729.4672,-461 "/>
<text text-anchor="middle" x="1739.9672" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1750.4672,-415 1750.4672,-461 "/>
<text text-anchor="middle" x="1879.9672" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="1750.4672,-438 2009.4672,-438 "/>
<text text-anchor="middle" x="1879.9672" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="2009.4672,-415 2009.4672,-461 "/>
<text text-anchor="middle" x="2019.9672" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge7" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1827.2768,-414.9938C1824.5252,-400.2996 1824.1301,-381.8488 1834.9672,-370 1887.029,-313.078 2365.3187,-286.6004 2622.7133,-276.3829"/>
<polygon fill="#000000" stroke="#000000" points="2623.0548,-279.8723 2632.9096,-275.9821 2622.7798,-272.8777 2623.0548,-279.8723"/>
<text text-anchor="middle" x="2061.9672" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fb510)</text>
</g>
<!-- off_study -->
<g id="node8" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M2825.4672,-714.5C2825.4672,-714.5 3240.4672,-714.5 3240.4672,-714.5 3246.4672,-714.5 3252.4672,-720.5 3252.4672,-726.5 3252.4672,-726.5 3252.4672,-909.5 3252.4672,-909.5 3252.4672,-915.5 3246.4672,-921.5 3240.4672,-921.5 3240.4672,-921.5 2825.4672,-921.5 2825.4672,-921.5 2819.4672,-921.5 2813.4672,-915.5 2813.4672,-909.5 2813.4672,-909.5 2813.4672,-726.5 2813.4672,-726.5 2813.4672,-720.5 2819.4672,-714.5 2825.4672,-714.5"/>
<text text-anchor="middle" x="2854.9672" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="2896.4672,-714.5 2896.4672,-921.5 "/>
<text text-anchor="middle" x="2906.9672" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2917.4672,-714.5 2917.4672,-921.5 "/>
<text text-anchor="middle" x="3074.4672" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="2917.4672,-898.5 3231.4672,-898.5 "/>
<text text-anchor="middle" x="3074.4672" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2917.4672,-875.5 3231.4672,-875.5 "/>
<text text-anchor="middle" x="3074.4672" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="2917.4672,-852.5 3231.4672,-852.5 "/>
<text text-anchor="middle" x="3074.4672" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2917.4672,-829.5 3231.4672,-829.5 "/>
<text text-anchor="middle" x="3074.4672" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="2917.4672,-806.5 3231.4672,-806.5 "/>
<text text-anchor="middle" x="3074.4672" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="2917.4672,-783.5 3231.4672,-783.5 "/>
<text text-anchor="middle" x="3074.4672" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="2917.4672,-760.5 3231.4672,-760.5 "/>
<text text-anchor="middle" x="3074.4672" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2917.4672,-737.5 3231.4672,-737.5 "/>
<text text-anchor="middle" x="3074.4672" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="3231.4672,-714.5 3231.4672,-921.5 "/>
<text text-anchor="middle" x="3241.9672" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up -->
<g id="node9" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1533.9672,-1209.5C1533.9672,-1209.5 1865.9672,-1209.5 1865.9672,-1209.5 1871.9672,-1209.5 1877.9672,-1215.5 1877.9672,-1221.5 1877.9672,-1221.5 1877.9672,-1404.5 1877.9672,-1404.5 1877.9672,-1410.5 1871.9672,-1416.5 1865.9672,-1416.5 1865.9672,-1416.5 1533.9672,-1416.5 1533.9672,-1416.5 1527.9672,-1416.5 1521.9672,-1410.5 1521.9672,-1404.5 1521.9672,-1404.5 1521.9672,-1221.5 1521.9672,-1221.5 1521.9672,-1215.5 1527.9672,-1209.5 1533.9672,-1209.5"/>
<text text-anchor="middle" x="1564.4672" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="1606.9672,-1209.5 1606.9672,-1416.5 "/>
<text text-anchor="middle" x="1617.4672" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1627.9672,-1209.5 1627.9672,-1416.5 "/>
<text text-anchor="middle" x="1742.4672" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="1627.9672,-1393.5 1856.9672,-1393.5 "/>
<text text-anchor="middle" x="1742.4672" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="1627.9672,-1370.5 1856.9672,-1370.5 "/>
<text text-anchor="middle" x="1742.4672" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="1627.9672,-1347.5 1856.9672,-1347.5 "/>
<text text-anchor="middle" x="1742.4672" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="1627.9672,-1324.5 1856.9672,-1324.5 "/>
<text text-anchor="middle" x="1742.4672" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1627.9672,-1301.5 1856.9672,-1301.5 "/>
<text text-anchor="middle" x="1742.4672" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="1627.9672,-1278.5 1856.9672,-1278.5 "/>
<text text-anchor="middle" x="1742.4672" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1627.9672,-1255.5 1856.9672,-1255.5 "/>
<text text-anchor="middle" x="1742.4672" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="1627.9672,-1232.5 1856.9672,-1232.5 "/>
<text text-anchor="middle" x="1742.4672" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="1856.9672,-1209.5 1856.9672,-1416.5 "/>
<text text-anchor="middle" x="1867.4672" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node18" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M2193.4672,-1065.5C2193.4672,-1065.5 2412.4672,-1065.5 2412.4672,-1065.5 2418.4672,-1065.5 2424.4672,-1071.5 2424.4672,-1077.5 2424.4672,-1077.5 2424.4672,-1145.5 2424.4672,-1145.5 2424.4672,-1151.5 2418.4672,-1157.5 2412.4672,-1157.5 2412.4672,-1157.5 2193.4672,-1157.5 2193.4672,-1157.5 2187.4672,-1157.5 2181.4672,-1151.5 2181.4672,-1145.5 2181.4672,-1145.5 2181.4672,-1077.5 2181.4672,-1077.5 2181.4672,-1071.5 2187.4672,-1065.5 2193.4672,-1065.5"/>
<text text-anchor="middle" x="2205.9672" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="2230.4672,-1065.5 2230.4672,-1157.5 "/>
<text text-anchor="middle" x="2240.9672" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2251.4672,-1065.5 2251.4672,-1157.5 "/>
<text text-anchor="middle" x="2327.4672" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="2251.4672,-1134.5 2403.4672,-1134.5 "/>
<text text-anchor="middle" x="2327.4672" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="2251.4672,-1111.5 2403.4672,-1111.5 "/>
<text text-anchor="middle" x="2327.4672" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2251.4672,-1088.5 2403.4672,-1088.5 "/>
<text text-anchor="middle" x="2327.4672" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="2403.4672,-1065.5 2403.4672,-1157.5 "/>
<text text-anchor="middle" x="2413.9672" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge28" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1690.3975,-1209.4673C1693.514,-1197.0174 1699.0163,-1185.4067 1707.9672,-1176 1739.2741,-1143.0986 2005.3514,-1125.0527 2170.9157,-1116.9174"/>
<polygon fill="#000000" stroke="#000000" points="2171.3612,-1120.4 2181.1798,-1116.4193 2171.0219,-1113.4082 2171.3612,-1120.4"/>
<text text-anchor="middle" x="1936.4672" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d1083a8)</text>
</g>
<!-- off_treatment -->
<g id="node10" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1707.4672,-726C1707.4672,-726 2154.4672,-726 2154.4672,-726 2160.4672,-726 2166.4672,-732 2166.4672,-738 2166.4672,-738 2166.4672,-898 2166.4672,-898 2166.4672,-904 2160.4672,-910 2154.4672,-910 2154.4672,-910 1707.4672,-910 1707.4672,-910 1701.4672,-910 1695.4672,-904 1695.4672,-898 1695.4672,-898 1695.4672,-738 1695.4672,-738 1695.4672,-732 1701.4672,-726 1707.4672,-726"/>
<text text-anchor="middle" x="1752.9672" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1810.4672,-726 1810.4672,-910 "/>
<text text-anchor="middle" x="1820.9672" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1831.4672,-726 1831.4672,-910 "/>
<text text-anchor="middle" x="1988.4672" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1831.4672,-887 2145.4672,-887 "/>
<text text-anchor="middle" x="1988.4672" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1831.4672,-864 2145.4672,-864 "/>
<text text-anchor="middle" x="1988.4672" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1831.4672,-841 2145.4672,-841 "/>
<text text-anchor="middle" x="1988.4672" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1831.4672,-818 2145.4672,-818 "/>
<text text-anchor="middle" x="1988.4672" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1831.4672,-795 2145.4672,-795 "/>
<text text-anchor="middle" x="1988.4672" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1831.4672,-772 2145.4672,-772 "/>
<text text-anchor="middle" x="1988.4672" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1831.4672,-749 2145.4672,-749 "/>
<text text-anchor="middle" x="1988.4672" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="2145.4672,-726 2145.4672,-910 "/>
<text text-anchor="middle" x="2155.9672" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site -->
<g id="node11" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M2825.4672,-403.5C2825.4672,-403.5 3142.4672,-403.5 3142.4672,-403.5 3148.4672,-403.5 3154.4672,-409.5 3154.4672,-415.5 3154.4672,-415.5 3154.4672,-460.5 3154.4672,-460.5 3154.4672,-466.5 3148.4672,-472.5 3142.4672,-472.5 3142.4672,-472.5 2825.4672,-472.5 2825.4672,-472.5 2819.4672,-472.5 2813.4672,-466.5 2813.4672,-460.5 2813.4672,-460.5 2813.4672,-415.5 2813.4672,-415.5 2813.4672,-409.5 2819.4672,-403.5 2825.4672,-403.5"/>
<text text-anchor="middle" x="2858.4672" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="2903.4672,-403.5 2903.4672,-472.5 "/>
<text text-anchor="middle" x="2913.9672" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2924.4672,-403.5 2924.4672,-472.5 "/>
<text text-anchor="middle" x="3028.9672" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="2924.4672,-449.5 3133.4672,-449.5 "/>
<text text-anchor="middle" x="3028.9672" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2924.4672,-426.5 3133.4672,-426.5 "/>
<text text-anchor="middle" x="3028.9672" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="3133.4672,-403.5 3133.4672,-472.5 "/>
<text text-anchor="middle" x="3143.9672" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge32" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2942.7342,-403.3975C2926.925,-390.1304 2908.0856,-374.3205 2889.0229,-358.3231"/>
<polygon fill="#000000" stroke="#000000" points="2891.0482,-355.4537 2881.1382,-351.7063 2886.5484,-360.8157 2891.0482,-355.4537"/>
<text text-anchor="middle" x="3147.4672" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d10d568)</text>
</g>
<!-- file -->
<g id="node12" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M1353.4672,-2750.5C1353.4672,-2750.5 1538.4672,-2750.5 1538.4672,-2750.5 1544.4672,-2750.5 1550.4672,-2756.5 1550.4672,-2762.5 1550.4672,-2762.5 1550.4672,-2945.5 1550.4672,-2945.5 1550.4672,-2951.5 1544.4672,-2957.5 1538.4672,-2957.5 1538.4672,-2957.5 1353.4672,-2957.5 1353.4672,-2957.5 1347.4672,-2957.5 1341.4672,-2951.5 1341.4672,-2945.5 1341.4672,-2945.5 1341.4672,-2762.5 1341.4672,-2762.5 1341.4672,-2756.5 1347.4672,-2750.5 1353.4672,-2750.5"/>
<text text-anchor="middle" x="1360.9672" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="1380.4672,-2750.5 1380.4672,-2957.5 "/>
<text text-anchor="middle" x="1390.9672" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1401.4672,-2750.5 1401.4672,-2957.5 "/>
<text text-anchor="middle" x="1465.4672" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="1401.4672,-2934.5 1529.4672,-2934.5 "/>
<text text-anchor="middle" x="1465.4672" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="1401.4672,-2911.5 1529.4672,-2911.5 "/>
<text text-anchor="middle" x="1465.4672" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="1401.4672,-2888.5 1529.4672,-2888.5 "/>
<text text-anchor="middle" x="1465.4672" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="1401.4672,-2865.5 1529.4672,-2865.5 "/>
<text text-anchor="middle" x="1465.4672" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="1401.4672,-2842.5 1529.4672,-2842.5 "/>
<text text-anchor="middle" x="1465.4672" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="1401.4672,-2819.5 1529.4672,-2819.5 "/>
<text text-anchor="middle" x="1465.4672" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_locations</text>
<polyline fill="none" stroke="#000000" points="1401.4672,-2796.5 1529.4672,-2796.5 "/>
<text text-anchor="middle" x="1465.4672" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="1401.4672,-2773.5 1529.4672,-2773.5 "/>
<text text-anchor="middle" x="1465.4672" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="1529.4672,-2750.5 1529.4672,-2957.5 "/>
<text text-anchor="middle" x="1539.9672" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- sample -->
<g id="node16" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M1738.4672,-1819.5C1738.4672,-1819.5 2161.4672,-1819.5 2161.4672,-1819.5 2167.4672,-1819.5 2173.4672,-1825.5 2173.4672,-1831.5 2173.4672,-1831.5 2173.4672,-2221.5 2173.4672,-2221.5 2173.4672,-2227.5 2167.4672,-2233.5 2161.4672,-2233.5 2161.4672,-2233.5 1738.4672,-2233.5 1738.4672,-2233.5 1732.4672,-2233.5 1726.4672,-2227.5 1726.4672,-2221.5 1726.4672,-2221.5 1726.4672,-1831.5 1726.4672,-1831.5 1726.4672,-1825.5 1732.4672,-1819.5 1738.4672,-1819.5"/>
<text text-anchor="middle" x="1760.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="1794.4672,-1819.5 1794.4672,-2233.5 "/>
<text text-anchor="middle" x="1804.9672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1815.4672,-1819.5 1815.4672,-2233.5 "/>
<text text-anchor="middle" x="1983.9672" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-2210.5 2152.4672,-2210.5 "/>
<text text-anchor="middle" x="1983.9672" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-2187.5 2152.4672,-2187.5 "/>
<text text-anchor="middle" x="1983.9672" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-2164.5 2152.4672,-2164.5 "/>
<text text-anchor="middle" x="1983.9672" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-2141.5 2152.4672,-2141.5 "/>
<text text-anchor="middle" x="1983.9672" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-2118.5 2152.4672,-2118.5 "/>
<text text-anchor="middle" x="1983.9672" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-2095.5 2152.4672,-2095.5 "/>
<text text-anchor="middle" x="1983.9672" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-2072.5 2152.4672,-2072.5 "/>
<text text-anchor="middle" x="1983.9672" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-2049.5 2152.4672,-2049.5 "/>
<text text-anchor="middle" x="1983.9672" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-2026.5 2152.4672,-2026.5 "/>
<text text-anchor="middle" x="1983.9672" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-2003.5 2152.4672,-2003.5 "/>
<text text-anchor="middle" x="1983.9672" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-1980.5 2152.4672,-1980.5 "/>
<text text-anchor="middle" x="1983.9672" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-1957.5 2152.4672,-1957.5 "/>
<text text-anchor="middle" x="1983.9672" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-1934.5 2152.4672,-1934.5 "/>
<text text-anchor="middle" x="1983.9672" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-1911.5 2152.4672,-1911.5 "/>
<text text-anchor="middle" x="1983.9672" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-1888.5 2152.4672,-1888.5 "/>
<text text-anchor="middle" x="1983.9672" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-1865.5 2152.4672,-1865.5 "/>
<text text-anchor="middle" x="1983.9672" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1815.4672,-1842.5 2152.4672,-1842.5 "/>
<text text-anchor="middle" x="1983.9672" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="2152.4672,-1819.5 2152.4672,-2233.5 "/>
<text text-anchor="middle" x="2162.9672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge3" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1442.5515,-2750.461C1444.4848,-2721.1048 1449.4144,-2689.6318 1459.9672,-2662 1461.1753,-2658.8365 1641.8513,-2424.8546 1783.4362,-2241.7433"/>
<polygon fill="#000000" stroke="#000000" points="1786.3758,-2243.6633 1789.724,-2233.6114 1780.8382,-2239.3814 1786.3758,-2243.6633"/>
<text text-anchor="middle" x="1686.4672" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fb3c0)</text>
</g>
<!-- assay -->
<g id="node20" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1933.9672,-2662.5C1933.9672,-2662.5 1965.9672,-2662.5 1965.9672,-2662.5 1971.9672,-2662.5 1977.9672,-2668.5 1977.9672,-2674.5 1977.9672,-2674.5 1977.9672,-2686.5 1977.9672,-2686.5 1977.9672,-2692.5 1971.9672,-2698.5 1965.9672,-2698.5 1965.9672,-2698.5 1933.9672,-2698.5 1933.9672,-2698.5 1927.9672,-2698.5 1921.9672,-2692.5 1921.9672,-2686.5 1921.9672,-2686.5 1921.9672,-2674.5 1921.9672,-2674.5 1921.9672,-2668.5 1927.9672,-2662.5 1933.9672,-2662.5"/>
<text text-anchor="middle" x="1949.9672" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge19" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1466.0338,-2750.2479C1472.6394,-2737.3396 1481.3881,-2725.6589 1492.9672,-2717 1529.4852,-2689.6917 1858.3641,-2708.4804 1902.9672,-2699 1906.0001,-2698.3553 1909.0919,-2697.5358 1912.1683,-2696.6021"/>
<polygon fill="#000000" stroke="#000000" points="1913.5138,-2699.8414 1921.8518,-2693.3047 1911.2574,-2693.215 1913.5138,-2699.8414"/>
<text text-anchor="middle" x="1719.9672" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d105f50)</text>
</g>
<!-- diagnosis -->
<g id="node23" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M124.4672,-2344.5C124.4672,-2344.5 467.4672,-2344.5 467.4672,-2344.5 473.4672,-2344.5 479.4672,-2350.5 479.4672,-2356.5 479.4672,-2356.5 479.4672,-2631.5 479.4672,-2631.5 479.4672,-2637.5 473.4672,-2643.5 467.4672,-2643.5 467.4672,-2643.5 124.4672,-2643.5 124.4672,-2643.5 118.4672,-2643.5 112.4672,-2637.5 112.4672,-2631.5 112.4672,-2631.5 112.4672,-2356.5 112.4672,-2356.5 112.4672,-2350.5 118.4672,-2344.5 124.4672,-2344.5"/>
<text text-anchor="middle" x="154.4672" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="196.4672,-2344.5 196.4672,-2643.5 "/>
<text text-anchor="middle" x="206.9672" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="217.4672,-2344.5 217.4672,-2643.5 "/>
<text text-anchor="middle" x="337.9672" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="217.4672,-2620.5 458.4672,-2620.5 "/>
<text text-anchor="middle" x="337.9672" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="217.4672,-2597.5 458.4672,-2597.5 "/>
<text text-anchor="middle" x="337.9672" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="217.4672,-2574.5 458.4672,-2574.5 "/>
<text text-anchor="middle" x="337.9672" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="217.4672,-2551.5 458.4672,-2551.5 "/>
<text text-anchor="middle" x="337.9672" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="217.4672,-2528.5 458.4672,-2528.5 "/>
<text text-anchor="middle" x="337.9672" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="217.4672,-2505.5 458.4672,-2505.5 "/>
<text text-anchor="middle" x="337.9672" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="217.4672,-2482.5 458.4672,-2482.5 "/>
<text text-anchor="middle" x="337.9672" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="217.4672,-2459.5 458.4672,-2459.5 "/>
<text text-anchor="middle" x="337.9672" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="217.4672,-2436.5 458.4672,-2436.5 "/>
<text text-anchor="middle" x="337.9672" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="217.4672,-2413.5 458.4672,-2413.5 "/>
<text text-anchor="middle" x="337.9672" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="217.4672,-2390.5 458.4672,-2390.5 "/>
<text text-anchor="middle" x="337.9672" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="217.4672,-2367.5 458.4672,-2367.5 "/>
<text text-anchor="middle" x="337.9672" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="458.4672,-2344.5 458.4672,-2643.5 "/>
<text text-anchor="middle" x="468.9672" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge18" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M1341.4384,-2829.5839C1245.5274,-2806.5529 1099.8238,-2769.9797 974.9672,-2732 809.5362,-2681.6781 624.4788,-2616.1882 489.391,-2566.6478"/>
<polygon fill="#000000" stroke="#000000" points="490.3456,-2563.2699 479.752,-2563.1089 487.933,-2569.841 490.3456,-2563.2699"/>
<text text-anchor="middle" x="1203.4672" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0e8920)</text>
</g>
<!-- agent -->
<g id="node13" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M883.9672,-524.5C883.9672,-524.5 1109.9672,-524.5 1109.9672,-524.5 1115.9672,-524.5 1121.9672,-530.5 1121.9672,-536.5 1121.9672,-536.5 1121.9672,-558.5 1121.9672,-558.5 1121.9672,-564.5 1115.9672,-570.5 1109.9672,-570.5 1109.9672,-570.5 883.9672,-570.5 883.9672,-570.5 877.9672,-570.5 871.9672,-564.5 871.9672,-558.5 871.9672,-558.5 871.9672,-536.5 871.9672,-536.5 871.9672,-530.5 877.9672,-524.5 883.9672,-524.5"/>
<text text-anchor="middle" x="900.4672" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="928.9672,-524.5 928.9672,-570.5 "/>
<text text-anchor="middle" x="939.4672" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="949.9672,-524.5 949.9672,-570.5 "/>
<text text-anchor="middle" x="1025.4672" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="949.9672,-547.5 1100.9672,-547.5 "/>
<text text-anchor="middle" x="1025.4672" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="1100.9672,-524.5 1100.9672,-570.5 "/>
<text text-anchor="middle" x="1111.4672" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge1" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1122.3234,-527.059C1193.6477,-515.7417 1284.7006,-501.819 1365.9672,-491 1451.2756,-479.6429 1545.5427,-468.6658 1626.9829,-459.676"/>
<polygon fill="#000000" stroke="#000000" points="1627.8035,-463.1069 1637.3604,-458.5336 1627.0374,-456.149 1627.8035,-463.1069"/>
<text text-anchor="middle" x="1594.4672" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d156070)</text>
</g>
<!-- enrollment -->
<g id="node14" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M3792.4672,-1468.5C3792.4672,-1468.5 4141.4672,-1468.5 4141.4672,-1468.5 4147.4672,-1468.5 4153.4672,-1474.5 4153.4672,-1480.5 4153.4672,-1480.5 4153.4672,-1663.5 4153.4672,-1663.5 4153.4672,-1669.5 4147.4672,-1675.5 4141.4672,-1675.5 4141.4672,-1675.5 3792.4672,-1675.5 3792.4672,-1675.5 3786.4672,-1675.5 3780.4672,-1669.5 3780.4672,-1663.5 3780.4672,-1663.5 3780.4672,-1480.5 3780.4672,-1480.5 3780.4672,-1474.5 3786.4672,-1468.5 3792.4672,-1468.5"/>
<text text-anchor="middle" x="3827.9672" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="3875.4672,-1468.5 3875.4672,-1675.5 "/>
<text text-anchor="middle" x="3885.9672" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3896.4672,-1468.5 3896.4672,-1675.5 "/>
<text text-anchor="middle" x="4014.4672" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="3896.4672,-1652.5 4132.4672,-1652.5 "/>
<text text-anchor="middle" x="4014.4672" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="3896.4672,-1629.5 4132.4672,-1629.5 "/>
<text text-anchor="middle" x="4014.4672" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="3896.4672,-1606.5 4132.4672,-1606.5 "/>
<text text-anchor="middle" x="4014.4672" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="3896.4672,-1583.5 4132.4672,-1583.5 "/>
<text text-anchor="middle" x="4014.4672" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="3896.4672,-1560.5 4132.4672,-1560.5 "/>
<text text-anchor="middle" x="4014.4672" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="3896.4672,-1537.5 4132.4672,-1537.5 "/>
<text text-anchor="middle" x="4014.4672" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="3896.4672,-1514.5 4132.4672,-1514.5 "/>
<text text-anchor="middle" x="4014.4672" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="3896.4672,-1491.5 4132.4672,-1491.5 "/>
<text text-anchor="middle" x="4014.4672" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="4132.4672,-1468.5 4132.4672,-1675.5 "/>
<text text-anchor="middle" x="4142.9672" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge24" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M3945.2924,-1468.2647C3940.1588,-1456.3545 3933.8122,-1444.9386 3925.9672,-1435 3783.706,-1254.7758 3698.9879,-1241.6499 3478.9672,-1176 3381.1784,-1146.8218 2720.7638,-1123.9276 2434.6788,-1115.2603"/>
<polygon fill="#000000" stroke="#000000" points="2434.7624,-1111.7613 2424.6613,-1114.958 2434.5512,-1118.7581 2434.7624,-1111.7613"/>
<text text-anchor="middle" x="4135.4672" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d1083a8)</text>
</g>
<!-- image -->
<g id="node15" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1937.9672,-2836C1937.9672,-2836 1973.9672,-2836 1973.9672,-2836 1979.9672,-2836 1985.9672,-2842 1985.9672,-2848 1985.9672,-2848 1985.9672,-2860 1985.9672,-2860 1985.9672,-2866 1979.9672,-2872 1973.9672,-2872 1973.9672,-2872 1937.9672,-2872 1937.9672,-2872 1931.9672,-2872 1925.9672,-2866 1925.9672,-2860 1925.9672,-2860 1925.9672,-2848 1925.9672,-2848 1925.9672,-2842 1931.9672,-2836 1937.9672,-2836"/>
<text text-anchor="middle" x="1955.9672" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge20" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1955.3364,-2835.7604C1954.2921,-2805.5622 1952.1961,-2744.9545 1950.9543,-2709.0457"/>
<polygon fill="#000000" stroke="#000000" points="1954.4421,-2708.6286 1950.5985,-2698.7556 1947.4463,-2708.8706 1954.4421,-2708.6286"/>
<text text-anchor="middle" x="2177.9672" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d105f50)</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge36" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2036.012,-1819.4695C2041.7744,-1775.1673 2036.8199,-1730.7068 2010.9672,-1694 1983.442,-1654.9185 1868.3187,-1619.2235 1779.3644,-1596.679"/>
<polygon fill="#000000" stroke="#000000" points="1780.0278,-1593.237 1769.4768,-1594.1995 1778.3251,-1600.0268 1780.0278,-1593.237"/>
<text text-anchor="middle" x="2243.4672" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d103c00)</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge13" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M2173.5627,-2065.8333C2184.8243,-2056.0642 2191.4672,-2042.9531 2191.4672,-2026.5 2191.4672,-2013.9031 2187.5733,-2003.2652 2180.6938,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="2183.0157,-1991.9513 2173.5627,-1987.1667 2177.9688,-1996.802 2183.0157,-1991.9513"/>
<text text-anchor="middle" x="2417.9672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fdda0)</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge29" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2173.7874,-1905.3666C2308.6802,-1839.0351 2486.314,-1763.1559 2653.9672,-1727 2697.2609,-1717.6633 3420.0056,-1740.6687 3450.9672,-1709 3549.265,-1608.457 3230.9887,-1247.5901 3109.9672,-1176 3053.4042,-1142.5403 2648.7433,-1123.5436 2434.81,-1115.7364"/>
<polygon fill="#000000" stroke="#000000" points="2434.8891,-1112.237 2424.769,-1115.373 2434.6359,-1119.2324 2434.8891,-1112.237"/>
<text text-anchor="middle" x="3601.4672" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d1083a8)</text>
</g>
<!-- demographic -->
<g id="node17" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M2491.9672,-1232.5C2491.9672,-1232.5 2827.9672,-1232.5 2827.9672,-1232.5 2833.9672,-1232.5 2839.9672,-1238.5 2839.9672,-1244.5 2839.9672,-1244.5 2839.9672,-1381.5 2839.9672,-1381.5 2839.9672,-1387.5 2833.9672,-1393.5 2827.9672,-1393.5 2827.9672,-1393.5 2491.9672,-1393.5 2491.9672,-1393.5 2485.9672,-1393.5 2479.9672,-1387.5 2479.9672,-1381.5 2479.9672,-1381.5 2479.9672,-1244.5 2479.9672,-1244.5 2479.9672,-1238.5 2485.9672,-1232.5 2491.9672,-1232.5"/>
<text text-anchor="middle" x="2534.9672" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="2589.9672,-1232.5 2589.9672,-1393.5 "/>
<text text-anchor="middle" x="2600.4672" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2610.9672,-1232.5 2610.9672,-1393.5 "/>
<text text-anchor="middle" x="2714.9672" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="2610.9672,-1370.5 2818.9672,-1370.5 "/>
<text text-anchor="middle" x="2714.9672" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="2610.9672,-1347.5 2818.9672,-1347.5 "/>
<text text-anchor="middle" x="2714.9672" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="2610.9672,-1324.5 2818.9672,-1324.5 "/>
<text text-anchor="middle" x="2714.9672" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="2610.9672,-1301.5 2818.9672,-1301.5 "/>
<text text-anchor="middle" x="2714.9672" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="2610.9672,-1278.5 2818.9672,-1278.5 "/>
<text text-anchor="middle" x="2714.9672" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2610.9672,-1255.5 2818.9672,-1255.5 "/>
<text text-anchor="middle" x="2714.9672" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="2818.9672,-1232.5 2818.9672,-1393.5 "/>
<text text-anchor="middle" x="2829.4672" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge25" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2662.9355,-1232.3865C2659.7688,-1211.6897 2652.5552,-1191.0472 2637.9672,-1176 2609.798,-1146.9442 2516.2436,-1130.5295 2435.1374,-1121.5395"/>
<polygon fill="#000000" stroke="#000000" points="2435.1225,-1118.0177 2424.8051,-1120.4263 2434.3726,-1124.9775 2435.1225,-1118.0177"/>
<text text-anchor="middle" x="2877.4672" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d1083a8)</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge9" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2424.6053,-1101.3893C2544.6365,-1088.7483 2716.4612,-1062.6011 2760.9672,-1014 2820.2374,-949.2762 2784.9672,-905.7617 2784.9672,-818 2784.9672,-818 2784.9672,-818 2784.9672,-438 2784.9672,-413.2823 2784.9672,-386.5067 2784.9672,-361.7851"/>
<polygon fill="#000000" stroke="#000000" points="2788.4673,-361.6946 2784.9672,-351.6946 2781.4673,-361.6947 2788.4673,-361.6946"/>
<text text-anchor="middle" x="3011.9672" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fb510)</text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge34" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M2424.5683,-1104.5255C2549.651,-1095.7951 2734.9598,-1078.0737 2798.9672,-1047 2855.5229,-1019.5438 2906.8878,-973.0675 2946.9907,-929.1308"/>
<polygon fill="#000000" stroke="#000000" points="2949.7415,-931.3066 2953.8365,-921.5351 2944.5417,-926.6202 2949.7415,-931.3066"/>
<text text-anchor="middle" x="3049.9672" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d10daa8)</text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge17" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M2181.4585,-1103.0651C2049.6038,-1092.6486 1854.7043,-1073.063 1831.9672,-1047 1799.9344,-1010.2816 1815.1742,-961.6109 1842.3246,-918.584"/>
<polygon fill="#000000" stroke="#000000" points="1845.3561,-920.3432 1847.903,-910.0591 1839.4987,-916.5103 1845.3561,-920.3432"/>
<text text-anchor="middle" x="2060.4672" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d1055c0)</text>
</g>
<!-- adverse_event -->
<g id="node19" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M799.4672,-622.5C799.4672,-622.5 1194.4672,-622.5 1194.4672,-622.5 1200.4672,-622.5 1206.4672,-628.5 1206.4672,-634.5 1206.4672,-634.5 1206.4672,-1001.5 1206.4672,-1001.5 1206.4672,-1007.5 1200.4672,-1013.5 1194.4672,-1013.5 1194.4672,-1013.5 799.4672,-1013.5 799.4672,-1013.5 793.4672,-1013.5 787.4672,-1007.5 787.4672,-1001.5 787.4672,-1001.5 787.4672,-634.5 787.4672,-634.5 787.4672,-628.5 793.4672,-622.5 799.4672,-622.5"/>
<text text-anchor="middle" x="847.4672" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="907.4672,-622.5 907.4672,-1013.5 "/>
<text text-anchor="middle" x="917.9672" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="928.4672,-622.5 928.4672,-1013.5 "/>
<text text-anchor="middle" x="1056.9672" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="928.4672,-990.5 1185.4672,-990.5 "/>
<text text-anchor="middle" x="1056.9672" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="928.4672,-967.5 1185.4672,-967.5 "/>
<text text-anchor="middle" x="1056.9672" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="928.4672,-944.5 1185.4672,-944.5 "/>
<text text-anchor="middle" x="1056.9672" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="928.4672,-921.5 1185.4672,-921.5 "/>
<text text-anchor="middle" x="1056.9672" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="928.4672,-898.5 1185.4672,-898.5 "/>
<text text-anchor="middle" x="1056.9672" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="928.4672,-875.5 1185.4672,-875.5 "/>
<text text-anchor="middle" x="1056.9672" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="928.4672,-852.5 1185.4672,-852.5 "/>
<text text-anchor="middle" x="1056.9672" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="928.4672,-829.5 1185.4672,-829.5 "/>
<text text-anchor="middle" x="1056.9672" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="928.4672,-806.5 1185.4672,-806.5 "/>
<text text-anchor="middle" x="1056.9672" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="928.4672,-783.5 1185.4672,-783.5 "/>
<text text-anchor="middle" x="1056.9672" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="928.4672,-760.5 1185.4672,-760.5 "/>
<text text-anchor="middle" x="1056.9672" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="928.4672,-737.5 1185.4672,-737.5 "/>
<text text-anchor="middle" x="1056.9672" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="928.4672,-714.5 1185.4672,-714.5 "/>
<text text-anchor="middle" x="1056.9672" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="928.4672,-691.5 1185.4672,-691.5 "/>
<text text-anchor="middle" x="1056.9672" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="928.4672,-668.5 1185.4672,-668.5 "/>
<text text-anchor="middle" x="1056.9672" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="928.4672,-645.5 1185.4672,-645.5 "/>
<text text-anchor="middle" x="1056.9672" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="1185.4672,-622.5 1185.4672,-1013.5 "/>
<text text-anchor="middle" x="1195.9672" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge11" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2181.2199,-1110.3579C1963.1884,-1107.1152 1515.0362,-1094.6769 1366.9672,-1047 1315.3498,-1030.3797 1263.5886,-1005.0752 1215.8226,-977.2633"/>
<polygon fill="#000000" stroke="#000000" points="1217.3446,-974.0979 1206.9511,-972.0426 1213.7943,-980.1308 1217.3446,-974.0979"/>
<text text-anchor="middle" x="1593.4672" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d102cf0)</text>
</g>
<!-- cohort -->
<g id="node26" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M2186.4672,-524.5C2186.4672,-524.5 2419.4672,-524.5 2419.4672,-524.5 2425.4672,-524.5 2431.4672,-530.5 2431.4672,-536.5 2431.4672,-536.5 2431.4672,-558.5 2431.4672,-558.5 2431.4672,-564.5 2425.4672,-570.5 2419.4672,-570.5 2419.4672,-570.5 2186.4672,-570.5 2186.4672,-570.5 2180.4672,-570.5 2174.4672,-564.5 2174.4672,-558.5 2174.4672,-558.5 2174.4672,-536.5 2174.4672,-536.5 2174.4672,-530.5 2180.4672,-524.5 2186.4672,-524.5"/>
<text text-anchor="middle" x="2205.9672" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="2237.4672,-524.5 2237.4672,-570.5 "/>
<text text-anchor="middle" x="2247.9672" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2258.4672,-524.5 2258.4672,-570.5 "/>
<text text-anchor="middle" x="2334.4672" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="2258.4672,-547.5 2410.4672,-547.5 "/>
<text text-anchor="middle" x="2334.4672" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="2410.4672,-524.5 2410.4672,-570.5 "/>
<text text-anchor="middle" x="2420.9672" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge5" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M2302.9672,-1065.3455C2302.9672,-954.7849 2302.9672,-676.8458 2302.9672,-580.7793"/>
<polygon fill="#000000" stroke="#000000" points="2306.4673,-580.7606 2302.9672,-570.7606 2299.4673,-580.7607 2306.4673,-580.7606"/>
<text text-anchor="middle" x="2529.9672" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fb510)</text>
</g>
<!-- adverse_event&#45;&gt;visit -->
<g id="edge39" class="edge">
<title>adverse_event&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1107.8512,-1013.6017C1145.2856,-1073.049 1189.4643,-1136.9073 1235.9672,-1191 1363.355,-1339.1792 1548.3278,-1482.5661 1629.3687,-1542.5713"/>
<polygon fill="#000000" stroke="#000000" points="1627.6805,-1545.6752 1637.8057,-1548.7947 1631.8358,-1540.0419 1627.6805,-1545.6752"/>
<text text-anchor="middle" x="1464.4672" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d103c00)</text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge31" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M996.9672,-622.4901C996.9672,-606.8636 996.9672,-592.5861 996.9672,-580.7798"/>
<polygon fill="#000000" stroke="#000000" points="1000.4673,-580.664 996.9672,-570.6641 993.4673,-580.6641 1000.4673,-580.664"/>
<text text-anchor="middle" x="1225.4672" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d10c218)</text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge16" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1206.6717,-845.2761C1217.8432,-838.5862 1224.4672,-829.4941 1224.4672,-818 1224.4672,-809.7386 1221.0452,-802.7181 1214.9723,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="1216.7744,-793.9155 1206.6717,-790.7239 1212.5791,-799.519 1216.7744,-793.9155"/>
<text text-anchor="middle" x="1450.9672" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fdda0)</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge2" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1949.9672,-2662.3257C1949.9672,-2602.0681 1949.9672,-2403.6328 1949.9672,-2244.2865"/>
<polygon fill="#000000" stroke="#000000" points="1953.4673,-2243.849 1949.9672,-2233.849 1946.4673,-2243.8491 1953.4673,-2243.849"/>
<text text-anchor="middle" x="2176.4672" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fb3c0)</text>
</g>
<!-- physical_exam -->
<g id="node21" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M3185.9672,-1934.5C3185.9672,-1934.5 3501.9672,-1934.5 3501.9672,-1934.5 3507.9672,-1934.5 3513.9672,-1940.5 3513.9672,-1946.5 3513.9672,-1946.5 3513.9672,-2106.5 3513.9672,-2106.5 3513.9672,-2112.5 3507.9672,-2118.5 3501.9672,-2118.5 3501.9672,-2118.5 3185.9672,-2118.5 3185.9672,-2118.5 3179.9672,-2118.5 3173.9672,-2112.5 3173.9672,-2106.5 3173.9672,-2106.5 3173.9672,-1946.5 3173.9672,-1946.5 3173.9672,-1940.5 3179.9672,-1934.5 3185.9672,-1934.5"/>
<text text-anchor="middle" x="3234.9672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="3295.9672,-1934.5 3295.9672,-2118.5 "/>
<text text-anchor="middle" x="3306.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3316.9672,-1934.5 3316.9672,-2118.5 "/>
<text text-anchor="middle" x="3404.9672" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="3316.9672,-2095.5 3492.9672,-2095.5 "/>
<text text-anchor="middle" x="3404.9672" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="3316.9672,-2072.5 3492.9672,-2072.5 "/>
<text text-anchor="middle" x="3404.9672" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="3316.9672,-2049.5 3492.9672,-2049.5 "/>
<text text-anchor="middle" x="3404.9672" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="3316.9672,-2026.5 3492.9672,-2026.5 "/>
<text text-anchor="middle" x="3404.9672" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="3316.9672,-2003.5 3492.9672,-2003.5 "/>
<text text-anchor="middle" x="3404.9672" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="3316.9672,-1980.5 3492.9672,-1980.5 "/>
<text text-anchor="middle" x="3404.9672" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="3316.9672,-1957.5 3492.9672,-1957.5 "/>
<text text-anchor="middle" x="3404.9672" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="3492.9672,-1934.5 3492.9672,-2118.5 "/>
<text text-anchor="middle" x="3503.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge37" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M3272.4641,-1934.1387C3204.5899,-1854.3658 3094.7537,-1744.2482 2970.9672,-1694 2755.9117,-1606.7034 2053.4726,-1581.0159 1780.1664,-1574.2211"/>
<polygon fill="#000000" stroke="#000000" points="1779.9209,-1570.7142 1769.8382,-1573.9683 1779.7495,-1577.7121 1779.9209,-1570.7142"/>
<text text-anchor="middle" x="3223.4672" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d103c00)</text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge23" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M3362.7426,-1934.1525C3382.8263,-1858.8127 3422.1531,-1755.1717 3494.9672,-1694 3537.5069,-1658.262 3660.5536,-1627.093 3770.3444,-1605.2061"/>
<polygon fill="#000000" stroke="#000000" points="3771.1144,-1608.6217 3780.2464,-1603.2499 3769.7576,-1601.7544 3771.1144,-1608.6217"/>
<text text-anchor="middle" x="3723.4672" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d1079e8)</text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge27" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2114.6242,-1278.4758C2127.9132,-1248.4023 2150.5472,-1205.1628 2180.9672,-1176 2185.5071,-1171.6477 2190.3987,-1167.5099 2195.5221,-1163.5882"/>
<polygon fill="#000000" stroke="#000000" points="2197.72,-1166.3174 2203.7468,-1157.6037 2193.6015,-1160.6571 2197.72,-1166.3174"/>
<text text-anchor="middle" x="2409.4672" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d1083a8)</text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge26" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M198.836,-2344.326C72.105,-2128.2005 -111.2219,-1726.3808 88.9672,-1468 407.1913,-1057.2732 707.6965,-1256.7232 1220.9672,-1176 1400.3105,-1147.7943 1923.9727,-1125.4652 2171.0369,-1116.1774"/>
<polygon fill="#000000" stroke="#000000" points="2171.2878,-1119.6706 2181.1498,-1115.7987 2171.0258,-1112.6755 2171.2878,-1119.6706"/>
<text text-anchor="middle" x="317.4672" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d1083a8)</text>
</g>
<!-- prior_therapy -->
<g id="node24" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M3646.9672,-1727.5C3646.9672,-1727.5 4102.9672,-1727.5 4102.9672,-1727.5 4108.9672,-1727.5 4114.9672,-1733.5 4114.9672,-1739.5 4114.9672,-1739.5 4114.9672,-2313.5 4114.9672,-2313.5 4114.9672,-2319.5 4108.9672,-2325.5 4102.9672,-2325.5 4102.9672,-2325.5 3646.9672,-2325.5 3646.9672,-2325.5 3640.9672,-2325.5 3634.9672,-2319.5 3634.9672,-2313.5 3634.9672,-2313.5 3634.9672,-1739.5 3634.9672,-1739.5 3634.9672,-1733.5 3640.9672,-1727.5 3646.9672,-1727.5"/>
<text text-anchor="middle" x="3692.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="3749.9672,-1727.5 3749.9672,-2325.5 "/>
<text text-anchor="middle" x="3760.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3770.9672,-1727.5 3770.9672,-2325.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2302.5 4093.9672,-2302.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2279.5 4093.9672,-2279.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2256.5 4093.9672,-2256.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2233.5 4093.9672,-2233.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2210.5 4093.9672,-2210.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2187.5 4093.9672,-2187.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2164.5 4093.9672,-2164.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2141.5 4093.9672,-2141.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2118.5 4093.9672,-2118.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2095.5 4093.9672,-2095.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2072.5 4093.9672,-2072.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2049.5 4093.9672,-2049.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2026.5 4093.9672,-2026.5 "/>
<text text-anchor="middle" x="3932.4672" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-2003.5 4093.9672,-2003.5 "/>
<text text-anchor="middle" x="3932.4672" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-1980.5 4093.9672,-1980.5 "/>
<text text-anchor="middle" x="3932.4672" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-1957.5 4093.9672,-1957.5 "/>
<text text-anchor="middle" x="3932.4672" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-1934.5 4093.9672,-1934.5 "/>
<text text-anchor="middle" x="3932.4672" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-1911.5 4093.9672,-1911.5 "/>
<text text-anchor="middle" x="3932.4672" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-1888.5 4093.9672,-1888.5 "/>
<text text-anchor="middle" x="3932.4672" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-1865.5 4093.9672,-1865.5 "/>
<text text-anchor="middle" x="3932.4672" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-1842.5 4093.9672,-1842.5 "/>
<text text-anchor="middle" x="3932.4672" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-1819.5 4093.9672,-1819.5 "/>
<text text-anchor="middle" x="3932.4672" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-1796.5 4093.9672,-1796.5 "/>
<text text-anchor="middle" x="3932.4672" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-1773.5 4093.9672,-1773.5 "/>
<text text-anchor="middle" x="3932.4672" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="3770.9672,-1750.5 4093.9672,-1750.5 "/>
<text text-anchor="middle" x="3932.4672" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="4093.9672,-1727.5 4093.9672,-2325.5 "/>
<text text-anchor="middle" x="4104.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge21" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M3952.7858,-1727.2416C3953.9003,-1721.1179 3954.963,-1715.0323 3955.9672,-1709 3957.2207,-1701.4699 3958.3327,-1693.6823 3959.319,-1685.8191"/>
<polygon fill="#000000" stroke="#000000" points="3962.8012,-1686.1747 3960.5022,-1675.8323 3955.8499,-1685.351 3962.8012,-1686.1747"/>
<text text-anchor="middle" x="4186.4672" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d1079e8)</text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge14" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M4115.2056,-2064.6912C4126.4059,-2055.0507 4132.9672,-2042.3203 4132.9672,-2026.5 4132.9672,-2014.3876 4129.1211,-2004.0864 4122.2916,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="4124.6861,-1993.0385 4115.2056,-1988.3088 4119.6674,-1997.9183 4124.6861,-1993.0385"/>
<text text-anchor="middle" x="4359.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fdda0)</text>
</g>
<!-- principal_investigator -->
<g id="node25" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M3242.4672,-403.5C3242.4672,-403.5 3569.4672,-403.5 3569.4672,-403.5 3575.4672,-403.5 3581.4672,-409.5 3581.4672,-415.5 3581.4672,-415.5 3581.4672,-460.5 3581.4672,-460.5 3581.4672,-466.5 3575.4672,-472.5 3569.4672,-472.5 3569.4672,-472.5 3242.4672,-472.5 3242.4672,-472.5 3236.4672,-472.5 3230.4672,-466.5 3230.4672,-460.5 3230.4672,-460.5 3230.4672,-415.5 3230.4672,-415.5 3230.4672,-409.5 3236.4672,-403.5 3242.4672,-403.5"/>
<text text-anchor="middle" x="3317.4672" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="3404.4672,-403.5 3404.4672,-472.5 "/>
<text text-anchor="middle" x="3414.9672" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="3425.4672,-403.5 3425.4672,-472.5 "/>
<text text-anchor="middle" x="3492.9672" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="3425.4672,-449.5 3560.4672,-449.5 "/>
<text text-anchor="middle" x="3492.9672" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="3425.4672,-426.5 3560.4672,-426.5 "/>
<text text-anchor="middle" x="3492.9672" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="3560.4672,-403.5 3560.4672,-472.5 "/>
<text text-anchor="middle" x="3570.9672" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge33" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M3400.1177,-403.3475C3396.344,-391.1011 3390.1447,-378.3187 3379.9672,-370 3315.2566,-317.1083 3099.9221,-291.6858 2946.9546,-280.0403"/>
<polygon fill="#000000" stroke="#000000" points="2947.2047,-276.5494 2936.9713,-279.2931 2946.6821,-283.5298 2947.2047,-276.5494"/>
<text text-anchor="middle" x="3620.4672" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d10d568)</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge10" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2297.9701,-524.4895C2292.6163,-493.2027 2288.3563,-437.2288 2316.9672,-403 2356.5945,-355.5916 2503.9262,-319.2405 2622.831,-296.8025"/>
<polygon fill="#000000" stroke="#000000" points="2623.6011,-300.2193 2632.7887,-294.9432 2622.3162,-293.3382 2623.6011,-300.2193"/>
<text text-anchor="middle" x="2543.9672" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fb510)</text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge6" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2174.1998,-544.7764C2043.6765,-540.659 1857.7447,-530.5222 1834.9672,-506 1826.4297,-496.8086 1824.8067,-483.5332 1825.8293,-471.1473"/>
<polygon fill="#000000" stroke="#000000" points="1829.3212,-471.4451 1827.2169,-461.0614 1822.3866,-470.491 1829.3212,-471.4451"/>
<text text-anchor="middle" x="2061.9672" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fb510)</text>
</g>
<!-- agent_administration -->
<g id="node27" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M341.4672,-1785C341.4672,-1785 810.4672,-1785 810.4672,-1785 816.4672,-1785 822.4672,-1791 822.4672,-1797 822.4672,-1797 822.4672,-2256 822.4672,-2256 822.4672,-2262 816.4672,-2268 810.4672,-2268 810.4672,-2268 341.4672,-2268 341.4672,-2268 335.4672,-2268 329.4672,-2262 329.4672,-2256 329.4672,-2256 329.4672,-1797 329.4672,-1797 329.4672,-1791 335.4672,-1785 341.4672,-1785"/>
<text text-anchor="middle" x="414.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="499.4672,-1785 499.4672,-2268 "/>
<text text-anchor="middle" x="509.9672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="520.4672,-1785 520.4672,-2268 "/>
<text text-anchor="middle" x="660.9672" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="520.4672,-2245 801.4672,-2245 "/>
<text text-anchor="middle" x="660.9672" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="520.4672,-2222 801.4672,-2222 "/>
<text text-anchor="middle" x="660.9672" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="520.4672,-2199 801.4672,-2199 "/>
<text text-anchor="middle" x="660.9672" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="520.4672,-2176 801.4672,-2176 "/>
<text text-anchor="middle" x="660.9672" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="520.4672,-2153 801.4672,-2153 "/>
<text text-anchor="middle" x="660.9672" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="520.4672,-2130 801.4672,-2130 "/>
<text text-anchor="middle" x="660.9672" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="520.4672,-2107 801.4672,-2107 "/>
<text text-anchor="middle" x="660.9672" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="520.4672,-2084 801.4672,-2084 "/>
<text text-anchor="middle" x="660.9672" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="520.4672,-2061 801.4672,-2061 "/>
<text text-anchor="middle" x="660.9672" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="520.4672,-2038 801.4672,-2038 "/>
<text text-anchor="middle" x="660.9672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="520.4672,-2015 801.4672,-2015 "/>
<text text-anchor="middle" x="660.9672" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="520.4672,-1992 801.4672,-1992 "/>
<text text-anchor="middle" x="660.9672" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="520.4672,-1969 801.4672,-1969 "/>
<text text-anchor="middle" x="660.9672" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="520.4672,-1946 801.4672,-1946 "/>
<text text-anchor="middle" x="660.9672" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="520.4672,-1923 801.4672,-1923 "/>
<text text-anchor="middle" x="660.9672" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="520.4672,-1900 801.4672,-1900 "/>
<text text-anchor="middle" x="660.9672" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="520.4672,-1877 801.4672,-1877 "/>
<text text-anchor="middle" x="660.9672" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="520.4672,-1854 801.4672,-1854 "/>
<text text-anchor="middle" x="660.9672" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="520.4672,-1831 801.4672,-1831 "/>
<text text-anchor="middle" x="660.9672" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="520.4672,-1808 801.4672,-1808 "/>
<text text-anchor="middle" x="660.9672" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="801.4672,-1785 801.4672,-2268 "/>
<text text-anchor="middle" x="811.9672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge35" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M568.1548,-1784.6806C577.2823,-1750.6552 592.8459,-1718.8664 617.9672,-1694 684.1342,-1628.5042 1304.1291,-1590.278 1560.1691,-1577.1696"/>
<polygon fill="#000000" stroke="#000000" points="1560.4246,-1580.6613 1570.2339,-1576.6577 1560.0689,-1573.6703 1560.4246,-1580.6613"/>
<text text-anchor="middle" x="846.4672" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d103c00)</text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge30" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M564.297,-1784.7846C561.8364,-1716.0419 559.9672,-1641.0857 559.9672,-1572 559.9672,-1572 559.9672,-1572 559.9672,-818 559.9672,-674.0795 733.4509,-604.1337 861.8046,-572.0788"/>
<polygon fill="#000000" stroke="#000000" points="862.8576,-575.4246 871.7405,-569.6501 861.1954,-568.6248 862.8576,-575.4246"/>
<text text-anchor="middle" x="788.4672" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d10c218)</text>
</g>
<!-- prior_surgery -->
<g id="node28" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M4615.9672,-1946C4615.9672,-1946 4961.9672,-1946 4961.9672,-1946 4967.9672,-1946 4973.9672,-1952 4973.9672,-1958 4973.9672,-1958 4973.9672,-2095 4973.9672,-2095 4973.9672,-2101 4967.9672,-2107 4961.9672,-2107 4961.9672,-2107 4615.9672,-2107 4615.9672,-2107 4609.9672,-2107 4603.9672,-2101 4603.9672,-2095 4603.9672,-2095 4603.9672,-1958 4603.9672,-1958 4603.9672,-1952 4609.9672,-1946 4615.9672,-1946"/>
<text text-anchor="middle" x="4661.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="4718.9672,-1946 4718.9672,-2107 "/>
<text text-anchor="middle" x="4729.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="4739.9672,-1946 4739.9672,-2107 "/>
<text text-anchor="middle" x="4846.4672" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="4739.9672,-2084 4952.9672,-2084 "/>
<text text-anchor="middle" x="4846.4672" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="4739.9672,-2061 4952.9672,-2061 "/>
<text text-anchor="middle" x="4846.4672" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="4739.9672,-2038 4952.9672,-2038 "/>
<text text-anchor="middle" x="4846.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="4739.9672,-2015 4952.9672,-2015 "/>
<text text-anchor="middle" x="4846.4672" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="4739.9672,-1992 4952.9672,-1992 "/>
<text text-anchor="middle" x="4846.4672" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="4739.9672,-1969 4952.9672,-1969 "/>
<text text-anchor="middle" x="4846.4672" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="4952.9672,-1946 4952.9672,-2107 "/>
<text text-anchor="middle" x="4963.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge22" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M4757.0558,-1945.7628C4725.8523,-1877.2917 4671.7886,-1781.7268 4594.9672,-1727 4526.165,-1677.986 4321.3375,-1633.0489 4164.1265,-1604.3248"/>
<polygon fill="#000000" stroke="#000000" points="4164.3067,-1600.8003 4153.8421,-1602.4564 4163.0554,-1607.6876 4164.3067,-1600.8003"/>
<text text-anchor="middle" x="4787.4672" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d1079e8)</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge15" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M4974.0802,-2068.5585C4985.2579,-2058.5547 4991.9672,-2044.5352 4991.9672,-2026.5 4991.9672,-2012.5509 4987.9537,-2001.004 4980.9634,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="4983.4478,-1989.3911 4974.0802,-1984.4415 4978.3165,-1994.1525 4983.4478,-1989.3911"/>
<text text-anchor="middle" x="5218.4672" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">ICDC::MakeModel::Model::EdgeType=HASH(0x55fd5d0fdda0)</text>
</g>
</g>
</svg>
</div>
