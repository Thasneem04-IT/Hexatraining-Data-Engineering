use admin

use retail_db

db.createCollection("Customers")

db.customers.insertOne({})

db.customers.insertOne({
  customer_id:1,
  name:"Rahul Sharma",
  city:"Hyderabad",
  phone:"9876543210",
  membership:"Gold"
})

db.customers.insertMany([
  {
    customer_id:2,
    name:"Priya Reddy",
    city:"Bangalore",
    phone:"7668787866",
    membership:"Silver"
  },
  {
    customer_id:3,
    name:"Amit Kumar",
    city:"Mumbai",
    phone:null,
    membership:"Gold"
  },
  {
    customer_id:4,
    name:"Sneha Patel",
    city:"Chennai",
    phone:"687834587",
    membership:"Bronze"
  }
])

db.customers.find()

db.customers.find({city:"Hyderabad"})

db.customers.find({customer_id:{$gt:2}})

db.customers.find({customer_id:{$lte:3}})

db.customers.find({customer_id:{$lt:3}})

db.customers.find({
  city:{$in:["Hyderabad","Bangalore"]}
})

db.customers.find({
  city:"Hyderabad",
  membership:"Gold"
})

db.customers.find({
  $or:[
    {city:"Hyderabad"},
    {membership:"Silver"}
  ]
})

db.customers.find(
  {},
  {name:1,city:1,_id:0}
)

db.customers.find().sort({customer_id:1})

db.customers.find().sort({customer_id:-1})

db.customers.find().limit(3)
