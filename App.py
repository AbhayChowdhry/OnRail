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

        # if the user wants to Sign Up!
        if choice == 1:
            print("Sign up")
            print("Choose the type of Account amongst the following: ")
            print("1. Customer")
            print("2. Delivery Partner")
            print("3. Seller")
            choice_one = int(input("Enter your choice: "))

            # New Customer Sign-Up
            if choice_one == 1:

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

            # New Delivery Partner Sign-up
            elif choice_one == 2:
                print("Welcome!")
                name = input("Enter your Name: ")
                phone_no = input("Enter your Phone No: ")
                sql_query = "insert into Delivery_partner (partner_name, partner_contact_no, orders_completed) values (%s, %s, %s);"
                vals = (name, phone_no, "0")
                try:
                    cursor.execute(sql_query, vals)
                    db.commit()
                except:
                    print("Error in input")
                    break

                print("Successfully Signed Up!")
                
                query = "SELECT * FROM Delivery_Partner"
                cursor.execute(query)
                print("Your unique User ID is: ")
                print(cursor.fetchall()[-1][0])
                break
            
            # New Seller Sign-Up
            elif choice_one == 3:
                print("Welcome!")
                name = input("Enter your Name: ")
                phone_no = input("Enter your Phone No: ")
                comm = input("Enter your commission: ")
                sql_query = "insert into Seller (seller_name, seller_contact_no, seller_commission) values (%s, %s, %s);"
                vals = (name, phone_no, comm)
                try:
                    cursor.execute(sql_query, vals)
                    db.commit()
                except:
                    print("Error in input")
                    break

                print("Successfully Signed Up!")
                
                query = "SELECT * FROM Seller"
                cursor.execute(query)
                print("Your unique User ID is: ")
                print(cursor.fetchall()[-1][0])
                break


        # if the user chose to login
        elif choice == 2:
            print("Login")
            print("Choose the type of Account amongst the following: ")
            print("1. Customer")
            print("2. Admin")
            print("3. Delivery Partner")
            print("4. Seller")
            choice_one = int(input("Enter your choice: "))

            # Customer
            if choice_one == 1:
                # CHECK IF USER EXISTS IN DATABASE HERE AND IF PASSWORD IS CORRECT
                id = int(input("Enter your Unique Customer ID: "))
                query = "SELECT * FROM Customers"
                cursor.execute(query)

                password = input("Enter your Password: ")
                flag = 0
                for row in cursor.fetchall():
                    if(row[0] == id):
                        correct_pass = row[4]
                        name = row[1]
                        flag = 1
                        break

                if flag == 0:
                    print("Invalid Customer ID")
                else:
                    if(correct_pass == password):
                        print(f"Welcome {name}")
                        # Choose Category
                        category = ""
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

                        rating = float(input("Enter the minimum rating you want: "))

                        #input desired price filter
                        price = float(input("Enter the maximum price you want: "))

                        # create a query to get the products
                        query = "SELECT * FROM PRODUCTS WHERE category = %s AND rating >= %s AND price <= %s"                  
                        vals = (category, rating, price)
                        try:
                            cursor.execute(query, vals)
                        except:
                            print("Invalid Choice")
                        products = cursor.fetchall()
                        for i in products:
                            print(i)
                    else:
                        print("Wrong Password")

            # Admin
            elif choice_one == 2:
                id = int(input("Enter your Unique Admin ID: "))
                query = "SELECT * FROM Admin"
                cursor.execute(query)

                password = input("Enter your Password: ")
                flag = 0
                for row in cursor.fetchall():
                    if(row[0] == id):
                        correct_pass = row[2]
                        name = row[1]
                        flag = 1
                        break

                if flag == 0:
                    print("Invalid Admin ID")
                else:
                    if(correct_pass == password):
                        print(f"Welcome {name}")

                        # Choice of 4 OLAP Queries
                        while True:
                            print("Choose among the following: ")
                            print("1. Number of Orders Placed by Each Customer and Total Orders")
                            print("2. Sales Revenue for each Category with Total Revenue")
                            print("3. Total Revenue Generated by each Category and Seller combination with the Total revenue")
                            print("4. Total number of orders completed by each delivery partner and total number of orders completed")
                            print("5. Number of products in each category, and the total number of products")
                            print("6. Exit / Logout")
                            choice_three = int(input())
                            if choice_three == 1:
                                # Define the SQL query
                                query = """ SELECT 
                                                CASE WHEN customer_name IS NULL THEN 'Total' ELSE customer_name END AS Customer, 
                                                COUNT(order_id) AS Orders_Placed
                                            FROM 
                                                customers c
                                            LEFT JOIN order_payment op ON c.customer_id = op.customer_id
                                            GROUP BY 
                                                c.customer_name
                                            WITH ROLLUP;"""

                                # Execute the query
                                cursor.execute(query)

                                # Fetch the results
                                for row in cursor.fetchall():
                                    print(row)
                            
                            elif choice_three == 2:
                                # Define the SQL query
                                query = """ SELECT c.category_name, SUM(op.order_value) AS total_sales
                                            FROM order_payment op
                                            JOIN order_items oi ON oi.order_id = op.order_id AND oi.customer_id = op.customer_id
                                            JOIN product p ON p.product_id = oi.product_id
                                            JOIN category c ON c.category_id = p.category_id
                                            GROUP BY c.category_name WITH ROLLUP;"""

                                # Execute the query
                                cursor.execute(query)

                                # Fetch the results
                                for row in cursor.fetchall():
                                    print(row)
                            
                            elif choice_three == 3:
                                # Define the SQL query
                                query = """SELECT c.category_name, s.seller_name, SUM(op.order_value) AS total_revenue
                                            FROM order_payment op
                                            JOIN order_items oi ON oi.order_id = op.order_id AND oi.customer_id = op.customer_id
                                            JOIN product p ON p.product_id = oi.product_id
                                            JOIN category c ON c.category_id = p.category_id
                                            JOIN seller s ON s.seller_id = p.seller_id
                                            GROUP BY c.category_name, s.seller_name WITH ROLLUP;"""

                                # Execute the query
                                cursor.execute(query)

                                # Fetch the results
                                for row in cursor.fetchall():
                                    print(row)
                            
                            elif choice_three == 4:
                                # Define the SQL query
                                query = """SELECT 
                                                IFNULL(partner_name, 'Total') AS delivery_partner,
                                                COUNT(*) AS orders_completed
                                            FROM 
                                                order_items oi
                                                INNER JOIN delivery_partner dp ON oi.partner_id = dp.partner_id
                                            GROUP BY 
                                                partner_name WITH ROLLUP;"""

                                # Execute the query
                                cursor.execute(query)

                                # Fetch the results
                                for row in cursor.fetchall():
                                    print(row)
                            
                            elif choice_three == 5:
                                # Define the SQL query
                                query = """SELECT 
                                                IFNULL(category_name, 'Total') AS category,
                                                COUNT(*) AS products_in_category
                                            FROM 
                                                product p
                                                INNER JOIN category c ON p.category_id = c.category_id
                                            GROUP BY 
                                                category_name WITH ROLLUP;"""

                                # Execute the query
                                cursor.execute(query)

                                # Fetch the results
                                for row in cursor.fetchall():
                                    print(row)

                            elif choice_three == 6:
                                print("Bye!")
                                break
                            
                            else:
                                print("Invalid Choice!")
                    else:
                        print("Wrong Password")

            # Delivery Partner
            elif choice_one == 3:
                print("Welcome!")
            
            # Seller
            elif choice_one == 4:
                print("Welcome!")

        # If the user wants to exit the App
        elif choice == 3:
            break
        
        # if the user chose something else
        else:
            print("Invalid choice")
    
    # Close the database connection
    cursor.close()
    db.close()


main()
