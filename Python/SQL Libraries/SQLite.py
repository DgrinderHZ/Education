# -- based on: https://realpython.com/python-sql-libraries/
import sqlite3
from sqlite3 import errors


def create_connection(path):
    """
    path = "<path>/<your_database>.sqlite"
    """
    connection = None
    try:
        connection = sqlite3.connect(path)
        print("SQLite is connected!")
    except Error as e:
        print(f'The error {e} occured!")
    
    return connection


def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print("Query executed successfully!")
    except Error as e:
        print(f'The error {e} occured!")
