# Data Model Owner's Guide

This guide provides information for data commons owners who manage model definitions and need to understand how models are utilized in the CRDC Submission Portal.

## Model Display in the CRDC Submission Portal

The CRDC Submission Portal displays data models through the Data Model Navigator (DMN) component. This visualization tool renders models as interactive diagrams that allow users to explore nodes, properties, and relationships.

### Repository Structure

Data model files are maintained in a central GitHub repository (`CBIIT/crdc-datahub-models`). The repository contains:

- A catalog file (content.json) listing all available models and versions
- Dedicated directories for each data commons (ICDC, CDS, etc.)
- Version-specific folders containing model definition files

When the portal accesses a model, files are loaded directly from this repository structure.

### Essential Model Files

Model owners should be familiar with the following files:

1. **Model Definition Files** (typically YAML format):
   - Define the model structure, nodes, and relationships
   - Specify property types, requirements, and constraints
   - Include descriptions and examples

2. **Documentation Files**:
   - README.md: Provides model overview
   - Release notes: Document version changes

3. **Configuration Files**:
   - Control model appearance in the Navigator
   - Define filtering categories and navigation options
   - Specify display preferences and icons

## Data Model Versioning Guidelines

As models evolve, consistent versioning practices ensure compatibility with existing data and systems.

### Semantic Versioning Framework

Data models follow the semantic versioning pattern (X.Y.Z):

- **X (MAJOR)**: Incremented for incompatible changes
- **Y (MINOR)**: Incremented for backward-compatible additions
- **Z (PATCH)**: Incremented for backward-compatible fixes

Example progression: 1.0.0 → 1.1.0 → 1.1.1 → 2.0.0

### Change Classification

#### Breaking Changes (MAJOR Version Increment)

Changes that may invalidate existing data or disrupt integrations:

- **Removal of required properties**: Results in missing mandatory fields
- **Property type changes**: Type conversions (e.g., string to number) invalidate existing values
- **Node/entity removal**: Orphans existing data
- **Relationship constraint increases**: Making optional relationships required
- **Enumeration value removal**: Eliminating previously valid values
- **Property semantic redefinition**: Changing what a property represents

#### Non-Breaking Changes (MINOR Version Increment)

Changes that maintain compatibility with existing data:

- **Addition of optional properties**: No impact on existing records
- **Addition of nodes/entities**: Expands the model without disrupting existing components
- **Creation of optional relationships**: Adds functionality without requiring changes
- **Enumeration value expansion**: Adding new options while retaining existing ones
- **Constraint relaxation**: Converting required fields to optional
- **Feature deprecation**: Marking for future removal while maintaining support

#### Documentation Updates (PATCH Version Increment)

Changes that do not affect schema structure:

- **Description improvements**: Clarification without requirement changes
- **Documentation corrections**: Fixing typos or unclear explanations
- **Example additions**: Providing sample values without changing validation
- **Metadata enhancements**: Adding contextual information

### Model Evolution Best Practices

1. **Extension-oriented design**: Anticipate future additions in initial design
2. **Deprecation before removal**: Signal intention to remove features in future versions
3. **Logical change grouping**: Bundle related changes in version updates
4. **Comprehensive documentation**: Describe changes and rationale
5. **Migration guidance**: Provide instructions for adapting to breaking changes

### Version Publication Process

The publication of new model versions is fully automated through the GitHub action process. Data commons teams only need to:

1. Create a new version directory in the data model repository with updated model files
2. Ensure the YAML file contains the correct version number
3. For production releases, create a git tag with a matching semantic version number
4. Include comprehensive release notes in the repository

The GitHub action will automatically:
- Detect the new version (from pre-release branch or release tag)
- Update the catalog file to include the new version
- Propagate changes to the appropriate environments
- Make the version available in the Data Hub

## Automated Model Updates with GitHub Actions

The CRDC Data Hub uses a GitHub action to automatically synchronize with the latest data model versions. This automated process ensures that data models are kept up-to-date across environments.

### How the GitHub Action Works

The GitHub action runs periodically and performs the following tasks:

1. Updates submodules to the latest upstream data model repository
2. Reads the versions of data models and compares them with previous versions stored in the metadata file (cache/content.json)
3. Updates the cache if a new version is found

### Environment Synchronization Strategy

The GitHub action follows different strategies for different environments:

#### Production and Stage Environments

- Syncs with the latest release tags of upstream data model repositories
- A release tag is a git tag with a version number format: `<major>.<minor>.<patch>` (e.g., "1.0.0" or "4.1.2")
- Data Hub assumes the tag with the largest number is the latest release
- **Important**: Data Hub uses the version defined in the YAML file instead of the tag name, so it's highly recommended to maintain consistent version numbers between the YAML definition and the tag name

#### Lower Tier Environments (DEV, DEV2, QA, QA2)

- Pulls the latest pre-release branch (development branch) of upstream data model repositories
- The pre-release branch name is determined by the data commons team (e.g., CDS uses "development", CTDC uses "develop")
- This approach gives Data Hub an opportunity to test upcoming data model changes before they're formally released

### Best Practices for Pre-Release Branches

1. Maintain a long-term pre-release branch for all future releases rather than creating new pre-release branches for each version
2. When working on multiple release versions:
   - Keep the upcoming release in the long-term pre-release branch
   - Create separate branches for future releases
   - Once the upcoming version is released, merge the next version into the long-term pre-release branch
3. Only place "ready for testing" model changes in the pre-release branch to allow Data Hub to identify potential issues in lower environments

## Implementation Workflow

The automated GitHub action described above is the **only workflow** for implementing model updates in the CRDC Data Hub. All model updates must follow this process to be properly integrated across environments.

### Implementation Steps

When making model changes, data commons teams should:

1. **Determine the appropriate version increment** based on the nature of changes:
   - MAJOR version: Breaking changes
   - MINOR version: Non-breaking additions
   - PATCH version: Documentation updates

2. **Make changes in the appropriate branch**:
   - For immediate testing in lower environments: Update the pre-release branch
   - For production releases: Create a release tag using semantic versioning

3. **Update version information**:
   - Ensure the YAML file version matches the git tag version
   - Document changes thoroughly in release notes

4. **Rely on the automated process**:
   - The GitHub action will detect and propagate changes
   - No manual updates to the Data Hub are needed or supported

### Example Scenarios

#### Scenario 1: Property Addition (MINOR change)
- Update model in pre-release branch with version 1.1.0 (from 1.0.0)
- The GitHub action automatically updates lower environments
- When ready for production, create a "1.1.0" tag
- The GitHub action automatically updates stage and production environments

#### Scenario 2: Breaking Changes (MAJOR change)
- Update model in pre-release branch with version 2.0.0 (from 1.x.x)
- Test thoroughly in lower environments through automated updates
- When ready for production, create a "2.0.0" tag
- The GitHub action propagates to production environments

#### Scenario 3: Documentation Update (PATCH change)
- Update documentation in pre-release branch with version 1.0.1
- For urgent documentation fixes, you may create a "1.0.1" tag directly
- The GitHub action handles the propagation to all environments

## Conclusion

Data commons model owners play a critical role in model evolution while ensuring compatibility with existing systems and data. Following these versioning guidelines and understanding the automated update process allows for model improvements while minimizing disruption to users and their data.

For assistance with model changes or versioning questions, contact the CRDC Data Hub team.