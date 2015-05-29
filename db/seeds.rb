# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do |n|
  subject = Subject.create!(name: Faker::Lorem.name)
  10.times do |m|
    question = Question.create!(content: Faker::Lorem.sentence(2), subject_id: n+1, )
    4.times do |k|
      option = Option.create!( question_id: m+1, content: Faker::Lorem.sentence(2),  correct: 1)
    end
  end
end

