from flask import Blueprint

views = Blueprint('views', __name__)

# This is a base route
# we simply return a string.  
@views.route('/')
def hello_world():
    return f'<h1>Q for Question</h1>'

# This is a sample route for the /test URI.  
# as above, it just returns a simple string. 
@views.route("/logo")
def logo_test():
    return f'<h2>/kw fȯr ?/</h2>'