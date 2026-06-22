import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# =====================================================
# STEP 1: Load Dataset
# =====================================================

df = pd.read_csv("expenses.csv")

print("=" * 50)
print("RAW DATA")
print("=" * 50)
print(df)

# =====================================================
# STEP 2: Data Cleaning
# =====================================================

df["amount"] = (
    df["amount"]
    .replace(r'[\$,]', '', regex=True)
    .astype(float)
)

df["date"] = pd.to_datetime(df["date"])

df["month"] = df["date"].dt.to_period("M")

print("\n" + "=" * 50)
print("CLEANED DATA")
print("=" * 50)
print(df)

# =====================================================
# STEP 3: NumPy Analysis
# =====================================================

total_expense = np.sum(df["amount"])

average_expense = np.mean(df["amount"])

max_expense = np.max(df["amount"])

min_expense = np.min(df["amount"])

print("\n" + "=" * 50)
print("NUMPY ANALYSIS")
print("=" * 50)

print(f"Total Expense   : {total_expense}")
print(f"Average Expense : {average_expense:.2f}")
print(f"Maximum Expense : {max_expense}")
print(f"Minimum Expense : {min_expense}")

# =====================================================
# STEP 4: Category-wise Breakdown
# =====================================================

category_breakdown = (
    df.groupby("category")["amount"]
    .sum()
    .reset_index()
)

print("\n" + "=" * 50)
print("CATEGORY-WISE BREAKDOWN")
print("=" * 50)
print(category_breakdown)

# =====================================================
# STEP 5: Monthly Summary
# =====================================================

monthly_summary = (
    df.groupby(["month", "category"])
    ["amount"]
    .sum()
    .unstack()
    .fillna(0)
)

print("\n" + "=" * 50)
print("MONTHLY EXPENSE SUMMARY")
print("=" * 50)
print(monthly_summary)

# =====================================================
# STEP 6: Top Spending Category
# =====================================================

top_category = (
    df.groupby("category")["amount"]
    .sum()
    .idxmax()
)

top_amount = (
    df.groupby("category")["amount"]
    .sum()
    .max()
)

print("\n" + "=" * 50)
print("TOP SPENDING CATEGORY")
print("=" * 50)
print(f"{top_category} : {top_amount}")

# =====================================================
# STEP 7: Visualization
# =====================================================

category_chart = (
    df.groupby("category")["amount"]
    .sum()
)

plt.figure(figsize=(8,5))
category_chart.plot(kind="bar")

plt.title("Expense Distribution by Category")
plt.xlabel("Category")
plt.ylabel("Amount Spent")

plt.tight_layout()

plt.show()