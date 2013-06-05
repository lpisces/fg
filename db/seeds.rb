# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Sysconfig.where(:key => 'title').first_or_create
Sysconfig.where(:key => 'keywords').first_or_create
Sysconfig.where(:key => 'description').first_or_create
