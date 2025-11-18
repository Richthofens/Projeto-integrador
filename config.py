import pymysql
pymysql.install_as_MySQLdb()
import MySQLdb


DB_NAME = "controle_epi"


def ensure_database_exists():
    # Conecta sem especificar o banco
    conn = MySQLdb.connect(
        host="localhost",
        user="root",
        passwd="1234",
        charset="utf8mb4"
    )

    cursor = conn.cursor()
    cursor.execute(f"CREATE DATABASE IF NOT EXISTS `{DB_NAME}` DEFAULT CHARACTER SET utf8mb4;")
    cursor.execute(f"USE {DB_NAME};")

    cursor.execute('''CREATE TABLE IF NOT EXISTS epi (
        id int AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(50) NOT NULL,
        codigo VARCHAR(30),
        lote VARCHAR(15),
        dataValidade DATE NOT NULL,
        quantidadeTotal INT NOT NULL,
        fornecedor VARCHAR(30)
    );''')

    cursor.execute('''CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(50) NOT NULL,
        cargo VARCHAR(40) NOT NULL,
        setor VARCHAR(40) NOT NULL,
        epi_atribuido VARCHAR(30),
        data_treinamento DATE
    );''')
    
    conn.commit()
    cursor.close()
    conn.close()

def get_db_connection():

    ensure_database_exists()

    return MySQLdb.connect(
        host="localhost",
        user="root",
        passwd="1234",
        db=DB_NAME,
        charset="utf8mb4"
)