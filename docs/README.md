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
<svg width="3242pt" height="2966pt"
 viewBox="0.00 0.00 3241.93 2966.00" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<g id="graph0" class="graph" transform="scale(1 1) rotate(0) translate(4 2962)">
<title>Perl</title>
<polygon fill="#ffffff" stroke="transparent" points="-4,4 -4,-2962 3237.9305,-2962 3237.9305,4 -4,4"/>
<!-- program -->
<g id="node1" class="node">
<title>program</title>
<path fill="none" stroke="#000000" d="M1786,-.5C1786,-.5 2094,-.5 2094,-.5 2100,-.5 2106,-6.5 2106,-12.5 2106,-12.5 2106,-126.5 2106,-126.5 2106,-132.5 2100,-138.5 2094,-138.5 2094,-138.5 1786,-138.5 1786,-138.5 1780,-138.5 1774,-132.5 1774,-126.5 1774,-126.5 1774,-12.5 1774,-12.5 1774,-6.5 1780,-.5 1786,-.5"/>
<text text-anchor="middle" x="1813" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000">program</text>
<polyline fill="none" stroke="#000000" points="1852,-.5 1852,-138.5 "/>
<text text-anchor="middle" x="1862.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1873,-.5 1873,-138.5 "/>
<text text-anchor="middle" x="1979" y="-123.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_sort_order</text>
<polyline fill="none" stroke="#000000" points="1873,-115.5 2085,-115.5 "/>
<text text-anchor="middle" x="1979" y="-100.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_acronym</text>
<polyline fill="none" stroke="#000000" points="1873,-92.5 2085,-92.5 "/>
<text text-anchor="middle" x="1979" y="-77.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_short_description</text>
<polyline fill="none" stroke="#000000" points="1873,-69.5 2085,-69.5 "/>
<text text-anchor="middle" x="1979" y="-54.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_external_url</text>
<polyline fill="none" stroke="#000000" points="1873,-46.5 2085,-46.5 "/>
<text text-anchor="middle" x="1979" y="-31.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_full_description</text>
<polyline fill="none" stroke="#000000" points="1873,-23.5 2085,-23.5 "/>
<text text-anchor="middle" x="1979" y="-8.3" font-family="Times,serif" font-size="14.00" fill="#000000">program_name</text>
<polyline fill="none" stroke="#000000" points="2085,-.5 2085,-138.5 "/>
<text text-anchor="middle" x="2095.5" y="-65.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study -->
<g id="node2" class="node">
<title>study</title>
<path fill="none" stroke="#000000" d="M1800,-190.5C1800,-190.5 2080,-190.5 2080,-190.5 2086,-190.5 2092,-196.5 2092,-202.5 2092,-202.5 2092,-339.5 2092,-339.5 2092,-345.5 2086,-351.5 2080,-351.5 2080,-351.5 1800,-351.5 1800,-351.5 1794,-351.5 1788,-345.5 1788,-339.5 1788,-339.5 1788,-202.5 1788,-202.5 1788,-196.5 1794,-190.5 1800,-190.5"/>
<text text-anchor="middle" x="1816" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">study</text>
<polyline fill="none" stroke="#000000" points="1844,-190.5 1844,-351.5 "/>
<text text-anchor="middle" x="1854.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1865,-190.5 1865,-351.5 "/>
<text text-anchor="middle" x="1968" y="-336.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_description</text>
<polyline fill="none" stroke="#000000" points="1865,-328.5 2071,-328.5 "/>
<text text-anchor="middle" x="1968" y="-313.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_iacuc_approval</text>
<polyline fill="none" stroke="#000000" points="1865,-305.5 2071,-305.5 "/>
<text text-anchor="middle" x="1968" y="-290.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_name</text>
<polyline fill="none" stroke="#000000" points="1865,-282.5 2071,-282.5 "/>
<text text-anchor="middle" x="1968" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_designation</text>
<polyline fill="none" stroke="#000000" points="1865,-259.5 2071,-259.5 "/>
<text text-anchor="middle" x="1968" y="-244.3" font-family="Times,serif" font-size="14.00" fill="#000000">dates_of_conduct</text>
<polyline fill="none" stroke="#000000" points="1865,-236.5 2071,-236.5 "/>
<text text-anchor="middle" x="1968" y="-221.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_type</text>
<polyline fill="none" stroke="#000000" points="1865,-213.5 2071,-213.5 "/>
<text text-anchor="middle" x="1968" y="-198.3" font-family="Times,serif" font-size="14.00" fill="#000000">clinical_study_id</text>
<polyline fill="none" stroke="#000000" points="2071,-190.5 2071,-351.5 "/>
<text text-anchor="middle" x="2081.5" y="-267.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study&#45;&gt;program -->
<g id="edge39" class="edge">
<title>study&#45;&gt;program</title>
<path fill="none" stroke="#000000" d="M1940,-190.4932C1940,-176.7786 1940,-162.5421 1940,-148.8576"/>
<polygon fill="#000000" stroke="#000000" points="1943.5001,-148.5183 1940,-138.5184 1936.5001,-148.5184 1943.5001,-148.5183"/>
<text text-anchor="middle" x="1980.5" y="-160.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- enrollment -->
<g id="node3" class="node">
<title>enrollment</title>
<path fill="none" stroke="#000000" d="M747.5,-1468.5C747.5,-1468.5 1096.5,-1468.5 1096.5,-1468.5 1102.5,-1468.5 1108.5,-1474.5 1108.5,-1480.5 1108.5,-1480.5 1108.5,-1663.5 1108.5,-1663.5 1108.5,-1669.5 1102.5,-1675.5 1096.5,-1675.5 1096.5,-1675.5 747.5,-1675.5 747.5,-1675.5 741.5,-1675.5 735.5,-1669.5 735.5,-1663.5 735.5,-1663.5 735.5,-1480.5 735.5,-1480.5 735.5,-1474.5 741.5,-1468.5 747.5,-1468.5"/>
<text text-anchor="middle" x="783" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment</text>
<polyline fill="none" stroke="#000000" points="830.5,-1468.5 830.5,-1675.5 "/>
<text text-anchor="middle" x="841" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="851.5,-1468.5 851.5,-1675.5 "/>
<text text-anchor="middle" x="969.5" y="-1660.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_informed_consent</text>
<polyline fill="none" stroke="#000000" points="851.5,-1652.5 1087.5,-1652.5 "/>
<text text-anchor="middle" x="969.5" y="-1637.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_subgroup</text>
<polyline fill="none" stroke="#000000" points="851.5,-1629.5 1087.5,-1629.5 "/>
<text text-anchor="middle" x="969.5" y="-1614.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="851.5,-1606.5 1087.5,-1606.5 "/>
<text text-anchor="middle" x="969.5" y="-1591.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="851.5,-1583.5 1087.5,-1583.5 "/>
<text text-anchor="middle" x="969.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="851.5,-1560.5 1087.5,-1560.5 "/>
<text text-anchor="middle" x="969.5" y="-1545.3" font-family="Times,serif" font-size="14.00" fill="#000000">initials</text>
<polyline fill="none" stroke="#000000" points="851.5,-1537.5 1087.5,-1537.5 "/>
<text text-anchor="middle" x="969.5" y="-1522.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_registration</text>
<polyline fill="none" stroke="#000000" points="851.5,-1514.5 1087.5,-1514.5 "/>
<text text-anchor="middle" x="969.5" y="-1499.3" font-family="Times,serif" font-size="14.00" fill="#000000">enrollment_document_number</text>
<polyline fill="none" stroke="#000000" points="851.5,-1491.5 1087.5,-1491.5 "/>
<text text-anchor="middle" x="969.5" y="-1476.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1087.5,-1468.5 1087.5,-1675.5 "/>
<text text-anchor="middle" x="1098" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case -->
<g id="node22" class="node">
<title>case</title>
<path fill="none" stroke="#000000" d="M1560.5,-1065.5C1560.5,-1065.5 1779.5,-1065.5 1779.5,-1065.5 1785.5,-1065.5 1791.5,-1071.5 1791.5,-1077.5 1791.5,-1077.5 1791.5,-1145.5 1791.5,-1145.5 1791.5,-1151.5 1785.5,-1157.5 1779.5,-1157.5 1779.5,-1157.5 1560.5,-1157.5 1560.5,-1157.5 1554.5,-1157.5 1548.5,-1151.5 1548.5,-1145.5 1548.5,-1145.5 1548.5,-1077.5 1548.5,-1077.5 1548.5,-1071.5 1554.5,-1065.5 1560.5,-1065.5"/>
<text text-anchor="middle" x="1573" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000">case</text>
<polyline fill="none" stroke="#000000" points="1597.5,-1065.5 1597.5,-1157.5 "/>
<text text-anchor="middle" x="1608" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1618.5,-1065.5 1618.5,-1157.5 "/>
<text text-anchor="middle" x="1694.5" y="-1142.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1618.5,-1134.5 1770.5,-1134.5 "/>
<text text-anchor="middle" x="1694.5" y="-1119.3" font-family="Times,serif" font-size="14.00" fill="#000000">case_id</text>
<polyline fill="none" stroke="#000000" points="1618.5,-1111.5 1770.5,-1111.5 "/>
<text text-anchor="middle" x="1694.5" y="-1096.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_first_name</text>
<polyline fill="none" stroke="#000000" points="1618.5,-1088.5 1770.5,-1088.5 "/>
<text text-anchor="middle" x="1694.5" y="-1073.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_id</text>
<polyline fill="none" stroke="#000000" points="1770.5,-1065.5 1770.5,-1157.5 "/>
<text text-anchor="middle" x="1781" y="-1107.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- enrollment&#45;&gt;case -->
<g id="edge9" class="edge">
<title>enrollment&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1108.6992,-1543.0738C1254.4013,-1516.6702 1440.6083,-1473.2189 1493,-1417 1557.2383,-1348.0691 1483.0181,-1288.2393 1534,-1209 1545.0772,-1191.7832 1560.361,-1176.657 1576.6963,-1163.7751"/>
<polygon fill="#000000" stroke="#000000" points="1578.9386,-1166.4672 1584.7861,-1157.6322 1574.7053,-1160.8923 1578.9386,-1166.4672"/>
<text text-anchor="middle" x="1561" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- demographic -->
<g id="node4" class="node">
<title>demographic</title>
<path fill="none" stroke="#000000" d="M1912,-1232.5C1912,-1232.5 2248,-1232.5 2248,-1232.5 2254,-1232.5 2260,-1238.5 2260,-1244.5 2260,-1244.5 2260,-1381.5 2260,-1381.5 2260,-1387.5 2254,-1393.5 2248,-1393.5 2248,-1393.5 1912,-1393.5 1912,-1393.5 1906,-1393.5 1900,-1387.5 1900,-1381.5 1900,-1381.5 1900,-1244.5 1900,-1244.5 1900,-1238.5 1906,-1232.5 1912,-1232.5"/>
<text text-anchor="middle" x="1955" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">demographic</text>
<polyline fill="none" stroke="#000000" points="2010,-1232.5 2010,-1393.5 "/>
<text text-anchor="middle" x="2020.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2031,-1232.5 2031,-1393.5 "/>
<text text-anchor="middle" x="2135" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">neutered_indicator</text>
<polyline fill="none" stroke="#000000" points="2031,-1370.5 2239,-1370.5 "/>
<text text-anchor="middle" x="2135" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_age_at_enrollment</text>
<polyline fill="none" stroke="#000000" points="2031,-1347.5 2239,-1347.5 "/>
<text text-anchor="middle" x="2135" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_birth</text>
<polyline fill="none" stroke="#000000" points="2031,-1324.5 2239,-1324.5 "/>
<text text-anchor="middle" x="2135" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">weight</text>
<polyline fill="none" stroke="#000000" points="2031,-1301.5 2239,-1301.5 "/>
<text text-anchor="middle" x="2135" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2031,-1278.5 2239,-1278.5 "/>
<text text-anchor="middle" x="2135" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">breed</text>
<polyline fill="none" stroke="#000000" points="2031,-1255.5 2239,-1255.5 "/>
<text text-anchor="middle" x="2135" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">sex</text>
<polyline fill="none" stroke="#000000" points="2239,-1232.5 2239,-1393.5 "/>
<text text-anchor="middle" x="2249.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- demographic&#45;&gt;case -->
<g id="edge10" class="edge">
<title>demographic&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1936.7379,-1232.4632C1921.3956,-1224.35 1905.9392,-1216.388 1891,-1209 1858.272,-1192.8147 1822.2434,-1176.3612 1788.9446,-1161.694"/>
<polygon fill="#000000" stroke="#000000" points="1790.1936,-1158.4199 1779.63,-1157.6061 1787.3805,-1164.8298 1790.1936,-1158.4199"/>
<text text-anchor="middle" x="1877" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent_administration -->
<g id="node5" class="node">
<title>agent_administration</title>
<path fill="none" stroke="#000000" d="M2661.5,-1785C2661.5,-1785 3130.5,-1785 3130.5,-1785 3136.5,-1785 3142.5,-1791 3142.5,-1797 3142.5,-1797 3142.5,-2256 3142.5,-2256 3142.5,-2262 3136.5,-2268 3130.5,-2268 3130.5,-2268 2661.5,-2268 2661.5,-2268 2655.5,-2268 2649.5,-2262 2649.5,-2256 2649.5,-2256 2649.5,-1797 2649.5,-1797 2649.5,-1791 2655.5,-1785 2661.5,-1785"/>
<text text-anchor="middle" x="2734.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent_administration</text>
<polyline fill="none" stroke="#000000" points="2819.5,-1785 2819.5,-2268 "/>
<text text-anchor="middle" x="2830" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2840.5,-1785 2840.5,-2268 "/>
<text text-anchor="middle" x="2981" y="-2252.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2840.5,-2245 3121.5,-2245 "/>
<text text-anchor="middle" x="2981" y="-2229.8" font-family="Times,serif" font-size="14.00" fill="#000000">start_time</text>
<polyline fill="none" stroke="#000000" points="2840.5,-2222 3121.5,-2222 "/>
<text text-anchor="middle" x="2981" y="-2206.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_lot_number</text>
<polyline fill="none" stroke="#000000" points="2840.5,-2199 3121.5,-2199 "/>
<text text-anchor="middle" x="2981" y="-2183.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2840.5,-2176 3121.5,-2176 "/>
<text text-anchor="middle" x="2981" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2840.5,-2153 3121.5,-2153 "/>
<text text-anchor="middle" x="2981" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_duration</text>
<polyline fill="none" stroke="#000000" points="2840.5,-2130 3121.5,-2130 "/>
<text text-anchor="middle" x="2981" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2840.5,-2107 3121.5,-2107 "/>
<text text-anchor="middle" x="2981" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_vial_id</text>
<polyline fill="none" stroke="#000000" points="2840.5,-2084 3121.5,-2084 "/>
<text text-anchor="middle" x="2981" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="2840.5,-2061 3121.5,-2061 "/>
<text text-anchor="middle" x="2981" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="2840.5,-2038 3121.5,-2038 "/>
<text text-anchor="middle" x="2981" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">stop_time</text>
<polyline fill="none" stroke="#000000" points="2840.5,-2015 3121.5,-2015 "/>
<text text-anchor="middle" x="2981" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">missed_dose_amount</text>
<polyline fill="none" stroke="#000000" points="2840.5,-1992 3121.5,-1992 "/>
<text text-anchor="middle" x="2981" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2840.5,-1969 3121.5,-1969 "/>
<text text-anchor="middle" x="2981" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_actual_dose</text>
<polyline fill="none" stroke="#000000" points="2840.5,-1946 3121.5,-1946 "/>
<text text-anchor="middle" x="2981" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">route_of_administration</text>
<polyline fill="none" stroke="#000000" points="2840.5,-1923 3121.5,-1923 "/>
<text text-anchor="middle" x="2981" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_missed_dose</text>
<polyline fill="none" stroke="#000000" points="2840.5,-1900 3121.5,-1900 "/>
<text text-anchor="middle" x="2981" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_course_number</text>
<polyline fill="none" stroke="#000000" points="2840.5,-1877 3121.5,-1877 "/>
<text text-anchor="middle" x="2981" y="-1861.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2840.5,-1854 3121.5,-1854 "/>
<text text-anchor="middle" x="2981" y="-1838.8" font-family="Times,serif" font-size="14.00" fill="#000000">medication_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2840.5,-1831 3121.5,-1831 "/>
<text text-anchor="middle" x="2981" y="-1815.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="2840.5,-1808 3121.5,-1808 "/>
<text text-anchor="middle" x="2981" y="-1792.8" font-family="Times,serif" font-size="14.00" fill="#000000">dose_level</text>
<polyline fill="none" stroke="#000000" points="3121.5,-1785 3121.5,-2268 "/>
<text text-anchor="middle" x="3132" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit -->
<g id="node15" class="node">
<title>visit</title>
<path fill="none" stroke="#000000" d="M2035.5,-1549C2035.5,-1549 2210.5,-1549 2210.5,-1549 2216.5,-1549 2222.5,-1555 2222.5,-1561 2222.5,-1561 2222.5,-1583 2222.5,-1583 2222.5,-1589 2216.5,-1595 2210.5,-1595 2210.5,-1595 2035.5,-1595 2035.5,-1595 2029.5,-1595 2023.5,-1589 2023.5,-1583 2023.5,-1583 2023.5,-1561 2023.5,-1561 2023.5,-1555 2029.5,-1549 2035.5,-1549"/>
<text text-anchor="middle" x="2047" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">visit</text>
<polyline fill="none" stroke="#000000" points="2070.5,-1549 2070.5,-1595 "/>
<text text-anchor="middle" x="2081" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2091.5,-1549 2091.5,-1595 "/>
<text text-anchor="middle" x="2146.5" y="-1579.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_number</text>
<polyline fill="none" stroke="#000000" points="2091.5,-1572 2201.5,-1572 "/>
<text text-anchor="middle" x="2146.5" y="-1556.8" font-family="Times,serif" font-size="14.00" fill="#000000">visit_date</text>
<polyline fill="none" stroke="#000000" points="2201.5,-1549 2201.5,-1595 "/>
<text text-anchor="middle" x="2212" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;visit -->
<g id="edge15" class="edge">
<title>agent_administration&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2712.3561,-1784.6638C2689.6035,-1763.2809 2665.3611,-1743.5222 2640,-1727 2514.1858,-1645.0349 2343.3045,-1604.9504 2233.0753,-1586.4314"/>
<polygon fill="#000000" stroke="#000000" points="2233.3684,-1582.9326 2222.9323,-1584.7595 2232.2298,-1589.8394 2233.3684,-1582.9326"/>
<text text-anchor="middle" x="2630" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- agent -->
<g id="node19" class="node">
<title>agent</title>
<path fill="none" stroke="#000000" d="M2581,-524.5C2581,-524.5 2807,-524.5 2807,-524.5 2813,-524.5 2819,-530.5 2819,-536.5 2819,-536.5 2819,-558.5 2819,-558.5 2819,-564.5 2813,-570.5 2807,-570.5 2807,-570.5 2581,-570.5 2581,-570.5 2575,-570.5 2569,-564.5 2569,-558.5 2569,-558.5 2569,-536.5 2569,-536.5 2569,-530.5 2575,-524.5 2581,-524.5"/>
<text text-anchor="middle" x="2597.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">agent</text>
<polyline fill="none" stroke="#000000" points="2626,-524.5 2626,-570.5 "/>
<text text-anchor="middle" x="2636.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2647,-524.5 2647,-570.5 "/>
<text text-anchor="middle" x="2722.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">medication</text>
<polyline fill="none" stroke="#000000" points="2647,-547.5 2798,-547.5 "/>
<text text-anchor="middle" x="2722.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="2798,-524.5 2798,-570.5 "/>
<text text-anchor="middle" x="2808.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- agent_administration&#45;&gt;agent -->
<g id="edge28" class="edge">
<title>agent_administration&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2794.9056,-1784.8825C2774.4161,-1717.2066 2759,-1642.7722 2759,-1572 2759,-1572 2759,-1572 2759,-818 2759,-714.4435 2750.196,-686.7476 2716,-589 2714.9229,-585.9211 2713.6453,-582.7912 2712.2561,-579.7014"/>
<polygon fill="#000000" stroke="#000000" points="2715.3693,-578.1 2707.8428,-570.6432 2709.0764,-581.166 2715.3693,-578.1"/>
<text text-anchor="middle" x="2790" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- off_study -->
<g id="node6" class="node">
<title>off_study</title>
<path fill="none" stroke="#000000" d="M1781.5,-714.5C1781.5,-714.5 2196.5,-714.5 2196.5,-714.5 2202.5,-714.5 2208.5,-720.5 2208.5,-726.5 2208.5,-726.5 2208.5,-909.5 2208.5,-909.5 2208.5,-915.5 2202.5,-921.5 2196.5,-921.5 2196.5,-921.5 1781.5,-921.5 1781.5,-921.5 1775.5,-921.5 1769.5,-915.5 1769.5,-909.5 1769.5,-909.5 1769.5,-726.5 1769.5,-726.5 1769.5,-720.5 1775.5,-714.5 1781.5,-714.5"/>
<text text-anchor="middle" x="1811" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_study</text>
<polyline fill="none" stroke="#000000" points="1852.5,-714.5 1852.5,-921.5 "/>
<text text-anchor="middle" x="1863" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1873.5,-714.5 1873.5,-921.5 "/>
<text text-anchor="middle" x="2030.5" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_study</text>
<polyline fill="none" stroke="#000000" points="1873.5,-898.5 2187.5,-898.5 "/>
<text text-anchor="middle" x="2030.5" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1873.5,-875.5 2187.5,-875.5 "/>
<text text-anchor="middle" x="2030.5" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1873.5,-852.5 2187.5,-852.5 "/>
<text text-anchor="middle" x="2030.5" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1873.5,-829.5 2187.5,-829.5 "/>
<text text-anchor="middle" x="2030.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1873.5,-806.5 2187.5,-806.5 "/>
<text text-anchor="middle" x="2030.5" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1873.5,-783.5 2187.5,-783.5 "/>
<text text-anchor="middle" x="2030.5" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1873.5,-760.5 2187.5,-760.5 "/>
<text text-anchor="middle" x="2030.5" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_study</text>
<polyline fill="none" stroke="#000000" points="1873.5,-737.5 2187.5,-737.5 "/>
<text text-anchor="middle" x="2030.5" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="2187.5,-714.5 2187.5,-921.5 "/>
<text text-anchor="middle" x="2198" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event -->
<g id="node7" class="node">
<title>adverse_event</title>
<path fill="none" stroke="#000000" d="M2238.5,-622.5C2238.5,-622.5 2633.5,-622.5 2633.5,-622.5 2639.5,-622.5 2645.5,-628.5 2645.5,-634.5 2645.5,-634.5 2645.5,-1001.5 2645.5,-1001.5 2645.5,-1007.5 2639.5,-1013.5 2633.5,-1013.5 2633.5,-1013.5 2238.5,-1013.5 2238.5,-1013.5 2232.5,-1013.5 2226.5,-1007.5 2226.5,-1001.5 2226.5,-1001.5 2226.5,-634.5 2226.5,-634.5 2226.5,-628.5 2232.5,-622.5 2238.5,-622.5"/>
<text text-anchor="middle" x="2286.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event</text>
<polyline fill="none" stroke="#000000" points="2346.5,-622.5 2346.5,-1013.5 "/>
<text text-anchor="middle" x="2357" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2367.5,-622.5 2367.5,-1013.5 "/>
<text text-anchor="middle" x="2496" y="-998.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_resolved</text>
<polyline fill="none" stroke="#000000" points="2367.5,-990.5 2624.5,-990.5 "/>
<text text-anchor="middle" x="2496" y="-975.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade</text>
<polyline fill="none" stroke="#000000" points="2367.5,-967.5 2624.5,-967.5 "/>
<text text-anchor="middle" x="2496" y="-952.3" font-family="Times,serif" font-size="14.00" fill="#000000">unexpected_adverse_event</text>
<polyline fill="none" stroke="#000000" points="2367.5,-944.5 2624.5,-944.5 "/>
<text text-anchor="middle" x="2496" y="-929.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="2367.5,-921.5 2624.5,-921.5 "/>
<text text-anchor="middle" x="2496" y="-906.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_agent_name</text>
<polyline fill="none" stroke="#000000" points="2367.5,-898.5 2624.5,-898.5 "/>
<text text-anchor="middle" x="2496" y="-883.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_other</text>
<polyline fill="none" stroke="#000000" points="2367.5,-875.5 2624.5,-875.5 "/>
<text text-anchor="middle" x="2496" y="-860.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_disease</text>
<polyline fill="none" stroke="#000000" points="2367.5,-852.5 2624.5,-852.5 "/>
<text text-anchor="middle" x="2496" y="-837.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_grade_description</text>
<polyline fill="none" stroke="#000000" points="2367.5,-829.5 2624.5,-829.5 "/>
<text text-anchor="middle" x="2496" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_dose</text>
<polyline fill="none" stroke="#000000" points="2367.5,-806.5 2624.5,-806.5 "/>
<text text-anchor="middle" x="2496" y="-791.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_limiting_toxicity</text>
<polyline fill="none" stroke="#000000" points="2367.5,-783.5 2624.5,-783.5 "/>
<text text-anchor="middle" x="2496" y="-768.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2367.5,-760.5 2624.5,-760.5 "/>
<text text-anchor="middle" x="2496" y="-745.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_description</text>
<polyline fill="none" stroke="#000000" points="2367.5,-737.5 2624.5,-737.5 "/>
<text text-anchor="middle" x="2496" y="-722.3" font-family="Times,serif" font-size="14.00" fill="#000000">adverse_event_term</text>
<polyline fill="none" stroke="#000000" points="2367.5,-714.5 2624.5,-714.5 "/>
<text text-anchor="middle" x="2496" y="-699.3" font-family="Times,serif" font-size="14.00" fill="#000000">ae_other</text>
<polyline fill="none" stroke="#000000" points="2367.5,-691.5 2624.5,-691.5 "/>
<text text-anchor="middle" x="2496" y="-676.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_ind</text>
<polyline fill="none" stroke="#000000" points="2367.5,-668.5 2624.5,-668.5 "/>
<text text-anchor="middle" x="2496" y="-653.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_research</text>
<polyline fill="none" stroke="#000000" points="2367.5,-645.5 2624.5,-645.5 "/>
<text text-anchor="middle" x="2496" y="-630.3" font-family="Times,serif" font-size="14.00" fill="#000000">attribution_to_commercial</text>
<polyline fill="none" stroke="#000000" points="2624.5,-622.5 2624.5,-1013.5 "/>
<text text-anchor="middle" x="2635" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- adverse_event&#45;&gt;adverse_event -->
<g id="edge7" class="edge">
<title>adverse_event&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M2645.7046,-845.2761C2656.876,-838.5862 2663.5,-829.4941 2663.5,-818 2663.5,-809.7386 2660.0781,-802.7181 2654.0052,-796.9385"/>
<polygon fill="#000000" stroke="#000000" points="2655.8073,-793.9155 2645.7046,-790.7239 2651.6119,-799.519 2655.8073,-793.9155"/>
<text text-anchor="middle" x="2679.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- adverse_event&#45;&gt;visit -->
<g id="edge19" class="edge">
<title>adverse_event&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2406.1866,-1013.6979C2381.7981,-1135.4486 2339.4921,-1292.0643 2269,-1417 2240.7461,-1467.0755 2192.9331,-1513.5168 2159.7559,-1542.2565"/>
<polygon fill="#000000" stroke="#000000" points="2157.4042,-1539.6623 2152.0764,-1548.82 2161.9522,-1544.9835 2157.4042,-1539.6623"/>
<text text-anchor="middle" x="2392" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- adverse_event&#45;&gt;agent -->
<g id="edge29" class="edge">
<title>adverse_event&#45;&gt;agent</title>
<path fill="none" stroke="#000000" d="M2622.4752,-622.4901C2638.5963,-605.588 2653.212,-590.2641 2664.9682,-577.9384"/>
<polygon fill="#000000" stroke="#000000" points="2667.5371,-580.3161 2671.9064,-570.6641 2662.4717,-575.4847 2667.5371,-580.3161"/>
<text text-anchor="middle" x="2681" y="-592.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_agent</text>
</g>
<!-- follow_up -->
<g id="node8" class="node">
<title>follow_up</title>
<path fill="none" stroke="#000000" d="M1140,-1209.5C1140,-1209.5 1472,-1209.5 1472,-1209.5 1478,-1209.5 1484,-1215.5 1484,-1221.5 1484,-1221.5 1484,-1404.5 1484,-1404.5 1484,-1410.5 1478,-1416.5 1472,-1416.5 1472,-1416.5 1140,-1416.5 1140,-1416.5 1134,-1416.5 1128,-1410.5 1128,-1404.5 1128,-1404.5 1128,-1221.5 1128,-1221.5 1128,-1215.5 1134,-1209.5 1140,-1209.5"/>
<text text-anchor="middle" x="1170.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up</text>
<polyline fill="none" stroke="#000000" points="1213,-1209.5 1213,-1416.5 "/>
<text text-anchor="middle" x="1223.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1234,-1209.5 1234,-1416.5 "/>
<text text-anchor="middle" x="1348.5" y="-1401.3" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1234,-1393.5 1463,-1393.5 "/>
<text text-anchor="middle" x="1348.5" y="-1378.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1234,-1370.5 1463,-1370.5 "/>
<text text-anchor="middle" x="1348.5" y="-1355.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_changes</text>
<polyline fill="none" stroke="#000000" points="1234,-1347.5 1463,-1347.5 "/>
<text text-anchor="middle" x="1348.5" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_since_last_contact</text>
<polyline fill="none" stroke="#000000" points="1234,-1324.5 1463,-1324.5 "/>
<text text-anchor="middle" x="1348.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">contact_type</text>
<polyline fill="none" stroke="#000000" points="1234,-1301.5 1463,-1301.5 "/>
<text text-anchor="middle" x="1348.5" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam_performed</text>
<polyline fill="none" stroke="#000000" points="1234,-1278.5 1463,-1278.5 "/>
<text text-anchor="middle" x="1348.5" y="-1263.3" font-family="Times,serif" font-size="14.00" fill="#000000">explain_unknown_status</text>
<polyline fill="none" stroke="#000000" points="1234,-1255.5 1463,-1255.5 "/>
<text text-anchor="middle" x="1348.5" y="-1240.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_contact</text>
<polyline fill="none" stroke="#000000" points="1234,-1232.5 1463,-1232.5 "/>
<text text-anchor="middle" x="1348.5" y="-1217.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_status</text>
<polyline fill="none" stroke="#000000" points="1463,-1209.5 1463,-1416.5 "/>
<text text-anchor="middle" x="1473.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- follow_up&#45;&gt;case -->
<g id="edge13" class="edge">
<title>follow_up&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1404.4221,-1209.498C1419.5127,-1197.0434 1435.5663,-1185.4232 1452,-1176 1478.5704,-1160.7644 1509.0639,-1148.8387 1538.6605,-1139.6163"/>
<polygon fill="#000000" stroke="#000000" points="1539.6767,-1142.9656 1548.2321,-1136.7162 1537.6468,-1136.2664 1539.6767,-1142.9656"/>
<text text-anchor="middle" x="1479" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- study_arm -->
<g id="node9" class="node">
<title>study_arm</title>
<path fill="none" stroke="#000000" d="M2509.5,-415C2509.5,-415 2878.5,-415 2878.5,-415 2884.5,-415 2890.5,-421 2890.5,-427 2890.5,-427 2890.5,-449 2890.5,-449 2890.5,-455 2884.5,-461 2878.5,-461 2878.5,-461 2509.5,-461 2509.5,-461 2503.5,-461 2497.5,-455 2497.5,-449 2497.5,-449 2497.5,-427 2497.5,-427 2497.5,-421 2503.5,-415 2509.5,-415"/>
<text text-anchor="middle" x="2543.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_arm</text>
<polyline fill="none" stroke="#000000" points="2589.5,-415 2589.5,-461 "/>
<text text-anchor="middle" x="2600" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2610.5,-415 2610.5,-461 "/>
<text text-anchor="middle" x="2740" y="-445.8" font-family="Times,serif" font-size="14.00" fill="#000000">arm</text>
<polyline fill="none" stroke="#000000" points="2610.5,-438 2869.5,-438 "/>
<text text-anchor="middle" x="2740" y="-422.8" font-family="Times,serif" font-size="14.00" fill="#000000">ctep_treatment_assignment_code</text>
<polyline fill="none" stroke="#000000" points="2869.5,-415 2869.5,-461 "/>
<text text-anchor="middle" x="2880" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_arm&#45;&gt;study -->
<g id="edge38" class="edge">
<title>study_arm&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2589.9512,-414.9547C2463.8748,-387.0306 2250.0188,-339.6646 2102.2326,-306.9321"/>
<polygon fill="#000000" stroke="#000000" points="2102.6723,-303.4448 2092.152,-304.6994 2101.1585,-310.2792 2102.6723,-303.4448"/>
<text text-anchor="middle" x="2490.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- diagnosis -->
<g id="node10" class="node">
<title>diagnosis</title>
<path fill="none" stroke="#000000" d="M2359.5,-2344.5C2359.5,-2344.5 2702.5,-2344.5 2702.5,-2344.5 2708.5,-2344.5 2714.5,-2350.5 2714.5,-2356.5 2714.5,-2356.5 2714.5,-2631.5 2714.5,-2631.5 2714.5,-2637.5 2708.5,-2643.5 2702.5,-2643.5 2702.5,-2643.5 2359.5,-2643.5 2359.5,-2643.5 2353.5,-2643.5 2347.5,-2637.5 2347.5,-2631.5 2347.5,-2631.5 2347.5,-2356.5 2347.5,-2356.5 2347.5,-2350.5 2353.5,-2344.5 2359.5,-2344.5"/>
<text text-anchor="middle" x="2389.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">diagnosis</text>
<polyline fill="none" stroke="#000000" points="2431.5,-2344.5 2431.5,-2643.5 "/>
<text text-anchor="middle" x="2442" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2452.5,-2344.5 2452.5,-2643.5 "/>
<text text-anchor="middle" x="2573" y="-2628.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_diagnosis</text>
<polyline fill="none" stroke="#000000" points="2452.5,-2620.5 2693.5,-2620.5 "/>
<text text-anchor="middle" x="2573" y="-2605.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2452.5,-2597.5 2693.5,-2597.5 "/>
<text text-anchor="middle" x="2573" y="-2582.3" font-family="Times,serif" font-size="14.00" fill="#000000">follow_up_data</text>
<polyline fill="none" stroke="#000000" points="2452.5,-2574.5 2693.5,-2574.5 "/>
<text text-anchor="middle" x="2573" y="-2559.3" font-family="Times,serif" font-size="14.00" fill="#000000">stage_of_disease</text>
<polyline fill="none" stroke="#000000" points="2452.5,-2551.5 2693.5,-2551.5 "/>
<text text-anchor="middle" x="2573" y="-2536.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease_type</text>
<polyline fill="none" stroke="#000000" points="2452.5,-2528.5 2693.5,-2528.5 "/>
<text text-anchor="middle" x="2573" y="-2513.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_histology_confirmation</text>
<polyline fill="none" stroke="#000000" points="2452.5,-2505.5 2693.5,-2505.5 "/>
<text text-anchor="middle" x="2573" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">histology_cytopathology</text>
<polyline fill="none" stroke="#000000" points="2452.5,-2482.5 2693.5,-2482.5 "/>
<text text-anchor="middle" x="2573" y="-2467.3" font-family="Times,serif" font-size="14.00" fill="#000000">pathology_report</text>
<polyline fill="none" stroke="#000000" points="2452.5,-2459.5 2693.5,-2459.5 "/>
<text text-anchor="middle" x="2573" y="-2444.3" font-family="Times,serif" font-size="14.00" fill="#000000">histological_grade</text>
<polyline fill="none" stroke="#000000" points="2452.5,-2436.5 2693.5,-2436.5 "/>
<text text-anchor="middle" x="2573" y="-2421.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_data</text>
<polyline fill="none" stroke="#000000" points="2452.5,-2413.5 2693.5,-2413.5 "/>
<text text-anchor="middle" x="2573" y="-2398.3" font-family="Times,serif" font-size="14.00" fill="#000000">primary_disease_site</text>
<polyline fill="none" stroke="#000000" points="2452.5,-2390.5 2693.5,-2390.5 "/>
<text text-anchor="middle" x="2573" y="-2375.3" font-family="Times,serif" font-size="14.00" fill="#000000">concurrent_disease</text>
<polyline fill="none" stroke="#000000" points="2452.5,-2367.5 2693.5,-2367.5 "/>
<text text-anchor="middle" x="2573" y="-2352.3" font-family="Times,serif" font-size="14.00" fill="#000000">disease_term</text>
<polyline fill="none" stroke="#000000" points="2693.5,-2344.5 2693.5,-2643.5 "/>
<text text-anchor="middle" x="2704" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- diagnosis&#45;&gt;case -->
<g id="edge11" class="edge">
<title>diagnosis&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M2714.5722,-2468.7368C2877.4591,-2442.1746 3097.7878,-2394.6388 3152,-2326 3324.1116,-2108.0872 3171,-1979.184 3171,-1701.5 3171,-1701.5 3171,-1701.5 3171,-1313 3171,-1147.6063 2986.5361,-1211.5125 2825,-1176 2633.4934,-1133.8988 2062.1531,-1118.4975 1801.841,-1113.5595"/>
<polygon fill="#000000" stroke="#000000" points="1801.64,-1110.0552 1791.5761,-1113.3672 1801.5088,-1117.054 1801.64,-1110.0552"/>
<text text-anchor="middle" x="3198" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- image -->
<g id="node11" class="node">
<title>image</title>
<path fill="none" stroke="#000000" d="M1514,-2836C1514,-2836 1550,-2836 1550,-2836 1556,-2836 1562,-2842 1562,-2848 1562,-2848 1562,-2860 1562,-2860 1562,-2866 1556,-2872 1550,-2872 1550,-2872 1514,-2872 1514,-2872 1508,-2872 1502,-2866 1502,-2860 1502,-2860 1502,-2848 1502,-2848 1502,-2842 1508,-2836 1514,-2836"/>
<text text-anchor="middle" x="1532" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">image</text>
</g>
<!-- assay -->
<g id="node17" class="node">
<title>assay</title>
<path fill="none" stroke="#000000" d="M1552,-2662.5C1552,-2662.5 1584,-2662.5 1584,-2662.5 1590,-2662.5 1596,-2668.5 1596,-2674.5 1596,-2674.5 1596,-2686.5 1596,-2686.5 1596,-2692.5 1590,-2698.5 1584,-2698.5 1584,-2698.5 1552,-2698.5 1552,-2698.5 1546,-2698.5 1540,-2692.5 1540,-2686.5 1540,-2686.5 1540,-2674.5 1540,-2674.5 1540,-2668.5 1546,-2662.5 1552,-2662.5"/>
<text text-anchor="middle" x="1568" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">assay</text>
</g>
<!-- image&#45;&gt;assay -->
<g id="edge32" class="edge">
<title>image&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1528.0351,-2835.8839C1523.0063,-2808.8561 1516.7973,-2756.8861 1533,-2717 1534.5179,-2713.2635 1536.618,-2709.6927 1539.0425,-2706.3484"/>
<polygon fill="#000000" stroke="#000000" points="1541.8489,-2708.4488 1545.5907,-2698.5367 1536.4843,-2703.9519 1541.8489,-2708.4488"/>
<text text-anchor="middle" x="1563.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- off_treatment -->
<g id="node12" class="node">
<title>off_treatment</title>
<path fill="none" stroke="#000000" d="M1136.5,-726C1136.5,-726 1583.5,-726 1583.5,-726 1589.5,-726 1595.5,-732 1595.5,-738 1595.5,-738 1595.5,-898 1595.5,-898 1595.5,-904 1589.5,-910 1583.5,-910 1583.5,-910 1136.5,-910 1136.5,-910 1130.5,-910 1124.5,-904 1124.5,-898 1124.5,-898 1124.5,-738 1124.5,-738 1124.5,-732 1130.5,-726 1136.5,-726"/>
<text text-anchor="middle" x="1182" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">off_treatment</text>
<polyline fill="none" stroke="#000000" points="1239.5,-726 1239.5,-910 "/>
<text text-anchor="middle" x="1250" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1260.5,-726 1260.5,-910 "/>
<text text-anchor="middle" x="1417.5" y="-894.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_best_response</text>
<polyline fill="none" stroke="#000000" points="1260.5,-887 1574.5,-887 "/>
<text text-anchor="middle" x="1417.5" y="-871.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_best_response</text>
<polyline fill="none" stroke="#000000" points="1260.5,-864 1574.5,-864 "/>
<text text-anchor="middle" x="1417.5" y="-848.8" font-family="Times,serif" font-size="14.00" fill="#000000">best_resp_vet_tx_tp_secondary_response</text>
<polyline fill="none" stroke="#000000" points="1260.5,-841 1574.5,-841 "/>
<text text-anchor="middle" x="1417.5" y="-825.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_disease_progression</text>
<polyline fill="none" stroke="#000000" points="1260.5,-818 1574.5,-818 "/>
<text text-anchor="middle" x="1417.5" y="-802.8" font-family="Times,serif" font-size="14.00" fill="#000000">document_number</text>
<polyline fill="none" stroke="#000000" points="1260.5,-795 1574.5,-795 "/>
<text text-anchor="middle" x="1417.5" y="-779.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_last_medication_administration</text>
<polyline fill="none" stroke="#000000" points="1260.5,-772 1574.5,-772 "/>
<text text-anchor="middle" x="1417.5" y="-756.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1260.5,-749 1574.5,-749 "/>
<text text-anchor="middle" x="1417.5" y="-733.8" font-family="Times,serif" font-size="14.00" fill="#000000">reason_off_treatment</text>
<polyline fill="none" stroke="#000000" points="1574.5,-726 1574.5,-910 "/>
<text text-anchor="middle" x="1585" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file -->
<g id="node13" class="node">
<title>file</title>
<path fill="none" stroke="#000000" d="M1599.5,-2750.5C1599.5,-2750.5 1784.5,-2750.5 1784.5,-2750.5 1790.5,-2750.5 1796.5,-2756.5 1796.5,-2762.5 1796.5,-2762.5 1796.5,-2945.5 1796.5,-2945.5 1796.5,-2951.5 1790.5,-2957.5 1784.5,-2957.5 1784.5,-2957.5 1599.5,-2957.5 1599.5,-2957.5 1593.5,-2957.5 1587.5,-2951.5 1587.5,-2945.5 1587.5,-2945.5 1587.5,-2762.5 1587.5,-2762.5 1587.5,-2756.5 1593.5,-2750.5 1599.5,-2750.5"/>
<text text-anchor="middle" x="1607" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file</text>
<polyline fill="none" stroke="#000000" points="1626.5,-2750.5 1626.5,-2957.5 "/>
<text text-anchor="middle" x="1637" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1647.5,-2750.5 1647.5,-2957.5 "/>
<text text-anchor="middle" x="1711.5" y="-2942.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_status</text>
<polyline fill="none" stroke="#000000" points="1647.5,-2934.5 1775.5,-2934.5 "/>
<text text-anchor="middle" x="1711.5" y="-2919.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_type</text>
<polyline fill="none" stroke="#000000" points="1647.5,-2911.5 1775.5,-2911.5 "/>
<text text-anchor="middle" x="1711.5" y="-2896.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_name</text>
<polyline fill="none" stroke="#000000" points="1647.5,-2888.5 1775.5,-2888.5 "/>
<text text-anchor="middle" x="1711.5" y="-2873.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_format</text>
<polyline fill="none" stroke="#000000" points="1647.5,-2865.5 1775.5,-2865.5 "/>
<text text-anchor="middle" x="1711.5" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_size</text>
<polyline fill="none" stroke="#000000" points="1647.5,-2842.5 1775.5,-2842.5 "/>
<text text-anchor="middle" x="1711.5" y="-2827.3" font-family="Times,serif" font-size="14.00" fill="#000000">md5sum</text>
<polyline fill="none" stroke="#000000" points="1647.5,-2819.5 1775.5,-2819.5 "/>
<text text-anchor="middle" x="1711.5" y="-2804.3" font-family="Times,serif" font-size="14.00" fill="#000000">uuid</text>
<polyline fill="none" stroke="#000000" points="1647.5,-2796.5 1775.5,-2796.5 "/>
<text text-anchor="middle" x="1711.5" y="-2781.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_description</text>
<polyline fill="none" stroke="#000000" points="1647.5,-2773.5 1775.5,-2773.5 "/>
<text text-anchor="middle" x="1711.5" y="-2758.3" font-family="Times,serif" font-size="14.00" fill="#000000">file_locations</text>
<polyline fill="none" stroke="#000000" points="1775.5,-2750.5 1775.5,-2957.5 "/>
<text text-anchor="middle" x="1786" y="-2850.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;diagnosis -->
<g id="edge8" class="edge">
<title>file&#45;&gt;diagnosis</title>
<path fill="none" stroke="#000000" d="M1796.5635,-2809.1336C1931.6804,-2751.1574 2169.5209,-2649.1043 2337.894,-2576.8584"/>
<polygon fill="#000000" stroke="#000000" points="2339.3064,-2580.061 2347.116,-2572.9014 2336.5461,-2573.6282 2339.3064,-2580.061"/>
<text text-anchor="middle" x="2059.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">from_diagnosis</text>
</g>
<!-- file&#45;&gt;assay -->
<g id="edge31" class="edge">
<title>file&#45;&gt;assay</title>
<path fill="none" stroke="#000000" d="M1617.7211,-2750.0694C1606.2656,-2734.041 1595.3927,-2718.8278 1586.7525,-2706.7384"/>
<polygon fill="#000000" stroke="#000000" points="1589.5415,-2704.6213 1580.8793,-2698.5206 1583.8464,-2708.6915 1589.5415,-2704.6213"/>
<text text-anchor="middle" x="1635.5" y="-2720.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_assay</text>
</g>
<!-- sample -->
<g id="node18" class="node">
<title>sample</title>
<path fill="none" stroke="#000000" d="M1356.5,-1819.5C1356.5,-1819.5 1779.5,-1819.5 1779.5,-1819.5 1785.5,-1819.5 1791.5,-1825.5 1791.5,-1831.5 1791.5,-1831.5 1791.5,-2221.5 1791.5,-2221.5 1791.5,-2227.5 1785.5,-2233.5 1779.5,-2233.5 1779.5,-2233.5 1356.5,-2233.5 1356.5,-2233.5 1350.5,-2233.5 1344.5,-2227.5 1344.5,-2221.5 1344.5,-2221.5 1344.5,-1831.5 1344.5,-1831.5 1344.5,-1825.5 1350.5,-1819.5 1356.5,-1819.5"/>
<text text-anchor="middle" x="1378.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">sample</text>
<polyline fill="none" stroke="#000000" points="1412.5,-1819.5 1412.5,-2233.5 "/>
<text text-anchor="middle" x="1423" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1433.5,-1819.5 1433.5,-2233.5 "/>
<text text-anchor="middle" x="1602" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1433.5,-2210.5 1770.5,-2210.5 "/>
<text text-anchor="middle" x="1602" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">general_sample_pathology</text>
<polyline fill="none" stroke="#000000" points="1433.5,-2187.5 1770.5,-2187.5 "/>
<text text-anchor="middle" x="1602" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1433.5,-2164.5 1770.5,-2164.5 "/>
<text text-anchor="middle" x="1602" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">necropsy_sample</text>
<polyline fill="none" stroke="#000000" points="1433.5,-2141.5 1770.5,-2141.5 "/>
<text text-anchor="middle" x="1602" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">non_tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1433.5,-2118.5 1770.5,-2118.5 "/>
<text text-anchor="middle" x="1602" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">comment</text>
<polyline fill="none" stroke="#000000" points="1433.5,-2095.5 1770.5,-2095.5 "/>
<text text-anchor="middle" x="1602" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1433.5,-2072.5 1770.5,-2072.5 "/>
<text text-anchor="middle" x="1602" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_stroma</text>
<polyline fill="none" stroke="#000000" points="1433.5,-2049.5 1770.5,-2049.5 "/>
<text text-anchor="middle" x="1602" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_id</text>
<polyline fill="none" stroke="#000000" points="1433.5,-2026.5 1770.5,-2026.5 "/>
<text text-anchor="middle" x="1602" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area</text>
<polyline fill="none" stroke="#000000" points="1433.5,-2003.5 1770.5,-2003.5 "/>
<text text-anchor="middle" x="1602" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_tumor</text>
<polyline fill="none" stroke="#000000" points="1433.5,-1980.5 1770.5,-1980.5 "/>
<text text-anchor="middle" x="1602" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_pigmented_tumor</text>
<polyline fill="none" stroke="#000000" points="1433.5,-1957.5 1770.5,-1957.5 "/>
<text text-anchor="middle" x="1602" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">tumor_tissue_area</text>
<polyline fill="none" stroke="#000000" points="1433.5,-1934.5 1770.5,-1934.5 "/>
<text text-anchor="middle" x="1602" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">width_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1433.5,-1911.5 1770.5,-1911.5 "/>
<text text-anchor="middle" x="1602" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_sample_collection</text>
<polyline fill="none" stroke="#000000" points="1433.5,-1888.5 1770.5,-1888.5 "/>
<text text-anchor="middle" x="1602" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">analysis_area_percentage_glass</text>
<polyline fill="none" stroke="#000000" points="1433.5,-1865.5 1770.5,-1865.5 "/>
<text text-anchor="middle" x="1602" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">length_of_tumor</text>
<polyline fill="none" stroke="#000000" points="1433.5,-1842.5 1770.5,-1842.5 "/>
<text text-anchor="middle" x="1602" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">sample_type</text>
<polyline fill="none" stroke="#000000" points="1770.5,-1819.5 1770.5,-2233.5 "/>
<text text-anchor="middle" x="1781" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- file&#45;&gt;sample -->
<g id="edge34" class="edge">
<title>file&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1686.8956,-2750.3798C1680.7582,-2646.9331 1668.2458,-2483.679 1645,-2344 1639.555,-2311.2819 1632.5797,-2276.9443 1625.0574,-2243.4344"/>
<polygon fill="#000000" stroke="#000000" points="1628.4383,-2242.5166 1622.8148,-2233.5373 1621.6114,-2244.0636 1628.4383,-2242.5166"/>
<text text-anchor="middle" x="1720.5" y="-2676.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- vital_signs -->
<g id="node14" class="node">
<title>vital_signs</title>
<path fill="none" stroke="#000000" d="M1871.5,-1865.5C1871.5,-1865.5 2158.5,-1865.5 2158.5,-1865.5 2164.5,-1865.5 2170.5,-1871.5 2170.5,-1877.5 2170.5,-1877.5 2170.5,-2175.5 2170.5,-2175.5 2170.5,-2181.5 2164.5,-2187.5 2158.5,-2187.5 2158.5,-2187.5 1871.5,-2187.5 1871.5,-2187.5 1865.5,-2187.5 1859.5,-2181.5 1859.5,-2175.5 1859.5,-2175.5 1859.5,-1877.5 1859.5,-1877.5 1859.5,-1871.5 1865.5,-1865.5 1871.5,-1865.5"/>
<text text-anchor="middle" x="1906" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">vital_signs</text>
<polyline fill="none" stroke="#000000" points="1952.5,-1865.5 1952.5,-2187.5 "/>
<text text-anchor="middle" x="1963" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1973.5,-1865.5 1973.5,-2187.5 "/>
<text text-anchor="middle" x="2061.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">patient_weight</text>
<polyline fill="none" stroke="#000000" points="1973.5,-2164.5 2149.5,-2164.5 "/>
<text text-anchor="middle" x="2061.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase</text>
<polyline fill="none" stroke="#000000" points="1973.5,-2141.5 2149.5,-2141.5 "/>
<text text-anchor="middle" x="2061.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_surface_area</text>
<polyline fill="none" stroke="#000000" points="1973.5,-2118.5 2149.5,-2118.5 "/>
<text text-anchor="middle" x="2061.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_rate</text>
<polyline fill="none" stroke="#000000" points="1973.5,-2095.5 2149.5,-2095.5 "/>
<text text-anchor="middle" x="2061.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1973.5,-2072.5 2149.5,-2072.5 "/>
<text text-anchor="middle" x="2061.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">modified_ecog</text>
<polyline fill="none" stroke="#000000" points="1973.5,-2049.5 2149.5,-2049.5 "/>
<text text-anchor="middle" x="2061.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_vital_signs</text>
<polyline fill="none" stroke="#000000" points="1973.5,-2026.5 2149.5,-2026.5 "/>
<text text-anchor="middle" x="2061.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">ecg</text>
<polyline fill="none" stroke="#000000" points="1973.5,-2003.5 2149.5,-2003.5 "/>
<text text-anchor="middle" x="2061.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_temperature</text>
<polyline fill="none" stroke="#000000" points="1973.5,-1980.5 2149.5,-1980.5 "/>
<text text-anchor="middle" x="2061.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">systolic_bp</text>
<polyline fill="none" stroke="#000000" points="1973.5,-1957.5 2149.5,-1957.5 "/>
<text text-anchor="middle" x="2061.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1973.5,-1934.5 2149.5,-1934.5 "/>
<text text-anchor="middle" x="2061.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse</text>
<polyline fill="none" stroke="#000000" points="1973.5,-1911.5 2149.5,-1911.5 "/>
<text text-anchor="middle" x="2061.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">pulse_ox</text>
<polyline fill="none" stroke="#000000" points="1973.5,-1888.5 2149.5,-1888.5 "/>
<text text-anchor="middle" x="2061.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">respiration_pattern</text>
<polyline fill="none" stroke="#000000" points="2149.5,-1865.5 2149.5,-2187.5 "/>
<text text-anchor="middle" x="2160" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- vital_signs&#45;&gt;visit -->
<g id="edge21" class="edge">
<title>vital_signs&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2053.3048,-1865.3007C2075.8128,-1770.5793 2102.3051,-1659.0912 2115.1828,-1604.8973"/>
<polygon fill="#000000" stroke="#000000" points="2118.5916,-1605.6911 2117.4983,-1595.1528 2111.7812,-1604.0727 2118.5916,-1605.6911"/>
<text text-anchor="middle" x="2120" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- visit&#45;&gt;visit -->
<g id="edge3" class="edge">
<title>visit&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2181.0376,-1595.0098C2212.1529,-1598.9199 2240.5,-1591.25 2240.5,-1572 2240.5,-1554.8555 2218.0147,-1546.8964 2191.1145,-1548.1228"/>
<polygon fill="#000000" stroke="#000000" points="2190.7006,-1544.6454 2181.0376,-1548.9902 2191.301,-1551.6196 2190.7006,-1544.6454"/>
<text text-anchor="middle" x="2256.5" y="-1568.3" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cycle -->
<g id="node20" class="node">
<title>cycle</title>
<path fill="none" stroke="#000000" d="M1642,-1278.5C1642,-1278.5 1870,-1278.5 1870,-1278.5 1876,-1278.5 1882,-1284.5 1882,-1290.5 1882,-1290.5 1882,-1335.5 1882,-1335.5 1882,-1341.5 1876,-1347.5 1870,-1347.5 1870,-1347.5 1642,-1347.5 1642,-1347.5 1636,-1347.5 1630,-1341.5 1630,-1335.5 1630,-1335.5 1630,-1290.5 1630,-1290.5 1630,-1284.5 1636,-1278.5 1642,-1278.5"/>
<text text-anchor="middle" x="1657" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle</text>
<polyline fill="none" stroke="#000000" points="1684,-1278.5 1684,-1347.5 "/>
<text text-anchor="middle" x="1694.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1705,-1278.5 1705,-1347.5 "/>
<text text-anchor="middle" x="1783" y="-1332.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_end</text>
<polyline fill="none" stroke="#000000" points="1705,-1324.5 1861,-1324.5 "/>
<text text-anchor="middle" x="1783" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000">cycle_number</text>
<polyline fill="none" stroke="#000000" points="1705,-1301.5 1861,-1301.5 "/>
<text text-anchor="middle" x="1783" y="-1286.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_cycle_start</text>
<polyline fill="none" stroke="#000000" points="1861,-1278.5 1861,-1347.5 "/>
<text text-anchor="middle" x="1871.5" y="-1309.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- visit&#45;&gt;cycle -->
<g id="edge2" class="edge">
<title>visit&#45;&gt;cycle</title>
<path fill="none" stroke="#000000" d="M2086.7184,-1548.8411C2040.6163,-1519.1685 1958.8753,-1465.7344 1891,-1417 1862.917,-1396.8364 1832.3435,-1373.4116 1807.4045,-1353.904"/>
<polygon fill="#000000" stroke="#000000" points="1809.5443,-1351.1343 1799.5157,-1347.7171 1805.2245,-1356.6424 1809.5443,-1351.1343"/>
<text text-anchor="middle" x="1964.5" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_cycle</text>
</g>
<!-- lab_exam -->
<g id="node16" class="node">
<title>lab_exam</title>
<path fill="none" stroke="#000000" d="M2201,-2008.5C2201,-2008.5 2261,-2008.5 2261,-2008.5 2267,-2008.5 2273,-2014.5 2273,-2020.5 2273,-2020.5 2273,-2032.5 2273,-2032.5 2273,-2038.5 2267,-2044.5 2261,-2044.5 2261,-2044.5 2201,-2044.5 2201,-2044.5 2195,-2044.5 2189,-2038.5 2189,-2032.5 2189,-2032.5 2189,-2020.5 2189,-2020.5 2189,-2014.5 2195,-2008.5 2201,-2008.5"/>
<text text-anchor="middle" x="2231" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">lab_exam</text>
</g>
<!-- lab_exam&#45;&gt;visit -->
<g id="edge18" class="edge">
<title>lab_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2229.0887,-2008.3608C2223.8791,-1961.3131 2207.9206,-1831.7332 2180,-1727 2168.4707,-1683.7525 2149.8074,-1635.6133 2136.9975,-1604.6293"/>
<polygon fill="#000000" stroke="#000000" points="2140.1434,-1603.0797 2133.0606,-1595.2004 2133.6838,-1605.7769 2140.1434,-1603.0797"/>
<text text-anchor="middle" x="2201" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- assay&#45;&gt;sample -->
<g id="edge33" class="edge">
<title>assay&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1568,-2662.3257C1568,-2602.0681 1568,-2403.6328 1568,-2244.2865"/>
<polygon fill="#000000" stroke="#000000" points="1571.5001,-2243.849 1568,-2233.849 1564.5001,-2243.8491 1571.5001,-2243.849"/>
<text text-anchor="middle" x="1604.5" y="-2490.3" font-family="Times,serif" font-size="14.00" fill="#000000">of_sample</text>
</g>
<!-- sample&#45;&gt;visit -->
<g id="edge16" class="edge">
<title>sample&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1747.2324,-1819.4934C1779.8529,-1786.7945 1814.7602,-1754.6863 1850,-1727 1917.5946,-1673.8941 2005.5228,-1627.3911 2063.0729,-1599.5125"/>
<polygon fill="#000000" stroke="#000000" points="2064.8971,-1602.519 2072.3932,-1595.0317 2061.8641,-1596.2102 2064.8971,-1602.519"/>
<text text-anchor="middle" x="1920" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- sample&#45;&gt;sample -->
<g id="edge4" class="edge">
<title>sample&#45;&gt;sample</title>
<path fill="none" stroke="#000000" d="M1791.5955,-2065.8333C1802.8572,-2056.0642 1809.5,-2042.9531 1809.5,-2026.5 1809.5,-2013.9031 1805.6061,-2003.2652 1798.7267,-1994.5864"/>
<polygon fill="#000000" stroke="#000000" points="1801.0485,-1991.9513 1791.5955,-1987.1667 1796.0016,-1996.802 1801.0485,-1991.9513"/>
<text text-anchor="middle" x="1825.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- sample&#45;&gt;case -->
<g id="edge14" class="edge">
<title>sample&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1572.0411,-1819.3865C1577.7023,-1615.7175 1590.9196,-1319.7453 1621,-1209 1624.8733,-1194.74 1630.9352,-1180.1183 1637.4924,-1166.6791"/>
<polygon fill="#000000" stroke="#000000" points="1640.7027,-1168.0866 1642.0904,-1157.583 1634.4554,-1164.9287 1640.7027,-1168.0866"/>
<text text-anchor="middle" x="1618" y="-1438.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- agent&#45;&gt;study_arm -->
<g id="edge30" class="edge">
<title>agent&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M2694,-524.2779C2694,-508.8892 2694,-488.4597 2694,-471.3432"/>
<polygon fill="#000000" stroke="#000000" points="2697.5001,-471.1886 2694,-461.1887 2690.5001,-471.1887 2697.5001,-471.1886"/>
<text text-anchor="middle" x="2742.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study_arm</text>
</g>
<!-- cycle&#45;&gt;case -->
<g id="edge12" class="edge">
<title>cycle&#45;&gt;case</title>
<path fill="none" stroke="#000000" d="M1741.2161,-1278.3609C1728.1668,-1247.7863 1708.9106,-1202.6684 1693.7106,-1167.0546"/>
<polygon fill="#000000" stroke="#000000" points="1696.8848,-1165.5753 1689.7403,-1157.7519 1690.4467,-1168.3231 1696.8848,-1165.5753"/>
<text text-anchor="middle" x="1730" y="-1179.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_case</text>
</g>
<!-- physical_exam -->
<g id="node21" class="node">
<title>physical_exam</title>
<path fill="none" stroke="#000000" d="M998,-1934.5C998,-1934.5 1314,-1934.5 1314,-1934.5 1320,-1934.5 1326,-1940.5 1326,-1946.5 1326,-1946.5 1326,-2106.5 1326,-2106.5 1326,-2112.5 1320,-2118.5 1314,-2118.5 1314,-2118.5 998,-2118.5 998,-2118.5 992,-2118.5 986,-2112.5 986,-2106.5 986,-2106.5 986,-1946.5 986,-1946.5 986,-1940.5 992,-1934.5 998,-1934.5"/>
<text text-anchor="middle" x="1047" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">physical_exam</text>
<polyline fill="none" stroke="#000000" points="1108,-1934.5 1108,-2118.5 "/>
<text text-anchor="middle" x="1118.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1129,-1934.5 1129,-2118.5 "/>
<text text-anchor="middle" x="1217" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">phase_pe</text>
<polyline fill="none" stroke="#000000" points="1129,-2095.5 1305,-2095.5 "/>
<text text-anchor="middle" x="1217" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">assessment_timepoint</text>
<polyline fill="none" stroke="#000000" points="1129,-2072.5 1305,-2072.5 "/>
<text text-anchor="middle" x="1217" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_finding</text>
<polyline fill="none" stroke="#000000" points="1129,-2049.5 1305,-2049.5 "/>
<text text-anchor="middle" x="1217" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">pe_comment</text>
<polyline fill="none" stroke="#000000" points="1129,-2026.5 1305,-2026.5 "/>
<text text-anchor="middle" x="1217" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">day_in_cycle</text>
<polyline fill="none" stroke="#000000" points="1129,-2003.5 1305,-2003.5 "/>
<text text-anchor="middle" x="1217" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="1129,-1980.5 1305,-1980.5 "/>
<text text-anchor="middle" x="1217" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_examination</text>
<polyline fill="none" stroke="#000000" points="1129,-1957.5 1305,-1957.5 "/>
<text text-anchor="middle" x="1217" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">body_system</text>
<polyline fill="none" stroke="#000000" points="1305,-1934.5 1305,-2118.5 "/>
<text text-anchor="middle" x="1315.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- physical_exam&#45;&gt;enrollment -->
<g id="edge24" class="edge">
<title>physical_exam&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M1108.5057,-1934.2514C1071.4069,-1862.1941 1019.6828,-1761.73 980.1136,-1684.8744"/>
<polygon fill="#000000" stroke="#000000" points="983.0394,-1682.911 975.3501,-1675.6223 976.8158,-1686.1153 983.0394,-1682.911"/>
<text text-anchor="middle" x="1042" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- physical_exam&#45;&gt;visit -->
<g id="edge17" class="edge">
<title>physical_exam&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M1187.5502,-1934.2111C1215.611,-1866.3002 1263.4138,-1777.3703 1335,-1727 1443.103,-1650.9354 1823.344,-1602.5178 2013.3009,-1582.5201"/>
<polygon fill="#000000" stroke="#000000" points="2013.73,-1585.9944 2023.312,-1581.474 2013.0024,-1579.0323 2013.73,-1585.9944"/>
<text text-anchor="middle" x="1421" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- case&#45;&gt;study -->
<g id="edge40" class="edge">
<title>case&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1657.2876,-1065.1442C1653.2212,-1049.048 1649.0008,-1030.8181 1646,-1014 1630.6028,-927.7047 1624,-905.6581 1624,-818 1624,-818 1624,-818 1624,-438 1624,-360.0471 1700.0979,-318.3856 1777.6067,-296.1692"/>
<polygon fill="#000000" stroke="#000000" points="1778.8452,-299.4583 1787.5537,-293.424 1776.9829,-292.7106 1778.8452,-299.4583"/>
<text text-anchor="middle" x="1664.5" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- case&#45;&gt;off_study -->
<g id="edge35" class="edge">
<title>case&#45;&gt;off_study</title>
<path fill="none" stroke="#000000" d="M1720.1947,-1065.3178C1759.9964,-1028.6977 1817.2951,-975.9793 1868.7737,-928.6157"/>
<polygon fill="#000000" stroke="#000000" points="1871.3346,-931.0156 1876.3239,-921.6691 1866.595,-925.8642 1871.3346,-931.0156"/>
<text text-anchor="middle" x="1810.5" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_study</text>
</g>
<!-- case&#45;&gt;adverse_event -->
<g id="edge25" class="edge">
<title>case&#45;&gt;adverse_event</title>
<path fill="none" stroke="#000000" d="M1791.7365,-1097.7469C1924.776,-1081.391 2129.6523,-1051.9606 2217.1201,-1014.0289"/>
<polygon fill="#000000" stroke="#000000" points="2218.5831,-1017.2086 2226.2046,-1009.8489 2215.6571,-1010.8494 2218.5831,-1017.2086"/>
<text text-anchor="middle" x="2234" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">had_adverse_event</text>
</g>
<!-- case&#45;&gt;off_treatment -->
<g id="edge1" class="edge">
<title>case&#45;&gt;off_treatment</title>
<path fill="none" stroke="#000000" d="M1548.3634,-1090.1878C1519.5873,-1080.6636 1490.7031,-1066.8959 1468,-1047 1429.961,-1013.6646 1404.2982,-964.0318 1387.5709,-919.4868"/>
<polygon fill="#000000" stroke="#000000" points="1390.8499,-918.2622 1384.1359,-910.0662 1384.2734,-920.6602 1390.8499,-918.2622"/>
<text text-anchor="middle" x="1539" y="-1035.8" font-family="Times,serif" font-size="14.00" fill="#000000">went_off_treatment</text>
</g>
<!-- cohort -->
<g id="node28" class="node">
<title>cohort</title>
<path fill="none" stroke="#000000" d="M1735.5,-524.5C1735.5,-524.5 1968.5,-524.5 1968.5,-524.5 1974.5,-524.5 1980.5,-530.5 1980.5,-536.5 1980.5,-536.5 1980.5,-558.5 1980.5,-558.5 1980.5,-564.5 1974.5,-570.5 1968.5,-570.5 1968.5,-570.5 1735.5,-570.5 1735.5,-570.5 1729.5,-570.5 1723.5,-564.5 1723.5,-558.5 1723.5,-558.5 1723.5,-536.5 1723.5,-536.5 1723.5,-530.5 1729.5,-524.5 1735.5,-524.5"/>
<text text-anchor="middle" x="1755" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000">cohort</text>
<polyline fill="none" stroke="#000000" points="1786.5,-524.5 1786.5,-570.5 "/>
<text text-anchor="middle" x="1797" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1807.5,-524.5 1807.5,-570.5 "/>
<text text-anchor="middle" x="1883.5" y="-555.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_description</text>
<polyline fill="none" stroke="#000000" points="1807.5,-547.5 1959.5,-547.5 "/>
<text text-anchor="middle" x="1883.5" y="-532.3" font-family="Times,serif" font-size="14.00" fill="#000000">cohort_dose</text>
<polyline fill="none" stroke="#000000" points="1959.5,-524.5 1959.5,-570.5 "/>
<text text-anchor="middle" x="1970" y="-543.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- case&#45;&gt;cohort -->
<g id="edge36" class="edge">
<title>case&#45;&gt;cohort</title>
<path fill="none" stroke="#000000" d="M1664.6873,-1065.2623C1653.2633,-957.4932 1631.0881,-693.3611 1679,-622 1693.2416,-600.7883 1714.9038,-585.5848 1738.1308,-574.6979"/>
<polygon fill="#000000" stroke="#000000" points="1739.7132,-577.8253 1747.4496,-570.5866 1736.8876,-571.4209 1739.7132,-577.8253"/>
<text text-anchor="middle" x="1719.5" y="-814.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- study_site -->
<g id="node23" class="node">
<title>study_site</title>
<path fill="none" stroke="#000000" d="M1781.5,-403.5C1781.5,-403.5 2098.5,-403.5 2098.5,-403.5 2104.5,-403.5 2110.5,-409.5 2110.5,-415.5 2110.5,-415.5 2110.5,-460.5 2110.5,-460.5 2110.5,-466.5 2104.5,-472.5 2098.5,-472.5 2098.5,-472.5 1781.5,-472.5 1781.5,-472.5 1775.5,-472.5 1769.5,-466.5 1769.5,-460.5 1769.5,-460.5 1769.5,-415.5 1769.5,-415.5 1769.5,-409.5 1775.5,-403.5 1781.5,-403.5"/>
<text text-anchor="middle" x="1814.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">study_site</text>
<polyline fill="none" stroke="#000000" points="1859.5,-403.5 1859.5,-472.5 "/>
<text text-anchor="middle" x="1870" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="1880.5,-403.5 1880.5,-472.5 "/>
<text text-anchor="middle" x="1985" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">registering_institution</text>
<polyline fill="none" stroke="#000000" points="1880.5,-449.5 2089.5,-449.5 "/>
<text text-anchor="middle" x="1985" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">veterinary_medical_center</text>
<polyline fill="none" stroke="#000000" points="1880.5,-426.5 2089.5,-426.5 "/>
<text text-anchor="middle" x="1985" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">site_short_name</text>
<polyline fill="none" stroke="#000000" points="2089.5,-403.5 2089.5,-472.5 "/>
<text text-anchor="middle" x="2100" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- study_site&#45;&gt;study -->
<g id="edge26" class="edge">
<title>study_site&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1940,-403.3975C1940,-391.1328 1940,-376.6951 1940,-361.945"/>
<polygon fill="#000000" stroke="#000000" points="1943.5001,-361.7063 1940,-351.7063 1936.5001,-361.7064 1943.5001,-361.7063"/>
<text text-anchor="middle" x="1970.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- principal_investigator -->
<g id="node24" class="node">
<title>principal_investigator</title>
<path fill="none" stroke="#000000" d="M2140.5,-403.5C2140.5,-403.5 2467.5,-403.5 2467.5,-403.5 2473.5,-403.5 2479.5,-409.5 2479.5,-415.5 2479.5,-415.5 2479.5,-460.5 2479.5,-460.5 2479.5,-466.5 2473.5,-472.5 2467.5,-472.5 2467.5,-472.5 2140.5,-472.5 2140.5,-472.5 2134.5,-472.5 2128.5,-466.5 2128.5,-460.5 2128.5,-460.5 2128.5,-415.5 2128.5,-415.5 2128.5,-409.5 2134.5,-403.5 2140.5,-403.5"/>
<text text-anchor="middle" x="2215.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">principal_investigator</text>
<polyline fill="none" stroke="#000000" points="2302.5,-403.5 2302.5,-472.5 "/>
<text text-anchor="middle" x="2313" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2323.5,-403.5 2323.5,-472.5 "/>
<text text-anchor="middle" x="2391" y="-457.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_first_name</text>
<polyline fill="none" stroke="#000000" points="2323.5,-449.5 2458.5,-449.5 "/>
<text text-anchor="middle" x="2391" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_middle_initial</text>
<polyline fill="none" stroke="#000000" points="2323.5,-426.5 2458.5,-426.5 "/>
<text text-anchor="middle" x="2391" y="-411.3" font-family="Times,serif" font-size="14.00" fill="#000000">pi_last_name</text>
<polyline fill="none" stroke="#000000" points="2458.5,-403.5 2458.5,-472.5 "/>
<text text-anchor="middle" x="2469" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- principal_investigator&#45;&gt;study -->
<g id="edge27" class="edge">
<title>principal_investigator&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M2228.579,-403.3975C2191.6613,-386.46 2145.7101,-365.378 2101.4077,-345.0524"/>
<polygon fill="#000000" stroke="#000000" points="2102.8268,-341.8528 2092.2782,-340.8639 2099.9078,-348.2151 2102.8268,-341.8528"/>
<text text-anchor="middle" x="2216.5" y="-373.8" font-family="Times,serif" font-size="14.00" fill="#000000">of_study</text>
</g>
<!-- prior_surgery -->
<g id="node25" class="node">
<title>prior_surgery</title>
<path fill="none" stroke="#000000" d="M560,-1946C560,-1946 906,-1946 906,-1946 912,-1946 918,-1952 918,-1958 918,-1958 918,-2095 918,-2095 918,-2101 912,-2107 906,-2107 906,-2107 560,-2107 560,-2107 554,-2107 548,-2101 548,-2095 548,-2095 548,-1958 548,-1958 548,-1952 554,-1946 560,-1946"/>
<text text-anchor="middle" x="605.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_surgery</text>
<polyline fill="none" stroke="#000000" points="663,-1946 663,-2107 "/>
<text text-anchor="middle" x="673.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="684,-1946 684,-2107 "/>
<text text-anchor="middle" x="790.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">residual_disease</text>
<polyline fill="none" stroke="#000000" points="684,-2084 897,-2084 "/>
<text text-anchor="middle" x="790.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">anatomical_site_of_surgery</text>
<polyline fill="none" stroke="#000000" points="684,-2061 897,-2061 "/>
<text text-anchor="middle" x="790.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">therapeutic_indicator</text>
<polyline fill="none" stroke="#000000" points="684,-2038 897,-2038 "/>
<text text-anchor="middle" x="790.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_surgery</text>
<polyline fill="none" stroke="#000000" points="684,-2015 897,-2015 "/>
<text text-anchor="middle" x="790.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">procedure</text>
<polyline fill="none" stroke="#000000" points="684,-1992 897,-1992 "/>
<text text-anchor="middle" x="790.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="684,-1969 897,-1969 "/>
<text text-anchor="middle" x="790.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">surgical_finding</text>
<polyline fill="none" stroke="#000000" points="897,-1946 897,-2107 "/>
<text text-anchor="middle" x="907.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_surgery&#45;&gt;enrollment -->
<g id="edge23" class="edge">
<title>prior_surgery&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M766.5716,-1945.7682C796.754,-1873.1869 841.3918,-1765.8436 875.097,-1684.7907"/>
<polygon fill="#000000" stroke="#000000" points="878.3357,-1686.1175 878.9437,-1675.5401 871.8723,-1683.4296 878.3357,-1686.1175"/>
<text text-anchor="middle" x="917" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_surgery&#45;&gt;prior_surgery -->
<g id="edge6" class="edge">
<title>prior_surgery&#45;&gt;prior_surgery</title>
<path fill="none" stroke="#000000" d="M918.113,-2068.5585C929.2907,-2058.5547 936,-2044.5352 936,-2026.5 936,-2012.5509 931.9865,-2001.004 924.9962,-1991.8593"/>
<polygon fill="#000000" stroke="#000000" points="927.4806,-1989.3911 918.113,-1984.4415 922.3494,-1994.1525 927.4806,-1989.3911"/>
<text text-anchor="middle" x="952" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- disease_extent -->
<g id="node26" class="node">
<title>disease_extent</title>
<path fill="none" stroke="#000000" d="M2303,-1877C2303,-1877 2619,-1877 2619,-1877 2625,-1877 2631,-1883 2631,-1889 2631,-1889 2631,-2164 2631,-2164 2631,-2170 2625,-2176 2619,-2176 2619,-2176 2303,-2176 2303,-2176 2297,-2176 2291,-2170 2291,-2164 2291,-2164 2291,-1889 2291,-1889 2291,-1883 2297,-1877 2303,-1877"/>
<text text-anchor="middle" x="2352.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">disease_extent</text>
<polyline fill="none" stroke="#000000" points="2414,-1877 2414,-2176 "/>
<text text-anchor="middle" x="2424.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="2435,-1877 2435,-2176 "/>
<text text-anchor="middle" x="2522.5" y="-2160.8" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_evaluation</text>
<polyline fill="none" stroke="#000000" points="2435,-2153 2610,-2153 "/>
<text text-anchor="middle" x="2522.5" y="-2137.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_number</text>
<polyline fill="none" stroke="#000000" points="2435,-2130 2610,-2130 "/>
<text text-anchor="middle" x="2522.5" y="-2114.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_irradiated</text>
<polyline fill="none" stroke="#000000" points="2435,-2107 2610,-2107 "/>
<text text-anchor="middle" x="2522.5" y="-2091.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_number</text>
<polyline fill="none" stroke="#000000" points="2435,-2084 2610,-2084 "/>
<text text-anchor="middle" x="2522.5" y="-2068.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_description</text>
<polyline fill="none" stroke="#000000" points="2435,-2061 2610,-2061 "/>
<text text-anchor="middle" x="2522.5" y="-2045.8" font-family="Times,serif" font-size="14.00" fill="#000000">measurable_lesion</text>
<polyline fill="none" stroke="#000000" points="2435,-2038 2610,-2038 "/>
<text text-anchor="middle" x="2522.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">evaluation_code</text>
<polyline fill="none" stroke="#000000" points="2435,-2015 2610,-2015 "/>
<text text-anchor="middle" x="2522.5" y="-1999.8" font-family="Times,serif" font-size="14.00" fill="#000000">crf_id</text>
<polyline fill="none" stroke="#000000" points="2435,-1992 2610,-1992 "/>
<text text-anchor="middle" x="2522.5" y="-1976.8" font-family="Times,serif" font-size="14.00" fill="#000000">longest_measurement</text>
<polyline fill="none" stroke="#000000" points="2435,-1969 2610,-1969 "/>
<text text-anchor="middle" x="2522.5" y="-1953.8" font-family="Times,serif" font-size="14.00" fill="#000000">previously_treated</text>
<polyline fill="none" stroke="#000000" points="2435,-1946 2610,-1946 "/>
<text text-anchor="middle" x="2522.5" y="-1930.8" font-family="Times,serif" font-size="14.00" fill="#000000">lesion_site</text>
<polyline fill="none" stroke="#000000" points="2435,-1923 2610,-1923 "/>
<text text-anchor="middle" x="2522.5" y="-1907.8" font-family="Times,serif" font-size="14.00" fill="#000000">target_lesion</text>
<polyline fill="none" stroke="#000000" points="2435,-1900 2610,-1900 "/>
<text text-anchor="middle" x="2522.5" y="-1884.8" font-family="Times,serif" font-size="14.00" fill="#000000">measured_how</text>
<polyline fill="none" stroke="#000000" points="2610,-1877 2610,-2176 "/>
<text text-anchor="middle" x="2620.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- disease_extent&#45;&gt;visit -->
<g id="edge20" class="edge">
<title>disease_extent&#45;&gt;visit</title>
<path fill="none" stroke="#000000" d="M2381.7642,-1876.7782C2352.9334,-1827.2809 2318.4151,-1773.1136 2282,-1727 2244.2886,-1679.2448 2192.6336,-1631.4524 2158.5669,-1601.8242"/>
<polygon fill="#000000" stroke="#000000" points="2160.5857,-1598.9432 2150.729,-1595.058 2156.0115,-1604.242 2160.5857,-1598.9432"/>
<text text-anchor="middle" x="2294" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">on_visit</text>
</g>
<!-- prior_therapy -->
<g id="node27" class="node">
<title>prior_therapy</title>
<path fill="none" stroke="#000000" d="M12,-1727.5C12,-1727.5 468,-1727.5 468,-1727.5 474,-1727.5 480,-1733.5 480,-1739.5 480,-1739.5 480,-2313.5 480,-2313.5 480,-2319.5 474,-2325.5 468,-2325.5 468,-2325.5 12,-2325.5 12,-2325.5 6,-2325.5 0,-2319.5 0,-2313.5 0,-2313.5 0,-1739.5 0,-1739.5 0,-1733.5 6,-1727.5 12,-1727.5"/>
<text text-anchor="middle" x="57.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy</text>
<polyline fill="none" stroke="#000000" points="115,-1727.5 115,-2325.5 "/>
<text text-anchor="middle" x="125.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
<polyline fill="none" stroke="#000000" points="136,-1727.5 136,-2325.5 "/>
<text text-anchor="middle" x="297.5" y="-2310.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_first_dose</text>
<polyline fill="none" stroke="#000000" points="136,-2302.5 459,-2302.5 "/>
<text text-anchor="middle" x="297.5" y="-2287.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_steroid_exposure</text>
<polyline fill="none" stroke="#000000" points="136,-2279.5 459,-2279.5 "/>
<text text-anchor="middle" x="297.5" y="-2264.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_any_therapy</text>
<polyline fill="none" stroke="#000000" points="136,-2256.5 459,-2256.5 "/>
<text text-anchor="middle" x="297.5" y="-2241.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_name</text>
<polyline fill="none" stroke="#000000" points="136,-2233.5 459,-2233.5 "/>
<text text-anchor="middle" x="297.5" y="-2218.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_nsaid</text>
<polyline fill="none" stroke="#000000" points="136,-2210.5 459,-2210.5 "/>
<text text-anchor="middle" x="297.5" y="-2195.3" font-family="Times,serif" font-size="14.00" fill="#000000">nonresponse_therapy_type</text>
<polyline fill="none" stroke="#000000" points="136,-2187.5 459,-2187.5 "/>
<text text-anchor="middle" x="297.5" y="-2172.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_any_therapy</text>
<polyline fill="none" stroke="#000000" points="136,-2164.5 459,-2164.5 "/>
<text text-anchor="middle" x="297.5" y="-2149.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose</text>
<polyline fill="none" stroke="#000000" points="136,-2141.5 459,-2141.5 "/>
<text text-anchor="middle" x="297.5" y="-2126.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_steroid</text>
<polyline fill="none" stroke="#000000" points="136,-2118.5 459,-2118.5 "/>
<text text-anchor="middle" x="297.5" y="-2103.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_steroid</text>
<polyline fill="none" stroke="#000000" points="136,-2095.5 459,-2095.5 "/>
<text text-anchor="middle" x="297.5" y="-2080.3" font-family="Times,serif" font-size="14.00" fill="#000000">number_of_prior_regimens_any_therapy</text>
<polyline fill="none" stroke="#000000" points="136,-2072.5 459,-2072.5 "/>
<text text-anchor="middle" x="297.5" y="-2057.3" font-family="Times,serif" font-size="14.00" fill="#000000">min_rsdl_dz_tx_ind_nsaids_treatment_pe</text>
<polyline fill="none" stroke="#000000" points="136,-2049.5 459,-2049.5 "/>
<text text-anchor="middle" x="297.5" y="-2034.3" font-family="Times,serif" font-size="14.00" fill="#000000">any_therapy</text>
<polyline fill="none" stroke="#000000" points="136,-2026.5 459,-2026.5 "/>
<text text-anchor="middle" x="297.5" y="-2011.3" font-family="Times,serif" font-size="14.00" fill="#000000">dose_schedule</text>
<polyline fill="none" stroke="#000000" points="136,-2003.5 459,-2003.5 "/>
<text text-anchor="middle" x="297.5" y="-1988.3" font-family="Times,serif" font-size="14.00" fill="#000000">tx_loc_geo_loc_ind_nsaid</text>
<polyline fill="none" stroke="#000000" points="136,-1980.5 459,-1980.5 "/>
<text text-anchor="middle" x="297.5" y="-1965.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_at_site</text>
<polyline fill="none" stroke="#000000" points="136,-1957.5 459,-1957.5 "/>
<text text-anchor="middle" x="297.5" y="-1942.3" font-family="Times,serif" font-size="14.00" fill="#000000">therapy_type</text>
<polyline fill="none" stroke="#000000" points="136,-1934.5 459,-1934.5 "/>
<text text-anchor="middle" x="297.5" y="-1919.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_nsaid_exposure</text>
<polyline fill="none" stroke="#000000" points="136,-1911.5 459,-1911.5 "/>
<text text-anchor="middle" x="297.5" y="-1896.3" font-family="Times,serif" font-size="14.00" fill="#000000">treatment_performed_in_minimal_residual</text>
<polyline fill="none" stroke="#000000" points="136,-1888.5 459,-1888.5 "/>
<text text-anchor="middle" x="297.5" y="-1873.3" font-family="Times,serif" font-size="14.00" fill="#000000">prior_therapy_type</text>
<polyline fill="none" stroke="#000000" points="136,-1865.5 459,-1865.5 "/>
<text text-anchor="middle" x="297.5" y="-1850.3" font-family="Times,serif" font-size="14.00" fill="#000000">best_response</text>
<polyline fill="none" stroke="#000000" points="136,-1842.5 459,-1842.5 "/>
<text text-anchor="middle" x="297.5" y="-1827.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_dose</text>
<polyline fill="none" stroke="#000000" points="136,-1819.5 459,-1819.5 "/>
<text text-anchor="middle" x="297.5" y="-1804.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_nsaid</text>
<polyline fill="none" stroke="#000000" points="136,-1796.5 459,-1796.5 "/>
<text text-anchor="middle" x="297.5" y="-1781.3" font-family="Times,serif" font-size="14.00" fill="#000000">agent_units_of_measure</text>
<polyline fill="none" stroke="#000000" points="136,-1773.5 459,-1773.5 "/>
<text text-anchor="middle" x="297.5" y="-1758.3" font-family="Times,serif" font-size="14.00" fill="#000000">date_of_last_dose_nsaid</text>
<polyline fill="none" stroke="#000000" points="136,-1750.5 459,-1750.5 "/>
<text text-anchor="middle" x="297.5" y="-1735.3" font-family="Times,serif" font-size="14.00" fill="#000000">total_number_of_doses_steroid</text>
<polyline fill="none" stroke="#000000" points="459,-1727.5 459,-2325.5 "/>
<text text-anchor="middle" x="469.5" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000"> </text>
</g>
<!-- prior_therapy&#45;&gt;enrollment -->
<g id="edge22" class="edge">
<title>prior_therapy&#45;&gt;enrollment</title>
<path fill="none" stroke="#000000" d="M480.2562,-1770.4245C499.4289,-1754.8643 519.0972,-1740.1936 539,-1727 595.8688,-1689.3015 663.3516,-1658.219 725.7103,-1634.0405"/>
<polygon fill="#000000" stroke="#000000" points="727.189,-1637.222 735.2712,-1630.3715 724.681,-1630.6867 727.189,-1637.222"/>
<text text-anchor="middle" x="637" y="-1697.8" font-family="Times,serif" font-size="14.00" fill="#000000">at_enrollment</text>
</g>
<!-- prior_therapy&#45;&gt;prior_therapy -->
<g id="edge5" class="edge">
<title>prior_therapy&#45;&gt;prior_therapy</title>
<path fill="none" stroke="#000000" d="M480.2384,-2064.6912C491.4387,-2055.0507 498,-2042.3203 498,-2026.5 498,-2014.3876 494.1539,-2004.0864 487.3244,-1995.5965"/>
<polygon fill="#000000" stroke="#000000" points="489.719,-1993.0385 480.2384,-1988.3088 484.7002,-1997.9183 489.719,-1993.0385"/>
<text text-anchor="middle" x="514" y="-2022.8" font-family="Times,serif" font-size="14.00" fill="#000000">next</text>
</g>
<!-- cohort&#45;&gt;study -->
<g id="edge41" class="edge">
<title>cohort&#45;&gt;study</title>
<path fill="none" stroke="#000000" d="M1746.7131,-524.4145C1720.2069,-513.3533 1694.8206,-497.0381 1679,-473 1661.8963,-447.0123 1662.7047,-429.5021 1679,-403 1701.9604,-365.658 1739.116,-338.4902 1778.2819,-318.8812"/>
<polygon fill="#000000" stroke="#000000" points="1780.2557,-321.8145 1787.734,-314.3095 1777.2077,-315.5129 1780.2557,-321.8145"/>
<text text-anchor="middle" x="1719.5" y="-434.3" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
<!-- cohort&#45;&gt;study_arm -->
<g id="edge37" class="edge">
<title>cohort&#45;&gt;study_arm</title>
<path fill="none" stroke="#000000" d="M1980.6705,-534.4623C2109.5174,-520.934 2313.3507,-498.248 2489,-473 2510.4616,-469.9151 2533.1351,-466.3515 2555.2708,-462.7036"/>
<polygon fill="#000000" stroke="#000000" points="2556.1051,-466.1131 2565.3971,-461.023 2554.959,-459.2075 2556.1051,-466.1131"/>
<text text-anchor="middle" x="2389.5" y="-494.8" font-family="Times,serif" font-size="14.00" fill="#000000">member_of</text>
</g>
</g>
</svg>
</div>
