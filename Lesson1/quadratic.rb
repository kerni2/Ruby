puts "Квадратное уравнение имеет вид ах^2 + bx + c = 0"
# приглашаем пользователя ввести 1 коэффициент
puts "Введите коэффициент a"
# сохраняем значение в переменную a
a = gets.chomp.to_i

# приглашаем пользователя ввести 2 коэффициент
puts "Введите коэффициент b"
# сохраняем значение в переменную b
b = gets.chomp.to_i

# приглашаем пользователя ввести 3 коэффициент
puts "Введите коэффициент c"
# сохраняем значение в переменную c
c = gets.chomp.to_i

#вычисляем дискриминант квадратного уравнения
d = ( (b**2) - (4 * a * b) )

#проверяем дискриминант квадратного уравнения
if d < 0
	puts "Дискриминант равен: #{d}. Корней нет"
elsif d == 0
	puts "Дискриминант равен: #{d}. Корень равен: #{ - b / (2.0 * a) }"
else
	puts "Дискриминант равен: #{d}. Корни равны: #{ (- b + Math.sqrt(d) ) / (2.0 * a) } и #{ (- b - Math.sqrt(d) ) / (2.0 * a) }"
end	




