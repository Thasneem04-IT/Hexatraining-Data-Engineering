// Use Database
use food_delivery_assessment_db;

// Create Collection + Insert Data
db.restaurants.insertMany([
  {
    restaurant_id: 1,
    name: "Spice Hub",
    city: "Hyderabad",
    cuisine: "Indian",
    rating: 4.5,
    avg_order_value: 450,
    delivery_available: true,
    tags: ["biryani", "north indian", "family"],
    contact: { phone: "9876543210", email: "spicehub@mail.com" }
  },
  {
    restaurant_id: 2,
    name: "Pizza Corner",
    city: "Bangalore",
    cuisine: "Italian",
    rating: 4.2,
    avg_order_value: 600,
    delivery_available: true,
    tags: ["pizza", "fast food", "cheese"],
    contact: { phone: "9876543211", email: "pizza@mail.com" }
  },
  {
    restaurant_id: 3,
    name: "Green Bowl",
    city: "Chennai",
    cuisine: "Healthy",
    rating: 4.7,
    avg_order_value: 350,
    delivery_available: false,
    tags: ["salad", "vegan", "healthy"],
    contact: { phone: null, email: "greenbowl@mail.com" }
  },
  {
    restaurant_id: 4,
    name: "Burger Street",
    city: "Hyderabad",
    cuisine: "Fast Food",
    rating: 3.9,
    avg_order_value: 300,
    delivery_available: true,
    tags: ["burger", "fries", "fast food"],
    contact: { phone: "9876543213", email: null }
  },
  {
    restaurant_id: 5,
    name: "Royal Tandoor",
    city: "Delhi",
    cuisine: "Indian",
    rating: 4.8,
    avg_order_value: 800,
    delivery_available: true,
    tags: ["tandoor", "north indian", "premium"],
    contact: { phone: "9876543214", email: "royal@mail.com" }
  },
  {
    restaurant_id: 6,
    name: "Tea Tales",
    city: "Pune",
    cuisine: "Cafe",
    rating: 4.1,
    avg_order_value: 200,
    delivery_available: false,
    tags: ["tea", "snacks", "cafe"],
    contact: { phone: "9876543215", email: "tea@mail.com" }
  },
  {
    restaurant_id: 7,
    name: "Ocean Grill",
    city: "Mumbai",
    cuisine: "Seafood",
    rating: 4.6,
    avg_order_value: 900,
    delivery_available: true,
    tags: ["fish", "grill", "premium"],
    contact: { phone: "9876543216", email: "ocean@mail.com" }
  },
  {
    restaurant_id: 8,
    name: "Dosa Point",
    city: "Chennai",
    cuisine: "South Indian",
    rating: 4.3,
    avg_order_value: 250,
    delivery_available: true,
    tags: ["dosa", "idli", "breakfast"],
    contact: { phone: null, email: null }
  }
]);

// -------------------- QUERIES --------------------

// 1. Display selected fields
db.restaurants.find({}, { name: 1, city: 1, cuisine: 1, _id: 0 });

// 2. Hyderabad restaurants
db.restaurants.find({ city: "Hyderabad" });

// 3. Indian cuisine
db.restaurants.find({ cuisine: "Indian" });

// 4. Delivery available
db.restaurants.find({ delivery_available: true });

// 5. Rating > 4.5
db.restaurants.find({ rating: { $gt: 4.5 } });

// 6. Avg order value < 400
db.restaurants.find({ avg_order_value: { $lt: 400 } });

// 7. Rating between 4.0 and 4.7
db.restaurants.find({ rating: { $gte: 4.0, $lte: 4.7 } });

// 8. Avg order value >= 600
db.restaurants.find({ avg_order_value: { $gte: 600 } });

// 9. Hyderabad + delivery available
db.restaurants.find({ city: "Hyderabad", delivery_available: true });

// 10. Chennai OR Indian cuisine
db.restaurants.find({
  $or: [{ city: "Chennai" }, { cuisine: "Indian" }]
});

// 11. Delivery NOT available
db.restaurants.find({ delivery_available: false });

// 12. Cities filter
db.restaurants.find({
  city: { $in: ["Hyderabad", "Delhi", "Mumbai"] }
});

// 13. Cuisine filter
db.restaurants.find({
  cuisine: { $in: ["Indian", "Italian", "Cafe"] }
});

// 14. Not in cities
db.restaurants.find({
  city: { $nin: ["Hyderabad", "Bangalore"] }
});

// 15. Name starts with P
db.restaurants.find({ name: { $regex: "^P" } });

// 16. Name contains "Point"
db.restaurants.find({ name: { $regex: "Point" } });

// 17. Phone is null
db.restaurants.find({ "contact.phone": null });

// 18. Phone OR email is null
db.restaurants.find({
  $or: [
    { "contact.phone": null },
    { "contact.email": null }
  ]
});

// 19. Tag = premium
db.restaurants.find({ tags: "premium" });

// 20. Both tags
db.restaurants.find({
  tags: { $all: ["north indian", "premium"] }
});

// 21. Sort by rating desc
db.restaurants.find().sort({ rating: -1 });

// 22. Top 3 rated
db.restaurants.find().sort({ rating: -1 }).limit(3);

// -------------------- UPDATES --------------------

// Update rating
db.restaurants.updateOne(
  { name: "Burger Street" },
  { $set: { rating: 4.0 } }
);

// Update delivery availability
db.restaurants.updateOne(
  { name: "Tea Tales" },
  { $set: { delivery_available: true } }
);

// Add field active
db.restaurants.updateMany(
  {},
  { $set: { active: true } }
);

// Remove field active
db.restaurants.updateMany(
  {},
  { $unset: { active: "" } }
);

// Add tag
db.restaurants.updateOne(
  { name: "Spice Hub" },
  { $push: { tags: "popular" } }
);

// -------------------- DELETE --------------------

// Delete by restaurant_id
db.restaurants.deleteOne({ restaurant_id: 6 });

// Delete rating < 4
db.restaurants.deleteMany({ rating: { $lt: 4.0 } });

// -------------------- COUNTS --------------------

db.restaurants.countDocuments();
db.restaurants.countDocuments({ delivery_available: true });

// Distinct
db.restaurants.distinct("city");
db.restaurants.distinct("cuisine");

// -------------------- AGGREGATION --------------------

// Count by city
db.restaurants.aggregate([
  { $group: { _id: "$city", total: { $sum: 1 } } }
]);

// Count by cuisine
db.restaurants.aggregate([
  { $group: { _id: "$cuisine", total: { $sum: 1 } } }
]);

// Avg rating by cuisine
db.restaurants.aggregate([
  { $group: { _id: "$cuisine", avg_rating: { $avg: "$rating" } } }
]);

// Avg order value by city
db.restaurants.aggregate([
  { $group: { _id: "$city", avg_order_value: { $avg: "$avg_order_value" } } }
]);

// Highest avg order value by cuisine
db.restaurants.aggregate([
  { $group: { _id: "$cuisine", avg_order_value: { $avg: "$avg_order_value" } } },
  { $sort: { avg_order_value: -1 } },
  { $limit: 1 }
]);

// Cuisines with more than 1 restaurant
db.restaurants.aggregate([
  { $group: { _id: "$cuisine", count: { $sum: 1 } } },
  { $match: { count: { $gt: 1 } } }
]);
