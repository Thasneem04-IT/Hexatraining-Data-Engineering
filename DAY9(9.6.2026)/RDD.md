RDD stands for Resilient Distributed Dataset in Apache Spark.

It is the core data structure of Spark used to process large amounts of data across multiple machines.

Think of an RDD as:

A distributed collection of data that Spark can process in parallel.

Imagine you have:

numbers = [10, 20, 30, 40]

This is a normal Python list.

But when you create:

rdd = spark.sparkContext.parallelize(numbers)

Spark converts the list into an RDD.

Now Spark can:

Split data into partitions
Process data in parallel
Run across clusters/multiple machines
Recover data if a node fails

How RDD Works Internally

When you do:

rdd.filter(lambda x: "QUIZ" in x)

Spark does NOT execute immediately.

Instead:

Spark creates an execution plan
Stores transformations lazily
Executes only when an action occurs

This is called Lazy Evaluation.

Two Important RDD Operations
1. Transformations

Create a new RDD.

Examples:

map()
filter()
flatMap()
distinct()
sortBy()

2. Actions

Actually execute computation.

Examples:

collect()
count()
first()
take()
reduce()
