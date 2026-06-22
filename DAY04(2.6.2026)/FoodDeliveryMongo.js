
// ==========================================
// FOOD DELIVERY CAPSTONE PROJECT - MONGODB
// ==========================================


// DATABASE


use food_delivery_capstone_db



// BASIC FIND QUERIES

// View all customers
db.customers.find()

// View selected customer fields
db.customers.find(
    {},
    { _id: 0, name: 1, city: 1, membership: 1 }
)

// Customers from Hyderabad
db.customers.find({ city: "Hyderabad" })

// Gold members
db.customers.find({ membership: "Gold" })

// Customers with missing phone number
db.customers.find({ phone: null })

// Customers from selected cities
db.customers.find({
    city: { $in: ["Hyderabad", "Delhi", "Mumbai"] }
})


// RESTAURANT QUERIES


// Restaurants rating > 4.5
db.restaurants.find({
    rating: { $gt: 4.5 }
})

// Restaurants with Indian or Fast Food cuisine
db.restaurants.find({
    cuisine: { $in: ["Indian", "Fast Food"] }
})

// Restaurants not in Bangalore and Chennai
db.restaurants.find({
    city: { $nin: ["Bangalore", "Chennai"] }
})

// Restaurants sorted by rating
db.restaurants.find().sort({ rating: -1 })

// Top 3 restaurants
db.restaurants.find()
.sort({ rating: -1 })
.limit(3)


// ORDER QUERIES

// Orders above 500
db.orders.find({
    order_amount: { $gt: 500 }
})

// Delivered orders
db.orders.find({
    order_status: "Delivered"
})

// Orders between 400 and 700
db.orders.find({
    order_amount: {
        $gte: 400,
        $lte: 700
    }
})

// Orders where payment failed/pending
db.orders.find({
    "payment.status": { $ne: "Success" }
})

// Orders with null delivery time
db.orders.find({
    delivery_time_minutes: null
})

// Orders with rating >= 4
db.orders.find({
    order_rating: { $gte: 4 }
})

// Orders containing Biryani
db.orders.find({
    "items.item_name": "Biryani"
})

// Orders containing Pizza
db.orders.find({
    "items.item_name": "Pizza"
})

// Orders where item quantity > 1
db.orders.find({
    "items.quantity": { $gt: 1 }
})

// Orders where item price > 300
db.orders.find({
    "items.price": { $gt: 300 }
})

// Show order id and items only
db.orders.find(
    {},
    {
        _id: 0,
        order_id: 1,
        items: 1
    }
)

// Orders sorted by amount
db.orders.find()
.sort({ order_amount: -1 })

// Top 2 highest orders
db.orders.find()
.sort({ order_amount: -1 })
.limit(2)



// DELIVERY PARTNER QUERIES


// Delivery partners sorted by rating
db.delivery_partners.find()
.sort({ rating: -1 })



// UPDATE QUERIES


// Update customer membership
db.customers.updateOne(
    { customer_id: 1 },
    { $set: { membership: "Platinum" } }
)

// Update restaurant rating
db.restaurants.updateOne(
    { restaurant_id: 104 },
    { $set: { rating: 4.1 } }
)

// Update order status
db.orders.updateOne(
    { order_id: 1003 },
    { $set: { order_status: "Delivered" } }
)

// Update delivery time
db.orders.updateOne(
    { order_id: 1003 },
    { $set: { delivery_time_minutes: 45 } }
)

// Add active field to all customers
db.customers.updateMany(
    {},
    { $set: { active: true } }
)

// Remove active field
db.customers.updateMany(
    {},
    { $unset: { active: "" } }
)

// Push new item into order
db.orders.updateOne(
    { order_id: 1006 },
    {
        $push: {
            items: {
                item_name: "Curd Rice",
                quantity: 1,
                price: 120
            }
        }
    }
)


// DELETE QUERIES


// Delete cancelled orders
db.orders.deleteMany({
    order_status: "Cancelled"
})

// Delete restaurants with rating < 4
db.restaurants.deleteMany({
    rating: { $lt: 4.0 }
})



// COUNT & DISTINCT


// Total customers
db.customers.countDocuments()

// Total orders
db.orders.countDocuments()

// Delivered orders count
db.orders.countDocuments({
    order_status: "Delivered"
})

// Failed payment count
db.orders.countDocuments({
    "payment.status": "Failed"
})

// Distinct customer cities
db.customers.distinct("city")

// Distinct cuisines
db.restaurants.distinct("cuisine")

// Distinct payment modes
db.orders.distinct("payment.mode")



// AGGREGATION QUERIES


// Revenue by payment mode
db.orders.aggregate([
    {
        $group: {
            _id: "$payment.mode",
            total_revenue: {
                $sum: "$order_amount"
            }
        }
    }
])

// Revenue by order status
db.orders.aggregate([
    {
        $group: {
            _id: "$order_status",
            total_revenue: {
                $sum: "$order_amount"
            }
        }
    }
])

// Average delivery time
db.orders.aggregate([
    {
        $match: {
            order_status: "Delivered"
        }
    },
    {
        $group: {
            _id: null,
            average_delivery_time: {
                $avg: "$delivery_time_minutes"
            }
        }
    }
])

// Customer order summary
db.orders.aggregate([
    {
        $group: {
            _id: "$customer_id",
            total_orders: {
                $sum: 1
            },
            total_amount: {
                $sum: "$order_amount"
            }
        }
    }
])

// Restaurant revenue summary
db.orders.aggregate([
    {
        $group: {
            _id: "$restaurant_id",
            total_orders: {
                $sum: 1
            },
            total_revenue: {
                $sum: "$order_amount"
            }
        }
    }
])

// Average rating by restaurant
db.orders.aggregate([
    {
        $group: {
            _id: "$restaurant_id",
            average_rating: {
                $avg: "$order_rating"
            }
        }
    }
])

// Customers spending above 700
db.orders.aggregate([
    {
        $group: {
            _id: "$customer_id",
            total_spending: {
                $sum: "$order_amount"
            }
        }
    },
    {
        $match: {
            total_spending: {
                $gt: 700
            }
        }
    }
])


// LOOKUP QUERIES


// Orders + Customers
db.orders.aggregate([
    {
        $lookup: {
            from: "customers",
            localField: "customer_id",
            foreignField: "customer_id",
            as: "customer_details"
        }
    },
    {
        $unwind: "$customer_details"
    },
    {
        $project: {
            _id: 0,
            order_id: 1,
            customer_name: "$customer_details.name",
            city: "$customer_details.city",
            order_amount: 1,
            order_status: 1
        }
    }
])

// Orders + Restaurants
db.orders.aggregate([
    {
        $lookup: {
            from: "restaurants",
            localField: "restaurant_id",
            foreignField: "restaurant_id",
            as: "restaurant_details"
        }
    },
    {
        $unwind: "$restaurant_details"
    },
    {
        $project: {
            _id: 0,
            order_id: 1,
            restaurant_name: "$restaurant_details.name",
            cuisine: "$restaurant_details.cuisine",
            order_amount: 1
        }
    }
])

// Orders + Delivery Partners
db.orders.aggregate([
    {
        $lookup: {
            from: "delivery_partners",
            localField: "partner_id",
            foreignField: "partner_id",
            as: "partner_details"
        }
    },
    {
        $unwind: {
            path: "$partner_details",
            preserveNullAndEmptyArrays: true
        }
    },
    {
        $project: {
            _id: 0,
            order_id: 1,
            partner_name: "$partner_details.partner_name",
            delivery_time_minutes: 1,
            order_status: 1
        }
    }
])

// Full Report using Multiple Lookups
db.orders.aggregate([
    {
        $lookup: {
            from: "customers",
            localField: "customer_id",
            foreignField: "customer_id",
            as: "customer_details"
        }
    },
    {
        $lookup: {
            from: "restaurants",
            localField: "restaurant_id",
            foreignField: "restaurant_id",
            as: "restaurant_details"
        }
    },
    {
        $lookup: {
            from: "delivery_partners",
            localField: "partner_id",
            foreignField: "partner_id",
            as: "partner_details"
        }
    },
    {
        $unwind: "$customer_details"
    },
    {
        $unwind: "$restaurant_details"
    },
    {
        $unwind: {
            path: "$partner_details",
            preserveNullAndEmptyArrays: true
        }
    },
    {
        $project: {
            _id: 0,
            order_id: 1,
            customer_name: "$customer_details.name",
            restaurant_name: "$restaurant_details.name",
            cuisine: "$restaurant_details.cuisine",
            partner_name: "$partner_details.partner_name",
            order_amount: 1,
            payment_mode: "$payment.mode",
            payment_status: "$payment.status",
            order_status: 1,
            delivery_time_minutes: 1,
            order_rating: 1
        }
    }
])


