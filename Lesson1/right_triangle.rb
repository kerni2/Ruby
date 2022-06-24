# приглашаем пользователя ввести 1 сторону
puts "Введите 1 сторону треугольника"
# сохраняем значение в переменную first
first = gets.chomp.to_i

# приглашаем пользователя ввести 2 сторону
puts "Введите 2 сторону треугольника"
# сохраняем значение в переменную second
second = gets.chomp.to_i

# приглашаем пользователя ввести 3 сторону
puts "Введите 3 сторону треугольника"
# сохраняем значение в переменную third
third = gets.chomp.to_i

# находим самую длинную сторону
if first < second && second < third
# самая длинная сторона third, проверяем на прямой угол и равные стороны
	if third**2 == first**2 + second**2
		puts "Треугольник прямоугольный"
	elsif first == second || second == third
		puts "Треугольник равнобедренный"
		if first == third
			puts "Треугольник равносторонний"
		end
	else
		puts "Треугольник обычный"
	end
elsif first > second && second > third
# самая длинная сторона first, проверяем на прямой угол и равные стороны	
	if first**2 == third**2 + second**2
		puts "Треугольник прямоугольный"	
	elsif first == second || second == third
		puts "Треугольник равнобедренный"
		if first == third
			puts "Треугольник равносторонний"
		end
	else
		puts "Треугольник обычный"
	end	
else 
# самая длинная сторона second, проверяем на прямой угол и равные стороны
	if second**2 == first**2 + third**2
		puts "Треугольник прямоугольный"
	elsif first == second || second == third
		puts "Треугольник равнобедренный"
		if first == third
			puts "Треугольник равносторонний"
		end
	else
		puts "Треугольник обычный"
	end
end




