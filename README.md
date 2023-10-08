# Restaurant-Ratings-Database
## Overview
The Restaurant Ratings Database is a MySQL database schema and data dump that captures restaurant-related information such as branches, chefs, customers, dishes, employee details, feedback, managers, recipes, and restaurant details. It's designed to support various restaurant management and rating functionalities.

## Features
- **Restaurant Management**: Store essential restaurant details, including their name and unique Corporate Identification Number (CIN).

- **Branch Management**: Keep track of different branches associated with a restaurant, each identified by a unique branch ID.

- **Employee Management**: Record comprehensive employee data, including their employee ID, branch association, and supervisor.

- **Chef and Waiter Management**: Specifically manage chef and waiter information, including their roles and any associated restrictions.

- **Customer Data**: Capture customer phone numbers and their entry times to gain insights into customer behavior.

- **Dish and Recipe Management**: Maintain records of dish names, their ingredients, and respective prices.

- **Feedback and Ratings**: Enable customers to provide valuable feedback and ratings regarding their dining experiences, facilitating continuous improvement.

- **Data Consistency**: Implement foreign keys and constraints to ensure data consistency and integrity.

## Usage
1. Import the MySQL dump into your MySQL server:

    ```bash
    mysql -u your_username -p Restaurant_Ratings < restaurant_ratings.sql
    ```

    Replace `your_username` with your MySQL username.

2. With the database successfully set up, you can now query it and build restaurant management or rating applications on top of it. Here's an example of how to connect to the database using Python:

    ```python
    import mysql.connector

    # Replace with your own database credentials
    db_config = {
        "host": "localhost",
        "user": "your_username",
        "password": "your_password",
        "database": "Restaurant_Ratings",
    }

    # Connect to the database
    try:
        connection = mysql.connector.connect(**db_config)
        if connection.is_connected():
            print("Connected to the Restaurant_Ratings database")
            # Start executing SQL queries here
        else:
            print("Connection failed")

    except Exception as e:
        print(f"Error: {str(e)}")

    finally:
        # Close the database connection when done
        if connection.is_connected():
            connection.close()
            print("Connection closed")
    ```

    Replace `"your_username"` and `"your_password"` with your MySQL database credentials.

3. You can now use this connection to perform various operations on the database, such as retrieving, updating, or inserting data, depending on your application's requirements.

## Database Schema
...
The database schema includes the following tables:

**Branch**: Stores branch information for restaurants.
**Chef**: Manages chef details and positions.
**Customers**: Records customer phone numbers and entry times.
**Dish**: Contains dish names and prices.
**Dish_meal**: Maps dishes to meal types.
**Employee**: Manages employee details and branch assignments.
**Feedback**: Captures customer feedback and ratings.
**Manager**: Manages managerial positions within the restaurant.
**Recipe**: Contains dish names and their ingredient lists.
**Restaurant**: Stores restaurant details.
**Waiter**: Manages waiter details.
