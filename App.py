import mysql.connector

def main():
    # Connect to the database
    cnx = mysql.connector.connect(user='root', password='idonthaveanewpassword@1234',
                                host='localhost', database='Online_Retail_Store')
    cursor = cnx.cursor()

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
            # INSERT QUERY HERE
            break

        # if the user chose to login
        elif choice == 2:
            print("Login")
            # CHECK IF USER EXISTS IN DATABASE HERE AND IF PASSWORD IS CORRECT and TRIGGER
            break

        # if the user wants to exit the app
        elif choice == 3:
            break
        
        # if the user chose something else
        else:
            print("Invalid choice")
    
    # Close the database connection
    cursor.close()
    cnx.close()


main()
