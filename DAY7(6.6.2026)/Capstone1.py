# Read CSV File
df = pd.read_csv("orders.csv")

# Create Revenue Column
df["Revenue"] = df["quantity"] * df["price"]


# ---------------- FUNCTIONS ---------------- #

def view_orders():

    print("\nALL ORDERS\n")

    print(df)


def revenue_analysis():

    print("\nREVENUE ANALYSIS\n")

    total_revenue = df["Revenue"].sum()

    highest_order = df["Revenue"].max()

    lowest_order = df["Revenue"].min()

    average_order = df["Revenue"].mean()

    print("Total Revenue:", total_revenue)

    print("Highest Order Value:", highest_order)

    print("Lowest Order Value:", lowest_order)

    print("Average Order Value:", average_order)


def product_analysis():

    print("\nPRODUCT ANALYSIS\n")

    # Revenue By Product
    product_revenue = df.groupby("product")["Revenue"].sum()

    print("Revenue By Product:\n")

    print(product_revenue)

    # Quantity Sold
    product_quantity = df.groupby("product")["quantity"].sum()

    print("\nQuantity Sold:\n")

    print(product_quantity)

    # Most Sold Product
    top_product = product_quantity.idxmax()

    print("\nMost Sold Product:", top_product)


def city_analysis():

    print("\nCITY ANALYSIS\n")

    # Orders By City
    city_orders = df.groupby("city")["order_id"].count()

    print("Orders By City:\n")

    print(city_orders)

    # Revenue By City
    city_revenue = df.groupby("city")["Revenue"].sum()

    print("\nRevenue By City:\n")

    print(city_revenue)

    # Top Revenue City
    top_city = city_revenue.idxmax()

    print("\nTop Revenue Generating City:", top_city)


def export_reports():

    # Sales Summary Report
    with open("sales_summary_report.txt", "w") as file:

        file.write("SALES SUMMARY REPORT\n")

        file.write("========================\n\n")

        file.write(f"Total Orders: {len(df)}\n")

        file.write(f"Total Revenue: {df['Revenue'].sum()}\n")

        file.write(f"Average Order Value: {df['Revenue'].mean()}\n")

        file.write(f"Highest Order Value: {df['Revenue'].max()}\n")

        file.write(f"Lowest Order Value: {df['Revenue'].min()}\n")


    # High Value Orders CSV
    high_value = df[df["Revenue"] > 50000]

    high_value.to_csv("high_value_orders.csv", index=False)


    # Electronics Orders CSV
    electronics = df[df["category"] == "Electronics"]

    electronics.to_csv("electronics_orders.csv", index=False)

    print("\nReports Exported Successfully")


# ---------------- MENU ---------------- #

while True:

    print("\n========= E-COMMERCE ANALYTICS SYSTEM =========")

    print("1. View Orders")

    print("2. Revenue Analysis")

    print("3. Product Analysis")

    print("4. City Analysis")

    print("5. Export Reports")

    print("6. Exit")


    choice = input("\nEnter Your Choice: ")


    if choice == "1":

        view_orders()

    elif choice == "2":

        revenue_analysis()

    elif choice == "3":

        product_analysis()

    elif choice == "4":

        city_analysis()

    elif choice == "5":

        export_reports()

    elif choice == "6":

        print("\nExiting Application...")

        break

    else:

        print("\nInvalid Choice")
