import pymysql
pymysql.install_as_MySQLdb()
import MySQLdb

def get_db_connection():
    return MySQLdb.connect(
        host="localhost",
        user="root",
        passwd="1234",
        db="controle_epi",
        charset="utf8mb4"
)