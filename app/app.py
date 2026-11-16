
from flask import Flask, render_template, request, redirect, url_for, flash
from db import get_db_connection

app = Flask(__name__)
app.secret_key = "nss_project_secret_key"


# HOME PAGE
@app.route("/")
def home():
    return redirect(url_for("volunteers"))


# VIEW ALL VOLUNTEERS
@app.route("/volunteers")
def volunteers():
    connection = get_db_connection()

    if connection is None:
        flash("Could not connect to the database.", "error")
        return render_template("volunteers.html", volunteers=[])

    try:
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT * FROM volunteer ORDER BY Volunteer_ID")
        volunteer_list = cursor.fetchall()

        cursor.close()
        connection.close()

        return render_template(
            "volunteers.html",
            volunteers=volunteer_list
        )

    except Exception as err:
        connection.close()
        flash(f"Database error: {err}", "error")
        return render_template("volunteers.html", volunteers=[])


# ADD A VOLUNTEER
@app.route("/volunteers/add", methods=["POST"])
def add_volunteer():
    volunteer_id = request.form["Volunteer_ID"]
    first_name = request.form["First_Name"]
    last_name = request.form["Last_Name"]
    email = request.form["Email"]
    gender = request.form["Gender"]

    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        query = """
            INSERT INTO volunteer
            (Volunteer_ID, First_Name, Last_Name, Email, Gender)
            VALUES (%s, %s, %s, %s, %s)
        """

        values = (
            volunteer_id, first_name, last_name, email, gender
        )

        cursor.execute(query, values)
        connection.commit()

        flash("Volunteer added successfully!", "success")

    except Exception as err:
        connection.rollback()
        flash(f"Could not add volunteer: {err}", "error")

    finally:
        cursor.close()
        connection.close()

    return redirect(url_for("volunteers"))


# UPDATE A VOLUNTEER
@app.route("/volunteers/update", methods=["POST"])
def update_volunteer():
    volunteer_id = request.form["Volunteer_ID"]
    first_name = request.form["First_Name"]
    last_name = request.form["Last_Name"]
    email = request.form["Email"]
    gender = request.form["Gender"]

    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        query = """
            UPDATE volunteer
            SET First_Name = %s,
                Last_Name = %s,
                Email = %s,
                Gender = %s
            WHERE Volunteer_ID = %s
        """

        values = (
            first_name, last_name, email, gender, volunteer_id
        )

        cursor.execute(query, values)
        connection.commit()

        flash("Volunteer updated successfully!", "success")

    except Exception as err:
        connection.rollback()
        flash(f"Could not update volunteer: {err}", "error")

    finally:
        cursor.close()
        connection.close()

    return redirect(url_for("volunteers"))


# DELETE A VOLUNTEER
@app.route("/volunteers/delete", methods=["POST"])
def delete_volunteer():
    volunteer_id = request.form["Volunteer_ID"]

    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        query = """
            DELETE FROM volunteer
            WHERE Volunteer_ID = %s
        """

        cursor.execute(query, (volunteer_id,))
        connection.commit()

        flash("Volunteer deleted successfully!", "success")

    except Exception as err:
        connection.rollback()
        flash(f"Could not delete volunteer: {err}", "error")

    finally:
        cursor.close()
        connection.close()

    return redirect(url_for("volunteers"))

# ==============================
# DRIVE MANAGEMENT
# ==============================

# VIEW ALL DRIVES
@app.route("/drives")
def drives():
    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT * FROM drive ORDER BY Drive_ID")
        drive_list = cursor.fetchall()
        return render_template("drives.html", drives=drive_list)

    except Exception as err:
        flash(f"Database error: {err}", "error")
        return render_template("drives.html", drives=[])

    finally:
        if connection:
            cursor.close()
            connection.close()


# ADD A DRIVE
@app.route("/drives/add", methods=["POST"])
def add_drive():
    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        query = """
            INSERT INTO drive
            (Drive_ID, Drive_Name, Cause, Start_Date, End_Date)
            VALUES (%s, %s, %s, %s, %s)
        """

        values = (
            request.form["Drive_ID"],
            request.form["Drive_Name"],
            request.form["Cause"],
            request.form["Start_Date"],
            request.form["End_Date"]
        )

        cursor.execute(query, values)
        connection.commit()
        flash("Drive added successfully!", "success")

    except Exception as err:
        if connection:
            connection.rollback()
        flash(f"Could not add drive: {err}", "error")

    finally:
        if connection:
            cursor.close()
            connection.close()

    return redirect(url_for("drives"))


# UPDATE A DRIVE
@app.route("/drives/update", methods=["POST"])
def update_drive():
    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        query = """
            UPDATE drive
            SET Drive_Name = %s,
                Cause = %s,
                Start_Date = %s,
                End_Date = %s
            WHERE Drive_ID = %s
        """

        values = (
            request.form["Drive_Name"],
            request.form["Cause"],
            request.form["Start_Date"],
            request.form["End_Date"],
            request.form["Drive_ID"]
        )

        cursor.execute(query, values)
        connection.commit()
        flash("Drive updated successfully!", "success")

    except Exception as err:
        if connection:
            connection.rollback()
        flash(f"Could not update drive: {err}", "error")

    finally:
        if connection:
            cursor.close()
            connection.close()

    return redirect(url_for("drives"))


# DELETE A DRIVE
@app.route("/drives/delete", methods=["POST"])
def delete_drive():
    connection = get_db_connection()

    try:
        cursor = connection.cursor()
        cursor.execute(
            "DELETE FROM drive WHERE Drive_ID = %s",
            (request.form["Drive_ID"],)
        )

        connection.commit()
        flash("Drive deleted successfully!", "success")

    except Exception as err:
        if connection:
            connection.rollback()
        flash(f"Could not delete drive: {err}", "error")

    finally:
        if connection:
            cursor.close()
            connection.close()

    return redirect(url_for("drives"))


# ==============================
# VENUE MANAGEMENT
# ==============================

# VIEW ALL VENUES
@app.route("/venues")
def venues():
    connection = get_db_connection()
    cursor = None

    try:
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT * FROM venue ORDER BY Venue_ID")
        venue_list = cursor.fetchall()

        return render_template("venues.html", venues=venue_list)

    except Exception as err:
        flash(f"Database error: {err}", "error")
        return render_template("venues.html", venues=[])

    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()


# ADD A VENUE
@app.route("/venues/add", methods=["POST"])
def add_venue():
    connection = get_db_connection()
    cursor = None

    try:
        cursor = connection.cursor()

        query = """
            INSERT INTO venue
            (Venue_ID, Venue_Name, Address, Capacity)
            VALUES (%s, %s, %s, %s)
        """

        values = (
            request.form["Venue_ID"],
            request.form["Venue_Name"],
            request.form["Address"],
            request.form["Capacity"]
        )

        cursor.execute(query, values)
        connection.commit()

        flash("Venue added successfully!", "success")

    except Exception as err:
        connection.rollback()
        flash(f"Could not add venue: {err}", "error")

    finally:
        if cursor:
            cursor.close()
        connection.close()

    return redirect(url_for("venues"))


# UPDATE A VENUE
@app.route("/venues/update", methods=["POST"])
def update_venue():
    connection = get_db_connection()
    cursor = None

    try:
        cursor = connection.cursor()

        query = """
            UPDATE venue
            SET Venue_Name = %s,
                Address = %s,
                Capacity = %s
            WHERE Venue_ID = %s
        """

        values = (
            request.form["Venue_Name"],
            request.form["Address"],
            request.form["Capacity"],
            request.form["Venue_ID"]
        )

        cursor.execute(query, values)
        connection.commit()

        flash("Venue updated successfully!", "success")

    except Exception as err:
        connection.rollback()
        flash(f"Could not update venue: {err}", "error")

    finally:
        if cursor:
            cursor.close()
        connection.close()

    return redirect(url_for("venues"))


# DELETE A VENUE
@app.route("/venues/delete", methods=["POST"])
def delete_venue():
    connection = get_db_connection()
    cursor = None

    try:
        cursor = connection.cursor()

        query = """
            DELETE FROM venue
            WHERE Venue_ID = %s
        """

        cursor.execute(query, (request.form["Venue_ID"],))
        connection.commit()

        flash("Venue deleted successfully!", "success")

    except Exception as err:
        connection.rollback()
        flash(f"Could not delete venue: {err}", "error")

    finally:
        if cursor:
            cursor.close()
        connection.close()

    return redirect(url_for("venues"))


# ==============================
# SQL REPORTS
# ==============================

@app.route("/reports")
def reports():
    connection = get_db_connection()
    cursor = None

    participation = []
    volunteer_hours = []
    unattended_drives = []

    try:
        cursor = connection.cursor(dictionary=True)

        # REPORT 1: VOLUNTEER PARTICIPATION
        query1 = """
            SELECT
                v.Volunteer_ID,
                v.First_Name,
                v.Last_Name,
                d.Drive_ID,
                d.Drive_Name
            FROM volunteer v
            LEFT JOIN attends a
                ON v.Volunteer_ID = a.Volunteer_ID
            LEFT JOIN drive d
                ON a.Drive_ID = d.Drive_ID
            ORDER BY v.Volunteer_ID, d.Drive_ID
        """

        cursor.execute(query1)
        participation = cursor.fetchall()


        # REPORT 2: TOTAL CERTIFIED HOURS PER VOLUNTEER
        query2 = """
            SELECT
                v.Volunteer_ID,
                v.First_Name,
                v.Last_Name,
                COALESCE(SUM(c.Hours), 0) AS Total_Hours
            FROM volunteer v
            LEFT JOIN certifies c
                ON v.Volunteer_ID = c.Volunteer_ID
            GROUP BY
                v.Volunteer_ID,
                v.First_Name,
                v.Last_Name
            ORDER BY v.Volunteer_ID
        """

        cursor.execute(query2)
        volunteer_hours = cursor.fetchall()


        # REPORT 3: DRIVES WITH NO VOLUNTEERS
        query3 = """
            SELECT
                d.Drive_ID,
                d.Drive_Name,
                d.Cause
            FROM drive d
            LEFT JOIN attends a
                ON d.Drive_ID = a.Drive_ID
            WHERE a.Volunteer_ID IS NULL
            ORDER BY d.Drive_ID
        """

        cursor.execute(query3)
        unattended_drives = cursor.fetchall()


        return render_template(
            "reports.html",
            participation=participation,
            volunteer_hours=volunteer_hours,
            unattended_drives=unattended_drives
        )

    except Exception as err:
        flash(f"Could not generate reports: {err}", "error")

        return render_template(
            "reports.html",
            participation=participation,
            volunteer_hours=volunteer_hours,
            unattended_drives=unattended_drives
        )

    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()


if __name__ == "__main__":
    app.run(debug=True)
