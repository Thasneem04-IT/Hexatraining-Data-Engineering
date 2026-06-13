use edtech_capstone_db


// PART 1: BASIC FIND QUERIES


// 1. Display all learners
db.learners.find()

// 2. Display all courses
db.courses.find()

// 3. Display learner name, city, and goal only
db.learners.find(
    {},
    { _id: 0, name: 1, city: 1, goal: 1 }
)

// 4. Find learners from Hyderabad
db.learners.find({ city: "Hyderabad" })

// 5. Find learners whose goal is AI Engineer
db.learners.find({ goal: "AI Engineer" })

// 6. Find courses in the Data Engineering category
db.courses.find({ category: "Data Engineering" })

// 7. Find courses priced above ₹10,000
db.courses.find({ price: { $gt: 10000 } })

// 8. Find beginner-level courses
db.courses.find({ level: "Beginner" })

// 9. Find enrollments with successful payments
db.enrollments.find({ "payment.status": "Success" })

// 10. Find learners where phone is null
db.learners.find({ phone: null })


// PART 2: OPERATORS


// 11. Find learners having experience greater than 2 years
db.learners.find({ experience_years: { $gt: 2 } })

// 12. Find courses priced between ₹8,000 and ₹18,000
db.courses.find({
    price: {
        $gte: 8000,
        $lte: 18000
    }
})

// 13. Find courses where level is either Beginner or Intermediate
db.courses.find({
    level: {
        $in: ["Beginner", "Intermediate"]
    }
})

// 14. Find enrollments where completion percent is >= 80
db.enrollments.find({
    "progress.completion_percent": { $gte: 80 }
})

// 15. Find enrollments where payment status is not Success
db.enrollments.find({
    "payment.status": { $ne: "Success" }
})

// 16. Find learners from Hyderabad, Bangalore, or Pune
db.learners.find({
    city: {
        $in: ["Hyderabad", "Bangalore", "Pune"]
    }
})

// 17. Find courses not in the Cloud category
db.courses.find({
    category: { $ne: "Cloud" }
})

// PART 3: ARRAY QUERIES


// 18. Find instructors having expertise in AI
db.instructors.find({
    expertise: "AI"
})

// 19. Find instructors having expertise in SQL
db.instructors.find({
    expertise: "SQL"
})

// 20. Find courses using tool Python
db.courses.find({
    tools: "Python"
})

// 21. Find courses using tool Databricks
db.courses.find({
    tools: "Databricks"
})

// 22. Find enrollments where quiz score contains 95
db.enrollments.find({
    quiz_scores: 95
})

// 23. Find enrollments where any quiz score is greater than 85
db.enrollments.find({
    quiz_scores: { $gt: 85 }
})


// PART 4: SORTING AND LIMIT

// 24. Sort courses by price descending
db.courses.find().sort({ price: -1 })

// 25. Display top 3 most expensive courses
db.courses.find()
    .sort({ price: -1 })
    .limit(3)

// 26. Sort learners by experience years descending
db.learners.find()
    .sort({ experience_years: -1 })

// 27. Display top 2 most experienced learners
db.learners.find()
    .sort({ experience_years: -1 })
    .limit(2)

// 28. Sort instructors by rating descending
db.instructors.find()
    .sort({ rating: -1 })


// PART 5: UPDATE OPERATIONS


// 29. Update learner 1 city to Secunderabad
db.learners.updateOne(
    { learner_id: 1 },
    { $set: { city: "Secunderabad" } }
)

// 30. Update course 203 price to 9000
db.courses.updateOne(
    { course_id: 203 },
    { $set: { price: 9000 } }
)

// 31. Update enrollment 1006 completion percent to 30
db.enrollments.updateOne(
    { enrollment_id: 1006 },
    { $set: { "progress.completion_percent": 30 } }
)

// 32. Change enrollment 1005 status to Inactive
db.enrollments.updateOne(
    { enrollment_id: 1005 },
    { $set: { status: "Inactive" } }
)

// 33. Add field active: true to all learners
db.learners.updateMany(
    {},
    { $set: { active: true } }
)

// 34. Remove field active from all learners
db.learners.updateMany(
    {},
    { $unset: { active: "" } }
)

// 35. Add tool MongoDB to course 201
db.courses.updateOne(
    { course_id: 201 },
    { $push: { tools: "MongoDB" } }
)


// PART 6: DELETE OPERATIONS


// 36. Delete enrollments where payment status is Failed
db.enrollments.deleteMany({
    "payment.status": "Failed"
})

// 37. Delete learners whose experience years is 0
db.learners.deleteMany({
    experience_years: 0
})


// PART 7: COUNT AND DISTINCT


// 38. Count total learners
db.learners.countDocuments()

// 39. Count total courses
db.courses.countDocuments()

// 40. Count successful enrollments
db.enrollments.countDocuments({
    "payment.status": "Success"
})

// 41. Display distinct learner cities
db.learners.distinct("city")

// 42. Display distinct course categories
db.courses.distinct("category")

// 43. Display distinct payment modes
db.enrollments.distinct("payment.mode")


// PART 8: AGGREGATION


// 44. Revenue by payment mode
db.enrollments.aggregate([
    {
        $match: {
            "payment.status": "Success"
        }
    },
    {
        $group: {
            _id: "$payment.mode",
            total_revenue: {
                $sum: "$payment.amount"
            }
        }
    }
])

// 45. Revenue by course
db.enrollments.aggregate([
    {
        $match: {
            "payment.status": "Success"
        }
    },
    {
        $group: {
            _id: "$course_id",
            total_revenue: {
                $sum: "$payment.amount"
            }
        }
    }
])

// 46. Count learners by goal
db.learners.aggregate([
    {
        $group: {
            _id: "$goal",
            total_learners: { $sum: 1 }
        }
    }
])

// 47. Average course price by category
db.courses.aggregate([
    {
        $group: {
            _id: "$category",
            average_price: {
                $avg: "$price"
            }
        }
    }
])

// 48. Average completion percentage by course
db.enrollments.aggregate([
    {
        $group: {
            _id: "$course_id",
            average_completion: {
                $avg: "$progress.completion_percent"
            }
        }
    }
])

// 49. Count enrollments by status
db.enrollments.aggregate([
    {
        $group: {
            _id: "$status",
            total_enrollments: { $sum: 1 }
        }
    }
])

// 50. Courses having revenue greater than ₹15,000
db.enrollments.aggregate([
    {
        $match: {
            "payment.status": "Success"
        }
    },
    {
        $group: {
            _id: "$course_id",
            total_revenue: {
                $sum: "$payment.amount"
            }
        }
    },
    {
        $match: {
            total_revenue: { $gt: 15000 }
        }
    }
])


// PART 9: LOOKUP / JOIN STYLE QUERIES


// 51. Enrollments with Learner Details
db.enrollments.aggregate([
    {
        $lookup: {
            from: "learners",
            localField: "learner_id",
            foreignField: "learner_id",
            as: "learner_details"
        }
    },
    {
        $unwind: "$learner_details"
    },
    {
        $project: {
            _id: 0,
            enrollment_id: 1,
            learner_name: "$learner_details.name",
            city: "$learner_details.city",
            course_id: 1,
            status: 1
        }
    }
])

// 52. Enrollments with Course Details
db.enrollments.aggregate([
    {
        $lookup: {
            from: "courses",
            localField: "course_id",
            foreignField: "course_id",
            as: "course_details"
        }
    },
    {
        $unwind: "$course_details"
    },
    {
        $project: {
            _id: 0,
            enrollment_id: 1,
            course_name: "$course_details.course_name",
            category: "$course_details.category",
            amount: "$payment.amount",
            payment_status: "$payment.status"
        }
    }
])

// 53. Courses with Instructor Details
db.courses.aggregate([
    {
        $lookup: {
            from: "instructors",
            localField: "instructor_id",
            foreignField: "instructor_id",
            as: "instructor_details"
        }
    },
    {
        $unwind: "$instructor_details"
    },
    {
        $project: {
            _id: 0,
            course_name: 1,
            category: 1,
            instructor_name: "$instructor_details.instructor_name",
            instructor_rating: "$instructor_details.rating"
        }
    }
])

// 54. Full Enrollment Report
db.enrollments.aggregate([
    {
        $lookup: {
            from: "learners",
            localField: "learner_id",
            foreignField: "learner_id",
            as: "learner_details"
        }
    },
    {
        $unwind: "$learner_details"
    },
    {
        $lookup: {
            from: "courses",
            localField: "course_id",
            foreignField: "course_id",
            as: "course_details"
        }
    },
    {
        $unwind: "$course_details"
    },
    {
        $lookup: {
            from: "instructors",
            localField: "course_details.instructor_id",
            foreignField: "instructor_id",
            as: "instructor_details"
        }
    },
    {
        $unwind: "$instructor_details"
    },
    {
        $project: {
            _id: 0,
            enrollment_id: 1,
            learner_name: "$learner_details.name",
            city: "$learner_details.city",
            goal: "$learner_details.goal",
            course_name: "$course_details.course_name",
            category: "$course_details.category",
            instructor_name: "$instructor_details.instructor_name",
            payment_amount: "$payment.amount",
            payment_status: "$payment.status",
            completion_percent: "$progress.completion_percent",
            enrollment_status: "$status"
        }
    }
])
