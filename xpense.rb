require 'csv'

puts "-->      Xpense-Report"
puts "-->      12/01/2022"
puts "______________________________________________________"
puts "Please write the path to your report (.csv): "

path = gets.chomp
transportation = []
meals = []
parking = []
others = []

CSV.foreach(path, headers: true) do |row|
  if row[0] == 'transportation'
    transportation << row[1]
  elsif row[0] == 'meal'
    meals << row[1]
  elsif row[0] == 'parking'
    parking << row[1]
  else
    others << row[1]
  end
end

puts ' '
puts "______________________________________________________"
print 'Transportation expenses: '
print transportation
puts ' '
print 'Meals eaten: '
print meals.size
puts ' '
print 'Parking expenses: '
print parking
puts ' '
puts "______________________________________________________"
puts ' '

def transportxpense(transportation)
  ttotal = 0
  transportation.each do |kms|
    ttotal += kms.to_i
  end
  if ttotal <= 100
    ttotal = ttotal * 0.12
  else
    ttotal = (ttotal - 100) * 0.08 + 12
  end
  ttotal
end

def mealsxpense(meals)
  mtotal = 0
  if meals.size <= 3
    mtotal = meals.size.to_i * 10
  else
    mtotal = ((meals.size.to_i - 3) * 6) + 30
  end
  mtotal
end

def parkingxpense(parking)
  ptotal = 0
  parking.each do |eurs|
    ptotal += eurs.to_i
  end
  if ptotal <= 20
    ptotal = ptotal
  else
    ptotal = ((ptotal - 20) * 0.5) + 20
  end
  ptotal
end

def otherxpense(others)
  ototal = 0
  others.each do |other|
    ototal += other.to_i
  end
  ototal
end

ttotal = transportxpense(transportation)
mtotal = mealsxpense(meals)
ptotal = parkingxpense(parking)
ototal = otherxpense(others)

def refund(ttotal, mtotal, ptotal)
  total = ttotal + mtotal + ptotal
end

total = refund(ttotal, mtotal, ptotal)

puts ' '
puts "______________________________________________________"
puts "The following costs are to be refunded:"
puts ' '
print "Transportation: € "
puts ttotal
print "Meals: € "
puts mtotal
print "Parking: € "
puts ptotal
print "Total: € "
puts total
puts "______________________________________________________"
puts ' '
if ototal != 0
  puts "The following costs are not to be refunded:"
  print "Other costs: € "
  puts ototal
  puts "______________________________________________________"
  puts ' '
end
