# приглашаем пользователя ввести имя
puts "Введите ваше имя"
# сохраняем имя в переменную user_name
user_name = gets.chomp
# запрашиваем у пользователя рост
puts "Укажите свой рост"
# сохраняем рост в переменную growth
growth = gets.chomp
# проверяем отрицательный ли идеальный вес
if ( growth.to_i - 110 ) * 1.15 < 0
	puts "Ваш вес уже оптимальный"
# если нет, выводим идеальный вес
else
	puts "#{user_name}, Ваш идеальный вес: #{(( growth.to_i - 110 ) * 1.15).to_i}"
end