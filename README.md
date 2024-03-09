# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

for landing page(it will display all the products):
name of 
        model : Product
        controller: Products
        resource: products

user :
        model:User
        object created in database:user
        sample data:
         id: 1,
 name: "jeevesh",        
 email: "jeeveshkumar2002@gmail.com",
 password_digest: "[FILTERED]",
 address: "delhi",
 phone_number: "1234567891",
 created_at: Sat, 09 Mar 2024 09:06:19.094643000 UTC +00:00,
 updated_at: Sat, 09 Mar 2024 09:06:19.094643000 UTC +00:00>

seller :
        model:Seller
        object created in database:seller
        sample data:
         id: 1,
 name: "JK PVT.LTD",       
 email: "jeeveshkumar202@gmail.com",
 password_digest: "[FILTERED]",
 address: "Pune",
 phone_number: "9876543210",
 created_at: Sat, 09 Mar 2024 09:12:09.304608000 UTC +00:00,
 updated_at: Sat, 09 Mar 2024 09:12:09.304608000 UTC +00:00>

 relationship has been set up btw seller and products(check their respective models file)

 To add entry in products table:

seller=Seller.find(1)
product = seller.products.new(name:"", etc, till quantity do not add seller here)
product.save

sample data in products:
        id: 1,
 name: "How to win friends and influence people",
 price: 0.499e3,
 author: "Dale Carnegie",
 category: "Self Help",
 description: "Book about creating friends",
 quantity: 20,
 seller_id: 1,
 created_at: Sat, 09 Mar 2024 09:47:04.186894000 UTC +00:00,
 updated_at: Sat, 09 Mar 2024 09:47:04.186894000 UTC +00:00>
