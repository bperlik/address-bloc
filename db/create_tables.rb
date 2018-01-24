require 'sqlite3'

 # create a new database file
 db = SQLite3::Database.new "db/address_bloc.sqlite"

 # clear out tables by that name if already exists
 db.execute("DROP TABLE IF EXISTS address_book;");
 db.execute("DROP TABLE IF EXISTS entry;");

 # create table address_book
 db.execute <<-SQL
     CREATE TABLE address_book (
       id INTEGER PRIMARY KEY,
       name VARCHAR(30)
     );
   SQL

 # create table entry...varchar is equivalent to text with (max length)
 db.execute <<-SQL
     CREATE TABLE entry (
       id INTEGER PRIMARY KEY,
       address_book_id INTEGER,
       name VARCHAR(30),
       phone_number VARCHAR(30),
       email VARCHAR(30),
       FOREIGN KEY (address_book_id) REFERENCES address_book(id)
     );
   SQL
