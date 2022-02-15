import mysql.connector
from flask import Flask, redirect, url_for, render_template, request, session, flash
from datetime import timedelta

app = Flask(__name__)
app.secret_key = "Bernard_1234#"
app.permanent_session_lifetime = timedelta(minutes= 15)

@app.route("/", methods = ["POST", "GET"])
def home():
    if request.method == "POST":
        age_confirmation = request.form ["input1"]
        if age_confirmation == "Yes":
            return redirect(url_for("query"))
        else:
            return render_template("age_fail.html")
    else:
        if user in session:
            return redirect(url_for("query"))
        else:
            return render_template("index.html")


@app.route("/query", methods = ["POST", "GET"])
def query():
    if request.method == "POST":
        flavor1 = request.form ["input1"]
        flavor = (str(flavor1)).replace(" ","_")
        alcohol_type1 = request.form ["input2"]
        alcohol_type = (str(alcohol_type1)).replace(" ","_")
        side_base1 = request.form ["input3"]
        side_base = (str(side_base1)).replace(" ","_")
        topping1 = request.form ["input4"]
        topping = (str(topping1)).replace(" ","_")

        my_list = [flavor, topping, alcohol_type, side_base]
        conn = mysql.connector.connect(
            host="localhost",
            database="Perfect_Cocktaildb",
            user="Al_Af",
            password="Manade_lord1234#" )

        # conn = pyodbc.connect(conn_str)
        cursor = conn.cursor()

        my_dictionary = {}
        my_set = set()
        cocktail_matches = []
        
        cursor.execute("SELECT Cocktail_name, Flavors, Toppings, Alcohol_type, Side_Base FROM Cocktail")
        
        for row in cursor:
            row1 = str(row)
            row2 = row1.replace(",","") 
            row1 = row2.replace(")","")
            row2 = row1.replace("(","")
            row1 = row2.replace("'","")
            row2 = row1.split()
            for i in my_list:
                for x in row2:
                    if i == x:
                        cocktail_matches.append(i)

            if len(cocktail_matches) == 2:
                cocktail_name = row2[0]
                row2 = cocktail_name.replace("_", " ")
                my_dictionary[cocktail_name] = 2
                my_set.add(cocktail_name)
            elif len(cocktail_matches) == 3:
                cocktail_name = row2[0]
                row2 = cocktail_name.replace("_", " ")
                my_dictionary[cocktail_name] = 3
                my_set.add(cocktail_name)
            elif len(cocktail_matches) == 4:
                cocktail_name = row2[0]
                row2 = cocktail_name.replace("_", " ")
                my_dictionary[cocktail_name] = 4
                my_set.add(cocktail_name)
            cocktail_matches = []
        
        my_list = list(my_set)

        last_dictionary = dict(sorted(my_dictionary.items()),reverse = True)

        
        if len(my_list) > 0:
            final_cocktail = list(last_dictionary.keys())[0]
        
        else:
            final_cocktail = "No matches"

        session.permanent = True

        session["user"] = [final_cocktail,last_dictionary]
        return(redirect(url_for("user")))
    else:
        if user in session:
            return redirect(url_for("query"))
        else:
            return render_template("verification.html")
    
@app.route("/user/")
def user():
    if "user" in session:
        user = (session["user"])[0]
        if user == "Irish_Coffee":
            return render_template("Irish_Coffee.html")
        elif user == "CBD_Spritz":
            return render_template("CBD_Spritz.html")
        elif user == "Daiquiri":
            return render_template("Daiquiri.html")
        elif user == "Dark_Side":
            return render_template("Dark_Side.html")
        elif user == "Margarita":
            return render_template("Margarita.html")
        else:
            return f"<h1>Your perfect match is: {user} </h1>"  
    else:
        return redirect(url_for("home"))

@app.route("/alternative", methods = ["POST", "GET"])
def alternative():
        if "user" in session:
            if isinstance((session["user"]), list):
                if len((session["user"])) >= 2:
                    user1 = (session["user"])[1]
                    dictionary_alt = dict(user1)
                elif len((session["user"])) == 1:
                    return f"<h1> No more matches </h1>"
            else:
                user1 = (session["user"])
                dictionary_alt = user1

            if len(dictionary_alt) == 1:
                return f"<h1> No more matches </h1>"
            else:
                ter = list(dictionary_alt.keys())[0]
                ter1 = list(dictionary_alt.keys())[1]
            pop_first = dictionary_alt.pop(ter)
            session["user"] = dictionary_alt
            if ter1 == "Irish_Coffee":
                return render_template("Irish_Coffee.html")
            elif ter1 == "CBD_Spritz":
                return render_template("CBD_Spritz.html")
            elif ter1 == "Daiquiri":
                return render_template("Daiquiri.html")
            elif ter1 == "Dark_Side":
                return render_template("Dark_Side.html")
            elif ter1 == "Margarita":
                return render_template("Margarita.html")
            elif ter1 == "reverse":
                return f"<h1> No more matches </h1>"
            else:
                return f"<h1> Next Match: {ter1} </h1>"

        else:
            return redirect(url_for("home"))


@app.route("/logout")
def logout():
    session.pop("user", None)
    flash("You have been logged out", "info")
    return redirect(url_for("home"))

if __name__ == "__main__":
    app.run(debug=True)