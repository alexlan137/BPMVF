from types import ModuleType
from flask import Flask, request
from flask import render_template
from form import MVPForm_Full, MVPForm_rsID
from utils import generate_output
from keras.models import load_model
import tensorflow as tf
from tensorflow import compat

app = Flask(__name__)

def loadbpm():
    global model
    global graph
    model = load_model('../ENCSR000EGM/models/model_split000.h5')
    graph = tf.get_default_graph()


@app.route("/", methods=['GET', 'POST'])
def home():
    """Home page of app with form"""
    form = MVPForm_Full(request.form)
    # if request.method == 'POST' and form.validate():
    #     return "<h1>Model Output Will Be Here</h1>"
    if request.method == 'POST' and form.validate():
        cell_type = request.form['cell_type']
        chromosome = request.form['chromosome']
        position = request.form['position']
        allele1 = request.form['allele1']
        allele2 = request.form['allele2']
        loadbpm()
        #model_output = generate_output(model, graph,  cell_type, chromosome, position, allele1, allele2)
        #return render_template('output.html', input = model_output)
    return render_template('index.html', form=form)

app.run(host='0.0.0.0', port=50000)