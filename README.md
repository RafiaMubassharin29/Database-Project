# Coffee Shop Website Database

This project contains the SQL schema and demo data for a coffee shop website. The database is designed to support the website's features, such as displaying menu items, managing customer data, handling orders, and calculating revenue.
The link is: 
## Database Structure

### Tables
1. **MenuItems**: Stores details about the coffee shop's menu items.
   - Fields: `ItemID`, `Name`, `Description`, `Price`

2. **Customers**: Stores customer information.
   - Fields: `CustomerID`, `Name`, `Email`, `Phone`, `RegistrationDate`

3. **Orders**: Tracks orders placed by customers.
   - Fields: `OrderID`, `CustomerID`, `OrderDate`, `TotalAmount`

4. **OrderDetails**: Contains details about the items in each order.
   - Fields: `OrderDetailID`, `OrderID`, `ItemID`, `Quantity`, `Subtotal`

## Demo Data
- Predefined menu items (e.g., Espresso, Cappuccino, Latte, Mocha).
- Sample customers (e.g., Alice Johnson, Bob Smith).
- Example orders with detailed breakdowns.

## Key Queries
- Display all menu items.
- Display all customers.
- Show all orders with details.
- Calculate total revenue.

## How to Use
1. Execute the SQL script in your preferred MySQL environment.
2. Use the queries to explore the data or integrate them into your website.

## Contact
For further assistance, feel free to reach out!
