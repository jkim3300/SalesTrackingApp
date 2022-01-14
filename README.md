# SalesTrackingApp
#### Technical exercise for Profisee on developing sales tracking application that handles salesperson's commissions and incentives. Window Forms application with full-stack foundation.
In database folder, execute query for sample tables and datas for testing;(Encouraged to run 1 and 2 line seperately). 

## Data layer
* Products – Name, Manufacturer, Style, Purchase Price, Sale Price, Qty On Hand, Commission Percentage
* Salesperson – First Name, Last Name, Address, Phone, Start Date, Termination Date, Manager
* Customer – First Name, Last Name, Address, Phone, Start Date
* Sales – Product, Salesperson, Customer, Sales Date
* Discount – Product, Begin Date, End Date, Discount Percentage
* Seed with sample data for testing

## Middle tier
*	Allows for client access to the data layer

## Client
* Display a list of salespersons
* Update a salesperson
* Display a list of products
* Update a product
* Display a list of customers
* Display a list of sales.  Optionally filter by date range.  This should include the Product, Customer, Date, Price, Salesperson, and Salesperson Commission.
* Create a sale
* Display a quarterly salesperson commission report

## Additional Requirements
* Products - No duplicate product can be entered
* Salespersons- No duplicate salesperson can be entered

## Non-functional Requirements
* Publish the source code to an online source code repository of you choosing.
* (Optional) Host in Azure
