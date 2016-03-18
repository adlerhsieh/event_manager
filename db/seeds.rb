# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# event = Event.create(name: "foo")
# Event.create(name: "bar")
# Location.create(address: "台北市", event: event)
# Group.create( :name => "Tech"  )
# Group.create( :name => "Business"  )
# Category.create( :name => "Meetup"  )
# Category.create( :name => "Conference"  )
# User.create( :email => "ihower@gmail.com", :password => "12345678" )

Event.all.each do |e|
  e.destroy if e.location
end

puts "Done!"
