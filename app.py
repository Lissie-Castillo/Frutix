from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/login_adm')
def login_admin():
    return render_template('login_admin.html')


@app.route('/login_empleado')
def login_empleado():
    return render_template('login_empleado.html')


@app.route('/login_gerente')
def login_gerente():
    return render_template('login_gerente.html')

@app.route('/inventario')
def inventario():
    return render_template('inventario.html')

@app.route('/login_gerente')
def login_gerente():
    return render_template('login_gerente.html')




