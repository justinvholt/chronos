# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
puts "------------------------------------------------------------"
puts "seeding fixtures"
count = 0

20.times do
  vesname = ["Wagon Canard", "Wagon Macaw", "Wagon Eagle", "Wagon Razorbill", "Wagon Albatros", "Wagon Goose", "Wagon Hornbill", "Wagon Toucan"].sample
  charterer = ["Petrochem", "SPL", "Chemtrade", "Bahia tradecorp", "Shell", "Riofiber", "Samba Marine", "Dow", "BASF", "Unilever"].sample

  if Fixture.where(vessel_name: vesname) == []
    voynum = rand(20..250)
  else
    voynum = Fixture.where(vessel_name: vesname).last.voyage_number + 1
  end

  Fixture.create(
    reference_no: "4837" + rand(100..500).to_s,
    charterer: charterer,
    vessel_name: vesname,
    voyage_number: voynum,
    demurrage_rate: rand(200..400) * 100,
    allowed_laytime: rand(20..60),
    calculation_status: "validate"
    )
  count += 1
end

puts "succesfully seeded #{count} fixtures"
puts "#{Fixture.all.length} fixtures in database"
puts "------------------------------------------------------------"
puts "seeding clauses"
count = 0




