require_relative( '../models/employee.rb' )
require_relative( '../models/client.rb' )
require_relative( '../models/gymclass.rb' )
require("pry-byebug")

GymClass.delete_all()
Employee.delete_all()
Client.delete_all()


employee1 = Employee.new({
"name" => "Chris Cooper",
"speciality" => "Body Fat Reduction, Muscle Toning & Development, Bodyweight Training"
})

employee1.save()

employee2 = Employee.new({
"name" => "Conner Henderson",
"speciality" => "Body Fat Reduction, Bodyweight Training"
})

employee2.save()

employee3 = Employee.new({
"name" => "Rebecca Minto",
"speciality" => "Body Fat Reduction, Confidence building, Nutritional advice"
})

employee3.save()

employee4 = Employee.new({
"name" => "Stewart Penny",
"speciality" => "Body Fat Reduction, Strength and Conditioning, Nutritional advice"
})

employee4.save()


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


client3 = Client.new({
"name" => "Alina Spencer",
"membership_type" => "Premium",
"contact_details" => "dmackintosh@yahoo.com, 6 Rutherglen road, telef: 07758026522"
})

client3.save()

client4 = Client.new({
"name" => "Anna Welsh",
"membership_type" => "Standard",
"contact_details" => "annawelsh@yahoo.com, 22 Sauchiehall street, telef: 07758736522"
})

client4.save()

gymclass1 = GymClass.new({
  "name" => "Fat Burn",
  "employee_id" => employee1.id,
  "client_id" => client1.id,
  "capacity" => 10
  })

gymclass1.save()

gymclass2 = GymClass.new({
  "name" => "Fit Spin",
  "employee_id" => employee2.id,
  "client_id" => client2.id,
  "capacity" => 5
  })

gymclass2.save()


gymclass3 = GymClass.new({
  "name" => "Tabata Fit",
  "employee_id" => employee3.id,
  "client_id" => client2.id,
  "capacity" => 5
  })

gymclass3.save()


gymclass4 = GymClass.new({
  "name" => "Body Conditioning",
  "employee_id" => employee3.id,
  "client_id" => client4.id,
  "capacity" => 5
  })

gymclass4.save()



    binding.pry
    nil
