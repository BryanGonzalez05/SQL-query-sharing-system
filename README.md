## SQL Query Sharing System

A java console application that allows users to create SQL problems, submit SQL query solutions, end execute stored solution based on given database

## Description
The SQL Query Sharing System is a java-based console application developed to allow users to share and execute SQL query solutions that is based on a information from a servery. The application allows users to create database-related problems, submit SQL solutions, and run previously submitted queries with user-provided parameters

The Project was build using Java, JDBC, and MySQL while emphasizing secure database interaction through prepared statements and relational database design

## Features

# Problem Management
- create and store SQL query problems 
- View unsolved SQL problems
- View solved SQL problems 

# SQL Solution submission 
- Submit SQL query solution 
- support for parameterized SQL statements
- Store runnable SQL solution in the database 

# Query Execution
- Execute stored SQL solutions
- Prompt users for required query parameters
- Dynamically displays query results

# Security 
- Uses prepared statements to prevents SQL injections
- Restricts destructive SQL commands such as: DROP,DELETE, UPDATE, INSERT, ALTER, TRUNCATE
- Input validation for users selections and parameters


## Backend
- Java
- JDBC database connectivity 
- MySQL
- Relational database design 
- Exception handling 
- Parameter validation

## Tech Stack

# language
- Java

# Database 
-MySQL

# Database Connectivity 
- JDBC


## Installation 
```
git clone ...

cd filename

install the DB schema into your database

go to DB_connection and input you database information

complie project: javac Main.java

Run application : java Main

```


## What I Learned

This project helped me gain experience with:
Java application development
JDBC database connectivity
Relational database design
SQL query execution
Prepared statements
Parameterized SQL queries
Exception handling
Command-line interface development
Input validation
Database security best practices
Object-oriented programming
