#  Gym Workout Tracker

## Project Overview
The Gym Workout Tracker is a Ruby on Rails web application that helps users manage workouts and exercises. Users can explore different workout routines, view exercises by category, and understand how exercises are structured within workouts.

This project demonstrates database design, Active Record associations, and dynamic web page rendering using Rails.

---

## Features
- View all workouts and exercises
- Categorize exercises (e.g., Strength, Cardio)
- Search workouts and exercises
- Display exercises within each workout
- Show exercise details including reps, sets, and instructions
- Clean and responsive UI using Bootstrap

---

## 🗂️ Database Design

### Models:
- **Category**
  - id (PK)
  - name

- **Exercise**
  - id (PK)
  - name
  - equipment
  - reps
  - sets
  - instructions
  - category_id (FK)

- **Workout**
  - id (PK)
  - name
  - difficulty
  - duration_minutes
  - description

- **WorkoutExercise (Join Table)**
  - id (PK)
  - workout_id (FK)
  - exercise_id (FK)
  - position

---

## 🔗 Relationships
- Category → Exercise (**One-to-Many**)
- Workout ↔ Exercise (**Many-to-Many**) through WorkoutExercise

---

## 🔍 Search Functionality
- Users can search workouts by name
- Users can search exercises by name

---

## 📊 Data Sources
- CSV files used for:
  - Categories
  - Exercises
  - Workouts
- Additional sample data generated using Faker

---

## 🧰 Technologies Used
- Ruby on Rails
- SQLite3
- Bootstrap (for styling)
- HTML / ERB
- Active Record

---

## ▶️ How to Run the Project

### 1. Clone the repository
```bash
git clone https://github.com/your-username/gym_workout_tracker.git
cd gym_workout_tracker