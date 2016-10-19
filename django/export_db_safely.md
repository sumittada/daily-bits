### "Safe" exporting of data from one Django DB backend to another

`python manage.py dumpdata --natural-foreign -e contenttypes -e auth.Permission -e sessions > db_dump.json`

### Clean existing DB on the importing machine

`python manage.py flush`

### Load the data from the imported DB dump

`python manage.py loaddata db_dump.json`
