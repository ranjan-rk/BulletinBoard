Bulletin Board
--------------

**MySQL DB setup script**
```
CREATE USER bulletin@localhost identified BY 'board';
GRANT usage ON *.* TO bulletin@localhost identified BY 'board';
CREATE DATABASE IF NOT EXISTS bulletinboard;
GRANT ALL privileges ON bulletinboard.* TO bulletin@localhost;
USE bulletinboard;
CREATE TABLE USERS
  (
     id        INT PRIMARY KEY AUTO_INCREMENT,
     firstName VARCHAR(30),
     lastName  VARCHAR(30),
     email     VARCHAR(30),
     role      VARCHAR(30)
  ); 


CREATE TABLE ADVERTS
  (
     id        INT PRIMARY KEY AUTO_INCREMENT,
     title     VARCHAR(30),
     userName  VARCHAR(30),
     text      TEXT,
     datetime  TIMESTAMP
  ); 

```
