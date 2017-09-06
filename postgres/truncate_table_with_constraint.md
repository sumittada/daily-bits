First get the table schema by running following:

`pg_dump -d postgres -U postgres --schema-only --table api_scanner`

This will give you the name of contraint to remove,
and also the full details needed for re-adding the contraint once everything is cleaned

Now remove the contraint first
`psql -U postgres -d postgres  -c  "ALTER TABLE first_table_name DROP CONSTRAINT  first_table_name_field_name_53665656b_fk_second_table_name_id;"`

Truncate the table
`psql -U postgres -d postgres  -c  "TRUNCATE TABLE second_table_name;"`

Update the foreign-key fields in original table to all NULL, otherwise we will get error about linked entry not existing
`psql -U postgres -d postgres  -c  "UPDATE second_table_name SET field_name_id = NULL;"`

Now re-add the contraint
`psql -U postgres -d postgres  -c  "ALTER TABLE ONLY second_table_name ADD CONSTRAINT first_table_name_field_name_5365229b_fk_second_table_name_id FOREIGN KEY (filed_name_id) REFERENCES first_table_name_field_name_5365229b_fk_second_table_name_id(id) DEFERRABLE INITIALLY DEFERRED;"`
