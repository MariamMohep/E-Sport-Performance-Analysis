# 🎮 E-Sports Performance Analysis

## 📌 Introduction

E-Sports has become a competitive field where players compete individually or as teams. Success in E-Sports requires quick reactions, concentration, decision-making, strategy, and consistent performance.

This project analyzes E-Sports player data to understand the factors that may be associated with player performance and match outcomes.

---

## 🎯 Project Objective

The main objective of this project is to analyze E-Sports performance and identify factors linked to match outcomes.

The analysis focuses on:

* Game Genre
* Sleep Hours
* Energy Drinks
* Age
* Gaming Environment
* Play Time

---

## 📊 Dataset Overview

The dataset contains **250,000 player records** covering different aspects of E-Sports performance and gaming habits.

### Dataset Features

* Player Age
* Game Genre
* Play Time
* Sleep Hours
* Energy Drinks Consumption
* Screen Brightness
* Blue Light Filter Usage
* Actions Per Minute (APM)
* Heart Rate
* HRV Score
* Reaction Time
* Match Outcome

The dataset covers four main game genres:

* MOBA
* FPS
* Battle Royale
* Fighting

---

## 🎮 Game Genre and Performance

The first part of the analysis focused on whether the type of game is related to player performance.

We compared:

* Popularity of different game genres
* Average Actions Per Minute (APM)
* Average Reaction Time

The results showed differences between game genres, suggesting that different types of games require different levels of speed and player actions.

---

## 😴 Sleep and Winning

We investigated the relationship between sleep hours and winning.

Players were divided into different sleep groups, ranging from **less than 5 hours to more than 8 hours**.

The analysis showed that the **6–7 hours** group had the highest number of players and the highest number of wins.

This suggests that sleep patterns may be associated with match outcomes, although the analysis does **not prove that sleep directly causes winning**.

---

## ⚡ Energy Drinks and Performance

We analyzed energy drink consumption and its relationship with winning and heart rate.

The data showed that players who consumed more energy drinks generally had higher average heart rates during matches.

For example:

* **0 energy drinks:** approximately 80 BPM
* **4 energy drinks:** approximately 97 BPM

We also analyzed age groups with higher energy drink consumption.

The **20–24 age group** showed the highest number of players consuming **3 or 4 energy drinks**.

---

## 🖥️ Gaming Environment

We investigated whether the gaming environment was related to match outcomes.

The analysis focused on:

* Screen Brightness
* Blue Light Filter Usage

Players were grouped according to their screen brightness levels, and the number of players and wins were compared across the groups.

The results showed differences in player distribution and wins across brightness levels.

We also examined the percentage of players using Blue Light Filters within each brightness group.

---

## ⏱️ Play Time and Performance

Finally, we examined whether longer gaming sessions were associated with changes in player performance.

A clear pattern was observed:

> **As Play Time increased, average APM decreased while average Reaction Time increased.**

For example:

| Play Time         | Average APM | Average Reaction Time |
| ----------------- | ----------: | --------------------: |
| Less than 1 hour  |         214 |               ~257 ms |
| More than 4 hours |         184 |               ~274 ms |

This indicates that longer gaming sessions were associated with **lower action rates and slower reaction times** in this dataset.

---

## 🔍 Key Findings

The analysis revealed several important patterns:

* 🎮 Game genre was associated with differences in APM and reaction time.
* 😴 The **6–7 hours** sleep group had the highest number of wins.
* ⚡ Higher energy drink consumption was associated with higher average heart rate.
* 👥 The **20–24 age group** had the highest number of players consuming high amounts of energy drinks.
* 🖥️ Screen brightness groups showed differences in player distribution and wins.
* ⏱️ Longer play time was associated with lower APM and slower reaction time.

---

## 💡 Recommendations

Based on the analysis, E-Sports players should consider:

1. **Sleep** – Maintain sufficient sleep to support consistent performance.
2. **Energy Drinks** – Monitor energy drink consumption.
3. **Gaming Time** – Manage gaming time to maintain consistent performance.
4. **Gaming Environment** – Optimize screen brightness and blue light filter settings.
5. **Performance** – Focus on reaction speed and APM depending on the game genre.

---

## 🏁 Conclusion

Overall, E-Sports performance is associated with multiple factors, including **game genre, sleep, energy drink consumption, gaming environment, and play time**.

The analysis demonstrates how **SQL and data analysis** can be used to explore large datasets, identify meaningful patterns, and generate insights that may help players better understand factors related to their performance.

> **From the game they play to how long they play, performance is influenced by more than just skill.**

---

## 🛠️ Tools Used

* SQL
* Power BI
* Python

---

## 📁 Project Files

```text
E-Sports-Performance-Analysis/
│
├── SQL/
│   └── Esports_Performance_Analysis.sql
│
├── Presentation/
│   └── Esports_Performance_Analysis.pptx
│
└── README.md
```
