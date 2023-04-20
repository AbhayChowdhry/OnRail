import mysql.connector
import pandas as pd
import datetime 

def main():
    # Connect to the database
    db = mysql.connector.connect(user='root', password='Dbm5_098',
                                host='localhost', database='Online_Retail_Store')
    
    # abhay password : Dbm5_098
    # arnav password : idonthaveanewpassword@1234
    
    cursor = db.cursor()

    while True:
        print("Welcome to Onrail, choose one of the following:")
        print("1. Sign Up")
        print("2. Log In")
        print("3. Exit")
        print("4. Triggers Example")

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
                        print("Choose one of the following: ")
                        print("1. View Products")
                        print("2. View Cart")
                        print("3. Place Order")
                        print("4. Exit")

                        choice_two = int(input("Enter your choice: "))
                        
                        # if choice_two == 1:
                        if(choice_two == 1):
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
                                
                                if choice_two in [1, 2, 3, 4, 5, 6, 7]:
                                    break
                                else:
                                    print("Invalid choice")

                            rating = float(input("Enter the minimum rating you want: "))

                            #input desired price filter
                            price = float(input("Enter the maximum price you want: "))

                            # create a query to get the products
                            query = "SELECT * FROM PRODUCT WHERE category_id = %s AND product_rating >= %s AND product_price <= %s"                  
                            vals = (choice_two, rating, price)
                            cursor.execute(query, vals)
                            products = cursor.fetchall()
    
                            df = pd.DataFrame(products, columns = ['Product ID', 'Product Name', 'Price', 'Seller ID', 'Category ID', 'Product Rating'])

                            with pd.option_context('display.max_rows', None, 'display.max_columns', None):
                                print(df)

                            # add to cart
                            while(True):
                                # do you want to add a product to cart
                                print("Do you want to add a product to cart?")
                                print("1. Yes")
                                print("2. No")
                                choice_three = int(input("Enter your choice: "))
                                if choice_three == 1:
                                    choice_three = int(input("Enter the Product ID of the product you want to add to cart: "))

                                    # check quantity of product in Inventory (product_id, quantity_in_stock)
                                    query = "SELECT * FROM INVENTORY WHERE product_id = %s"
                                    vals = (choice_three,)
                                    cursor.execute(query, vals)
                                    product = cursor.fetchall()

                                    if(len(product) == 0):
                                        print("Invalid Product ID")
                                    else:
                                        # enter quantity
                                        quantity = int(input("Enter the quantity of the product you want to add to cart: "))
                                        if(quantity > product[0][1]):
                                            print("Not enough quantity in stock")                                       

                                        else:
                                            query = "insert into Cart (customer_id, product_id, product_quantity) values (%s, %s, %s);"
                                            vals = (id, choice_three, quantity)
                                            cursor.execute(query, vals)
                                            db.commit()

                                            print("Product added to cart")
                                            break

                                elif choice_three == 2:
                                    break

                        # if choice_two == 2:
                        elif(choice_two == 2):
                            query = "SELECT * FROM CART WHERE customer_id = %s"
                            vals = (id,)
                            cursor.execute(query, vals)
                            cart = cursor.fetchall()
                            print("your cart is:")
                            df = pd.DataFrame(cart, columns = ['Customer ID', 'Product ID', 'Quantity'])
                            with pd.option_context('display.max_rows', None, 'display.max_columns', None):
                                print(df)

                        # if choice_two == 3:
                        elif(choice_two == 3):
                            query = "SELECT * FROM CART WHERE customer_id = %s"
                            vals = (id,)
                            cursor.execute(query, vals)
                            cart = cursor.fetchall()
                            print("your cart is:")
                            df = pd.DataFrame(cart, columns = ['Customer ID', 'Product ID', 'Quantity'])
                            with pd.option_context('display.max_rows', None, 'display.max_columns', None):
                                print(df)

                            # do you want something from cart
                            print("Do you want to remove a product from cart?")
                            print("1. Yes")
                            print("2. No")
                            choice_three = int(input("Enter your choice: "))
                            if choice_three == 1:

                                # input the product id of the product to be removed
                                choice_three = int(input("Enter the Product ID of the product you want to remove from cart: "))
                                query = "DELETE FROM CART WHERE customer_id = %s AND product_id = %s"
                                vals = (id, choice_three)
                                cursor.execute(query, vals)
                                db.commit()

                                print("Product removed from cart")

                            print("Do you want to confirm the order?")
                            print("1. Yes")
                            print("2. No")
                            choice_four = int(input("Enter your choice: "))
                            if choice_four == 1:

                                # get all iterms in cart
                                query = "SELECT * FROM CART WHERE customer_id = %s"
                                vals = (id,)
                                cursor.execute(query, vals)
                                cart = cursor.fetchall()
                                
                                # get the total price of the order
                                total_price = 0
                                for item in cart:
                                    query = "SELECT * FROM PRODUCT WHERE product_id = %s"
                                    vals = (item[1],)
                                    cursor.execute(query, vals)
                                    product = cursor.fetchall()
                                    total_price += product[0][2] * item[2]
                                    
                                # payment
                                print("Total price of the order is: ", total_price)
                                print("Enter your payment details: ")
                                print("1. UPI")
                                print("2. Credit Card")
                                print("3. Debit Card")
                                print("4. Net Banking")
                                print("5. Cash on Delivery")
                                choice_five = int(input("Enter your choice: "))
                                if choice_five == 1:
                                    payment_method = "UPI"
                                elif choice_five == 2:
                                    payment_method = "Credit Card"
                                elif choice_five == 3:
                                    payment_method = "Debit Card"
                                elif choice_five == 4:
                                    payment_method = "Net Banking"
                                elif choice_five == 5:
                                    payment_method = "Cash on Delivery"

                                print("Rs. ", total_price, " has been deducted from your ", payment_method, " account.")

                                # add to order_items while assigning a unique order_id and new partner id
                                query = "SELECT MAX(order_id) FROM ORDER_ITEMS"
                                cursor.execute(query)
                                order_id = cursor.fetchall()[0][0] + 1
                                for item in cart:
                                    query = "SELECT MAX(partner_id) FROM ORDER_ITEMS"
                                    cursor.execute(query)
                                    partner_id = cursor.fetchall()[0][0] + 1
                                    query = "INSERT INTO ORDER_ITEMS (order_id, customer_id, product_id, quantity_added, partner_id) VALUES (%s, %s, %s, %s, %s)"
                                    vals = (order_id, id, item[1], item[2], partner_id)
                                    cursor.execute(query, vals)
                                    db.commit()

                                # get cusomter address
                                query = "SELECT * FROM CUSTOMERs WHERE customer_id = %s"
                                vals = (id,)
                                cursor.execute(query, vals)
                                customer = cursor.fetchall()
                                address = customer[0][3]

                                # for all elements in cart, reduce the quantity in Inventory
                                for item in cart:
                                    query = "SELECT * FROM INVENTORY WHERE product_id = %s"
                                    vals = (item[1],)
                                    cursor.execute(query, vals)
                                    inventory = cursor.fetchall()
                                    query = "UPDATE INVENTORY SET quantity_in_stock = %s WHERE product_id = %s"
                                    vals = (inventory[0][1] - item[2], item[1])
                                    cursor.execute(query, vals)
                                    db.commit()                        

                                # add to order_payment insert into Order_Payment (order_id, customer_id, payment_mode, shipping_address, order_value, order_date, status) values (6, 6, 2, '20124 Derek Terrace', 6971, '2023-01-15 18:57:24', 0);
                                query = "INSERT INTO ORDER_PAYMENT (order_id, customer_id, payment_mode, shipping_address, order_value, order_date, status) VALUES (%s, %s, %s, %s, %s, %s, %s)"
                                vals = (order_id, id, payment_method, address, total_price, datetime.datetime.now(), 0)
                                cursor.execute(query, vals)
                                db.commit()

                                # remove from cart
                                query = "DELETE FROM CART WHERE customer_id = %s"
                                vals = (id,)
                                cursor.execute(query, vals)
                                db.commit()

                                print("Order confirmed")
                                
                            elif choice_four == 2:
                                print("Order cancelled")

                        # if choice_two == 4:
                        elif(choice_two == 4):
                            break
                        
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
                id = int(input("Enter your Unique Partner ID: "))
                query = "SELECT * FROM Delivery_Partner"
                cursor.execute(query)
                flag = 0
                for row in cursor.fetchall():
                    if(row[0] == id):
                        name = row[1]
                        flag = 1
                        rating = row[4]
                        break
                
                if(flag == 0):
                    print("Invalid Partner ID")
                else:
                    print(f'Welcome {name}') 
                           
            
            # Seller
            elif choice_one == 4:
                print("Welcome!")

        # If the user wants to exit the App
        elif choice == 3:
            break

        # Trigger Examples
        elif choice == 4:
            
            customer_id = int(input("Enter your Unique Customer ID: "))
            query_check = "SELECT * FROM Customers"
            cursor.execute(query_check)

            password = input("Enter your Password: ")
            flag = 0
            for row in cursor.fetchall():
                if(row[0] == customer_id):
                    correct_pass = row[4]
                    name = row[1]
                    flag = 1
                    break

            if flag == 0:
                print("Invalid Customer ID")
            else:
                if(correct_pass == password):
                    print(f"Welcome {name}")  

                    while(True):
                        print("0. Show Products")
                        print("1. Show Cart List")
                        print("2. Show Order_Items")
                        print("3. Show Inventory")
                        print("4. Add product")
                        print("5. Add Order_Item")
                        print("6. Exit")

                        choice = int(input("Enter your choice: "))
                        if choice == 0:
                            
                            try:
                                query = "SELECT * FROM PRODUCT"
                                cursor.execute(query)
                                product = cursor.fetchall()

                                df = pd.DataFrame(product, columns = ['Product ID', 'Product Name', 'Product Price', 'Seller ID', 'Product Category', 'Product Rating'])
                                with pd.option_context('display.max_rows', None, 'display.max_columns', None):
                                    print(df)

                            except mysql.connector.Error as error:
                                print(f"Failed to connect to MySQL: {error}")

                        if choice == 1:
                            query = "SELECT * FROM CART WHERE CUSTOMER_ID = %s"
                            val_curr = (customer_id,)
                            cursor.execute(query, val_curr)
                            cart = cursor.fetchall()
        
                            df = pd.DataFrame(cart, columns = ['Customer ID', 'Product ID', 'Quantity'])
                            with pd.option_context('display.max_rows', None, 'display.max_columns', None):
                                print(df)

                        elif choice == 2:
                            query = "SELECT * FROM ORDER_ITEMS WHERE CUSTOMER_ID = %s"
                            
                            try:
                                val_curr = (customer_id,)
                                cursor.execute(query, val_curr)
                                
                                order_items = cursor.fetchall()
                                df = pd.DataFrame(order_items, columns = ['Order ID', 'Customer ID', 'Product ID', 'Quantity', 'Partner ID'])
                                with pd.option_context('display.max_rows', None, 'display.max_columns', None):
                                    print(df)
                            
                            except mysql.connector.Error as error:
                                print(f"Failed to connect to MySQL: {error}")

                        elif choice == 3:
                            product_demand = int(input("Enter the Product ID: "))
                            try:
                                query = "SELECT * FROM INVENTORY WHERE PRODUCT_ID = %s"
                                val_curr = (product_demand,)
                                cursor.execute(query, val_curr)
                                
                                inventory = cursor.fetchall()
                                df = pd.DataFrame(inventory, columns = ['Product ID', 'Quantity'])
                                with pd.option_context('display.max_rows', None, 'display.max_columns', None):
                                    print(df)
                            
                            except mysql.connector.Error as error:
                                print(f"Failed to connect to MySQL: {error}")
                        
                        elif choice == 4:
                            try:
                                # get value of last product_id
                                query = "SELECT * FROM PRODUCT"
                                cursor.execute(query)
                                product_id = cursor.fetchall()[-1][0] + 1

                                print("Enter the following details: ")
                                product_name = input("Enter product_name: ")
                                product_price = int(input("Enter product_price: "))
                                seller_id = int(input("Enter seller_id: "))
                                product_category = input("Enter product_category: ")
                                product_rating = int(input("Enter product_rating: "))
                
                                query = "insert into Product (product_id, product_name, product_price, seller_id, category_id, product_rating) values (%s, %s, %s, %s, %s, %s);"
                                vals = (product_id, product_name, product_price, seller_id, product_category, product_rating)
                                cursor.execute(query, vals)
                                db.commit()

                                print("Successfully added product")

                            except mysql.connector.Error as error:
                                print(f"Failed to connect to MySQL: {error}")

                        elif choice == 5:
                            try:
                                # get value of last order_id
                                query = "SELECT * FROM ORDER_ITEMS"
                                cursor.execute(query)
                                order_id = cursor.fetchall()[-1][0] + 1

                                print("Enter the following details: ")
                                product_id = int(input("Enter product_id: "))
                                quantity_added = int(input("Enter quantity_added: "))
                                partner_id = int(input("Enter partner_id: "))
                                query = "insert into Order_items (order_id, customer_id, product_id, quantity_added, partner_id) values (%s, %s, %s, %s, %s);"
                                vals = (order_id, customer_id, product_id, quantity_added, partner_id)
                                cursor.execute(query, vals)
                                db.commit()
                                print("Successfully added order_item")
                            
                            except mysql.connector.Error as error:
                                print(f"Failed to connect to MySQL: {error}")

                        elif choice == 6:
                            break
                else:
                    print("Wrong Password")
            
        # if the user chose something else
        else:
            print("Invalid choice")
    
    # Close the database connection
    cursor.close()
    db.close()


main()
