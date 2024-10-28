# Modulo para operaciones matematicas
module MathOperations
  PI = 3.14159265359

  def self.circle_area(radius)
    PI * radius ** 2
  end

  def self.circle_circumference(radius)
    2 * PI * radius
  end

  def self.addition(a, b)
    a + b
  end

  def self.subtraction(a, b)
    a - b
  end

  def self.multiplication(a, b)
    a * b
  end

  def self.division(a, b)
    return nil if b == 0
    a / b.to_f
  end
end

# Clase basica de vehiculo
class Vehicle
  attr_accessor :make, :model, :year, :speed

  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year
    @speed = 0
  end

  def accelerate(amount)
    @speed += amount
  end

  def brake(amount)
    @speed -= amount
    @speed = 0 if @speed < 0
  end

  def info
    "Vehicle: #{@make} #{@model}, Year: #{@year}, Speed: #{@speed} km/h"
  end
end

# Clase para coches que hereda de Vehicle
class Car < Vehicle
  attr_accessor :doors, :fuel_efficiency

  def initialize(make, model, year, doors, fuel_efficiency)
    super(make, model, year)
    @doors = doors
    @fuel_efficiency = fuel_efficiency # en km/l
  end

  def range(fuel)
    fuel * @fuel_efficiency
  end

  def info
    super + ", Doors: #{@doors}, Fuel Efficiency: #{@fuel_efficiency} km/l"
  end
end

# Clase para bicicletas que hereda de Vehicle
class Bicycle < Vehicle
  attr_accessor :type, :gear_count

  def initialize(make, model, year, type, gear_count)
    super(make, model, year)
    @type = type
    @gear_count = gear_count
  end

  def ring_bell
    puts "Ring ring!"
  end

  def info
    super + ", Type: #{@type}, Gears: #{@gear_count}"
  end
end

# Clase para motos que hereda de Vehicle
class Motorcycle < Vehicle
  attr_accessor :cc

  def initialize(make, model, year, cc)
    super(make, model, year)
    @cc = cc
  end

  def info
    super + ", Engine Capacity: #{@cc} cc"
  end
end

# Uso de diferentes tipos de variables y operadores
def experiment_with_variables
  # Enteros y operaciones
  a = 10
  b = 20
  sum = a + b
  difference = b - a
  product = a * b
  quotient = b / a
  modulo = b % a
  exponent = a ** 2

  puts "Sum: #{sum}, Difference: #{difference}, Product: #{product}, Quotient: #{quotient}, Modulo: #{modulo}, Exponent: #{exponent}"

  # Flotantes
  x = 12.34
  y = 56.78
  sum_float = x + y
  difference_float = y - x
  product_float = x * y
  quotient_float = y / x

  puts "Float Sum: #{sum_float}, Float Difference: #{difference_float}, Float Product: #{product_float}, Float Quotient: #{quotient_float}"

  # Booleanos y operadores logicos
  is_true = true
  is_false = false

  and_operation = is_true && is_false
  or_operation = is_true || is_false
  not_operation = !is_true

  puts "AND: #{and_operation}, OR: #{or_operation}, NOT: #{not_operation}"

  # String manipulacion
  str1 = "Hello"
  str2 = "World"
  concatenated = str1 + " " + str2
  interpolated = "#{str1}, #{str2}!"

  puts concatenated
  puts interpolated

  # Arrays y hashes
  array = [1, 2, 3, 4, 5]
  hash = { name: "John", age: 30, city: "New York" }

  array << 6
  hash[:country] = "USA"

  puts "Array: #{array.inspect}"
  puts "Hash: #{hash.inspect}"

  # Simbolos
  symbol = :my_symbol
  puts "Symbol: #{symbol}"
end

# Uso de estructuras de control
def control_structures
  # Condicionales
  x = 10
  y = 20

  if x > y
    puts "x is greater than y"
  elsif x < y
    puts "x is less than y"
  else
    puts "x is equal to y"
  end

  # A menos que (unless)
  unless x == y
    puts "x is not equal to y"
  else
    puts "x is equal to y"
  end

  # Casos (case)
  grade = 'A'
  case grade
  when 'A'
    puts "Excellent"
  when 'B'
    puts "Good"
  when 'C'
    puts "Fair"
  when 'D'
    puts "Poor"
  else
    puts "Fail"
  end

  # Ciclos
  i = 0
  while i < 5
    puts "While loop iteration: #{i}"
    i += 1
  end

  for j in 1..5
    puts "For loop iteration: #{j}"
  end

  3.times do |k|
    puts "Times loop iteration: #{k}"
  end

  array = [1, 2, 3, 4, 5]
  array.each do |element|
    puts "Each loop element: #{element}"
  end

  # Uso de next, break, redo
  5.times do |n|
    next if n == 2
    puts "Next skipped number 2: #{n}"
    break if n == 4
  end

  # Begin, rescue, ensure
  begin
    puts "Trying to divide by zero..."
    result = 10 / 0
  rescue ZeroDivisionError
    puts "Caught a division by zero error"
  ensure
    puts "This runs no matter what"
  end

  # Ranges
  range_inclusive = (1..10).to_a
  range_exclusive = (1...10).to_a

  puts "Inclusive range: #{range_inclusive.inspect}"
  puts "Exclusive range: #{range_exclusive.inspect}"
end

# Ejecucion principal del script
experiment_with_variables
control_structures

car = Car.new("Toyota", "Corolla", 2020, 4, 15.5)
bicycle = Bicycle.new("Giant", "Escape 3", 2021, "Hybrid", 21)
motorcycle = Motorcycle.new("Harley-Davidson", "Iron 883", 2019, 883)

puts car.info
puts "Car range with 10 liters of fuel: #{car.range(10)} km"

puts bicycle.info
bicycle.ring_bell

puts motorcycle.info

puts "Circle area with radius 5: #{MathOperations.circle_area(5)}"
puts "Circle circumference with radius 5: #{MathOperations.circle_circumference(5)}"
puts "Addition of 5 and 10: #{MathOperations.addition(5, 10)}"
puts "Subtraction of 10 from 20: #{MathOperations.subtraction(20, 10)}"
puts "Multiplication of 5 and 10: #{MathOperations.multiplication(5, 10)}"
puts "Division of 20 by 5: #{MathOperations.division(20, 5)}"