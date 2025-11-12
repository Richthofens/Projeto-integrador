import MySQLdb

db = MySQLdb.connect(
    host="localhost",
    user="seu_usuario",        # Ex: 'root'
    passwd="sua_senha",        # Senha do MySQL
    db="controle_epi"          # Nome do banco de dados
)

cursos = db.cursor()