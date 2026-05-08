## Release Notes - Integrated Canine Data Commons (ICDC)
### Data Model version 2.1.0
Release Date 05/8/26

This minor version release adds the study_accession property to the ICDC data model and finalizes the caDSR code mapping for the Consent Group node.

### Data Model version 2.0.0
Release Date: 03/10/26  

This major version release includes a breaking change to the Case node's key property name, introduces a new system-generated key for the Registration node, updates the publications-to-studies relationship cardinality, and improves documentation for record ID properties across the model. Speficially, this release:

- Reverts the "case_record_id" property back to simply "case_id"
- Adds a system-generated "registration_record_id" property which now acts as the registration node's key property instead of the "registration_id" property
- Changes the cardinality of the relationship between publications and studies from many-to-one to many-to-many
- Updates, clarifies or corrects the descriptions pertaining to multiple node ID properties, most notably those with names ending in "_record_id" 

### Data Model version 1.3.0
Release Date: 12/23/2025
- Adds Common Data Elements (CDEs) for the Program and Study nodes
- Adds relationship for Consent Group node

### Data Model version 1.2.0
Release Date: 12/22/2025
- Adds new Consent Group node and properties

### Data Model version 1.1.0
Release Date: 12/1/2025
- Add permissible values for sample_site property.

### Data Model version 1.0.0
Release Date: 10/23/2025
- First official release of data model with semantic versioning.
