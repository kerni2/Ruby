# создаем пустой хэш
letters = {}

# создаем строку из букв
alphabet = ("a".."z")
# задаем первое значение, которое будем передавать в хэш
letter_index = 1

# перебираем буквы в строке и при совпадении с гласными буквами 
# записываем их в хэш, используя метод start_with?
for value in alphabet
  if value.start_with?("a","e","i","o","u","y")
    letters[value] = letter_index
  end
  letter_index += 1
end

# выводим для проверки результата
puts letters


