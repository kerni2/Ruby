# создаем пустые массивы и переменные
input1 = []
input2 = []
input3 = []
sum = []
arr_buy = []
user_input1 = nil
user_input2 = nil
user_input3 = nil
total = 0

# приглашаем к вводу
puts "Вводите название товара, цену за единицу и количество купленного товара"
puts "Для прекращения ввода напишите stop"

# запускаем бесконечный цикл с выходом по stop
while true do
  user_input1 = gets.encode("UTF-8").chomp
    if user_input1 == "stop"
      break
    else 
      input1 << user_input1
      user_input2 = gets.chomp.to_f
        if user_input2 <= 0 || nil
          puts "Введено не правильное число"
          break
        else
          input2 << user_input2
          user_input3 = gets.chomp.to_f
            if user_input3 <= 0 || nil
              puts "Введено не правильное число"
              break
            else
              input3 << user_input3 
              sum << ( user_input2 * user_input3 )
              arr_buy << Hash[[[user_input2],[user_input3]].transpose]
            end
        end
    end
end

# выводим результаты
buys = Hash[[input1,arr_buy].transpose]
puts "Ваши покупки: #{buys}"
puts "Сумма каждой покупки: #{sum}"
sum.each { |x| total += x }
puts "Всего покупок на сумму: #{total}"