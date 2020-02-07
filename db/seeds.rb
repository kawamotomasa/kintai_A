# coding: utf-8

User.create!(name: "Sample User",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)

User.create!(name: "上長A",
             email: "superiorA@email.com",
             password: "password",
             password_confirmation: "password",
             superior: true,
             basic_work_time: "8:00",
             designated_work_start_time: "9:00",
             designated_work_end_time: "18:00")

User.create!(name: "上長B",
             email: "superiorB@email.com",
             password: "password",
             password_confirmation: "password",
             superior: true,
             basic_work_time: "8:00",
             designated_work_start_time: "9:00",
             designated_work_end_time: "18:00")

60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               basic_work_time: "8:00",
               designated_work_start_time: "9:00",
               designated_work_end_time: "18:00")
end