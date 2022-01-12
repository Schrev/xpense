def transportxpense(transportation)
  ttotal = 0
  transportation.each do |kms|
    ttotal += kms
  end
  if ttotal <= 100
    ttotal = ttotal * 0.12
  else
    ttotal = ((ttotal - 100) * 0.08) + 12
  end
  ttotal
end

def mealsxpense(meals)
  mtotal = 0
  if meals.size <= 3
    mtotal = meals.size * 10
  else
    mtotal = ((meals.size - 3) * 6) + 30
  end
  mtotal
end

def parkingxpense(parking)
  ptotal = 0
  parking.each do |eurs|
    ptotal += eurs
  end
  if ptotal <= 20
    ptotal
  else
    ptotal = ((ptotal - 20) * 0.5) + 20
  end
  ptotal
end

def otherxpense(others)
  ototal = 0
  others.each do |other|
    ototal += other
  end
  ototal
end

def refund(ttotal, mtotal, ptotal)
  total = ttotal + mtotal + ptotal
end
