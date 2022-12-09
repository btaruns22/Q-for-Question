# import the Flask framework
from flask import Flask, jsonify, request, render_template
from flaskext.mysql import MySQL
from flask import Blueprint
from src import db

class_blueprint = Blueprint('class_blueprint', __name__)


@class_blueprint.route('/class')
def db_testing():
   cur = db.get_db().cursor()
   cur.execute('select * from Class')
   row_headers = [x[0] for x in cur.description]
   json_data = []
   theData = cur.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)


# This route will handle the user going to /users/<some_id>
@class_blueprint.route("/lecture/<classID>")
def handle_user_with_id(classID):
    cur = db.get_db().cursor()
    cur.execute('select * FROM Lecture where ClassID = '+ classID  +'')
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)

    #return f'<h2>You asked for {idNumber} id.'


# This route will handle the user going to /users/<some_id>
@class_blueprint.route("/student/<classID>")
def get_student_data(classID):
    cur = db.get_db().cursor()
    cur.execute('select * FROM Student where ClassID = '+ classID +'')
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)