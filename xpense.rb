require 'csv'
require_relative 'methods'

puts '-->      Xpense-Report'
puts '-->      12/01/2022'
puts '______________________________________________________'
puts 'Please write the path to your report (.csv): '
path = gets.chomp
puts '______________________________________________________'

transportation = []
meals = []
parking = []
others = []

CSV.foreach(path, headers: true, converters: :numeric) do |row|
  raise TypeError, "Something's wrong with your Expenses Report: #{row} Expected an Integer, got #{row[1].class.name}." unless row[1].is_a?(Integer)

  case row[0]
  when 'transportation'
    transportation << row[1]
  when 'meal'
    meals << row[1]
  when 'parking'
    parking << row[1]
  else
    others << row[1]
  end
end

ttotal = transportxpense(transportation)
mtotal = mealsxpense(meals)
ptotal = parkingxpense(parking)
ototal = otherxpense(others)
total = refund(ttotal, mtotal, ptotal)

puts ' '
puts '______________________________________________________'
print 'Transportation expenses: '
print transportation
puts ' '
print 'Meals eaten: '
print meals.size
puts ' '
print 'Parking expenses: '
print parking
puts ' '
puts '______________________________________________________'
puts ' '
puts '______________________________________________________'
puts 'The following costs are to be refunded:'
puts ' '
print 'Transportation: € '
puts ttotal
print 'Meals: € '
puts mtotal
print 'Parking: € '
puts ptotal
print 'Total: € '
puts total
puts '______________________________________________________'
puts ' '

if ototal != 0
  puts 'The following costs are not to be refunded:'
  print 'Other expenses: € '
  puts ototal
  puts '______________________________________________________'
  puts ' '
end
