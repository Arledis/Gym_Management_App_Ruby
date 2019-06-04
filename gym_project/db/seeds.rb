require_relative( '../models/booking.rb' )
require_relative( '../models/client.rb' )
require_relative( '../models/gymclass.rb' )
require("pry-byebug")

Booking.delete_all()
Gymclass.delete_all()
Client.delete_all()



client1 = Client.new({
"name" => "Arledis Amaya",
"membership_type" => "Standard",
"contact_details" => "arledis.amaya@yahoo.com, 4 Falkirk road, telef: 07757926522"
})

client1.save()

client2 = Client.new({
"name" => "Jenny Scott",
"membership_type" => "Premium",
"contact_details" => "jenny.scott@yahoo.com, 4 Macbeth road, telef: 07758026522"
})

client2.save()

client3 = Client.new({
"name" => "Duncan Mackintosh",
"membership_type" => "Premium",
"contact_details" => "dmackintosh@yahoo.com, 6 Rutherglen road, telef: 07756926522"
})

client3.save()


client4 = Client.new({
"name" => "Alina Spencer",
"membership_type" => "Premium",
"contact_details" => "alinaspencer@yahoo.com, 20 Rutherglen road, telef: 07758226522"
})

client4.save()



gymclass1 = Gymclass.new({
  "name" => "Fat Burn",
  "capacity" => 10
  })

gymclass1.save()

gymclass2 = Gymclass.new({
  "name" => "Fit Spin",
  "capacity" => 5
  })

gymclass2.save()


gymclass3 = Gymclass.new({
  "name" => "Tabata Fit",
  "capacity" => 5
  })

gymclass3.save()


gymclass4 = Gymclass.new({
  "name" => "Body Conditioning",
  "capacity" => 5
  })

gymclass4.save()

booking1 = Booking.new({
  "gymclass_id" => gymclass1.id,
  "client_id" => client1.id
})

booking1.save()

booking2 = Booking.new({
  "gymclass_id" => gymclass2.id,
  "client_id" => client2.id
})

booking2.save()

booking3 = Booking.new({
  "gymclass_id" => gymclass3.id,
  "client_id" => client2.id
})

booking3.save()

booking4 = Booking.new({
  "gymclass_id" => gymclass4.id,
  "client_id" => client2.id
})

booking4 = Booking.new({
  "gymclass_id" => gymclass1.id,
  "client_id" => client2.id
})

booking4.save()


    binding.pry
    nil
