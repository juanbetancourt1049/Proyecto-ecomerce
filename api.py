from flask import Flask, request, jsonify
import mysql.connector
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Configuración de la conexión a la base de datos MySQL
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="ecommerce"
)

cursor = db.cursor(dictionary=True)

# Endpoint para "Contáctanos"
@app.route('/contact-us', methods=['POST'])
def contact_us():
    # Obtener los datos del mensaje de contacto desde la solicitud JSON
    data = request.json
    name = data.get('name')
    email = data.get('email')
    subject = data.get('subject')
    message = data.get('message')

    # Validación básica de los datos
    if not name or not email or not message:
        return jsonify({'message': 'Faltan datos requeridos'}), 400

    # Insertar el mensaje en la base de datos
    cursor.execute(
        "INSERT INTO contact_us (name, email, subject, message) VALUES (%s, %s, %s, %s)",
        (name, email, subject, message)
    )
    db.commit()

    # Respuesta exitosa
    return jsonify({'message': 'Mensaje enviado exitosamente'}), 200

# Endpoint para login
@app.route('/login', methods=['POST'])
def login():
    data = request.json
    email = data.get('email')
    password = data.get('password')

    if not email or not password:
        return jsonify({'message': 'Faltan datos del usuario'}), 400

    # Ejecuta la consulta para buscar el usuario
    cursor.execute("SELECT * FROM customers WHERE email = %s AND password = %s", (email, password))
    user = cursor.fetchone()

    if user:
        return jsonify({'message': 'Inicio de sesión exitoso', 'user': user}), 200
    else:
        return jsonify({'message': 'Credenciales incorrectas'}), 401

# Endpoint para obtener productos de la tabla 'products'
@app.route('/products', methods=['GET'])
def get_products():
    cursor.execute("SELECT * FROM products")  # Consulta los productos de la tabla 'products'
    products = cursor.fetchall()
    return jsonify(products), 200

# Endpoint para obtener productos de la tabla 'products2'
@app.route('/products2', methods=['GET'])
def get_products2():
    cursor.execute("SELECT * FROM products2")  # Consulta los productos de la tabla 'products2'
    products2 = cursor.fetchall()
    return jsonify(products2), 200

if __name__ == '__main__':
    app.run(debug=True)