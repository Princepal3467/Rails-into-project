require "csv"
require "faker"

WorkoutExercise.destroy_all
Exercise.destroy_all
Workout.destroy_all
Category.destroy_all

CSV.foreach(Rails.root.join("db/data/categories.csv"), headers: true) do |row|
  Category.create!(name: row["name"].strip)
end

CSV.foreach(Rails.root.join("db/data/exercises.csv"), headers: true) do |row|
  category = Category.find_by(name: row["category"].strip)

  Exercise.create!(
    name: row["name"].strip,
    equipment: row["equipment"].strip,
    reps: row["reps"].strip,
    sets: row["sets"].strip,
    instructions: row["instructions"].strip,
    category: category
  )
end

CSV.foreach(Rails.root.join("db/data/workouts.csv"), headers: true) do |row|
  Workout.create!(
    name: row["name"].strip,
    difficulty: row["difficulty"].strip,
    duration_minutes: row["duration_minutes"].to_i,
    description: row["description"].strip
  )
end

Workout.find_each do |workout|
  exercises = Exercise.order(Arel.sql("RANDOM()")).limit(rand(4..7))
  position = 1

  exercises.each do |exercise|
    WorkoutExercise.create!(
      workout: workout,
      exercise: exercise,
      position: position
    )
    position += 1
  end
end

10.times do
  workout = Workout.create!(
    name: "#{['Strength', 'Cardio', 'Push', 'Pull', 'Leg', 'Core'].sample} Workout #{rand(100..999)}",
    difficulty: ["Beginner", "Intermediate", "Advanced"].sample,
    duration_minutes: rand(20..70),
    description: Faker::Lorem.sentence(word_count: 12)
  )

  Exercise.order(Arel.sql("RANDOM()")).limit(rand(4..8)).each_with_index do |exercise, index|
    WorkoutExercise.create!(
      workout: workout,
      exercise: exercise,
      position: index + 1
    )
  end
end

puts "Categories: #{Category.count}"
puts "Exercises: #{Exercise.count}"
puts "Workouts: #{Workout.count}"
puts "WorkoutExercises: #{WorkoutExercise.count}"
puts "Total rows: #{Category.count + Exercise.count + Workout.count + WorkoutExercise.count}"