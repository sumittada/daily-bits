"Safe" exporting of data from one Django DB backend to another

`python manage.py dumpdata --natural-foreign -e contenttypes -e auth.Permission -e sessions > db_dump.json`
`python manage.py loaddata db_dump.json`
