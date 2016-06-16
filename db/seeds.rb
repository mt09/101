# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

x = User.new
x.email = "q@q.com"
x.password = "qwerasdf"
x.password_confirmation = "qwerasdf"
x.is_admin = true
x.save

y = User.new
y.email = "w@w.com"
y.password = "qwerasdf"
y.password_confirmation = "qwerasdf"
y.is_admin = false
y.save
