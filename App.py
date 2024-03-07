import mysql.connector
import pandas as pd
import datetime 
from tabulate import tabulate

# Connect to the database
db = mysql.connector.connect(user='root', password=password,
                            host='localhost', database='Online_Retail_Store')

cursor = db.cursor()

#Non-Conflicting Transaction 1
def mark_order_delivered(order_id, partner_id):

    # start transaction
    try:
        db.autocommit = False
        query_one = """
                    UPDATE order_payment op
                    SET op.status = 2
                    WHERE op.order_id = %s AND op.partner_id = %s;
                    """
        vals_one = (order_id, partner_id)
        cursor.execute(query_one, vals_one)
        print("Order Status Updated")

        query_two = """
                    UPDATE delivery_partner dp
                    SET dp.orders_completed = dp.orders_completed + 1
                    WHERE dp.partner_id = %s;
                    """
        
        vals_two = (partner_id, )
        cursor.execute(query_two, vals_two)
        print("Number of Orders Updated")

        db.commit()
    
    except mysql.connector.Error as error:

        # Rollback transaction
        db.rollback()
        print(f"Failed to connect to MySQL: {error}")

# Transaction 2
def delete_product(product_id):

    # start transaction
    try:
        
        db.autocommit = False
        # Delete from Product Table
        query_one = """
                    DELETE FROM product p
                    WHERE p.product_id = %s;
                    """
        vals_one = (product_id, )
        cursor.execute(query_one, vals_one)
        print("Product Deleted")

        # Delete from Inventory Table
        query_two = """
                    DELETE FROM Inventory 
                    WHERE product_id = %s;
                    """
        cursor.execute(query_two, vals_one)

        # Delete from Cart Table
        query_three = """
                        DELETE FROM Cart
                        WHERE product_id = %s;
                    """
        cursor.execute(query_three, vals_one)

        db.commit()
    
    except mysql.connector.Error as error:

        # Rollback transaction
        db.rollback()
        print(f"Failed to connect to MySQL: {error}")

# Transaction 3
def place_order(customer_id, cart, payment_method, address, total_price):
    
        # start transaction
        try:
            
            db.autocommit = False

            # add to order_items while assigning a unique order_id and new partner id
            query_one  = "SELECT MAX(order_id) FROM ORDER_ITEMS"
            cursor.execute(query_one)
            order_id = cursor.fetchall()[0][0] + 1

            for item in cart:
                query = "SELECT (MAX(partner_id)%100)+1 FROM ORDER_ITEMS"
                cursor.execute(query)
                partner_id = cursor.fetchall()[0][0]
                query = "INSERT INTO ORDER_ITEMS (order_id, customer_id, product_id, quantity_added, partner_id) VALUES (%s, %s, %s, %s, %s)"
                vals = (order_id, customer_id, item[1], item[2], partner_id)
                cursor.execute(query, vals)
            
            # for all elements in cart, reduce the quantity in Inventory
            for item in cart:
                query = "SELECT * FROM INVENTORY WHERE product_id = %s"
                vals = (item[1],)
                cursor.execute(query, vals)
                inventory = cursor.fetchall()
                query = "UPDATE INVENTORY SET quantity_in_stock = %s WHERE product_id = %s"
                vals = (inventory[0][1] - item[2], item[1])
                cursor.execute(query, vals)
            
            # add to order_payment insert into Order_Payment (order_id, customer_id, payment_mode, shipping_address, order_value, order_date, status) values (6, 6, 2, '20124 Derek Terrace', 6971, '2023-01-15 18:57:24', 0);
            query = "INSERT INTO ORDER_PAYMENT (order_id, customer_id, partner_id, payment_mode, shipping_address, order_value, order_date, status) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
            vals = (order_id, customer_id, partner_id, payment_method, address, total_price, datetime.datetime.now(), 0)
            cursor.execute(query, vals)

            # remove from cart
            query = "DELETE FROM CART WHERE customer_id = %s"
            vals = (customer_id,)
            cursor.execute(query, vals)
    
            db.commit()
        
        except mysql.connector.Error as error:
    
            # Rollback transaction
            db.rollback()
            print(f"Failed to connect to MySQL: {error}")

# Transaction 4
def update_product_quantity(product_id, quantity):
    
        # start transaction
        try:
            
            db.autocommit = False
            query = "UPDATE INVENTORY SET quantity_in_stock = %s WHERE product_id = %s"
            vals = (quantity, product_id)
            cursor.execute(query, vals)
            print("Quantity Updated")
    
            db.commit()
        
        except mysql.connector.Error as error:
    
            # Rollback transaction
            db.rollback()
            print(f"Failed to connect to MySQL: {error}")

# Transaction 5
def add_new_product(product_name, product_price, seller_id, category_id, quantity):
    # start transaction
    try:
        db.autocommit = False

        # add to product table
        query_insert = """INSERT INTO product (product_name, product_price, seller_id, category_id)
                            VALUES (%s, %s, %s, %s)"""
        vals = (product_name, product_price, seller_id, category_id)
        cursor.execute(query_insert, vals)

        # get the product_id
        query = "SELECT MAX(product_id) FROM product"
        cursor.execute(query)

        product_id = cursor.fetchall()[0][0]
        print("Product Added")
        print("Product ID: ", product_id)

        # add to inventory table
        query = "INSERT INTO inventory (product_id, quantity_in_stock) VALUES (%s, %s)"
        vals = (product_id, quantity)
        cursor.execute(query, vals)
        print("Quantity Updated")

        db.commit()
    
    except mysql.connector.Error as error:

        # Rollback transaction
        db.rollback()
        print(f"Failed to connect to MySQL: {error}")

        

def main():
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
                print("Your unique Partner ID is: ")
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
                print("Your unique Seller ID is: ")
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
                customer_id = int(input("Enter your Unique Customer ID: "))
                query = "SELECT * FROM Customers"
                cursor.execute(query)

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
                            print("Choose one of the following: ")
                            print("1. View Products")
                            print("2. View Cart")
                            print("3. Place Order")
                            print("4. Add to Cart")
                            print("5. Remove from Cart")
                            print("6. View Orders")
                            print("7. Rate Delivery Partner")
                            print("8. Exit")
                            # Need to add option view orders with their status and update rating of delivery partner

                            choice_two = int(input("Enter your choice: "))
                            
                            # View Products
                            if(choice_two == 1):
                                while(True):
                                    print("Choose one of the following: ")
                                    query = "SELECT * FROM CATEGORY"
                                    cursor.execute(query)
                                    id = []
                                    name = []
                                    for row in cursor.fetchall():
                                        id.append(row[0])
                                        name.append(row[1])

                                    table_cat = {
                                        "Category ID" : id,
                                        "Category Name" : name,
                                    }
                                    print(tabulate(table_cat, headers = "keys", tablefmt = "fancy_grid"))

                                    choice_two = int(input("Enter your choice: "))
                                    
                                    if choice_two in range(1, len(id)+1):
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

                                # Add to Cart
                                while(True):
                                    # do you want to add a product to cart
                                    print("Do you want to add a product to cart?")
                                    print("1. Yes")
                                    print("2. No")
                                    choice_cart_add = int(input("Enter your choice: "))
                                    if choice_cart_add == 1:
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
                                                vals = (customer_id, choice_three, quantity)
                                                cursor.execute(query, vals)
                                                db.commit()

                                                print("Product added to cart")
                                                break

                                    elif choice_cart_add == 2:
                                        break

                            # View Cart
                            elif(choice_two == 2):
                                query = "SELECT * FROM CART WHERE customer_id = %s"
                                vals = (customer_id,)
                                cursor.execute(query, vals)
                                cart = cursor.fetchall()
                                print("Your Cart is:")
                                cust_id_arr = []
                                prod_id_arr = []
                                quantity_arr = []
                                for row in cart:
                                    cust_id_arr.append(row[0])
                                    prod_id_arr.append(row[1])
                                    quantity_arr.append(row[2])

                                table_cart = {
                                    "Customer ID" : cust_id_arr,
                                    "Product ID" : prod_id_arr,
                                    "Quantity" : quantity_arr,
                                }
                                print(tabulate(table_cart, headers = "keys", tablefmt = "fancy_grid"))
                            

                            # Place Order
                            elif(choice_two == 3):
                                query = "SELECT * FROM CART WHERE customer_id = %s"
                                vals = (customer_id,)
                                cursor.execute(query, vals)
                                cart = cursor.fetchall()
                                print("your cart is:")
                                df = pd.DataFrame(cart, columns = ['Customer ID', 'Product ID', 'Quantity'])
                                with pd.option_context('display.max_rows', None, 'display.max_columns', None):
                                    print(df)

                                # Do you want something from cart
                                print("Do you want to remove a product from cart?")
                                print("1. Yes")
                                print("2. No")
                                choice_three = int(input("Enter your choice: "))

                                # Remove Something From Cart - Yes
                                if choice_three == 1:

                                    # input the product id of the product to be removed
                                    choice_three = int(input("Enter the Product ID of the product you want to remove from cart: "))
                                    query = "DELETE FROM CART WHERE customer_id = %s AND product_id = %s"
                                    vals = (customer_id, choice_three)
                                    cursor.execute(query, vals)
                                    db.commit()
                                    print("Product removed from cart")

                                print("Do you want to confirm the order?")
                                print("1. Yes")
                                print("2. No")
                                choice_four = int(input("Enter your choice: "))
                                if choice_four == 1:

                                    # get all items in cart
                                    query = "SELECT * FROM CART WHERE customer_id = %s"
                                    vals = (customer_id,)
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
                                    print("1. UPI/Wallet")
                                    print("2. Credit Card")
                                    print("3. Cash")
                                    print("4. Netbanking")
                                    choice_five = int(input("Enter your choice: "))
                                    if choice_five == 1:
                                        payment_method = "UPI/Wallet"
                                    elif choice_five == 2:
                                        payment_method = "Credit Card"
                                    elif choice_five == 3:
                                        payment_method = "Cash"
                                    elif choice_five == 4:
                                        payment_method = "Netbanking"

                                    print("Rs. ", total_price, " has been deducted from your ", payment_method, " account.")

                                    # get customer address
                                    query = "SELECT * FROM CUSTOMERs WHERE customer_id = %s"
                                    vals = (customer_id,)
                                    cursor.execute(query, vals)
                                    customer = cursor.fetchall()
                                    address = customer[0][3]

                                    # Place Order - Transaction 3
                                    place_order(customer_id, cart, payment_method, address, total_price)

                                    print("Order confirmed")
                                    
                                elif choice_four == 2:
                                    print("Order cancelled")

                            # Add to Cart
                            elif(choice_two == 4):
                                choice_three = int(input("Enter the Product ID of the product you want to add to cart: "))

                                # check quantity of product in Inventory (product_id, quantity_in_stock)
                                query = "SELECT * FROM INVENTORY WHERE product_id = %s"
                                vals = (choice_three,)
                                cursor.execute(query, vals)
                                product = cursor.fetchall()

                                if(len(product) == 0):
                                    print("Invalid Product ID")

                                else:
                                    # Enter Quantity
                                    quantity = int(input("Enter the quantity of the product you want to add to cart: "))
                                    if(quantity > product[0][1]):
                                        print("Not enough quantity in stock")                                       

                                    else:
                                        query = "insert into Cart (customer_id, product_id, product_quantity) values (%s, %s, %s);"
                                        vals = (customer_id, choice_three, quantity)
                                        cursor.execute(query, vals)
                                        db.commit()
                                        print("Product added to cart")

                            # Remove from Cart
                            elif(choice_two == 5):
                                choice_three = int(input("Enter the Product ID of the product you want to remove from cart: "))
                                query = "DELETE FROM CART WHERE customer_id = %s AND product_id = %s"
                                vals = (customer_id, choice_three)
                                try:
                                    cursor.execute(query, vals)
                                    db.commit()
                                    print("Product removed from cart")
                                except mysql.connector.Error as err:
                                    print(err)
                            
                            # View Order History
                            elif(choice_two == 6):
                                query = "SELECT * FROM order_payment op WHERE op.customer_id = %s"
                                vals = (customer_id,)
                                try:
                                    cursor.execute(query, vals)
                                    orders = cursor.fetchall()
                                    ord_id_arr = []
                                    partner_id_arr = []
                                    payment_method_arr = []
                                    address_arr = []
                                    total_price_arr = []
                                    date_of_order_arr = []
                                    order_status_arr = []
                                    for order in orders:
                                        ord_id_arr.append(order[0])
                                        partner_id_arr.append(order[2])
                                        payment_method_arr.append(order[3])
                                        address_arr.append(order[4])
                                        total_price_arr.append(order[5])
                                        date_of_order_arr.append(order[6])
                                        order_status_arr.append(order[7])
                                    
                                    table_ord_payment = {
                                        'Order ID': ord_id_arr,
                                        'Partner ID': partner_id_arr,
                                        'Payment Method': payment_method_arr,
                                        'Shipping Address': address_arr,
                                        'Total Price': total_price_arr,
                                        'Date of Order': date_of_order_arr,
                                        'Order Status': order_status_arr
                                    }
                                    print(tabulate(table_ord_payment, headers='keys', tablefmt='fancy_grid'))
                                    
                                except mysql.connector.Error as err:
                                    print(err)
                            
                            # Rate Delivery Partner
                            elif(choice_two == 7):
                                order_id = int(input("Enter the Order ID of the Order you want to rate: "))
                                rating = int(input("Enter the rating you want to give to the delivery partner out of 10: "))
                                query = """SELECT op.partner_id FROM order_payment op 
                                            WHERE op.customer_id = %s AND op.status = 2 AND op.order_id = %s"""
                                vals = (customer_id, order_id)
                                cursor.execute(query, vals)
                                partner_id = cursor.fetchall()
                                if(len(partner_id) == 0):
                                    print("Invalid Order ID")
                                else:
                                    partner_id = partner_id[0][0]
                                    
                                # get number of orders completed by the delivery partner
                                query_dp = "SELECT * FROM DELIVERY_PARTNER WHERE partner_id = %s"
                                vals_dp = (partner_id,)

                                cursor.execute(query_dp, vals_dp)
                                dp = cursor.fetchall()
                                ord_completed = dp[0][3]
                                ord_completed = ord_completed - 1
                                curr_rating = dp[0][4]

                                # update rating of delivery partner
                                rating = (curr_rating * ord_completed + rating) / (ord_completed + 1)

                                query = "UPDATE DELIVERY_PARTNER SET partner_rating = %s WHERE partner_id = %s"
                                vals = (rating, partner_id)

                                try:
                                    db.autocommit = False
                                    cursor.execute(query, vals)
                                    db.commit()
                                    print("Rating updated")
                                except mysql.connector.Error as err:
                                    print(err)
                                    db.rollback()
                                

                            # Exit
                            elif(choice_two == 8):
                                break
                            
                    # Wrong Password
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

                        # Admin Choice
                        while True:
                            print("Choose among the following: ")
                            print("1. Number of Orders Placed by Each Customer and Total Orders")
                            print("2. Sales Revenue for each Category with Total Revenue")
                            print("3. Total Revenue Generated by each Category and Seller combination with the Total revenue")
                            print("4. Total number of orders completed by each delivery partner and total number of orders completed")
                            print("5. Number of products in each category, and the total number of products")
                            print("6. Add a Category")
                            print("7. Delete a Category")
                            print("8. Delete a Product")
                            print("9. Exit / Logout")

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

                            # Add a Category
                            elif choice_three == 6:
                                category_name = input("Enter Category Name: ")
                                discount = int(input("Enter Discount: "))
                                query = "INSERT INTO Category (category_name, category_discount) VALUES (%s, %s)"
                                vals = (category_name, discount)
                                cursor.execute(query, vals)
                                db.commit()
                                print("Category Added")

                            # Delete a Category        
                            elif choice_three == 7:
                                query = "SELECT * FROM Category"
                                cursor.execute(query)
                                category_id = int(input("Enter a Category ID: "))
                                flag = 0
                                for row in cursor.fetchall():
                                    if(row[0] == category_id):
                                        flag = 1
                                        break
                                
                                if(flag == 0):
                                    print("Invalid Category ID")
                                else:
                                    # Get product IDs of products in the category
                                    query = "SELECT product_id FROM Product WHERE category_id = %s"
                                    vals = (category_id,)
                                    cursor.execute(query, vals)
                                    product_ids = []
                                    for row in cursor.fetchall():
                                        product_ids.append(row[0])
                                    
                                    # Delete products in the category - Transaction 2
                                    for product_id in product_ids:
                                        delete_product(product_id)
                                    
                                    # Delete the category
                                    query = "DELETE FROM Category WHERE category_id = %s"
                                    vals = (category_id,)
                                    cursor.execute(query, vals)
                                    db.commit()
                                    print("Category Deleted")

                            # Delete a Product
                            elif choice_three == 8:
                                query = "SELECT * FROM PRODUCT"
                                cursor.execute(query)
                                prod_id = int(input("Enter a Product ID: "))
                                flag = 0
                                for row in cursor.fetchall():
                                    if(row[0] == prod_id):
                                        flag = 1
                                        break
                                
                                if(flag == 0):
                                    print("Invalid Product ID")
                                else:

                                    # Calling Transaction 2
                                    delete_product(prod_id)                                    

                            elif choice_three == 9:
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
                    print(f'Your current rating is {rating}')
                    while(True):
                        print("Choose among the following options: ")
                        print("1. See Orders Assigned to You")
                        print("2. Mark an Order as Delivered")
                        print("3. See the Items in an Order Assigned to you")
                        print("4. Exit")
                        choice_delivery = int(input("Enter your choice: "))

                        # See Order IDs assigned to you
                        if(choice_delivery == 1):
                            query = """SELECT 
                                            op.order_id, 
                                            op.customer_id, 
                                            op.shipping_address,
                                            op.order_value
                                        FROM order_payment op
                                        WHERE op.partner_id = %s AND op.status != 2"""
                            vals = (id,)
                            ord_id_arr = []
                            cust_id_arr = []
                            addr_arr = []
                            val_arr = []
                            try:
                                cursor.execute(query, vals)
                                for row in cursor.fetchall():
                                    ord_id_arr.append(row[0])
                                    cust_id_arr.append(row[1])
                                    addr_arr.append(row[2])
                                    val_arr.append(row[3])

                                table_ord = {
                                    'Order ID': ord_id_arr,
                                    'Customer ID': cust_id_arr,
                                    'Shipping Address': addr_arr,
                                    'Order Value': val_arr
                                }
                                print(tabulate(table_ord, headers='keys', tablefmt='fancy_grid'))
                            except mysql.connector.Error as error:
                                print(f"Failed to connect to MySQL: {error}")
                        
                        # Mark an order as delivered
                        elif(choice_delivery == 2):
                            ord_id = int(input("Enter the Order ID: "))
                            ord_id_check = """SELECT 
                                                    op.order_id
                                                FROM order_payment op
                                                WHERE op.partner_id = %s"""
                            vals = (id, )

                            try:
                                cursor.execute(ord_id_check, vals)
                                flag = 0
                                for row in cursor.fetchall():
                                    if(row[0] == ord_id):
                                        flag = 1
                                        break
                                if(flag == 0):
                                    print("Invalid Order ID")
                                else:

                                    # Calling Transaction 1
                                    mark_order_delivered(ord_id, id)
                            
                            except mysql.connector.Error as error:
                                print(f"Failed to connect to MySQL: {error}")

                        # See Items In an Order Assigned to you
                        elif(choice_delivery == 3):
                            ord_id = int(input("Enter the Order ID: "))
                            ord_id_check = """SELECT 
                                                    op.order_id
                                                FROM order_payment op
                                                WHERE op.partner_id = %s;"""
                            vals = (id, )
                            try:
                                cursor.execute(ord_id_check, vals)
                                flag = 0
                                for row in cursor.fetchall():
                                    if(row[0] == ord_id):
                                        flag = 1
                                        break
                                if(flag == 0):
                                    print("Invalid Order ID")
                                else:
                                    query = """SELECT 
                                                    oi.product_id, 
                                                    p.product_name, 
                                                    oi.quantity_added
                                                FROM order_items oi
                                                JOIN product p ON p.product_id = oi.product_id
                                                WHERE oi.order_id = %s;"""
                                    vals = (ord_id,)
                                    try:
                                        cursor.execute(query, vals)

                                        # Tabulate the results
                                        prod_id_arr = []
                                        prod_name_arr = []
                                        quantity_arr = []
                                        for row in cursor.fetchall():
                                            prod_id_arr.append(row[0])
                                            prod_name_arr.append(row[1])
                                            quantity_arr.append(row[2])
                                        
                                        table_prod = {
                                            'Product ID': prod_id_arr,
                                            'Product Name': prod_name_arr,
                                            'Quantity': quantity_arr
                                        }
                                        print(tabulate(table_prod, headers="keys", tablefmt="fancy_grid"))
                                        
                                    except mysql.connector.Error as error:
                                        print(f"Failed to connect to MySQL: {error}")
                            
                            except mysql.connector.Error as error:
                                print(f"Failed to connect to MySQL: {error}")

                        # Exit
                        else:
                            break
                           
            
            # Seller
            elif choice_one == 4:
                seller_id = int(input("Enter your Unique Seller ID: "))
                query = "SELECT * FROM Seller"
                cursor.execute(query)

                flag = 0
                for row in cursor.fetchall():
                    if(row[0] == seller_id):
                        commission = row[3]
                        name = row[1]
                        flag = 1
                        break

                if flag == 0:
                    print("Invalid Seller ID")
                else:
                    print(f"Welcome {name}")
                    print(f"Your current commission is {commission}")
                    while(True):
                        print("Choose among the following options: ")
                        print("1. Check your Products and their Stock")
                        print("2. Add a Product")
                        print("3. Update a Product if Quantity is less than 10")
                        print("4. Update a Product if Quantity is more than 10")
                        print("5. Exit")
                        seller_choice = int(input("Enter your choice: "))

                        # Check Products and their Stock
                        if seller_choice == 1:
                            query = """SELECT 
                                            p.product_id, 
                                            p.product_name, 
                                            p.product_price,  
                                            i.quantity_in_stock
                                        FROM product p
                                        JOIN inventory i ON i.product_id = p.product_id
                                        WHERE p.seller_id = %s"""
                            vals = (seller_id,)
                            try:
                                cursor.execute(query, vals)
                                prod_id_arr = []
                                prod_name_arr = []
                                prod_price_arr = [] 
                                quantity_arr = [] 

                                for row in cursor.fetchall():
                                    prod_id_arr.append(row[0])
                                    prod_name_arr.append(row[1])
                                    prod_price_arr.append(row[2])
                                    quantity_arr.append(row[3])

                                table_prod = {
                                    'Product ID': prod_id_arr,
                                    'Product Name': prod_name_arr,
                                    'Product Price': prod_price_arr,
                                    'Quantity in Stock': quantity_arr
                                }    

                                print(tabulate(table_prod, headers='keys', tablefmt='fancy_grid'))
                            except mysql.connector.Error as error:
                                print(f"Failed to connect to MySQL: {error}")
                        
                        # Add a Product
                        elif seller_choice == 2:
                            product_name = input("Enter the Product Name: ")
                            product_price = int(input("Enter the Product Price: "))
                            category_id = int(input("Enter the Category ID: "))
                            quantity_in_stock = int(input("Enter the Quantity in Stock: "))

                            add_new_product(product_name, product_price, seller_id, category_id, quantity_in_stock)

                        # Update a Product if Quantity is less than or equal to 10
                        elif seller_choice == 3:

                            # Get Product IDs of products with quantity less than or equal to 10
                            query = """SELECT p.product_id,
                                                i.quantity_in_stock
                                        FROM product p
                                        JOIN inventory i ON i.product_id = p.product_id
                                        WHERE i.quantity_in_stock <= 10 AND p.seller_id = %s"""
                            vals = (seller_id,)
                            try:
                                cursor.execute(query, vals)
                                prod_id_arr = []
                                quantity_arr = [] 

                                for row in cursor.fetchall():
                                    prod_id_arr.append(row[0])
                                    quantity_arr.append(row[1])

                                table_prod = {
                                    'Product ID': prod_id_arr,
                                    'Quantity in Stock': quantity_arr
                                }    

                                print(tabulate(table_prod, headers='keys', tablefmt='fancy_grid'))

                            except mysql.connector.Error as error:
                                print(f"Failed to connect to MySQL: {error}")
                            
                            while True:
                                print("Enter 0 to exit")
                                print("Enter 1 to update a product")
                                choice = int(input("Enter your choice: "))
                                if choice == 0:
                                    break
                                elif choice == 1:
                                    product_id_zero = int(input("Enter the Product ID: "))

                                    if product_id_zero in prod_id_arr:
                                        quantity = int(input("Enter the Quantity: "))
                                        
                                        # Implementing Transaction 4
                                        update_product_quantity(product_id_zero, quantity)
                                    else:
                                        print("Invalid Product ID")
                                else:
                                    print("Invalid Choice")

                        # Update a Product if Quantity is more than 10
                        elif seller_choice == 4:
                                
                                # Get Product IDs of products with quantity more than 10
                                query = """SELECT p.product_id,
                                                    i.quantity_in_stock
                                            FROM product p
                                            JOIN inventory i ON i.product_id = p.product_id
                                            WHERE i.quantity_in_stock > 10 AND p.seller_id = %s"""
                                vals = (seller_id,)
                                try:
                                    cursor.execute(query, vals)
                                    prod_id_arr = []
                                    quantity_arr = [] 

                                    for row in cursor.fetchall():
                                        prod_id_arr.append(row[0])
                                        quantity_arr.append(row[1])

                                    table_prod = {
                                        'Product ID': prod_id_arr,
                                        'Quantity in Stock': quantity_arr
                                    }    

                                    print(tabulate(table_prod, headers='keys', tablefmt='fancy_grid'))
                                except mysql.connector.Error as error:
                                    print(f"Failed to connect to MySQL: {error}")
                                
                                while True:
                                    print("Enter 0 to exit")
                                    print("Enter 1 to update a product")
                                    choice = int(input("Enter your choice: "))
                                    if choice == 0:
                                        break
                                    elif choice == 1:
                                        product_id_zero = int(input("Enter the Product ID: "))

                                        if product_id_zero in prod_id_arr:
                                            quantity = int(input("Enter the Quantity: "))
                                            
                                            # Implementing Transaction 4
                                            update_product_quantity(product_id_zero, quantity)
                                        else:
                                            print("Invalid Product ID")
                                    else:
                                        print("Invalid Choice")
                                
                        # Exit
                        else:
                            break
                    
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
