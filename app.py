from flask import Flask, request, jsonify
import mysql.connector
from mysql.connector import Error
from collections import defaultdict
import os
import csv
import json
import pandas as pd
from flask_cors import CORS
from datetime import datetime, timedelta
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import StandardScaler
import joblib
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


@app.route('/notification_count', methods=['GET'])
def get_notification_count():
    user_id = request.args.get('user_id')

    cursor = db.cursor(dictionary=True)
    query = "SELECT COUNT(*) as count FROM notes WHERE user_id=%s AND date=%s"
    current_date = datetime.now().strftime('%Y-%m-%d')
    cursor.execute(query, (user_id, current_date))
    result = cursor.fetchone()
    cursor.close()

    count = result['count'] if result else 0
    return jsonify({'count': count}), 200

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

@app.route('/appointments/<int:user_id>', methods=['GET'])
def get_appointments(user_id):
    try:
        cursor = db.cursor(dictionary=True)
        query = """
        SELECT ba.id, ba.appointment_date, ba.appointment_time, ba.reason, d.name as doctor_name
        FROM booked_appointments ba
        JOIN doctors d ON ba.doctor_id = d.id
        WHERE ba.user_id = %s
        ORDER BY ba.appointment_date, ba.appointment_time
        """
        cursor.execute(query, (user_id,))
        appointments = cursor.fetchall()

        # Convert date and time to string for JSON serialization
        for appointment in appointments:
            appointment['appointment_date'] = appointment['appointment_date'].strftime('%Y-%m-%d')

            # Handle timedelta object for appointment_time
            if isinstance(appointment['appointment_time'], timedelta):
                total_seconds = int(appointment['appointment_time'].total_seconds())
                hours, remainder = divmod(total_seconds, 3600)
                minutes, seconds = divmod(remainder, 60)
                appointment['appointment_time'] = f'{hours:02d}:{minutes:02d}:{seconds:02d}'
            else:
                appointment['appointment_time'] = appointment['appointment_time'].strftime('%H:%M:%S')

        return jsonify(appointments), 200
    except Error as e:
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()

@app.route('/appointments/<int:appointment_id>', methods=['DELETE'])
def delete_appointment(appointment_id):
    try:
        cursor = db.cursor()
        query = "DELETE FROM booked_appointments WHERE id = %s"
        cursor.execute(query, (appointment_id,))
        db.commit()

        if cursor.rowcount == 0:
            return jsonify({"error": "Appointment not found"}), 404

        return jsonify({"message": "Appointment deleted successfully"}), 200
    except Error as e:
        db.rollback()
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()

@app.route('/appointments/<int:appointment_id>', methods=['PUT'])
def update_appointment(appointment_id):
    data = request.json
    try:
        cursor = db.cursor()
        query = """
        UPDATE booked_appointments
        SET doctor_id = %s, appointment_date = %s, appointment_time = %s, reason = %s
        WHERE id = %s
        """
        values = (
            data['doctor_id'],
            data['appointment_date'],
            data['appointment_time'],
            data['reason'],
            appointment_id
        )
        cursor.execute(query, values)
        db.commit()
        return jsonify({"message": "Appointment updated successfully"}), 200
    except Error as e:
        db.rollback()
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()

@app.route('/doctors', methods=['GET'])
def get_doctors():
    try:
        cursor = db.cursor(dictionary=True)
        query = "SELECT id, name FROM doctors"
        cursor.execute(query)
        doctors = cursor.fetchall()
        return jsonify(doctors), 200
    except Error as e:
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()

@app.route('/appointments', methods=['POST'])
def book_appointment():
    data = request.json
    conn = None
    cursor = None
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        # Insert booked appointment into database
        appointment_insert_query = """
        INSERT INTO booked_appointments (user_id, doctor_id, appointment_date, appointment_time, reason, status)
        VALUES (%s, %s, %s, %s, %s, %s)
        """
        appointment_insert_values = (
            data['user_id'],
            data['doctor_id'],
            data['appointment_date'],
            data['appointment_time'],
            data['reason'],
            'Scheduled'
        )
        cursor.execute(appointment_insert_query, appointment_insert_values)
        conn.commit()

        return jsonify({"message": "Appointment booked successfully!"}), 201

    except KeyError as e:
        return jsonify({"error": f"Missing required field: {str(e)}"}), 400
    except Error as e:
        return jsonify({"error": f"Database error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"error": f"An unexpected error occurred: {str(e)}"}), 500
    finally:
        if cursor:
            cursor.close()
        if conn and conn.is_connected():
            conn.close()

@app.route('/get_prescriptions', methods=['GET'])
def get_prescriptions():
    user_id = request.args.get('user_id')
    try:
        cursor = db.cursor(dictionary=True)
        query = "SELECT * FROM prescriptions WHERE user_id = %s"
        cursor.execute(query, (user_id,))
        prescriptions = cursor.fetchall()
        return jsonify(prescriptions), 200
    except Error as e:
        return handle_db_error(f"Database error: {str(e)}")
    finally:
        cursor.close()



df = pd.read_csv('assets/pregnancy_nutrition_dataset.csv')

# Prepare the features and target variables
X = df[['trimester', 'weight', 'height']]
y = df[['recommended_calories', 'recommended_protein', 'recommended_carbs', 'recommended_fat']]

# One-hot encode the activity_level
activity_dummies = pd.get_dummies(df['activity_level'], prefix='activity')
X = pd.concat([X, activity_dummies], axis=1)

# Ensure all activity levels are present
for level in ['Sedentary', 'Lightly Active', 'Moderately Active', 'Very Active']:
    if f'activity_{level}' not in X.columns:
        X[f'activity_{level}'] = 0

# Reorder columns to match prediction input
X = X[['trimester', 'weight', 'height',
       'activity_Sedentary', 'activity_Lightly Active',
       'activity_Moderately Active', 'activity_Very Active']]

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Scale the features
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

# Train the model
model = LinearRegression()
model.fit(X_train_scaled, y_train)

# Save the model and scaler
joblib.dump(model, 'nutrition_model.joblib')
joblib.dump(scaler, 'nutrition_scaler.joblib')

def predict_nutrition(trimester, weight, height, activity_level):
    # Load the saved model and scaler
    model = joblib.load('nutrition_model.joblib')
    scaler = joblib.load('nutrition_scaler.joblib')

    # Prepare the input data
    input_data = pd.DataFrame({
        'trimester': [trimester],
        'weight': [weight],
        'height': [height],
        'activity_Sedentary': [0],
        'activity_Lightly Active': [0],
        'activity_Moderately Active': [0],
        'activity_Very Active': [0]
    })

    # Set the correct activity level
    activity_column = f'activity_{activity_level}'
    if activity_column in input_data.columns:
        input_data[activity_column] = 1

    # Ensure column order matches training data
    expected_columns = ['trimester', 'weight', 'height',
                        'activity_Sedentary', 'activity_Lightly Active',
                        'activity_Moderately Active', 'activity_Very Active']
    input_data = input_data.reindex(columns=expected_columns)

    # Scale the input data
    input_scaled = scaler.transform(input_data)

    # Make predictions
    predictions = model.predict(input_scaled)

    return {
        'calories': round(predictions[0][0], 2),
        'protein': round(predictions[0][1], 2),
        'carbs': round(predictions[0][2], 2),
        'fat': round(predictions[0][3], 2)
    }

# Add this to your Flask app
@app.route('/nutrition_recommendation', methods=['POST'])
def nutrition_recommendation():
    data = request.json
    print(f"Received data: {data}")  # Log received data
    try:
        if not all(key in data for key in ['trimester', 'weight', 'height', 'activity_level']):
            raise ValueError("Missing required fields")

        recommendation = predict_nutrition(
            data['trimester'],
            data['weight'],
            data['height'],
            data['activity_level']
        )
        print(f"Recommendation: {recommendation}")  # Log recommendation
        return jsonify(recommendation), 200
    except ValueError as ve:
        print(f"ValueError: {str(ve)}")
        return jsonify({"error": str(ve)}), 400
    except Exception as e:
        print(f"Unexpected error: {str(e)}")
        return jsonify({"error": str(e)}), 500


# Function to safely read CSV files
def read_csv_safely(file_path):
    data = []
    with open(file_path, 'r', encoding='utf-8') as file:
        reader = csv.reader(file)
        for row in reader:
            if len(row) >= 2:
                data.append([row[0].strip(), ','.join(row[1:]).strip()])
    return pd.DataFrame(data, columns=['Name', 'Meaning']).drop_duplicates(subset=['Name'])

def read_names_file(file_path):
    df = read_csv_safely(file_path)
    names_data = defaultdict(list)
    for _, row in df.iterrows():
        name = row['Name'].strip().lower()
        meaning = row['Meaning'].strip()
        names_data[name].append({'Name': row['Name'], 'Meaning': meaning})
    return names_data

boys_names = read_names_file('assets/boys_names.csv')
girls_names = read_names_file('assets/girls_names.csv')

@app.route('/suggest_names', methods=['POST'])
def suggest_names():
    data = request.json
    letter_position = data['letter_position']
    letter = data['letter'].lower() if data['letter'] else ''
    gender = data['gender']
    keyword = data.get('keyword_for_meaning', '').lower()

    names_data = boys_names if gender == 'Male' else girls_names

    suggested_names = []

    if letter_position == 'First':
        suggested_names = [name for name in names_data if name.startswith(letter)]
    elif letter_position == 'Last':
        suggested_names = [name for name in names_data if name.endswith(letter)]
    else:  # Meaning search
        for name_list in names_data.values():
            for name_data in name_list:
                if keyword in name_data['Meaning'].lower():
                    suggested_names.append(name_data['Name'].lower())

    # Remove duplicates and limit to 10 results
    suggested_names = list(dict.fromkeys(suggested_names))[:10]

    # Fetch full data for suggested names
    result = []
    for name in suggested_names:
        if name in names_data:
            result.extend(names_data[name])

    return jsonify(result)
if __name__ == '__main__':
    app.run(debug=True)