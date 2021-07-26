# CHALLENGE STATEMENT

# Input

Given a form accepting a CSV file. CSV file contains the following fields with a header: `first_name`, `last_name`, `email`, `phone`

After submitting the form it saves the data to the `people` table with the following validations:

first_name|last_name|email|phone
-----|----|----|----
non-empty|non-empty|any e-mail regexp you like|starts  from + sign and then a series of numbers, e.g. `+1100500700`

# Output

Displays a result in a table:

id|first_name|last_name|email|phone|errors|save
--|----|---|----|----|-----|------
id of the record|first_name value|last_name value|email value|phone value|validtion errors|save button

If a record save fails then `first_name value`, `last_name value`, `email value`, `phone value` should contain editable fields so user can change them and attempt to re-save.
The `Save` button attempts to re-save the record and only available for the records which are not persisted in the database.

# Other requirements

* This is a single-page application
* Back-end: Ruby on Rails
* Front-end: Marionette + CoffeeScript
* Code is covered with tests