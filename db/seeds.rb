# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



contact_array = [
  'Christian Sipple',
  'Vinnie Haake',
  'Marita Schear',
  'Lajuana Icenhour',
  'Kent Dehaan',
  'Brittney Metzger',
  'Fransisca Delaney',
  'Bradly Dahn',
  'Kellye Lytle',
  'Jennell Fetty',
  'Al Voegele',
  'Elodia Profit',
  'Aron Mcmeen',
  'Angle Rinke',
  'Tomeka Mayville',
  'Bree Withey',
  'Lisette Demps',
  'Imelda Goyette',
  'Edris Dorsey',
  'Tanner Furlong']


company_array = [
'Porsche',
'Coca-Cola',
'Google',
'HSBC',
'Louis Vuitton',
'Sprite',
'Corona',
'Wal-Mart',
'Credit Suisse',
'American Express',
'eBay',
'MasterCard',
'Prada',
'Beko',
'3M',
'Facebook',
'PepsiCo',
'Cartier SA',
'Cisco Systems',
'Pampers']


num = -1

contact_array.each do |contact|
  num += 1
  Contact.create!(name: contact , company: company_array[num], phone1: "0293799#{num}3", phone2: "0299589#{num}4", email: "#{contact[0..4]}@mail.com", address: "#{1+rand(30)} Commonwealth Rd", comment: "Very professional")
end


event_array = [
  conf = {
    name: 'Conference',
    tasks: ['book venue', 'finalise budget', 'confirm speakers', 'arrange accomodation', 'confirm catering']
  },
  wed = {
    name: 'Wedding',
    tasks: ['book venue', 'finalise budget', 'decorations', 'band and DJ', 'confirm catering']
  },
  prod = {
    name: 'Product Launch',
    tasks: ['book venue', 'finalise budget', 'book travel', 'confirm catering']
  }
]


num2 = -1
event_array.each do |event|

  num2 += 1
  date1 = 1433385118 + rand(1814400)
  date2 = date1 + rand(25200)

  created_event = Event.create!(name: event[:name], start: Time.at(date1), end: Time.at(date2), address: "Another street", comment: "Complete asap!")

  event[:tasks].each do |task|

    date3 = rand(Time.now.to_i..date1)
    amount = 1 + rand(15000)
    contact_no = 1 + rand(contact_array.size - 1)

    created_event.tasks.create!(name: task, deadline: Time.at(date3), cost: amount, contact_id: contact_no )
  end

end
