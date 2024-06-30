from flask import Flask, request, jsonify
import mysql.connector

app = Flask(__name__)

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="asteria_db"
)

@app.route('/signup', methods=['POST'])
def signup():
    data = request.json
    cursor = db.cursor()
    query = "INSERT INTO users (username, email, password, contact_number) VALUES (%s, %s, %s, %s)"
    values = (data['username'], data['email'], data['password'], data['contact_number'])
    cursor.execute(query, values)
    db.commit()
    return jsonify({"message": "User created successfully!"}), 201

@app.route('/login', methods=['POST'])
def login():
    data = request.json
    cursor = db.cursor(dictionary=True)
    query = "SELECT * FROM users WHERE username=%s AND password=%s"
    values = (data['username'], data['password'])
    cursor.execute(query, values)
    user = cursor.fetchone()
    if user:
        return jsonify({"message": "Login successful!", "user_id": user['id']}), 200
    else:
        return jsonify({"message": "Invalid credentials!"}), 401

@app.route('/save_profile', methods=['POST'])
def save_profile():
    data = request.json
    cursor = db.cursor()
    query = """
    INSERT INTO user_profiles (user_id, age, gender, weight, height, diet, months, children)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    """
    values = (
        data['user_id'], data['age'], data['gender'], data['weight'],
        data['height'], data['diet'], data['months'], data['children']
    )
    cursor.execute(query, values)
    db.commit()
    return jsonify({"message": "Profile saved successfully!"}), 200

@app.route('/user_info', methods=['GET'])
def user_info():
    user_id = request.args.get('user_id')
    cursor = db.cursor(dictionary=True)
    query = "SELECT u.username, u.email, u.contact_number, p.age, p.gender, p.weight, p.height, p.diet, p.months, p.children FROM users u JOIN user_profiles p ON u.id = p.user_id WHERE u.id=%s"
    cursor.execute(query, (user_id,))
    user_info = cursor.fetchone()
    if user_info:
        return jsonify(user_info), 200
    else:
        return jsonify({"message": "User not found!"}), 404

if __name__ == '__main__':
    app.run(debug=True)

