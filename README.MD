## EGRAMA - Grama-niladhar-assistant ##
Tested for php version =7.4.2 mysql version = 15.1
database configured as following:
```
    databasename:grama_nildari_db
    host:localhost
    username:root
    password:""
```
- if you want you can configure database connection in connection.php file
- for php version lower than 7.4.2 and mysql version=8.0+ 
```
    change mysql default_authentication_plugin=mysql_native_password by 
    ALTER USER 'username'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
    To resolve database connecting problem
```

database file is inside databasefile folder

- import database
```
mysql -u username -p password grama_niladari_db < grama_nildari_db.sql
```
- run php server
```
localhost/EGRAMA
```

