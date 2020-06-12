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