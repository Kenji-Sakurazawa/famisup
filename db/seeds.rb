# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: 'shinsoukenbi@gmail.com',
  password: "kenjisakura",
  role: 0
)

Topic.create(
  title: "勉強について",
)

Post.create(
  name: "Ken",
  body: "I hate to study",
  topic_id: 2
)
