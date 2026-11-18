# Quantum Force – Jira Engineering Intelligence dataset (updated)

## What changed

This package extends the supplied JSON dataset for the Quantum Force Hackathon MVP. It is synthetic/demo data and must not be represented as live Jira or client data.

### New dimensions and bridges
- `projects.json` – five synthetic project groupings.
- `teams.json` – Backend, Frontend, Platform, QA, DevOps, Scrum, Product Owner and Business Analyst teams.
- `roles.json` – role dimension.
- `team_roles.json` – team-to-role mapping, including secondary Architecture role mappings.
- `people.json` – unified person dimension covering developers and non-developer team members.
- `team_members.json` – 60 mock Scrum, Product Owner and Business Analyst members.
- `dim_calendar.json` – one row per calendar date, spanning the dataset history through one future year.
- `dim_time.json` – one row per second of the day (86,400 rows).
- `project_sprint_bridge.json` – project-to-sprint bridge for sprints containing issues from more than one project.
- `user_team_access.json` – illustrative user/team access mapping for a future RLS design; it does not enforce security.
- `issue_history.json` – simulated status-change events for historical trend analysis.

### Updated existing files
- `developers.json`: added `person_id`, `team_id`, and `role_id`.
- `epics.json`: added `project_id`; retained the original project key in `source_project_key`.
- `features.json`: added `project_id` inherited from the parent Epic.
- `sprints.json`: added a primary `project_id`, plus `start_date_key` and `end_date_key`.
- `issues_enriched.json`: added project, assignee-person, team, role, description, resolution notes, date keys and time keys; filled missing/invalid assignees; adjusted story points and recalculated cycle time.

## Important modelling assumptions

1. The supplied Epic records all referenced project key `KAFKA`. To demonstrate multi-project filtering without losing lineage, five synthetic project groupings were created. Epics own the project assignment; Features and Issues inherit it.
2. `source_issue_key` preserves the original issue key. `issue_key` is rewritten with the synthetic project's key so that it aligns with `project_key`. `issue_id` remains unchanged.
3. A sprint can contain issues from multiple projects. `sprints.json.project_id` is the sprint's primary project (the project with the most issues); `project_sprint_bridge.json` preserves all project associations and counts. Use the bridge for accurate multi-project sprint filtering.
4. The original five developer teams remain in `developers.json`. Scrum, Product Owner and Business Analyst people are synthetic non-developer team members in `team_members.json` and `people.json`. For those assignees, `developer_id` is intentionally null; `assignee_person_id` is populated.
5. Roles and `user_team_access.json` are modelling scaffolding for future Unity Catalog/RLS implementation. They do not implement or validate actual user-level security.
6. Existing story points of 0.5–3 are retained. Values above 3 are replaced with deterministic random whole numbers from 1 to 3. In this dataset the resulting values are 1, 2 and 3.
7. The source had no issue descriptions and all resolution values were blank. `description` and `resolution_notes` are simulated from the available summary/issue type; resolution categories are populated for resolved issues. Treat these as demo knowledge content, not verified historical closure notes.
8. `cycle_time_days` is recalculated as the elapsed days from `created` to `resolution_date` for resolved issues. It is null for unresolved issues. It is not derived from story points.
9. `dim_calendar.json` covers the full observed date range plus 365 days beyond the latest observed date. Date keys use `YYYYMMDD`.
10. `dim_time.json` uses second-of-day grain with `HHMMSS` integer keys. Time keys in issues use local clock components from the supplied timestamps; no timezone conversion has been applied.
11. All supplied sprints were marked `Completed`. No synthetic active/current sprint was added, so a current-sprint dashboard tile will need a separate explicit demo sprint if required.
12. `issue_history.json` is simulated status history derived from each issue's created/updated/resolution timestamps. It is intended to support trend demonstrations, not to claim a complete event log.

## Recommended relationship/load order

1. `projects`
2. `teams`, `roles`
3. `team_roles`
4. `developers`, `team_members`, `people`, `user_team_access`
5. `epics`
6. `features`
7. `sprints`, `project_sprint_bridge`
8. `dim_calendar`, `dim_time`
9. `issues_enriched`
10. `issue_history`

## Key relationships

- Projects 1:M Epics
- Epics 1:M Features
- Features 1:M Issues
- Projects 1:M Issues
- Teams 1:M People / Developers / Issues
- Roles M:N Teams through `team_roles`
- Sprints M:N Projects through `project_sprint_bridge`
- Calendar 1:M Issues through created/updated/resolution date keys
- Time 1:M Issues through created/updated/resolution time keys
- Issues 1:M Issue History

## Validation summary

- 20,177 issues retained.
- 100 Epics and 300 Features retained.
- 400 Sprints retained.
- 5 synthetic projects created; issue distribution is approximately even.
- 8 teams represented; 60 additional non-developer people created.
- All issue assignees map to `people.json`.
- All project, Epic, Feature and Sprint foreign keys validate.
- All story points are between 1 and 3 after the requested adjustment.
- All resolved issues have a resolution category; unresolved cycle times are null.
- Calendar and time keys are populated where source timestamps are available.


## Parent end dates

- `features.json` includes `end_date`, derived as the latest `resolution_date` among resolved child issues associated with that feature (`feature_id`).
- `epics.json` includes `end_date`, derived as the latest `resolution_date` among resolved child issues associated with that epic (`epic_id`).
- If no associated child issue is resolved, `end_date` is null.
- This dataset does not contain an issue type named `Story`; all resolved child issue types with a resolution date are used as completion records.


### Project end dates

`projects.json` includes `end_date`, derived as the latest `resolution_date` among resolved child issues associated with that project. If a project has no resolved issues, `end_date` is null.

## End-date hierarchy
- Story/issue completion dates use the issue `resolution_date`.
- Feature end dates are derived from completed child issues.
- Epic end dates are derived from related completed issues/features.
- Project end dates are derived from the latest non-null `end_date` among the project's related epics and features, matched by `project_id`.
