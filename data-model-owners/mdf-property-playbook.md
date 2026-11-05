# MDF Property Playbook

**Audience:** anyone writing or reviewing property definitions in a CRDC model description file (MDF).
**Scope:** CRDC-wide. Kept identical in `CBIIT/ctdc-model` and `CBIIT/icdc-model-tool`; update both copies together.
**Verified against:** `CBIIT/bento-mdf` 0.13.6 (schema and reader, October 2026), `CBIIT/bento-meta` 0.3.3, `CBIIT/bento-edps`, and the MDB and Data Hub teams' answers in #data-modeling through November 2026. Every example was parsed with those versions; every anti-pattern in Section 11 was tested to show which tool catches it.

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
| One value from a **caDSR CDE's** permissible values | `Term:` for meaning **plus** an `Enum:` reference to the same CDE | 6.2, 8.2 |
| One value from a **shared CRDC value set** | EDP reference | 8.2 |
| Several values per record | `Type: {value_type: list, ...}` around any of the above | 4.4 |
| Standard null values ("Unknown", "Not Reported") added to a value list | `useNullCDE: Yes` inside the caDSR `Term:` entry | 7 |
| To define a shared CRDC value set | EDP definition in `CBIIT/bento-edps` | 8.3 |

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
| `Term` | No (but nearly every CRDC property has one) | List of term entries (Section 6) | none | MDB, STS, Navigator. **Not used for validation** |
| `Key` | No | Boolean | `false` | Loaders: marks a unique identifier |
| `Nul` | No | Boolean | `false` | Recorded in MDB; whether null is a valid value |
| `Strict` | No | Boolean | `true` | Validation hint: `false` means do not fail on values outside the `Enum` |
| `Deprecated` | No | Boolean | `false` | Recorded in MDB; pair it with `Desc` text (Rulebook, Section 7) |
| `Ext` | Only on EDP definitions | `true` | `false` | Reader: marks an EDP definition (Section 8.3) |
| `Tags` | No | Map of scalar values | none | Downstream tools. The Portal ignores them |

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

Each string becomes a term whose origin is the model itself. **This list is what the Portal validates against**, whatever the property's `Term:` says, so every removal, comment-out, or respelling is MAJOR (Rulebook, Section 5).

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

### 6.2 What a `Term:` does and does not do

**A `Term:` says what the property means. It does not decide what values are valid.** Since EDPs went live in early September 2026, the Submission Portal never looks at `Term:` to find permissible values (confirmed by the MDB team in #data-modeling, August and September 2026). Before that, the Portal pulled a bound CDE's values from `Term:`; that behavior was never part of MDF and is gone.

What validates a property today is decided only by `Type:` or `Enum:`:

| The property has | What the Portal validates against |
|---|---|
| `Enum:` with literal values | That list |
| `Enum:` with one term reference (a caDSR CDE or a CRDC EDP) | That value set, served by MDB through STS (Section 8) |
| `Type: string` | **Nothing: free text**, whatever the `Term:` says |
| `Type: integer` or `number` | Any number of that type |
| `Type: {pattern}` | The regular expression |

So a property bound to an enumerated CDE in `Term:` with `Type: string` accepts any text. **To validate against a CDE's permissible values, reference the CDE in both places:** `Term:` for meaning, `Enum:` for values.

```yaml
  assessment_timepoint:
    Desc: A specific point in the time continuum, including those established relative to an event.
    Src: Data Submitter
    Term:                              # what the property means
      - Origin: caDSR
        Code: '5899851'
        Value: Timepoint Event
        Version: '1'
    Enum:                              # where its values come from
      - Origin: caDSR
        Code: '5899851'
        Value: Timepoint Event
        Version: '1'
    Req: 'Yes'
```

A CDE whose value domain is not enumerated (free text, numbers, dates) is annotated with `Term:` alone and constrained by `Type:`. The Portal reads the type from `Type:`, not from the CDE, so set it from the CDE's datatype: `string`, `integer`, or `number`. A made-up type such as `Type: Common Data Element` fails the schema.

### 6.3 More than one term

`Term:` takes a list, and every entry is read as a **synonym** of the others: they all describe what the property means. Use it, for example, to record both the caDSR CDE and a DICOM tag:

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

Two terms do **not** combine two value sets. A union of value sets in `Enum:` (for example a CDE plus a CRDC EDP) is planned by the MDB team but not supported yet; today an `Enum:` holds exactly one reference. If a property needs values from two sources, ask the MDB team for a CRDC EDP that contains them.

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

The Portal ignores `Tags` everywhere (node-level tags can drive viewers). They are for people and downstream tools. `useNullCDE` is the one exception, and only in the position described in Section 7.

### 6.5 Removing a CDE as a value source

Because `Term:` no longer drives values, "disabling a CDE" now means changing the `Enum:`, not commenting out `Term:`:

* *To stop validating against the CDE*: replace the `Enum:` reference with `Type: string` (free text) or a literal `Enum:` list. Keep the `Term:` if the CDE still describes the meaning.
* *To change what the property means*: edit or remove the `Term:` entry. Record why in `Desc`.

Both are classified with the Rulebook before merging.

### 6.6 Never release `Code: 'TBD'`

It passes the schema (it is a string), but it means the property has no real definition, and in an `Enum:` reference MDB cannot resolve it, so validation fails. Bind a real CDE or leave the `Term:` out.

---

## 7. Null CDEs: `useNullCDE`

`useNullCDE: Yes` adds the standard caDSR null values to the property's permissible values. In October 2026 STS returned these for a CTDC property with the flag: Unknown, Technical Problem, Response Declined, Insufficient Quantity, Not Otherwise Specified, Not Evaluable, Not Asked, Not Specified, Not Allowed To Collect, Not Applicable, Not Assessed, Temporarily Unavailable, Not Reported, and Censored. Check the property's STS endpoint (Section 12) for the current list before telling submitters what they can send.

```yaml
  primary_diagnosis_disease_group:
    Enum:
      - Colorectal Carcinoma
      - Ovarian Carcinoma
    Req: 'Yes'
    Term:
      - Origin: caDSR
        Value: Disease Primary Diagnosis NCI Thesaurus Name
        useNullCDE: Yes          # inside the caDSR term entry
```

Rules:

* *It adds to a value list.* It works with a literal `Enum:` or an `Enum:` reference. On a `Type: string` property it adds nothing, because free text already accepts any value.
* *Requiredness is independent.* A `Req: 'Yes'` property can use null values; a submitter then supplies "Not Reported" rather than leaving the cell empty.
* *Placement, verified against bento-mdf 0.13.6:*

| Placement | Result |
|---|---|
| Inside a `Term:` entry with `Origin: caDSR` | **Works.** Recorded in MDB as a `useNullCDE` tag on the property |
| At the property level, or under the property's `Tags:` | **Silently ignored** by the current reader. Passes the schema; no tag is created |
| Inside a term entry with any other `Origin` | **Silently ignored** |
| On more than one caDSR entry | Only the **first** caDSR entry's flag counts |

**Pending change:** the MDB team has proposed (DATATEAM-772, October 2026) moving `useNullCDE` to the property's `Tags:`, alongside a new `pvSource` tag that would let a property accept an EDP's codes, values, or both. Until bento-mdf reads that position, keep `useNullCDE` inside the caDSR `Term:` entry, and update this section when the change ships.

Adding `useNullCDE` is MINOR; removing it is MAJOR (Rulebook, Section 4.4).

---

## 8. EDPs: extended definition properties

### 8.1 What they are

An EDP is a **named, versioned value set held in MDB**. A property uses one by referencing it in `Enum:`, instead of copying values into the model. EDPs went live for the Submission Portal in early September 2026.

| Half | Where it lives | Purpose |
|---|---|---|
| **EDP reference** | Your model: an `Enum:` (or list `item_type:`) containing one term entry | "This property's values are whatever this value set contains" |
| **EDP definition** | `CBIIT/bento-edps`, not a commons model | Defines a CRDC value set (`Origin: CRDC`, a `CRDC####` code) |

A reference can point to:

* *a caDSR CDE* (`Origin: caDSR`): MDB fetches the CDE's permissible values at the referenced version. The CDE must be available as an EDP in MDB. STS lists the registered ones at `https://sts.cancer.gov/v2/edps/caDSR`; if a CDE you need is missing, ask the MDB team to add it.
* *a CRDC EDP* (`Origin: CRDC`): a value set curated in `bento-edps`.

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

A CRDC EDP, with a CDE describing the meaning (the MDB team's own example):

```yaml
  primary_disease_site:
    Desc: The location within the body from where the disease of interest originated, as captured in the Uberon identifier.
    Term:
      - Origin: caDSR
        Code: '14883047'
        Value: Disease Primary Site of Disease Uberon Identifier
        Version: '1'
    Enum:
      - Origin: CRDC
        Code: 'CRDC0001'
        Value: uberon value set reference
        Version: '1'
    Src: Data Submitter
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

Rules for references:

* *Write it as a list item* (`- Origin: ...`). The `bento-edps` README shows the reference without the leading `-`; the MDF schema requires the list form.
* *Exactly one reference.* A reference and literal values cannot be mixed, and two references cannot be combined yet (Section 6.3).
* *`Origin`, `Code`, and `Version` are required* (the schema rejects a reference missing any of them). `Value` is optional but makes the model readable; include it.
* *Pin the version.* caDSR increments a CDE's version when permissible values are **removed** or its meaning changes, but adds new values **without** a version change. So moving to a new CDE version can remove values (Rulebook, Section 4.4), and values caDSR adds to the current version reach the Portal only after your next model release (Owner's Guide, Section 6).
* *Codes versus values.* Submitters must send the value strings (for example `habenular nucleus`), not the codes (`0008993`). Accepting codes is part of the pending `pvSource` proposal (Section 7).
* *Size is not a constraint.* The MDB team has confirmed there is no limit on EDP size (for example an NCIt list of 20,000 values).

### 8.3 Defining an EDP

CRDC EDPs are defined in **`CBIIT/bento-edps`**, one folder per EDP, never inside a commons model:

```text
bento-edps/model-desc/edps/<edp_handle>/
  edp-props.yml      # the EDP definition
  terms.yml          # one entry per value: Origin, Code, Version, Value, Definition
```

```yaml
# edp-props.yml
Nodes: {}
Relationships: {}
PropDefinitions:
  obib_terms_valueset:
    Desc: Standardized permissible values from OBIB describing biological specimens.
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
* *A `Term:` entry* whose `Origin`/`Code`/`Version` is the EDP's identity, the thing references point to. Missing `Term:` stops the reader.
* *An explicit `Enum:` list of strings*: no `Type:`, path, or nested reference. Missing `Enum:` stops the reader.
* *Not listed under any node's `Props:`*: EDP definitions are the one exception to "every definition must be used."

Process, from the `bento-edps` README and #data-modeling:

1. Request the EDP from the MDB team (a ticket with the property, CDE, and the source list or ontology); they assign the `CRDC####` code.
2. Add the folder and open a PR in `bento-edps`.
3. MDB polls `bento-edps` daily and loads new or changed EDPs.
4. **Increment the EDP `Version` whenever its values change**, and update references in models to the new version.
5. Removing a value from an EDP does not yet remove it from MDB; plan removals with the MDB team.

EDPs available in November 2026 (production ones only):

| Code | Handle | Contents |
|---|---|---|
| `CRDC0001` | `uberon_valueset_reference` | UBERON anatomy terms |
| `CRDC0002` | `obib_terms_valueset` | OBIB specimen types |
| `CRDC0008` | `crdc_study_names` | Official CRDC study names |

### 8.4 Before the first EDP reference goes into this repository

| Check | Status, November 2026 |
|---|---|
| MDB, STS, and the Portal resolve EDP references | **Live** since early September 2026 |
| `bento-mdf` schema accepts references in `Enum:` | Since 0.13.1 (May 2026) |
| **ctdc-model's pinned `bento-mdf` submodule** | **March 2025: predates EDP syntax** |
| **icdc-model-tool's pinned `bento-mdf` submodule** | **March 2022: predates EDP syntax** |
| References in CTDC or ICDC on `prod`/`master` | None yet |

Update the `bento-mdf` submodule, then push a branch with one reference to confirm the CI validator accepts it, before converting properties in bulk. Converting a property from `Type: string` to an `Enum:` reference narrows what it accepts: classify it with the Rulebook and run the coverage check.

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

**Value from an enumerated CDE, with null values**

```yaml
  ethnicity:
    Desc: Ethnicity of the participant.
    Src: Data Submitter
    Enum:
      - Origin: caDSR
        Code: '2192217'
        Value: Ethnic Group Category Text
        Version: '2.0'
    Req: 'Yes'
    Term:
      - Origin: caDSR
        Code: '2192217'
        Value: Ethnic Group Category Text
        Version: '2.0'
        useNullCDE: Yes
```

**Free text described by a non-enumerated CDE**

```yaml
  study_outcome:
    Desc: The overall primary outcome for the study.
    Src: Data Submitter
    Type: string
    Req: 'No'
    Term:
      - Origin: caDSR
        Code: '16085973'
        Value: Study Administration Study Objective Response Rate Text
        Version: '1'
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
- [ ] A property meant to use a CDE's values has an `Enum:` reference to it, not `Type: string`
- [ ] `Type:` is a real MDF type taken from the CDE's datatype, never a placeholder such as `Common Data Element`
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
| `Type: Common Data Element` (or another invented type) | :x: Error | Accepted as-is | The Portal falls back to string: free text |
| **Enumerated CDE in `Term:` only, with `Type: string`** | Passes | Passes | **Free text: the CDE's values are not enforced** |
| **`Code: 'TBD'`** | Passes | Passes | **No real definition; as an `Enum:` reference, validation fails** |
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

After a release, check what the Portal will actually validate against. This is the STS endpoint the Data Hub uses:

```bash
curl -s "https://sts.cancer.gov/v2/terms/model-pvs/CTDC/assessment_timepoint" | jq '.[] | {version, n: (.permissibleValues | length)}'
curl -s "https://sts.cancer.gov/v2/model/CTDC/versions"    # versions MDB has loaded
```

An empty list for a property that should have values means either the model is free text there, or MDB has not loaded that version yet (Owner's Guide, Section 6).
