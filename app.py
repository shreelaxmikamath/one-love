from flask import Flask, request, jsonify
import mysql.connector
from mysql.connector import Error
import os
import json

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

        # Validate contact number format
        if not data['contact_number'].isdigit() or len(data['contact_number']) != 10:
            return jsonify({"error": "Invalid contact number format. It should be a 10-digit number."}), 400

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

@app.route('/user_info', methods=['GET'])
def user_info():
    user_id = request.args.get('user_id')
    try:
        cursor = db.cursor(dictionary=True)
        query = """
        SELECT u.full_name, u.username, u.email, u.contact_number,
               p.age, p.weight, p.height, p.diet, p.months, p.children
        FROM users u
        LEFT JOIN user_profiles p ON u.id = p.user_id
        WHERE u.id = %s
        """
        cursor.execute(query, (user_id,))
        user_info = cursor.fetchone()
        if user_info:
            return jsonify(user_info), 200
        else:
            return jsonify({"message": "User not found!"}), 404
    except Error as e:
        return jsonify({"error": f"Database error: {str(e)}"}), 500
    finally:
        cursor.close()

@app.route('/save_profile', methods=['POST'])
def save_profile():
    data = request.json
    try:
        cursor = db.cursor()

        # Update user information
        user_update_query = """
        UPDATE users
        SET full_name = %s, username = %s, email = %s, contact_number = %s
        WHERE id = %s
        """
        user_update_values = (
            data['full_name'], data['username'], data['email'],
            data['contact_number'], data['user_id']
        )
        cursor.execute(user_update_query, user_update_values)

        # Check if user profile exists
        profile_check_query = "SELECT id FROM user_profiles WHERE user_id = %s"
        cursor.execute(profile_check_query, (data['user_id'],))
        profile = cursor.fetchone()

        if profile:
            # Update user profile information if it exists
            profile_update_query = """
            UPDATE user_profiles
            SET age = %s, weight = %s, height = %s, diet = %s, months = %s, children = %s
            WHERE user_id = %s
            """
            profile_update_values = (
                data['age'], data['weight'], data['height'],
                data['diet'], data['months'], data['children'], data['user_id']
            )
        else:
            # Insert user profile information if it does not exist
            profile_update_query = """
            INSERT INTO user_profiles
            (user_id, age, weight, height, diet, months, children)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
            """
            profile_update_values = (
                data['user_id'], data['age'], data['weight'], data['height'],
                data['diet'], data['months'], data['children']
            )

        cursor.execute(profile_update_query, profile_update_values)
        db.commit()
        return jsonify({"message": "Profile updated successfully!"}), 200
    except Error as e:
        db.rollback()
        return jsonify({"error": f"Database error: {str(e)}"}), 500
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
        return jsonify({"error": f"Missing required field: {str(e)}"}), 400
    except Error as e:
        db.rollback()
        return jsonify({"error": f"Database error: {str(e)}"}), 500
    finally:
        cursor.close()

@app.route('/get_notes', methods=['GET'])
def get_notes():
    user_id = request.args.get('user_id')
    date = request.args.get('date')
    try:
        cursor = db.cursor(dictionary=True)
        query = "SELECT id, note FROM notes WHERE user_id = %s AND date = %s"
        cursor.execute(query, (user_id, date))
        notes = cursor.fetchall()
        return jsonify(notes), 200
    except Error as e:
        return jsonify({"error": f"Database error: {str(e)}"}), 500
    finally:
        cursor.close()

@app.route('/edit_note', methods=['PUT'])
def edit_note():
    data = request.json
    try:
        cursor = db.cursor()
        query = "UPDATE notes SET note = %s WHERE id = %s"
        values = (data['note'], data['note_id'])
        cursor.execute(query, values)
        db.commit()
        return jsonify({"message": "Note edited successfully!"}), 200
    except Error as e:
        db.rollback()
        return jsonify({"error": f"Database error: {str(e)}"}), 500
    finally:
        cursor.close()

@app.route('/delete_note', methods=['DELETE'])
def delete_note():
    data = request.json
    try:
        cursor = db.cursor()
        query = "DELETE FROM notes WHERE id = %s"
        cursor.execute(query, (data['note_id'],))
        db.commit()
        return jsonify({"message": "Note deleted successfully!"}), 200
    except Error as e:
        db.rollback()
        return jsonify({"error": f"Database error: {str(e)}"}), 500
    finally:
        cursor.close()

@app.route('/notifications', methods=['GET'])
def notifications():
    user_id = request.args.get('user_id')
    date = request.args.get('date')
    cursor = db.cursor(dictionary=True)
    query = "SELECT note AS message FROM notes WHERE user_id=%s AND date=%s"
    cursor.execute(query, (user_id, date))
    notifications = cursor.fetchall()
    cursor.close()
    if notifications:
        return jsonify(notifications), 200
    else:
        return jsonify({"message": "No notifications found!"}), 404

# Emergency contact
@app.route('/emergency_contact', methods=['POST'])
def add_emergency_contact():
    try:
        # Get data from request
        data = request.json
        name = data['name']
        phone = data['phone']

        # Check if name and phone are provided
        if not name or not phone:
            return jsonify({"error": "Both name and phone are required"}), 400

        # Validate phone number format
        if not phone.isdigit() or len(phone) != 10:
            return jsonify({"error": "Invalid phone number format. It should be a 10-digit number."}), 400

        # Insert emergency contact into database
        cursor = db.cursor()
        insert_query = """
        INSERT INTO emergency_contacts (user_id, name, phone)
        VALUES (%s, %s, %s)
        """
        user_id = 1  # Replace with the actual user_id from your authentication system
        insert_values = (user_id, name, phone)
        cursor.execute(insert_query, insert_values)
        db.commit()
        cursor.close()

        return jsonify({"message": "Emergency contact added successfully!"}), 201

    except Error as e:
        return jsonify({"error": str(e)}), 500

@app.route('/emergency_contacts', methods=['GET'])
def get_emergency_contacts():
    user_id = request.args.get('user_id')
    try:
        cursor = db.cursor(dictionary=True)
        query = "SELECT * FROM emergency_contacts WHERE user_id = %s"
        cursor.execute(query, (user_id,))
        contacts = cursor.fetchall()
        cursor.close()

        return jsonify(contacts), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/categories', methods=['POST'])
def add_category():
    data = request.json
    try:
        cursor = db.cursor()
        query = "INSERT INTO categories (name, user_id) VALUES (%s, %s)"
        values = (data['name'], data['user_id'])
        cursor.execute(query, values)
        db.commit()
        return jsonify({"message": "Category added successfully!"}), 201
    except Error as e:
        db.rollback()
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()

@app.route('/categories', methods=['GET'])
def get_categories():
    user_id = request.args.get('user_id')
    try:
        cursor = db.cursor(dictionary=True)
        query = "SELECT id, name FROM categories WHERE user_id = %s"
        cursor.execute(query, (user_id,))
        categories = cursor.fetchall()
        return jsonify(categories), 200
    except Error as e:
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()


@app.route('/categories/<int:category_id>', methods=['DELETE'])
def delete_category(category_id):
    try:
        cursor = db.cursor()
        query = "DELETE FROM categories WHERE id = %s"
        cursor.execute(query, (category_id,))
        db.commit()
        return jsonify({"message": "Category deleted successfully!"}), 200
    except Error as e:
        db.rollback()
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()

@app.route('/checklist_items', methods=['POST'])
def add_item():
    data = request.json
    try:
        cursor = db.cursor()
        query = "INSERT INTO checklist_items (name, category_id) VALUES (%s, %s)"
        values = (data['name'], data['category_id'])
        cursor.execute(query, values)
        db.commit()
        return jsonify({"message": "Item added successfully!"}), 201
    except Error as e:
        db.rollback()
        print(f"Error: {str(e)}")
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()


@app.route('/checklist_items/<int:category_id>', methods=['GET'])
def get_items(category_id):
    try:
        cursor = db.cursor(dictionary=True)
        query = "SELECT id, name, is_checked FROM checklist_items WHERE category_id = %s"
        cursor.execute(query, (category_id,))
        items = cursor.fetchall()
        return jsonify(items), 200
    except Error as e:
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()


@app.route('/checklist_items/<int:item_id>', methods=['PUT'])
def update_item(item_id):
    data = request.json
    try:
        cursor = db.cursor()
        query = "UPDATE checklist_items SET is_checked = %s WHERE id = %s"
        values = (data['is_checked'], item_id)
        cursor.execute(query, values)
        db.commit()
        return jsonify({"message": "Item updated successfully!"}), 200
    except Error as e:
        db.rollback()
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()


@app.route('/checklist_items/<int:item_id>', methods=['DELETE'])
def delete_item(item_id):
    try:
        cursor = db.cursor()
        query = "DELETE FROM checklist_items WHERE id = %s"
        cursor.execute(query, (item_id,))
        db.commit()
        return jsonify({"message": "Item deleted successfully!"}), 200
    except Error as e:
        db.rollback()
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()

@app.route('/delete_account', methods=['DELETE'])
def delete_account():
    data = request.json
    try:
        cursor = db.cursor()
        # Delete user from the users table
        delete_user_query = "DELETE FROM users WHERE id = %s"
        cursor.execute(delete_user_query, (data['user_id'],))
        db.commit()
        return jsonify({"message": "Account deleted successfully!"}), 200
    except Error as e:
        db.rollback()
        return jsonify({"error": f"Database error: {str(e)}"}), 500
    finally:
        cursor.close()

#doctorsappointment
@app.route('/doctors', methods=['GET'])
def get_doctors():
    try:
        cursor = db.cursor(dictionary=True)
        query = "SELECT id, name FROM doctors"
        cursor.execute(query)
        doctors = cursor.fetchall()
        cursor.close()
        return jsonify(doctors), 200
    except Error as e:
        return handle_db_error(f"Database error: {str(e)}")


# Flask endpoint to book an appointment
@app.route('/book_appointment', methods=['POST'])
def book_appointment():
    data = request.json

    try:
        cursor = db.cursor()

        # Fetch doctor_id based on doctor_name
        doctor_query = """
        SELECT id FROM doctors WHERE name = %s
        """
        cursor.execute(doctor_query, (data['doctor_name'],))
        doctor_id = cursor.fetchone()[0]

        # Insert booked appointment into database
        appointment_insert_query = """
        INSERT INTO booked_appointments (user_id, doctor_id, appointment_date, appointment_time, reason)
        VALUES (%s, %s, %s, %s, %s)
        """
        appointment_insert_values = (
            data['user_id'], doctor_id, data['appointment_date'],
            data['appointment_time'], data['reason']
        )
        cursor.execute(appointment_insert_query, appointment_insert_values)
        db.commit()

        return jsonify({"message": "Appointment booked successfully!"}), 201

    except KeyError as e:
        return jsonify({"error": f"Missing required field: {str(e)}"}), 400

    except pymysql.Error as e:
        db.rollback()
        return jsonify({"error": f"Database error: {str(e)}"}), 500

    finally:
        if 'cursor' in locals() and cursor is not None:
            cursor.close()



@app.route('/get_prescriptions', methods=['GET'])
def get_prescriptions():
    user_id = request.args.get('user_id')

    try:
        cursor = db.cursor(dictionary=True)
        query = """
        SELECT id, prescription_date, doctor_name, diagnosis, medications, instructions
        FROM prescriptions
        WHERE user_id = %s
        """
        cursor.execute(query, (user_id,))
        prescriptions = cursor.fetchall()
        cursor.close()
        return jsonify(prescriptions), 200

    except Error as e:
        return jsonify({"error": f"Database error: {str(e)}"}), 500


@app.route('/get_appointments', methods=['GET'])
def get_appointments():
    user_id = request.args.get('user_id')

    try:
        cursor = db.cursor(dictionary=True)
        query = """
        SELECT ba.appointment_date, ba.appointment_time, d.name AS doctor_name, ba.status
        FROM booked_appointments ba
        JOIN doctors d ON ba.doctor_id = d.id
        WHERE ba.user_id = %s
        """
        cursor.execute(query, (user_id,))
        appointments = cursor.fetchall()
        cursor.close()

        # Ensure all keys and values are serializable
        for appointment in appointments:
            appointment['appointment_date'] = appointment['appointment_date'].isoformat()
            appointment['appointment_time'] = str(appointment['appointment_time'])

        return jsonify(appointments), 200

    except Exception as e:
        return jsonify({"error": f"Database error: {str(e)}"}), 500


@app.route('/delete_appointment', methods=['DELETE'])
def delete_appointment():
    data = request.get_json()
    user_id = data.get('user_id')
    appointment_date = data.get('appointment_date')
    appointment_time = data.get('appointment_time')

    try:
        cursor = db.cursor()
        cursor.execute("""
            DELETE FROM booked_appointments 
            WHERE user_id = %s AND appointment_date = %s AND appointment_time = %s
        """, (user_id, appointment_date, appointment_time))
        db.commit()
        cursor.close()
        return jsonify({"message": "Appointment deleted successfully"}), 200
    except Exception as e:
        return jsonify({"error": f"Database error: {str(e)}"}), 500
@app.route('/update_appointment', methods=['PUT'])
def update_appointment():
    data = request.get_json()
    user_id = data.get('user_id')
    appointment_date = data.get('appointment_date')
    appointment_time = data.get('appointment_time')
    new_date = data.get('new_date')
    new_time = data.get('new_time')

    try:
        cursor = db.cursor()
        cursor.execute("""
            UPDATE booked_appointments 
            SET appointment_date = %s, appointment_time = %s
            WHERE user_id = %s AND appointment_date = %s AND appointment_time = %s
        """, (new_date, new_time, user_id, appointment_date, appointment_time))
        db.commit()
        cursor.close()
        return jsonify({"message": "Appointment updated successfully"}), 200
    except Exception as e:
        return jsonify({"error": f"Database error: {str(e)}"}), 500



if __name__ == '__main__':
    app.run(debug=True)



