from flask import Flask, request, abort, render_template, url_for
import pandas
from config import get_db_connection

app = Flask(__name__)


def get_dashboard_data():
    db = get_db_connection()
    cursor = db.cursor()

    cursor.execute("SELECT COUNT(*) FROM epi")
    total_epi = cursor.fetchone()[0]



    db.close()

    return {
        'total_epis': total_epi,
        # 'percentual_validos': percentual_validos
    }



@app.route('/')
def index():
    data = get_dashboard_data()
    return render_template('epi360.html' , **data)


if __name__ == '__main__':
    app.run(debug=True)
