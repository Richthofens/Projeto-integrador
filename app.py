from flask import Flask, request, abort, render_template, url_for
import pandas

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('epi360.html')


if __name__ == '__main__':
    app.run(debug=True)