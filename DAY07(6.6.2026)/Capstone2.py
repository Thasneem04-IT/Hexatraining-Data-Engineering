import pandas as pd
import numpy as np



# FILE HANDLING
try:

    file = open("players.csv", "r")
    data = file.read()
    print("\nALL PLAYER RECORDS\n")
    print(data)
    file.close()
except FileNotFoundError:
    print("players.csv file not found")


# Count Total Players

with open("players.csv", "r") as file:
    next(file)
    count = 0
    for line in file:
        if line.strip() != "":
            count += 1
print("\nTotal Players:", count)


# PLAYER ANALYTICS

highest_runs = 0
highest_player = ""

lowest_runs = 999999
lowest_player = ""

total_runs = 0
player_count = 0

print("\nPlayers Scoring More Than 600 Runs\n")

with open("players.csv", "r") as file:

    next(file)

    for line in file:

        if line.strip() == "":
            continue

        data = line.strip().split(",")

        try:

            player = data[1]

            runs = int(data[4])

            total_runs += runs

            player_count += 1

            if runs > highest_runs:

                highest_runs = runs

                highest_player = player

            if runs < lowest_runs:

                lowest_runs = runs

                lowest_player = player

            if runs > 600:

                print(player, "-", runs)

        except ValueError:

            print("Invalid Run Value")


print("\nHighest Scorer:", highest_player, "-", highest_runs)

print("Lowest Scorer:", lowest_player, "-", lowest_runs)

average_runs = total_runs / player_count

print("Average Runs:", average_runs)


# Players Less Than 500

print("\nPlayers Scoring Less Than 500 Runs\n")

with open("players.csv", "r") as file:

    next(file)

    for line in file:

        if line.strip() == "":
            continue

        data = line.strip().split(",")

        runs = int(data[4])

        if runs < 500:

            print(data[1], "-", runs)


# TEAM ANALYTICS

team_players = {}
team_runs = {}

with open("players.csv", "r") as file:

    next(file)

    for line in file:

        if line.strip() == "":
            continue

        data = line.strip().split(",")

        team = data[2]

        runs = int(data[4])

        # Count Players
        if team in team_players:

            team_players[team] += 1

        else:

            team_players[team] = 1

        # Total Runs
        if team in team_runs:

            team_runs[team] += runs

        else:

            team_runs[team] = runs


print("\nPlayers By Team\n")

for team, count in team_players.items():

    print(team, ":", count)


print("\nTotal Runs By Team\n")

for team, runs in team_runs.items():

    print(team, ":", runs)


top_team = max(team_runs, key=team_runs.get)

lowest_team = min(team_runs, key=team_runs.get)

print("\nTeam With Highest Runs:", top_team)

print("Team With Lowest Runs:", lowest_team)


# BOUNDARY ANALYSIS

most_fours = 0
fours_player = ""

most_sixes = 0
sixes_player = ""

total_fours = 0
total_sixes = 0

with open("players.csv", "r") as file:

    next(file)

    for line in file:

        if line.strip() == "":
            continue

        data = line.strip().split(",")

        player = data[1]

        fours = int(data[5])

        sixes = int(data[6])

        total_fours += fours

        total_sixes += sixes

        if fours > most_fours:

            most_fours = fours

            fours_player = player

        if sixes > most_sixes:

            most_sixes = sixes

            sixes_player = player


print("\nMost Fours:", fours_player, "-", most_fours)

print("Most Sixes:", sixes_player, "-", most_sixes)

print("Total Fours:", total_fours)

print("Total Sixes:", total_sixes)


# LISTS, SETS, DICTIONARIES

players = []

teams = set()

player_runs = {}

with open("players.csv", "r") as file:

    next(file)

    for line in file:

        if line.strip() == "":
            continue

        data = line.strip().split(",")

        player = data[1]

        team = data[2]

        runs = int(data[4])

        players.append(player)

        teams.add(team)

        player_runs[player] = runs


players.sort()

print("\nSorted Player Names\n")

for player in players:

    print(player)


print("\nUnique Teams\n")

for team in teams:

    print(team)


print("\nTeam Runs Dictionary\n")

print(team_runs)

print("\nPlayer Runs Dictionary\n")

print(player_runs)


# FUNCTIONS

def find_top_scorer():

    return highest_player


def calculate_average_runs():

    return average_runs


def find_best_team():

    return top_team


def find_total_boundaries():

    return total_fours + total_sixes


print("\nTop Scorer:", find_top_scorer())

print("Average Runs:", calculate_average_runs())

print("Best Team:", find_best_team())

print("Total Boundaries:", find_total_boundaries())


# NUMPY

runs_list = []

with open("players.csv", "r") as file:

    next(file)

    for line in file:

        if line.strip() == "":
            continue

        data = line.strip().split(",")

        runs_list.append(int(data[4]))


arr = np.array(runs_list)

print("\nNUMPY ANALYSIS\n")

print("Total Runs:", np.sum(arr))

print("Average Runs:", np.mean(arr))

print("Maximum Runs:", np.max(arr))

print("Minimum Runs:", np.min(arr))

print("Standard Deviation:", np.std(arr))

print("Median:", np.median(arr))


# PANDAS

df = pd.read_csv("players.csv")

print("\nTOP 5 RUN SCORERS\n")

top5 = df.sort_values(by="runs", ascending=False)

print(top5.head(5))


print("\nPLAYERS SORTED BY RUNS\n")

print(df.sort_values(by="runs", ascending=False))


print("\nTEAM TOTAL RUNS\n")

print(df.groupby("team")["runs"].sum())


print("\nTEAM AVERAGE RUNS\n")

print(df.groupby("team")["runs"].mean())


print("\nPLAYERS WITH RUNS > 600\n")

print(df[df["runs"] > 600])


best_team = df.groupby("team")["runs"].sum().idxmax()

print("\nTOP TEAM:", best_team)


# REPORT GENERATION

with open("cricket_report.txt", "w") as file:

    file.write("CRICKET ANALYTICS REPORT\n")

    file.write("===========================\n\n")

    file.write(f"Total Players: {player_count}\n")

    file.write(f"Total Runs: {total_runs}\n")

    file.write(f"Average Runs: {average_runs}\n")

    file.write(f"Highest Scorer: {highest_player} - {highest_runs}\n")

    file.write(f"Lowest Scorer: {lowest_player} - {lowest_runs}\n\n")

    file.write("TEAM WISE RUNS\n")

    file.write("-------------------\n")

    for team, runs in team_runs.items():

        file.write(f"{team}: {runs}\n")

    file.write("\nTOP 5 PLAYERS\n")

    file.write("-------------------\n")

    top_players = df.sort_values(by="runs", ascending=False).head(5)

    for index, row in top_players.iterrows():

        file.write(f"{row['player_name']} - {row['runs']}\n")

    file.write(f"\nMost Fours: {fours_player} - {most_fours}\n")

    file.write(f"Most Sixes: {sixes_player} - {most_sixes}\n")


print("\ncricket_report.txt generated successfully")


# EXPORT CSV FILES

# Top Players CSV

top_players_df = df[df["runs"] > 600]

top_players_df.to_csv("top_players.csv", index=False)

print("top_players.csv generated")


# Team Summary CSV

team_summary = df.groupby("team").agg({

    "runs": ["sum", "mean"],

    "player_id": "count"

})

team_summary.columns = ["Total_Runs", "Average_Runs", "Player_Count"]

team_summary.to_csv("team_summary.csv")

print("team_summary.csv generated")


# MENU DRIVEN APPLICATION

while True:

    print("\n===== SMART CRICKET ANALYTICS SYSTEM =====")

    print("1. Player Analysis")

    print("2. Team Analysis")

    print("3. Boundary Analysis")

    print("4. Export Reports")

    print("5. Exit")


    choice = input("\nEnter Your Choice: ")


    if choice == "1":

        print("\nPLAYER ANALYSIS\n")

        print("Highest Scorer:", highest_player)

        print("Lowest Scorer:", lowest_player)

        print("Average Runs:", average_runs)


    elif choice == "2":

        print("\nTEAM ANALYSIS\n")

        for team, runs in team_runs.items():

            print(team, ":", runs)

        print("\nBest Team:", top_team)


    elif choice == "3":

        print("\nBOUNDARY ANALYSIS\n")

        print("Most Fours:", fours_player)

        print("Most Sixes:", sixes_player)

        print("Total Fours:", total_fours)

        print("Total Sixes:", total_sixes)


    elif choice == "4":

        print("\nReports Already Exported")

        print("1. cricket_report.txt")

        print("2. top_players.csv")

        print("3. team_summary.csv")


    elif choice == "5":

        print("\nExiting Application...")

        break


    else:

        print("\nInvalid Choice")
