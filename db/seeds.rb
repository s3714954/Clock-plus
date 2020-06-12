# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# City.create!(name: 'Melbourne', offset: 10)
# City.create!(name: 'Santo Domingo', offset: -4)
# City.create!(name: 'Tokyo', offset: 9)
# City.create!(name: 'Midway', offset: -11)

zones = JSON.parse(File.read(Rails.root.join("zone.json")))
zones.each do |zone|
    zone["utc"].each do |city|
        City.create!(name: city.split("/").last.tr("_", " "), offset: zone["offset"])
    end
end

(-23..23).each do |offset|
    utc_name = "UTC#{sprintf("%+d", offset)}"
    gmt_name = "GMT#{sprintf("%+d", offset)}"
    City.create!(name: utc_name, offset: offset) if City.find_by(name: utc_name).nil?
    City.create!(name: gmt_name, offset: offset) if City.find_by(name: gmt_name).nil?
end

City.create!(name: "UTC", offset: 0)
City.create!(name: "GMT", offset: 0)

melbourne = City.find_by(name: "Melbourne")
melbourne.toggled = true
melbourne.save