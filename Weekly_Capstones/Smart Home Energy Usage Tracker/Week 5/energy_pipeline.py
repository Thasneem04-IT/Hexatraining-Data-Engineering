import pandas as pd
import os

# -------------------------
# Create reports folder
# -------------------------
os.makedirs("reports", exist_ok=True)

# -------------------------
# Load Dataset
# -------------------------
df = pd.read_csv("data/smart_home_energy_logs.csv")

# -------------------------
# Data Cleaning
# -------------------------
df["timestamp"] = pd.to_datetime(df["timestamp"])

df["energy_kwh"] = pd.to_numeric(
    df["energy_kwh"],
    errors="coerce"
)

df = df.dropna()

# -------------------------
# Daily Summary
# -------------------------
daily_summary = (
    df.groupby(
        [
            "device_id",
            "device_name",
            df["timestamp"].dt.date
        ]
    )["energy_kwh"]
    .sum()
    .reset_index()
)

daily_summary.columns = [
    "device_id",
    "device_name",
    "date",
    "total_energy"
]

# -------------------------
# Alerts
# -------------------------
alerts = daily_summary[
    daily_summary["total_energy"] > 10
]

# -------------------------
# Save Reports
# -------------------------
daily_summary.to_csv(
    "reports/daily_summary.csv",
    index=False
)

alerts.to_csv(
    "reports/alerts.csv",
    index=False
)

print("="*40)
print("SMART HOME ENERGY REPORT")
print("="*40)

print("\nDaily Summary")
print(daily_summary)

print("\nAlerts")

if alerts.empty:
    print("No alerts generated.")
else:
    print(alerts)

print("\nPipeline completed successfully.")