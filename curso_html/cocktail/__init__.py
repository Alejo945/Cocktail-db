import mysql.connector
from flask import Flask, redirect, url_for, render_template, request, session, flash
from datetime import timedelta
import random



def create_app(test_config=None):

    app = Flask(__name__)
    app.secret_key = "Bernard_1234#"
    app.permanent_session_lifetime = timedelta(minutes= 15)

    @app.route("/cocktail/", methods = ["POST", "GET"])
    def home():
        if request.method == "POST":
            age_confirmation = request.form ["input1"]
            if age_confirmation == "Yes":
                session["user1"] = ""
                return redirect(url_for("query"))
            else:
                return render_template("age_fail.html")
        else:
            if user in session:
                return redirect(url_for("query"))
            else:
                return render_template("index.html")


    @app.route("/cocktail/query/", methods = ["POST", "GET"])
    def query():
        if request.method == "POST":
            flavor1 = request.form ["input1"]
            flavor = (str(flavor1)).replace(" ","_")
            flavor_2 = request.form ["input5"]
            flavor2 = (str(flavor_2)).replace(" ","_")
            alcohol_type1 = request.form ["inputC"]
            alcohol_type = (str(alcohol_type1)).replace(" ","_")
            alcohol_type_2 = request.form ["inputD"]
            alcohol_type2 = (str(alcohol_type_2)).replace(" ","_")
            side_base1 = request.form ["inputE"]
            side_base = (str(side_base1)).replace(" ","_")
            side_base_2 = request.form ["inputF"]
            side_base2 = (str(side_base_2)).replace(" ","_")
            topping1 = request.form ["inputG"]
            topping = (str(topping1)).replace(" ","_")
            topping_2 = request.form ["inputH"]
            topping2 = (str(topping_2)).replace(" ","_")



            flavor_tuple = (flavor, flavor2)
            flavor_tuple_2 = (flavor1, flavor_2)
            alcohol_tuple = (alcohol_type, alcohol_type2)
            alcohol_tuple_2 = (alcohol_type1, alcohol_type_2)
            side_tuple = (side_base, side_base2)
            side_tuple_2 = (side_base1, side_base_2)
            topping_tuple = (topping, topping2)
            topping_tuple_2 = (topping1, topping_2)

            my_list = [flavor_tuple, topping_tuple, alcohol_tuple, side_tuple]

            my_list3 = "Flavor: " + (str(flavor_tuple_2)) + "   " + "Toppings: " + (str(topping_tuple_2)) + "   " + "Alcohols: " + (str(alcohol_tuple_2)) + "   " + "Side Bases: " + (str(side_tuple_2))
            my_list2 = my_list3.replace("(","")
            my_list3 = my_list2.replace(")","")
            my_list2 = my_list3.replace("'","")
            my_list3 = my_list2.replace('"',"")

            session["flavor"] = my_list3
            conn = mysql.connector.connect(
                host="localhost",
                database="Final_Perfect_Cocktail",
                user="root",
                password="MySqL2022*" )

            # conn = pyodbc.connect(conn_str)
            cursor = conn.cursor()

            my_dictionary = {}
            my_set = set()
            cocktail_matches = []

            my_name = []
            my_cocktails = []

            #FLAVORS
            cursor.execute("SELECT idFlavors FROM Flavors WHERE Flavor_Type = %s OR Flavor_Type = %s", (flavor, flavor2))

            for row in cursor:
                my_name.append(row)

            if len(my_name) == 2:

                cursor.execute ("SELECT Cocktail_Name FROM Cocktails c, Cocktails_has_Flavors cf WHERE cf.idCocktails = c.idCocktails AND (cf.idFlavors = %s OR cf.idFlavors = %s)", (my_name[0],my_name[1]))


            else:
                cursor.execute ("SELECT Cocktail_Name FROM Cocktails c, Cocktails_has_Flavors cf WHERE cf.idCocktails = c.idCocktails AND (cf.idFlavors = %s)", (my_name[0]))

            for row in cursor:
                row1 = str(row)
                row2 = row1.replace(",","")
                row1 = row2.replace(")","")
                row2 = row1.replace("(","")
                row1 = row2.replace("'","")
                my_cocktails.append(row1)


            #SIDE BASES
            my_name = []

            cursor.execute("SELECT idSB FROM Side_Base WHERE SB_Type = %s OR SB_Type = %s", (side_base1, side_base_2))

            for row in cursor:
                my_name.append(row)

            if len(my_name) == 2:

                cursor.execute ("SELECT Cocktail_Name FROM Cocktails c, Cocktails_has_Side_Base cb  WHERE cb.idCocktails = c.idCocktails AND (cb.idSB = %s OR cb.idSB = %s)", (my_name[0],my_name[1]))


            else:
                cursor.execute ("SELECT Cocktail_Name FROM Cocktails c, Cocktails_has_Side_Base cb  WHERE cb.idCocktails = c.idCocktails AND (cb.idSB = %s)", (my_name[0]))

            for row in cursor:
                row1 = str(row)
                row2 = row1.replace(",","")
                row1 = row2.replace(")","")
                row2 = row1.replace("(","")
                row1 = row2.replace("'","")
                my_cocktails.append(row1)


            #TYPE OF Alcohol
            my_name = []

            cursor.execute("SELECT idAlcohol FROM Type_of_Alcohol WHERE Alcohol_Type = %s OR Alcohol_Type = %s", (alcohol_type1, alcohol_type_2))

            for row in cursor:
                my_name.append(row)


            if len(my_name) == 2:

                cursor.execute ("SELECT Cocktail_Name FROM Cocktails c, Cocktails_has_Type_of_Alcohol ca  WHERE ca.idCocktails = c.idCocktails AND (ca.idAlcohol = %s OR ca.idAlcohol = %s)", (my_name[0],my_name[1]))


            else:
                cursor.execute ("SELECT Cocktail_Name FROM Cocktails c, Cocktails_has_Type_of_Alcohol ca  WHERE ca.idCocktails = c.idCocktails AND (ca.idAlcohol = %s)", (my_name[0]))

            for row in cursor:
                row1 = str(row)
                row2 = row1.replace(",","")
                row1 = row2.replace(")","")
                row2 = row1.replace("(","")
                row1 = row2.replace("'","")
                my_cocktails.append(row1)


            #TOPPINGS
            my_name = []

            cursor.execute("SELECT idToppings FROM Toppings WHERE Toppings_Type = %s OR Toppings_Type = %s", (topping1, topping_2))

            for row in cursor:
                my_name.append(row)

            if len(my_name) == 2:

                cursor.execute ("SELECT Cocktail_Name FROM Cocktails c, Cocktails_has_Toppings ct  WHERE ct.idCocktails = c.idCocktails AND (ct.idToppings = %s OR ct.idToppings = %s)", (my_name[0],my_name[1]))


            else:
                cursor.execute ("SELECT Cocktail_Name FROM Cocktails c, Cocktails_has_Toppings ct  WHERE ct.idCocktails = c.idCocktails AND (ct.idToppings = %s)", (my_name[0]))

            for row in cursor:
                row1 = str(row)
                row2 = row1.replace(",","")
                row1 = row2.replace(")","")
                row2 = row1.replace("(","")
                row1 = row2.replace("'","")
                my_cocktails.append(row1)


            my_set = set()
            for i in my_cocktails:
                my_set.add(i)

            for i in my_set:
                x = my_cocktails.count(i)
                my_dictionary[i] = x


            my_list = list(my_set)

            last_dictionary = dict(sorted(my_dictionary.items(), key=lambda x: x[1], reverse=True))

            if len(my_list) > 0:
                final_cocktail = list(last_dictionary.keys())[0]
                session["user"] = final_cocktail
                final_cocktail_1 = [final_cocktail]
                cursor.execute("SELECT idCocktails FROM Cocktails WHERE Cocktail_Name = %s", (final_cocktail_1))
                for row in cursor:
                     cocktail_id = row
                session["id"] = cocktail_id
                session["dict"] = last_dictionary
            else:
                final_cocktail = "No matches"

            session.permanent = True
            return(redirect(url_for("user")))
        else:
            if user in session:
                return redirect(url_for("query"))
            else:
                return render_template("verification.html")

    @app.route("/cocktail/user/")
    def user():
        if "user" in session:
            conn = mysql.connector.connect(
                host="localhost",
                database="Final_Perfect_Cocktail",
                user="root",
                password="MySqL2022*" )

            # conn = pyodbc.connect(conn_str)
            cursor = conn.cursor()
            user = (session["id"])
            naming = (session["user"])
            userx = (str(naming)).replace("_", " ")
            return_flavor = session["flavor"]

            flavor_final = []
            cursor.execute("SELECT Flavor_Type FROM Flavors f, Cocktails_has_Flavors cf WHERE cf.idFlavors = f.idFlavors AND cf.idCocktails = %s", (user))
            for row in cursor:
                row1 = str(row)
                row2 = row1.replace(",","")
                row1 = row2.replace(")","")
                row2 = row1.replace("(","")
                row1 = row2.replace("'","")
                flavor_final.append(row1)


            sb_final = []
            cursor.execute("SELECT SB_Type FROM Side_Base s, Cocktails_has_Side_Base sb WHERE sb.idSB = s.idSB AND sb.idCocktails = %s", (user))
            for row in cursor:
                row1 = str(row)
                row2 = row1.replace(",","")
                row1 = row2.replace(")","")
                row2 = row1.replace("(","")
                row1 = row2.replace("'","")
                sb_final.append(row1)

            toppings_final = []
            cursor.execute("SELECT Toppings_Type FROM Toppings t, Cocktails_has_Toppings ct WHERE ct.idToppings = t.idToppings AND ct.idCocktails = %s", (user))
            for row in cursor:
                row1 = str(row)
                row2 = row1.replace(",","")
                row1 = row2.replace(")","")
                row2 = row1.replace("(","")
                row1 = row2.replace("'","")
                toppings_final.append(row1)

            alcohol_final = []
            cursor.execute("SELECT Alcohol_Type FROM Type_of_Alcohol a, Cocktails_has_Type_of_Alcohol ta WHERE a.idAlcohol = ta.idAlcohol AND ta.idCocktails = %s", (user))
            for row in cursor:
                row1 = str(row)
                row2 = row1.replace(",","")
                row1 = row2.replace(")","")
                row2 = row1.replace("(","")
                row1 = row2.replace("'","")
                alcohol_final.append(row1)

            cursor.execute("SELECT Recipe FROM Cocktails WHERE idCocktails = %s", (user))

            for row in cursor:
                row1 = str(row)
                row2 = row1.replace(")","")
                row1 = row2.replace("(","")
                row2 = row1.replace("'","")
                final_recipe = row2

            final_recipe_2 = final_recipe.replace(">", "<br> <br>")

            cursor.execute("SELECT Image_URL FROM Cocktails WHERE idCocktails = %s", (user))

            for row in cursor:
                row1 = str(row)
                row2 = row1.replace(")","")
                row1 = row2.replace("(","")
                row2 = row1.replace("'","")
                row1 = row2.replace(",","")
                final_image = row1



            flavor = "Flavors: " + str(flavor_final) + "   Toppings: " + str(toppings_final) + "   Alcohols: " + str(alcohol_final) + "   Side Bases: " + str(sb_final)
            return f""" <!doctype html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Perfect Cocktail Outputs</title>
        <!-- Bootstrap core CSS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="/static/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <!-- Begin navbar -->
        <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top" style="background-color: #062d4c">
            <a class="navbar-brand mr-0" href="/cocktail/query">
            <img class="mr-1" src="/static/cocktail.png" alt="" width="30" height="30">
            Perfect Cocktail
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse ml-5" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                <a class="nav-link" href="http://127.0.0.1:5000/">
                    Home
                </a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="http://127.0.0.1:5000/query">
                    Try another One
                </a>
                </li>
                <li class="nav-item">
                <a class="nav-link active" href="Irish_Coffee.html">
                    Result
                </a>
                </li>
            </ul>
            </div>
        </nav>
        </header>
        <!-- End navbar -->
        <!-- Begin page content -->
        <main role="main" class="container-fluid">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">We chose this for you</h1>
            </div>
            <div class="row border-bottom mb-12 pb-5">
            <div class="col-md-6">
                <h4>{userx}</h4>
                <img src="{final_image}" class="img-fluid" alt="{userx}">
            </div>

            <!--</div>-->
            <!--<div class="row pb-5">-->
            <div class="col-md-6">
                <h4 class="mb-4">Recipe</h4>
                {final_recipe_2}
                <br>
                <br>
                <p>Your search</p>
                {return_flavor}
                <br>
                <br>
                <p>Cocktail Atributes</p>
                {flavor}
                <br>
                <br>
                <a href="http://127.0.0.1:5000/cocktail/alternative">
                <button>See other matches</button>
            </a>

            </form>
            </div>
            </div>
        </main>
        <!-- End page content -->
    </body>
    </html>
    """


        else:
            return redirect(url_for("home"))

    @app.route("/cocktail/alternative/", methods = ["POST", "GET"])
    def alternative():
            if "user" in session:
                userx = session["user"]
                dicter = session["dict"]
                if len(dicter) >= 2:
                    dictionary_alt1 = dict(dicter)
                elif len(userx[1]) == 1:
                    return f"<h1> No more matches </h1>"

                dictionary_alt = dict(sorted(dictionary_alt1.items(), key=lambda x: x[1], reverse=True))

                dictionary_alt.pop(userx)
                ter = list(dictionary_alt.keys())[0]

                ter1 = [ter]
                terx = (str(ter)).replace("_", " ")
                return_flavor = session["flavor"]


                conn = mysql.connector.connect(
                    host="localhost",
                    database="Final_Perfect_Cocktail",
                    user="root",
                    password="MySqL2022*" )

                # conn = pyodbc.connect(conn_str)
                cursor = conn.cursor()
                user = (session["id"])
                naming = (session["user"])
                userx = (str(naming)).replace("_", " ")
                return_flavor = session["flavor"]

                cursor.execute("SELECT idCocktails FROM Cocktails WHERE Cocktail_Name = %s", (ter1))
                for row in cursor:
                    row1 = str(row)
                    row2 = row1.replace(",","")
                    row1 = row2.replace(")","")
                    row2 = row1.replace("(","")
                    row1 = row2.replace("'","")
                    user = row1

                user = [user]

                flavor_final = []
                cursor.execute("SELECT Flavor_Type FROM Flavors f, Cocktails_has_Flavors cf WHERE cf.idFlavors = f.idFlavors AND cf.idCocktails = %s", (user))
                for row in cursor:
                    row1 = str(row)
                    row2 = row1.replace(",","")
                    row1 = row2.replace(")","")
                    row2 = row1.replace("(","")
                    row1 = row2.replace("'","")
                    flavor_final.append(row1)


                sb_final = []
                cursor.execute("SELECT SB_Type FROM Side_Base s, Cocktails_has_Side_Base sb WHERE sb.idSB = s.idSB AND sb.idCocktails = %s", (user))
                for row in cursor:
                    row1 = str(row)
                    row2 = row1.replace(",","")
                    row1 = row2.replace(")","")
                    row2 = row1.replace("(","")
                    row1 = row2.replace("'","")
                    sb_final.append(row1)

                toppings_final = []
                cursor.execute("SELECT Toppings_Type FROM Toppings t, Cocktails_has_Toppings ct WHERE ct.idToppings = t.idToppings AND ct.idCocktails = %s", (user))
                for row in cursor:
                    row1 = str(row)
                    row2 = row1.replace(",","")
                    row1 = row2.replace(")","")
                    row2 = row1.replace("(","")
                    row1 = row2.replace("'","")
                    toppings_final.append(row1)

                alcohol_final = []
                cursor.execute("SELECT Alcohol_Type FROM Type_of_Alcohol a, Cocktails_has_Type_of_Alcohol ta WHERE a.idAlcohol = ta.idAlcohol AND ta.idCocktails = %s", (user))
                for row in cursor:
                    row1 = str(row)
                    row2 = row1.replace(",","")
                    row1 = row2.replace(")","")
                    row2 = row1.replace("(","")
                    row1 = row2.replace("'","")
                    alcohol_final.append(row1)


                cursor.execute("SELECT Recipe FROM Cocktails WHERE idCocktails = %s", (user))

                for row in cursor:
                    row1 = str(row)
                    row2 = row1.replace(")","")
                    row1 = row2.replace("(","")
                    row2 = row1.replace("'","")
                    final_recipe = row2

                final_recipe_2 = final_recipe.replace(">", "<br> <br>")

                cursor.execute("SELECT Image_URL FROM Cocktails WHERE idCocktails = %s", (user))

                for row in cursor:
                    row1 = str(row)
                    row2 = row1.replace(")","")
                    row1 = row2.replace("(","")
                    row2 = row1.replace("'","")
                    row1 = row2.replace(",","")
                    final_image = row1



                flavor = "Flavors: " + str(flavor_final) + "   Toppings: " + str(toppings_final) + "   Alcohols: " + str(alcohol_final) + "   Side Bases: " + str(sb_final)
                return f""" <!doctype html>
        <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">
            <title>Perfect Cocktail Outputs</title>
            <!-- Bootstrap core CSS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
            <link href="/static/bootstrap.min.css" rel="stylesheet">

        </head>
        <body>
            <!-- Begin navbar -->
            <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top" style="background-color: #062d4c">
                <a class="navbar-brand mr-0" href="/cocktail/query">
                <img class="mr-1" src="/static/cocktail.png" alt="" width="30" height="30">
                Perfect Cocktail
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse ml-5" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                    <a class="nav-link" href="http://127.0.0.1:5000/">
                        Home
                    </a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="http://127.0.0.1:5000/query">
                        Try another One
                    </a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link active" href="Irish_Coffee.html">
                        Result
                    </a>
                    </li>
                </ul>
                </div>
            </nav>
            </header>
            <!-- End navbar -->
            <!-- Begin page content -->
            <main role="main" class="container-fluid">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">We chose this for you</h1>
                </div>
                <div class="row border-bottom mb-12 pb-5">
                <div class="col-md-6">
                    <h4>{ter}</h4>
                    <img src= "{final_image}" class="img-fluid" alt="{ter}">
                </div>

                <!--</div>-->
                <!--<div class="row pb-5">-->
                <div class="col-md-6">
                    <h4 class="mb-4">Recipe</h4>
                    {final_recipe_2}
                    <br>
                    <br>
                    <p>Your search</p>
                    {return_flavor}
                    <br>
                    <br>
                    <p>Cocktail Atributes</p>
                    {flavor}
                    <br>
                    <br>
                    <a href="http://127.0.0.1:5000/cocktail/alternative">
                    <button>See other matches</button>
                </a>

                </form>
                </div>
                </div>
            </main>
            <!-- End page content -->
        </body>
        </html>
        """


            else:
                return redirect(url_for("home"))

    @app.route("/cocktail/register", methods =("POST", "GET"))
    def register():
        if request.method == "POST":
            return render_template("login2.html")
        else:
            return redirect(url_for("home"))

    @app.route("/cocktail/log", methods =("POST", "GET"))
    def log():
        if request.method == "POST":
            return render_template("log.html")
        else:
            return redirect(url_for("home"))

    @app.route("/cocktail/login2", methods =("POST", "GET"))
    def login2():
        if request.method == "POST":
            age_confirmation = request.form ["input1"]
            if age_confirmation == "Yes":
                return render_template("register.html")
        else:
            return redirect(url_for("home"))

    @app.route("/cocktail/query2", methods =("POST", "GET"))
    def query2():
        if request.method == "POST":
            return redirect(url_for("query"))
        else:
            return redirect(url_for("home"))

    @app.route("/cocktail/verify", methods =("POST", "GET"))
    def verify():
        if request.method == "POST":
            username = request.form ["uname"]
            password = request.form ["psw"]
            conn = mysql.connector.connect(
                host="localhost",
                database="Perfect_Cocktaildb",
                user="Al_Af",
                password="Manade_lord1234#" )

            # conn = pyodbc.connect(conn_str)
            cursor = conn.cursor()
            name = []
            cursor.execute('''SELECT * FROM users WHERE Username = %s and Password = %s''',(username,password))

            for row in cursor:
                name.append(row)
            if name == []:
                flash("Incorrect password or user. Try again")
                return render_template("log.html")
            else:
                session["user1"] = username
                return render_template("my_page.html")
            #return render_template("register.html")
        else:
            return redirect(url_for("home"))

    @app.route("/cocktail/create", methods =("POST", "GET"))
    def create():
        if request.method == "POST":
            username = request.form ["uname"]
            username1 = [username]
            password = request.form ["psw"]
            conn = mysql.connector.connect(
                host="localhost",
                database="Perfect_Cocktaildb",
                user="Al_Af",
                password="Manade_lord1234#" )

            # conn = pyodbc.connect(conn_str)
            cursor = conn.cursor()
            name = []
            cursor.execute('''SELECT * FROM users WHERE Username = %s ''', (username1))

            for row in cursor:
                name.append(row)
            if name != []:
                flash("User already exists")
                return render_template("log.html")
            else:
                x = random.randint(1, 100001)
                x1 = [x]
                id = []
                cursor.execute('''SELECT * FROM users WHERE UserID = %s''',(x1))
                for row in cursor:
                    id.append(row)

                if id == []:
                    cursor.execute('''INSERT INTO users (UserID, Username, Password) VALUES (%s, %s, %s)''',(x,username,password))
                    conn.commit()
                else:
                    x = random.randint(1, 100001)
                    x1 = [x]
                    cursor.execute('''SELECT * FROM users WHERE UserID = %s''',(x1))
                    for row in cursor:
                        id.append(row)
                    if id == []:
                        cursor.execute('''INSERT INTO users(UserID, Username, Password) VALUES (%s, %s, %s)''',(x,username,password))
                        conn.commit()
                return render_template("my_page.html")
            #return render_template("register.html")
        else:
            return redirect(url_for("home"))

    @app.route("/cocktail/like/", methods =("POST", "GET"))
    def like():
        if request.method == "POST":
            name = session["user1"]
            info = session["id"]
            if name == "":
                return(redirect(url_for("user")))

            else:
                conn = mysql.connector.connect(
                    host="localhost",
                    database="Perfect_Cocktaildb",
                    user="Al_Af",
                    password="Manade_lord1234#" )

                # conn = pyodbc.connect(conn_str)
                cursor = conn.cursor()

                list_c = ""
                list_e = ""
                list_c += str(info[0]) + ","
                name1 = [name]
                cursor.execute("SELECT History FROM users WHERE Username = %s;",(name1))

                for row in cursor:
                    for i in row:
                        if  i != "NULL":
                            if i is not None:
                                row1 = str(row)
                                row = row1.replace(")","")
                                row1 = row.replace("(","")
                                row = row1.replace('"',"")

                                list_c += row1

                list_c.split(",")
                for i in list_c:
                    if i != "reverse":
                        list_e += i


                if list_e[-1] == ",":
                    list_d =list_e[:-1]

                else:
                    list_d = list_e
                cursor.execute('''UPDATE users SET History = %s WHERE Username = %s''',(list_d, name))
                conn.commit()
                return(redirect(url_for("user")))

    @app.route("/cocktail/logout/")
    def logout():
        session.pop("user", None)
        flash("You have been logged out", "info")
        return redirect(url_for("home"))

    return app
