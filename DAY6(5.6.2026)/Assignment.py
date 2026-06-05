# Read and display entire file

file = open("employees.txt","r")
data = file.read()
print(data)
file.close()

# Read and display file line by line

file = open("employees.txt","r")
for line in file:
  print(line)
file.close()

# Count total employees

file = open("employees.txt","r")
count = 0
for line in file:
  count += 1
print("Total employees:", count)
file.close()

# Display only employee names
file = open("employees.txt","r")
for line in file:
  name = line.split(",")[1]
  print(name)
file.close()

# Display employees from Hyderabad
print("From Hyderabad...")
file = open("employees.txt","r")
for line in file:
  data = line.strip().split(",")
  if data[4] == "Hyderabad":
    print(data[1])
file.close()

# Display employees from Bangalore
print("From Bangalore...")
file = open("employees.txt",'r')
for line in file:
  data = line.strip().split(",")
  if data[4]=='Bangalore':
    print(data[0], data[1])
file.close()

# Display employees whose salary is greater than 80000
file = open("employees.txt","r")
for line in file:
  data = line.strip().split(",")
  salary = int(data[3])
  if salary>80000:
    print(data[1], salary)
file.close()


# Find highest salary

file = open('employees.txt',"r")
highest = 0
for line in file:
  data = line.strip().split(",")
  salary = int(data[3])
  if salary>highest:
    highest = salary
print("Highest Salary: ", highest)
file.close()


# Find lowest salary
file = open('employees.txt',"r")
lowest = 9999999
for line in file:
  data = line.strip().split(",")
  salary = int(data[3])
  if salary<lowest:
    lowest = salary
print("Lowest Salary: ", lowest)
file.close()


# Find average salary

file = open("employees.txt","r")
total = 0
count = 0 
for line in file:
  data = line.strip().split(",")
  salary = int(data[3])
  total+=salary
  count+=1
avg = total/count
print("Average salary: ", avg)
file.close()


# Calculate total salary payout

file = open("employees.txt","r")
total = 0

for line in file:
  data = line.strip().split(",")
  salary = int(data[3])
  total+=salary
print("Total salary payout: ", total)
file.close()


# Count employees in AI Engineering
file =  open("employees.txt","r")
count = 0 
for line in file:
  data = line.strip().split(",")
  if data[2] == "AI Engineering":
    count+=1
print("Employees in AI Engineering: ",count)
file.close()

# Count employees in Data Engineering

file =  open("employees.txt","r")
count = 0 
for line in file:
  data = line.strip().split(",")
  if data[2] == "Data Engineering":
    count+=1
print("Employees in Data Engineering: ",count)
file.close()

# Display employees whose department is AI Engineering

file =  open("employees.txt","r")
for line in file:
  data = line.strip().split(",")
  if data[2] == "AI Engineering":
    print(data[0], data[1])
file.close()

# Create high_salary_employees.txt

file = open("employees.txt", "r")
new_file = open("high_salary_employees.txt", "w")
for line in file:
  data = line.strip().split(",")
  salary = int(data[3])
  if salary>80000:
    new_file.write(line)
file.close()
new_file.close()
print("High Salary Employees file created")


# Create hyderabad_employees.txt
file = open("employees.txt", "r")
new_file = open("hyderabad_employees.txt", "w")
for line in file:
  data = line.strip().split(",")
  if data[4] == "Hyderabad":
    new_file.write(line)
file.close()
new_file.close()
print("Hyderabad Employees file created")


# Count unique cities

file = open("employees.txt", "r")
cities = []
for line in file:
  data = line.strip().split(",")
  city = data[4]
  if city not in cities:
    cities.append(city)
for city in cities:
  print(city)
file.close()


# Count employees by department

file = open("employees.txt", "r")
de = 0
ae = 0
ds = 0
ce = 0
for line in file:
  data = line.strip().split(",")
  dept = data[2]
  if dept == "Data Engineering":
    de+=1
  elif dept == "AI Engineering":
    ae+=1
  elif dept == "Data Science":
    ds+=1
  elif dept == "Cloud Engineering":
    ce+=1
print("Data Engineering =", de)
print("AI Engineering =", ae)
print("Data Science =", ds)
print("Cloud Engineering =", ce)
file.close()


# Find employee with highest salary


file = open("employees.txt", "r")
highest = 0
employee = ""
for line in file:
    data = line.strip().split(",")
    salary = int(data[3])
    if salary > highest:
        highest = salary
        employee = data[1]
print(employee)
print(highest)
file.close()


# Generate employee_report.txt

file = open("employees.txt", "r")
count = 0
total = 0
highest = 0
lowest = 999999
for line in file:
    data = line.strip().split(",")
    salary = int(data[3])
    count += 1
    total += salary
    if salary > highest:
        highest = salary
    if salary < lowest:
        lowest = salary
average = total / count
report = open("employee_report.txt", "w")
report.write("Total Employees = " + str(count) + "\n")
report.write("Highest Salary = " + str(highest) + "\n")
report.write("Lowest Salary = " + str(lowest) + "\n")
report.write("Average Salary = " + str(average) + "\n")
