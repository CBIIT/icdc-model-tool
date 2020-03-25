# ICDC Model Mapping to [BRIDG](https://bridgmodel.nci.nih.gov/)

The [ICDC graph model](../model-desc) -- nodes, relationships, and properties -- has
been mapped manually to the standardized conceptual model called [BRIDG](https://bridgmodel.nci.nih.gov/) by Wendy Verhoeff. The detailed mapping is found in [this Excel spreadsheet](./ICDC Cross-Mapping of Data Sources and Standards - 20200110.xlsx).

## Graphics

The SVG images in this directory are a visual representation of that mapping. One way to view these at full size is to click on the SVG in the repository. When the small rendering appears in the GitHub UI, right-click on that rendering and select "View Image". Note that you will need to scroll in the image viewer to see the content.

* The vertices (rounded boxes) represent BRIDG Classes (nodes and relationships) or BRIDG Attributes (properties)
  * Labels on the left side of the vertices are BRIDG terms
  * Labels on the right side are ICDC model local terms
  * <span style="color:red">Red vertices</span> are BRIDG Classes representing unitary concepts (i.e., nodes)
  * <span style="color:blue">Blue vertices</span> are BRIDG Classes representing relationships
  * <span style="color:green">Green vertices</span> are BRIDG Attributes representing properties. 
  
* The edges indicate different kinds of links:
  * Thin solid edges indicate named BRIDG associations between classes
  * Bold solid edges indicate is_a links (BRIDG generalizations)
  * Dashed edges link entities to their properties (BRIDG attributes)
  * Dotted edges link association entities to source and destination classes

## Points of note

* WIP

 
