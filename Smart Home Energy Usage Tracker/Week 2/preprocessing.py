import pandas as pd
import numpy as np

# Load CSV
df = pd.read_csv("data.csv")

print("Original Dataset")
print(df)

# Convert timestamp column
df['timestamp'] = pd.to_datetime(df['timestamp'])

# Convert energy column to numeric
# Invalid values become NaN
df['energy_kwh'] = pd.to_numeric(
    df['energy_kwh'],
    errors='coerce'
)

# Remove rows with missing values
df_clean = df.dropna()

print("\nCleaned Dataset")
print(df_clean)

# Save cleaned dataset
df_clean.to_csv(
    "cleaned_energy_usage.csv",
    index=False
)

# -------------------------------
# NumPy Calculations
# -------------------------------

print("\nDevice Energy Statistics")

for device in df_clean['device_id'].unique():

    device_data = df_clean[
        df_clean['device_id'] == device
    ]

    energy_values = device_data[
        'energy_kwh'
    ].to_numpy()

    total_energy = np.sum(
        energy_values
    )

    average_energy = np.mean(
        energy_values
    )

    print(
        f"Device {device}: "
        f"Total={total_energy:.2f} kWh, "
        f"Average={average_energy:.2f} kWh"
    )

# -------------------------------
# Room Level Summary
# -------------------------------

room_summary = (
    df_clean
    .groupby('room_id')['energy_kwh']
    .sum()
    .reset_index()
)

print("\nRoom Summary")
print(room_summary)

room_summary.to_csv(
    "room_summary.csv",
    index=False
)

# -------------------------------
# Device Summary
# -------------------------------

device_summary = (
    df_clean
    .groupby(['device_id','device_name'])
    ['energy_kwh']
    .agg(
        Total_Energy='sum',
        Average_Energy='mean'
    )
    .reset_index()
)

print("\nDevice Summary")
print(device_summary)

device_summary.to_csv(
    "device_summary.csv",
    index=False
)

print("\nFiles Generated Successfully")