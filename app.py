from flask import Flask, request, jsonify
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# Establish database connection
try:
    db = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",  # Add your MySQL password here
        database="asteria_db"
    )
    print("Connected to MySQL database")
except Error as e:
    print("Error connecting to MySQL database:", e)

# Function to handle database errors
def handle_db_error(error_message):
    return jsonify({"error": error_message}), 500


@app.route('/signup', methods=['POST'])
def signup():
    data = request.json
    print('Received Signup Data:', data)  # Debug print
    try:
        cursor = db.cursor()

        # Insert user into users table
        user_insert_query = """
        INSERT INTO users (username, full_name, email, password, contact_number)
        VALUES (%s, %s, %s, %s, %s)
        """
        user_insert_values = (
            data['username'], data['full_name'], data['email'],
            data['password'], data['contact_number']
        )
        cursor.execute(user_insert_query, user_insert_values)
        db.commit()

        # Get the newly inserted user's ID
        user_id = cursor.lastrowid

        return jsonify({"user_id": user_id}), 201
    except Error as e:
        db.rollback()
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()

@app.route('/login', methods=['POST'])
def login():
    data = request.json
    try:
        cursor = db.cursor(dictionary=True)
        query = "SELECT * FROM users WHERE username=%s AND password=%s"
        values = (data['username'], data['password'])
        cursor.execute(query, values)
        user = cursor.fetchone()
        if user:
            return jsonify({"message": "Login successful!", "user_id": user['id']}), 200
        else:
            return jsonify({"message": "Invalid credentials!"}), 401
    except KeyError as e:
        return handle_db_error(f"Missing required field: {str(e)}")
    except Error as e:
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()

@app.route('/save_profile', methods=['POST'])
def save_profile():
    data = request.json
    print('Received Profile Data:', data)  # Debug print
    try:
        cursor = db.cursor()

        # Update user information
        user_update_query = """
        UPDATE users
        SET full_name = %s, username = %s, email = %s, contact_number = %s
        WHERE id = %s
        """
        user_update_values = (
            data['full_name'], data['username'], data['email'], data['contact_number'], data['user_id']
        )
        cursor.execute(user_update_query, user_update_values)

        # Insert or update user profile information
        profile_update_query = """
        INSERT INTO user_profiles (user_id, age, weight, height, diet, months, children)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE
        age=VALUES(age), weight=VALUES(weight), height=VALUES(height),
        diet=VALUES(diet), months=VALUES(months), children=VALUES(children)
        """
        profile_update_values = (
            data['user_id'], data['age'], data['weight'],
            data['height'], data['diet'], data['months'], data['children']
        )
        cursor.execute(profile_update_query, profile_update_values)

        db.commit()
        return jsonify({"message": "Profile updated successfully!"}), 200
    except KeyError as e:
        return handle_db_error(f"Missing required field: {str(e)}")
    except Error as e:
        db.rollback()
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()

@app.route('/user_info', methods=['GET'])
def user_info():
    user_id = request.args.get('user_id')
    try:
        cursor = db.cursor(dictionary=True)
        query = """
        SELECT u.full_name, u.username, u.email, u.contact_number, p.age, p.weight, p.height, p.diet, p.months, p.children
        FROM users u
        LEFT JOIN user_profiles p ON u.id = p.user_id
        WHERE u.id=%s
        """
        cursor.execute(query, (user_id,))
        user_info = cursor.fetchone()
        if user_info:
            return jsonify(user_info), 200
        else:
            return jsonify({"message": "User not found!"}), 404
    except Error as e:
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()

@app.route('/save_note', methods=['POST'])
def save_note():
    data = request.json
    try:
        cursor = db.cursor()
        query = "INSERT INTO notes (user_id, date, note) VALUES (%s, %s, %s)"
        values = (data['user_id'], data['date'], data['note'])
        cursor.execute(query, values)
        db.commit()
        return jsonify({"message": "Note saved successfully!"}), 200
    except KeyError as e:
        return handle_db_error(f"Missing required field: {str(e)}")
    except Error as e:
        db.rollback()
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()

if __name__ == '__main__':
    app.run(debug=True)
