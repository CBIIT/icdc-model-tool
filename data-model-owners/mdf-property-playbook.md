# MDF Property Playbook

**Audience:** anyone writing or reviewing property definitions in a CRDC model description file (MDF).
**Scope:** CRDC-wide. Kept identical in `CBIIT/ctdc-model` and `CBIIT/icdc-model-tool`; update both copies together.
**Verified against:** `CBIIT/bento-mdf` 0.13.6 (schema and reader, October 2026) and `CBIIT/bento-meta` 0.3.3. Every example in this playbook was parsed with those versions; every anti-pattern in Section 11 was tested to show which tool catches it.

## How this fits with the other owner documents

| Document | Answers |
|---|---|
| [Owner's Guide](./owner-guide.md) | What happens to the model after you merge or tag it, and which list validates a submission (Section 6) |
| [Contribution SOP](./contribution-sop.md) | The steps to make and release a change |
| [Versioning Rulebook](./versioning-rulebook.md) | Whether a change is MAJOR, MINOR, or PATCH |
| **MDF Property Playbook** (this file) | How to write a correct property block |

---

## 0. Which pattern do I need?

| I want the property to hold... | Use | Section |
|---|---|---|
| An identifier or free text | `Type: string` | 4.1 |
| A whole number, decimal, true/false, date, or link | `Type: integer`, `number`, `boolean`, `datetime`, `url` | 4.1 |
| A measurement with units | `Type: {value_type, units}` | 4.2 |
| Text that must match a format | `Type: {pattern}` | 4.3 |
| One value from a list **we** maintain | `Enum:` with literal values | 5.1 |
| One value from a list we maintain, with codes and definitions per value | `Enum:` plus a `Terms:` section | 5.2 |
| One value from a list kept in a separate file | `Enum:` with one path or URL | 5.3 |
| One value from a **caDSR CDE's** permissible values | `Term:` binding plus `Type: string` (today), or an EDP reference (once adopted) | 6.2, 8.2 |
| One value from a **shared CRDC value set** | EDP reference | 8.2 |
| Several values per record | `Type: {value_type: list, ...}` around any of the above | 4.4 |
| Standard null values ("Unknown", "Not Reported") alongside a CDE | `useNullCDE: Yes` inside the caDSR `Term:` entry | 7 |
| To define a shared CRDC value set | EDP definition (`Ext: true`) | 8.3 |

---

## 1. Anatomy of a property block

A property is defined once under `PropDefinitions:`, and attached to a node by listing its name under that node's `Props:` in the model file.

```yaml
PropDefinitions:
  age_at_enrollment:                       # property handle: snake_case
    Desc: Age of the participant, in days, on the date of enrollment.
    Src: Data Submitter                    # who supplies the value (free text)
    Type:                                  # exactly one of Type: or Enum:
      value_type: integer
      units:
        - days
    Req: 'Yes'                             # 'Yes' | 'No' | Preferred
    Term:                                  # what the property MEANS (list)
      - Origin: caDSR
        Code: '15742605'
        Value: Person Enrollment Age Day Count
        Version: '1.00'
        Tags:
          Provenance: CTDC
          Added: 10-15-26
```

### Key reference

| Key | Required? | Allowed values | Default | What reads it |
|---|---|---|---|---|
| `Desc` | Recommended | Text | none | Navigator, submission templates |
| `Src` | No | Free text (`Data Submitter`, `Data Hub`, ...) | none | People; some templates |
| `Type` | **Exactly one of `Type` or `Enum`** | A type spec (Section 4) | none | Schema, reader, MDB, Portal |
| `Enum` | **Exactly one of `Type` or `Enum`** | A value list, one path or URL, or one term reference (Sections 5, 8) | none | Schema, reader, MDB, Portal |
| `Req` | Recommended: always declare it | `'Yes'`, `'No'`, `Preferred`, or a boolean | not required | Portal validation, templates |
| `Term` | No (but nearly every CRDC property has one) | List of term entries (Section 6) | none | MDB, STS, Portal |
| `Key` | No | Boolean | `false` | Loaders: marks a unique identifier |
| `Nul` | No | Boolean | `false` | Recorded in MDB; whether null is a valid value |
| `Strict` | No | Boolean | `true` | Validation hint: `false` means do not fail on values outside the `Enum` |
| `Deprecated` | No | Boolean | `false` | Recorded in MDB; pair it with `Desc` text (Rulebook, Section 7) |
| `Ext` | Only on EDP definitions | `true` | `false` | Reader: marks an EDP definition (Section 8.3) |
| `Tags` | No | Map of scalar values | none | Downstream tools that look for a specific tag |

Keys the schema does not define (for example `Private:` in some CRDC models) are allowed but ignored by the reader. Do not invent keys expecting them to do something.

**Before relying on `Nul`, `Strict`, or `Deprecated` to change submission behavior, confirm with the Data Hub team that the Portal reads them.** The tooling stores them; the playbook cannot verify what the Portal does with them.

### Conventions

* *Handles*: lowercase snake_case. The schema allows `[A-Za-z0-9_.]`, but the dot is reserved for qualified names (below).
* *Key order*: `Desc`, `Src`, `Type` or `Enum`, `Req`, other flags, then `Term`. The order does not matter to the parser; a consistent order makes diffs and reviews easier.
* *Every property declares `Req:`*, even when it is `'No'`.

### One handle, two definitions: qualified names

When two nodes need a property with the same handle but different definitions, prefix the key with the node:

```yaml
  specimen.best_response:
    Desc: Pathologic response observed in the specimen.
    Enum:
      - Complete
      - Partial
      - None
    Req: 'No'
  therapy.best_response:
    Desc: Best overall response to the therapy.
    Type: string
    Req: Preferred
```

Both nodes still list plain `best_response` under `Props:`. A qualified key takes precedence over an unqualified one for that node.

### Every definition must be used

A definition that no node or relationship lists under `Props:` is an error (`No properties in model corresponding to the following PropDefintions`). The only exception is an EDP definition (Section 8.3).

---

## 2. YAML typing rules that bite

YAML guesses types. These guesses silently change what the model says:

| Write | Not | Because |
|---|---|---|
| `Code: '2192217'` | `Code: 2192217` | The schema requires a string. Unquoted, it is a number and fails validation |
| `Version: '1.00'` | `Version: 1.00` | Unquoted, `1.00` becomes the number `1.0`, a different version string |
| `Req: 'Yes'` | `Req: Yes` | Unquoted `Yes` is the boolean `true`. It validates, but quoting keeps the three values (`'Yes'`, `'No'`, `Preferred`) consistent |
| `- 'Yes'` in an `Enum:` | `- Yes` | Unquoted `Yes` and `No` are booleans; the schema rejects them, and the reader stores them as the strings `True` and `False` |
| `Desc: 'Deprecated: use participant_id'` | `Desc: Deprecated: use participant_id` | A colon followed by a space inside an unquoted value is a YAML syntax error. Also quote values containing ` #`, with leading or trailing spaces, or starting with `/`, `*`, `&`, `!`, `%`, `@` |

`None` unquoted is the string `"None"` (YAML null is `null` or `~`), so it is safe as an enum value.

---

## 3. Where values are checked

Two layers check a property block, and they catch different mistakes:

| Layer | Runs when | Catches |
|---|---|---|
| **Schema** (`mdf-schema.yaml`, via `test_mdf` and CI) | On every PR, and locally (SOP, Section 8) | Shape errors: missing `Type`/`Enum`, both present, unquoted codes, bad `Req` values, malformed units or lists, incomplete term references |
| **Reader** (`bento_mdf.MDFReader`, used to load MDB) | When the model is loaded into MDB | Meaning errors: term entries without `Value`, unused definitions, broken enum file references, incomplete EDP definitions |

Some mistakes pass both (Section 11). Those are the ones reviewers must catch.

---

## 4. Value types

### 4.1 Simple scalars

```yaml
  participant_id:
    Desc: Unique identifier for the participant, assigned by the submitting study.
    Type: string
    Key: true
    Req: 'Yes'

  year_of_birth:
    Desc: Four-digit year of birth.
    Type: integer
    Req: Preferred

  specimen_count:
    Type: number          # any decimal
  is_deceased:
    Type: boolean
  consent_date:
    Type: datetime
  publication_url:
    Type: url
```

The full scalar set is `string`, `integer`, `number`, `boolean`, `datetime`, `url`, and `TBD`. `TBD` is a placeholder that passes the schema; never release it.

### 4.2 Numbers with units

`units` is **always a list**, even with one unit:

```yaml
  age_at_enrollment:
    Type:
      value_type: integer        # integer or number only
      units:
        - days

  weight:
    Type:
      value_type: number
      units:
        - kg
        - lb
```

Changing the unit is a `Type` change: MAJOR (Rulebook, Section 4.2), even when the number of values does not change.

### 4.3 Pattern match

```yaml
  dbgap_accession:
    Desc: dbGaP study accession, for example phs002790.
    Type:
      pattern: '^phs\d{6}$'
    Req: Preferred
```

Quote the pattern with single quotes so backslashes survive. Anchor it with `^` and `$`.

### 4.4 Lists (multiple values per record)

Wrap any item type in `value_type: list`. Use **either** `item_type:` **or** `Enum:` inside the list, never both:

```yaml
  # List of free text
  alternate_ids:
    Type:
      value_type: list
      item_type: string

  # List drawn from a model-maintained value list
  study_arm_label:
    Type:
      value_type: list
      Enum:
        - Arm A
        - Arm B

  # List drawn from a file or an EDP: item_type takes the same forms as Enum
  race:
    Type:
      value_type: list
      item_type:
        - Origin: caDSR
          Code: '2192199'
          Value: Race Category Text
          Version: '1.00'
```

How multiple values are separated in submission files is a Portal setting per commons (`list-delimiter`; see the Owner's Guide, Section 7), not part of the property block.

---

## 5. Enumerations the model maintains

### 5.1 Literal value list

```yaml
  program_short_name:
    Desc: Short name of the program.
    Enum:
      - CMB
      - CIMAC-CIDC
      - Not Applicable
    Req: 'Yes'
```

Each string becomes a term whose origin is the model itself. If the property has no live CDE binding, **this list is what the Portal validates against**, so every removal, comment-out, or respelling is MAJOR (Rulebook, Section 5).

`Enum:` is shorthand for a list type; do not also write `Type:`. The MDF schema requires exactly one of the two.

### 5.2 Value list with per-value codes: the `Terms:` section

To give individual values their own code and definition, add a top-level `Terms:` section (usually in a separate terms file). Each `Enum:` string is looked up as a `Terms:` key; values with no entry stay model-defined:

```yaml
PropDefinitions:
  sample_site:
    Enum:
      - Bone
      - Lymph node
      - Skin

Terms:
  Lymph node:
    Origin: NCIt
    Code: C12745
    Version: '25.06d'
    Value: Lymph node
    Definition: A secondary lymphoid organ along lymphatic vessels.
```

Every `Terms:` entry needs `Value` and `Origin`. If more than one entry matches an `Enum:` string, the reader uses the first and warns.

### 5.3 Value list kept in a separate file

An `Enum:` (or list `item_type:`) with **exactly one** string that starts with `/` or a URL scheme is a reference, not a value:

```yaml
  sample_site:
    Enum:
      - /model-desc/enums/sample_site.yml
```

The referenced file holds a `PropDefinitions:` entry whose key matches the property handle, plus an optional `Terms:` section:

```yaml
# model-desc/enums/sample_site.yml
PropDefinitions:
  sample_site:
    - Bone
    - Lymph node
    - Skin
Terms:
  Lymph node:
    Origin: NCIt
    Code: C12745
    Version: '25.06d'
    Value: Lymph node
```

* *Paths* resolve relative to the directory the tool runs from, not the model file.
* *URLs* (`https://...`) are fetched when the model is read. Pin GitHub URLs to a commit, not a branch, or the value list can change under a released version.
* *Publication*: anything under `model-desc/` is published by the Data Hub sync (Owner's Guide, Section 5). Agree on a location with the Data Hub team before adding enum files.

The single-string rule is a trap in reverse: a one-value enum whose only value starts with `/` is read as a file path. Quote it differently or add a second value.

---

## 6. Term annotations: what a property means

### 6.1 The term entry

`Term:` is a **list**. Each entry describes one concept the property represents:

| Key | Required? | Notes |
|---|---|---|
| `Value` | **Yes** (schema and reader) | The concept's name in its authority, for example the CDE long name |
| `Origin` | **Yes** (schema) | Authority abbreviation: `caDSR`, `NCIt`, `CRDC`, `DICOM`, ... |
| `Code` | For caDSR bindings | Quoted string. The caDSR public ID, NCIt C-code, or other identifier |
| `Version` | For caDSR bindings | Quoted string. The CDE version |
| `Definition` | No | The authority's definition |
| `Handle` | No | Defaults to the `Value` |
| `Tags` | No | Provenance and similar notes; human-read |
| `useNullCDE` | No; caDSR only | Section 7 |

Other keys (for example `Original Source: NCI Std`, seen in some CRDC models) pass the schema and are ignored.

### 6.2 Binding a caDSR CDE

```yaml
  ethnicity:
    Desc: Ethnicity of the participant.
    Type: string
    Req: 'Yes'
    Term:
      - Origin: caDSR
        Code: '2192217'
        Value: Ethnic Group Category Text
        Version: '2.0'
```

What a binding does at submission time (Owner's Guide, Section 6):

* *Enumerated CDE*: the Portal validates against the CDE's permissible values. Any `Enum:` on the property is ignored for validation but still shown in the Navigator.
* *Non-enumerated CDE* (free text, numbers, dates, or URL-placeholder values): only the `Type:` constrains values, or the model `Enum:` if one is present.

**Recommended form for an enumerated CDE today: `Term:` plus `Type: string`, with no `Enum:`.** An `Enum:` next to an enumerated CDE is display-only and drifts from what actually validates. That is why CTDC 3.4.1 commented out 47 of them.

### 6.3 More than one term

List each concept. The first `caDSR` entry is the binding the tooling uses for null values (Section 7):

```yaml
    Term:
      - Origin: caDSR
        Code: '14644131'
        Value: Imaging Technique Inversion Time Float Number
        Version: '1.00'
      - Origin: DICOM
        Code: '0018,0082'
        Value: inversion_time
```

### 6.4 Provenance tags

```yaml
      - Origin: caDSR
        Code: '7063755'
        Value: Procedure Domain Radiation Therapy Administration Extent
        Version: '1'
        Tags:
          Provenance: CMB
          Added: 05-29-24
```

### 6.5 Disabling a binding

Comment out the **whole** `Term:` entry, or at least `Code:` and `Version:` together, and record why in `Desc`:

```yaml
  occupation:
    Desc: Occupation of the participant. CDE binding disabled pending re-binding.
    Type: string
    Req: 'No'
    # Term:
    #   - Origin: caDSR
    #     Code: '5004400'
    #     Value: Person Occupation Text
    #     Version: '1.00'
```

Disabling a binding changes which list validates. Classify it with the Rulebook (Section 4.4) before merging, and run the coverage check if an `Enum:` takes over.

### 6.6 Never release `Code: 'TBD'`

It passes the schema (it is a string), but MDB cannot resolve it, so validation for that property fails. Bind a real CDE or leave the `Term:` out.

---

## 7. Null CDEs: `useNullCDE`

`useNullCDE: Yes` tells the CRDC tooling to accept the standard caDSR null values (such as "Unknown" and "Not Reported") for the property, in addition to its own permissible values.

```yaml
  ethnicity:
    Type: string
    Req: 'Yes'
    Term:
      - Origin: caDSR
        Code: '2192217'
        Value: Ethnic Group Category Text
        Version: '2.0'
        useNullCDE: Yes          # inside the caDSR term entry
```

Placement rules, verified against the reader:

| Placement | Result |
|---|---|
| Inside a `Term:` entry with `Origin: caDSR` | **Works.** Recorded in MDB as a `useNullCDE` tag on the property |
| At the property level (`useNullCDE:` next to `Req:`) | **Silently ignored.** Passes the schema; no tag is created. At least one live CRDC model has this form |
| Inside a term entry with any other `Origin` | **Silently ignored** |
| On more than one caDSR entry | Only the **first** caDSR entry's flag counts |

Write the value as unquoted `Yes` or `No`, as the bento-mdf samples do. Omitting the key is the same as `No`.

Things to know before using it:

* *Exact null values*: which null values are added is decided by the Portal's permissible-value loader, not by the MDF tooling. Confirm the current list with the Data Hub team before telling submitters what they can send.
* *On a property with no live `Code:`*: the reader still records the tag as long as the entry's `Origin` is `caDSR` (CTDC's `primary_diagnosis_disease_group` is in this state). Confirm with the Data Hub team whether the Portal adds null values to a model `Enum:` in that case; if it does not, put the null values in the `Enum:` explicitly.
* *Versioning*: adding `useNullCDE` is MINOR; removing it is MAJOR (Rulebook, Section 4.4).

---

## 8. EDPs: extended definition properties

### 8.1 What they are

An EDP lets a property **take its permissible values from a named, versioned value set by reference**, instead of copying the values into the model. There are two halves:

| Half | Syntax | Purpose |
|---|---|---|
| **EDP reference** | An `Enum:` (or list `item_type:`) containing exactly one term entry with `Origin`, `Code`, and `Version` | "This property's values are whatever value set this identifier names" |
| **EDP definition** | A `PropDefinitions:` entry with `Ext: true`, a `Term:`, and an explicit `Enum:` | Defines a new CRDC value set that references can point to |

A reference can point to a caDSR CDE (the CDE's permissible values become the value set) or to a CRDC-defined EDP. When the model is loaded into MDB with EDP resolution on, the reader fetches the values from STS at `/edp/<Origin>/<Code>/<Version>/terms`.

The difference from a plain `Term:` binding: **`Term:` says what the property means. An EDP reference says where its values come from.** Most properties that use an EDP reference also keep a `Term:` annotation for the same CDE.

### 8.2 Referencing an EDP

A caDSR CDE as the value set:

```yaml
  sex_at_birth:
    Desc: A textual description of a person's sex at birth.
    Term:
      - Origin: caDSR
        Code: '7572817'
        Value: Person Sex at Birth Category
        Version: '2.0'
    Enum:
      - Origin: caDSR
        Code: '7572817'
        Value: Person Sex at Birth Category
        Version: '2.0'
    Req: 'Yes'
```

As a multi-value list:

```yaml
  race:
    Term:
      - Origin: caDSR
        Code: '2192199'
        Value: Race Category Text
        Version: '1.00'
    Type:
      value_type: list
      item_type:
        - Origin: caDSR
          Code: '2192199'
          Value: Race Category Text
          Version: '1.00'
    Req: 'Yes'
```

A CRDC-defined value set:

```yaml
  specimen_type_obib:
    Desc: Kind of specimen, from the OBIB-based CRDC value set.
    Enum:
      - Origin: CRDC
        Code: 'CRDC0002'
        Value: Obib Value Set Reference
        Version: '1'
    Req: 'Yes'
```

Rules for references:

* *Exactly one entry* in the `Enum:` or `item_type:` list.
* *`Origin`, `Code`, and `Version` are all required* (the schema rejects a reference missing any of them). `Value` is the display name.
* *Pin the version.* The version is what makes a released model's values reproducible. Changing it is a MINOR (same authority, new version); changing the `Code` or `Origin` is MAJOR (Rulebook, Section 4.4).
* *Do not also list values.* A reference and literal values cannot be mixed in one `Enum:`.

### 8.3 Defining an EDP

```yaml
  obib_specimen_valueset:
    Desc: CRDC value set of OBIB specimen types.
    Ext: true
    Term:
      - Origin: CRDC
        Code: 'CRDC0002'
        Value: Obib Value Set Reference
        Version: '1'
        Definition: EDP holding OBIB standard permissible values for biological specimens.
    Enum:
      - blood specimen
      - bone marrow specimen
      - FFPE specimen
```

Requirements, enforced by the reader:

* *`Ext: true`*
* *A `Term:` entry*: its `Origin`/`Code`/`Version` become the EDP's identity, which is what references point to. Missing `Term:` stops the reader.
* *An explicit `Enum:` list of strings*: no `Type:`, no path, no nested reference. Missing `Enum:` stops the reader.
* *Not listed under any node's `Props:`*: EDP definitions are the one exception to "every definition must be used."
* *Optional `Terms:` section* to give each value its own code and definition (Section 5.2).

The reader files EDP definitions under a separate `_EDP` model, not under the commons model, which signals that **EDP definitions are shared CRDC assets**. Agree with the MDB and Data Hub teams where a new EDP definition should live and which `CRDC` code it gets before writing one into a commons model.

### 8.4 Readiness: check before adopting EDPs

EDP support is new, and several pieces are not yet in place for CTDC or ICDC:

| Check | Status, November 2026 |
|---|---|
| bento-mdf schema accepts term references in `Enum:` | Since 0.13.1 (May 2026) |
| bento-mdf reader handles `Ext: true` definitions | Since August 2026; writer support since 0.13.5 (October 2026) |
| bento-meta stores EDP terms in MDB | Since 0.3.3 (October 2026) |
| **ctdc-model's pinned `bento-mdf` submodule** | **March 2025: predates EDPs. A term reference in `Enum:` fails its schema** |
| **icdc-model-tool's pinned `bento-mdf` submodule** | **March 2022: predates EDPs** |
| STS `/edp/...` endpoint | Not in the public `bento-sts` repository; the reader's default STS URL is a local `/v2` service |
| Any model on the Portal's `prod` branch using EDP references or definitions | **None** |

Before the first EDP goes into either model:

1. Update the `bento-mdf` submodule (and confirm the CI workflow's validator version) so validation accepts the syntax.
2. Confirm with the Data Hub team that the Portal's permissible-value loader resolves EDP references for this commons.
3. Treat the switch from a `Term:`-plus-`Type:` binding to an EDP reference as a binding change and classify it with the Rulebook.

Until then, keep using the `Term:` binding pattern from Section 6.2.

---

## 9. Recipes

Complete blocks for the situations that come up most.

**Submitter-assigned identifier**

```yaml
  specimen_id:
    Desc: Unique identifier for the specimen, assigned by the submitting study.
    Src: Data Submitter
    Type: string
    Key: true
    Req: 'Yes'
```

**Value from an enumerated CDE, with nulls (today's recommended form)**

```yaml
  ethnicity:
    Desc: Ethnicity of the participant.
    Src: Data Submitter
    Type: string
    Req: 'Yes'
    Term:
      - Origin: caDSR
        Code: '2192217'
        Value: Ethnic Group Category Text
        Version: '2.0'
        useNullCDE: Yes
```

**Value from a list the model maintains**

```yaml
  program_short_name:
    Desc: Short name of the program.
    Src: Data Submitter
    Enum:
      - CMB
      - CIMAC-CIDC
    Req: 'Yes'
```

**Multi-select from a list the model maintains**

```yaml
  study_arm_label:
    Desc: Arms the participant was assigned to.
    Type:
      value_type: list
      Enum:
        - Arm A
        - Arm B
    Req: 'No'
```

**Measurement**

```yaml
  age_at_enrollment:
    Desc: Age of the participant, in days, on the date of enrollment.
    Type:
      value_type: integer
      units:
        - days
    Req: 'Yes'
    Term:
      - Origin: caDSR
        Code: '15742605'
        Value: Person Enrollment Age Day Count
        Version: '1.00'
```

**Deprecating a property** (Rulebook, Section 7)

```yaml
  legacy_patient_code:
    Desc: 'Deprecated: use participant_id. Planned for removal in 3.0.0.'
    Type: string
    Req: 'No'
    Deprecated: true
```

Quote a `Desc` that contains a colon followed by a space (Section 2).

---

## 10. Review checklist for a property block

- [ ] Exactly one of `Type:` or `Enum:`; inside a list, exactly one of `item_type:` or `Enum:`
- [ ] `Req:` declared and quoted
- [ ] Every `Code:` and `Version:` quoted
- [ ] Every `Term:` entry has `Value:` and `Origin:`
- [ ] No `Code: 'TBD'`
- [ ] `useNullCDE` sits inside the first caDSR `Term:` entry, not at the property level
- [ ] No unquoted `Yes`/`No` in an `Enum:`
- [ ] No `Enum:` next to an enumerated CDE (display-only and drifts)
- [ ] `units` is a list
- [ ] The property is listed under a node's `Props:` (unless it is an EDP definition)
- [ ] Any EDP reference has `Origin`, `Code`, and `Version`, and the readiness checks in Section 8.4 are done
- [ ] The change is classified with the Versioning Rulebook

---

## 11. Anti-patterns and what catches them

Each row was tested against bento-mdf 0.13.6. "Nothing" means the mistake reaches MDB and the Portal unless a reviewer catches it.

| Mistake | Schema (CI) | Reader (MDB load) | Effect if missed |
|---|---|---|---|
| Both `Type:` and `Enum:` | :x: Error | Accepted; `Enum:` wins | Ambiguous intent |
| Neither `Type:` nor `Enum:` | :x: Error | Accepted; type defaults | Unconstrained property |
| `Code: 2192217` unquoted | :x: Error | Accepted; code stored as a number | Binding may not match the caDSR record in MDB |
| `Term:` entry without `Value:` | :x: Error | :x: Error | |
| Term reference in `Enum:` missing `Version:` | :x: Error | Accepted | Unpinned value set |
| `Enum:` with unquoted `Yes`/`No` | :x: Error | Stored as `True`/`False` | Submitters' "Yes" rejected |
| `Req: Required` (or other invalid value) | :x: Error | Accepted | |
| `units: days` (not a list) | :x: Error | Accepted | |
| List with both `item_type:` and `Enum:` | :x: Error | Accepted; `item_type` wins | |
| Definition not used by any node | Passes | :x: Error | |
| `Ext: true` without `Term:` or `Enum:` | Passes | :x: Error | |
| One-value `Enum:` whose value starts with `/` | Passes | :x: Error (treated as a file path) | |
| **`useNullCDE` at the property level** | Passes | **Silently ignored** | Null values not accepted |
| **`useNullCDE` on a non-caDSR term** | Passes | **Silently ignored** | Null values not accepted |
| **`Code: 'TBD'`** | Passes | Passes | **Property fails validation in the Portal** |
| **`Enum:` next to an enumerated CDE** | Passes | Passes | **Navigator shows a list that does not validate** |
| **Unit or `Type` change shipped as MINOR or PATCH** | Passes | Passes | **Existing data misread** |

---

## 12. Testing a block locally

The repository validator checks the schema layer (Contribution SOP, Section 8). To also run the reader layer and see exactly how a property was interpreted:

```bash
pip install bento-mdf          # 0.13.6 or later
python - <<'EOF'
from bento_mdf.mdf import MDFReader
m = MDFReader("model-desc/<model-file>.yml", "model-desc/<props-file>.yml",
              mdf_schema="bento-mdf/schema/mdf-schema.yaml")
print("reader errors:", not m.create_model_success)
p = m.model.nodes["participant"].props["ethnicity"]
print(p.value_domain, p.is_required, {k: t.value for k, t in p.tags.items()},
      [(t.origin_name, t.origin_id, t.origin_version) for t in p.annotations.values()])
EOF
```

Reader errors are logged with the property name. The last line shows the property's type, whether it is required, its tags (including `useNullCDE`), and its term bindings.
