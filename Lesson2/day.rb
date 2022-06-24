# присваеваем переменной массив с количеством дней по месяцам
array = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

# поочередно выводим приглашение ввести число, месяц, год
# и записываем полученные данные в соответствующие переменные
puts "Введите число"
day = gets.chomp.to_i 
puts "Введите цифрами месяц"
month = gets.chomp.to_i
puts "Введите полностью год"
year = gets.chomp.to_i

# проверяем ошибки ввода, високосный ли год, затем вычисляем количество дней
if day > 31 || day <= 0
  puts "Число должно быть от 1 до 31"
elsif month > 12 || month <= 0
  puts "Месяц должен быть от 1 до 12"
elsif year <= 0
  puts "Год не указан"
elsif month == 1
  puts "Количество дней: #{day}"
elsif ( year % 4 == 0 ) || ( year % 100 == 0 && year % 400 == 0 )
#  puts "Год високосный"
  for value in (0..month-2)
    day = day + array[value]
  end  
  puts "Количество дней: #{day += 1}"
else
#  puts "Год не високосный"
  for value in (0..month-2)
    day = day + array[value]
  end
  puts "Количество дней: #{day}"
end