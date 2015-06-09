# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



1.upto(12) do |num3|
  contact = Contact.create!(name: "Contact no.#{num3}", company: "Company no.#{num3}", phone1: "0293799#{num3}3", phone2: "0299589#{num3}4", email: "#{num3}@mail.com", address: "address line.#{num3}", comment: "hflfnlwfnw")
end


1.upto(4) do |num1|
  date1 = 1433385118 + rand(12096000)
  date2 = date1 + rand(3024000)

  event = Event.create!(name: "Event no.#{num1}", start: Time.at(date1), end: Time.at(date2), address: "address of event number #{num1}", comment: "abscdhd")


  1.upto(7) do |num2|
    date3 = date1 - 1209600
    amount = 1 + rand(15000)

    task = event.tasks.create!(name: "Task no.#{num2}", deadline: Time.at(date3), cost: amount, contact_id: ( 1 + rand(11) ) )
  end
end
