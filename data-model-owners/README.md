# ICDC Data Model Owner Documentation

Reference material for people who own, change, or release the ICDC data model. Start with the document that matches your question.

| Read this | When you need to know |
|---|---|
| [Owner's Guide](./owner-guide.md) | What happens to the model after you merge to `develop` or tag a release: how the CRDC Submission Portal picks it up, which environments see what, and what gets published. Shared across CRDC commons |
| [Contribution SOP](./contribution-sop.md) | The step-by-step process for a model change in this repository, from Jira ticket to verified release on `master` |
| [Versioning Rulebook](./versioning-rulebook.md) | Whether a change is MAJOR, MINOR, or PATCH, including caDSR CDE binding changes, plus an audit of past releases and open findings |

**Maintenance:** `owner-guide.md` is kept identical in `CBIIT/ctdc-model` and `CBIIT/icdc-model-tool`; change both together. The SOP and Rulebook are specific to this repository but share structure with the other commons' copies, so a process change usually belongs in both.

These documents do not affect what the Submission Portal publishes: the Data Hub sync reads only `model-desc/`.
