# frozen_string_literal: true

require_relative 'train'

tr = Train.new('11111', 'Cargo', 1)

puts tr.a1
puts tr.a2
puts tr.a3

tr.a1 = 12
tr.a1 = 45
tr.a1 = 89
tr.a2 = 44
tr.a2 = 67
tr.a3 = 34

puts tr.a1
puts tr.a2
puts tr.a3

puts tr.a1_history.to_s
puts tr.a2_history.to_s
puts tr.a3_history.to_s

puts tr.a4
tr.a4 = '87'
puts tr.a4

tr.a4 = 87
