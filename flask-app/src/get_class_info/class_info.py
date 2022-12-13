# import the Flask framework
from flask import Flask, jsonify, request, render_template
from flaskext.mysql import MySQL
from flask import Blueprint
from src import db
from flask import current_app, request
import random
import string

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


@class_blueprint.route("q&a/<lectureId>")
def getQandA(lectureId):
    cur = db.get_db().cursor()
    cur.execute('select * FROM Lecture natural join Question natural join Asking natural join Answer where LectureID = (%s)', lectureId)
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)


@class_blueprint.route("/form", methods=['POST'])
def add_question():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    question = request.form['question']
    ClassID = request.form['ClassID']
    LectureID = request.form['LectureID']
    Anonymous = request.form['Anonymous']
    StudentName = request.form['StudentName']
    if(Anonymous == 1):
        StudentName = "Anonymous Student"
    query = f'insert into Question (QuestionID, Question, ClassID, LectureID, Starred, Anonymous, StudentName) values ({random.randint(0, 10000000000000000000)}, \"{question}\", \"{ClassID}\", \"{LectureID}\", 0, \"{Anonymous}\", \"{StudentName}\");'
    cursor.execute(query)
    db.get_db().commit()
    return 'Success'



@class_blueprint.route("answer/form", methods=['POST'])
def add_answer():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    answer = request.form['Answer']
    questionid = request.form['QuestionID']
    responderName = request.form['ResponderName']
    answerid = random.randint(0, 10000000000000000000)
    answerQuery = f'insert into Answer (AnswerID, Answer, ResponderName, QuestionID) values (\'{answerid}\', \'{answer}\', \'{responderName} \', \'{questionid}\');'
    cursor.excute(answerQuery)
    db.get_db().commit()
    return 'Success'





