# import the Flask framework
from flask import Flask, jsonify, request, render_template
from flaskext.mysql import MySQL

# create a flask object
app = Flask(__name__)

# import the blueprint objects from their respective locations
from customer_api.customers import customers_blueprint
from manager_api.managers import managers_blueprint

# register the blueprints we created with the current Flask app object.
app.register_blueprint(customers_blueprint, url_prefix='/cust')
app.register_blueprint(managers_blueprint, url_prefix='/mgr')


# add db config variables to the app object
app.config['MYSQL_DATABASE_HOST'] = 'db'
app.config['MYSQL_DATABASE_PORT'] = 3306
app.config['MYSQL_DATABASE_USER'] = 'webapp'
app.config['MYSQL_DATABASE_PASSWORD'] = 'abc123'
app.config['MYSQL_DATABASE_DB'] = 'cool_db'

# create the MySQL object and connect it to the 
# Flask app object
db_connection = MySQL()
db_connection.init_app(app)


# --------------------------------------------------------------------
# Create a function named hello world that 
# returns a simple html string 
# the @app.route("/") connects the hello_world function to 
# the URL / 
@app.route("/")
def hello_world():
    return f'<h1>Hello From the Flask-MySQL Connection Tutorial</h1>'


@app.route('/db_test')
def db_testing():
   cur = db_connection.get_db().cursor()
   cur.execute('select * from Class')
   row_headers = [x[0] for x in cur.description]
   json_data = []
   theData = cur.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

@app.route('/form')
def form():
    return render_template('form.html')

@app.route('/data/', methods = ['POST', 'GET'])
def data():
    if request.method == 'GET':
        return f"The URL /data is accessed directly. Try going to '/form' to submit form"
    if request.method == 'POST':
        form_data = request.form
        return render_template('data.html',form_data = form_data)


# If this file is being run directly, then run the application 
# via the app object. 
# debug = True will provide helpful debugging information and 
#   allow hot reloading of the source code as you make edits and 
#   save the files. 
if __name__ == '__main__': 
    app.run(debug = True, host = '0.0.0.0', port = 4000)