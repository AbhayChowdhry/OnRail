import mysql.connector

def main():
    # Connect to the database
    db = mysql.connector.connect(user='root', password='idonthaveanewpassword@1234',
                                host='localhost', database='Online_Retail_Store')
    cursor = db.cursor()

    while True:
        print("Welcome to Onrail, choose one of the following:")
        print("1. Sign Up")
        print("2. Log In")
        print("3. Exit")

        # get the user's choice
        choice = int(input("Enter your choice: "))

        if choice == 1:
            print("Sign up")
            print("Choose the type of Account amongst the following: ")
            print("1. Customer")
            print("2. Delivery Partner")
            print("3. Seller")
            choice_one = int(input("Enter your choice: "))

            if choice_one == 1:
               # Customer
               print("Welcome!")
               name = input("Enter your Name: ")
               phone_no = input("Enter your Phone No: ")
               address = input("Enter your address: ")
               email = input("Enter your email-ID: ")
               password = input("Make a strong password for your account: ")
               sql_query = "insert into Customers (customer_name, phone_no, address, customer_password, email_id) values (%s, %s, %s, %s, %s);"
               vals = (name, phone_no, address, password, email)
               cursor.execute(sql_query, vals)
               db.commit()
               print("Successfully Signed Up!")
               
               query = "SELECT * FROM CUSTOMERS"
               cursor.execute(query)
               print("Your unique User ID is: ")
               print(cursor.fetchall()[-1][0])
               break
            elif choice_one == 2:
                print("Welcome!")
                # D.P.
            elif choice_one == 3:
                print("Welcome!")
                # Seller

        # if the user chose to login
        elif choice == 2:
            print("Login")
            print("Choose the type of Account amongst the following: ")
            print("1. Customer")
            print("2. Admin")
            print("3. Delivery Partner")
            print("4. Seller")
            choice_one = int(input("Enter your choice: "))

            if choice_one == 1:
                # Customer
                print("Welcome!")
                # LOGIN

                while(True):
                    print("Choose a category: ")
                    print("1. Electronics and Gadgets")
                    print("2. Home and Kitchen")
                    print("3. Beauty and Personal Care")
                    print("4. Toys and Games")
                    print("5. Books and Office Supplies")
                    print("6. Sports and Fitness")
                    print("7. Clothing and Accessories")
                    choice_two = int(input("Enter your choice: "))
                    
                    if choice_two == 1:
                        category = "Electronics and Gadgets"                
                        break
                    elif choice_two == 2:
                        category = "Home and Kitchen"
                        break
                    elif choice_two == 3:
                        category = "Beauty and Personal Care"
                        break
                    elif choice_two == 4:
                        category = "Toys and Games"
                        break
                    elif choice_two == 5:
                        category = "Books and Office Supplies"
                        break
                    elif choice_two == 6:
                        category = "Sports and Fitness"
                        break
                    elif choice_two == 7:
                        category = "Clothing and Accessories"
                        break
                    else:
                        print("Invalid choice")

                #input desired rating out of 10 filter
                rating = float(input("Enter the minimum rating you want: "))

                #input desired price filter
                price = float(input("Enter the maximum price you want: "))

                # create a query to get the products
                query = "SELECT * FROM PRODUCTS WHERE category = %s AND rating >= %s AND price <= %s"                  
                vals = (category, rating, price)
                cursor.execute(query, vals)
                products = cursor.fetchall()

            elif choice_one == 2:
                print("Welcome!")
                # Admin
            elif choice_one == 3:
                print("Welcome!")
                # D.P.
            elif choice_one == 4:
                print("Welcome!")
                # Seller

            # CHECK IF USER EXISTS IN DATABASE HERE AND IF PASSWORD IS CORRECT and TRIGGER

        # if the user wants to exit the app
        elif choice == 3:
            break
        
        # if the user chose something else
        else:
            print("Invalid choice")
    
    # Close the database connection
    cursor.close()
    db.close()


main()
