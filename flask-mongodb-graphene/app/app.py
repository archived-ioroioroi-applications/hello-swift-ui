""" app.py """
from flask import Flask, redirect
from flask_graphql import GraphQLView

from database import client
from schema import schema


app = Flask(__name__)
app.debug = True

app.add_url_rule(
    "/graphql", view_func=GraphQLView.as_view("graphql", schema=schema, graphiql=True)
)

@app.route('/')
def work():
    return redirect('/graphql')

if __name__ == "__main__":
    app.run(port=5002, host='0.0.0.0')
