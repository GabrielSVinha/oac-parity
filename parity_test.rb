#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
gem 'faker', '~> 1.6', '>= 1.6.3'
require 'minitest/autorun'
require 'faker'
require_relative './parity'

module OAC
  class ParityTest < Minitest::Test
    def test_wrong_even_parity
      # Gera numero de 7 bits aleatorio
      number = '%07b' % Faker::Number.number(2)

      # Adiciona o bit de paridade errado
      if generate_parity(number) == "par"
        number = "1" + number
      else
        number = "0" + number
      end

      assert Parity.error?(number, 'par')
    end


    def test_wrong_odd_parity
      # Gera numero de 7 bits aleatorio
      number = '%07b' % Faker::Number.number(2)

      # Adiciona o bit de paridade errado
      if generate_parity(number) == "impar"
        number = "1" + number
      else
        number = "0" + number
      end

      assert Parity.error?(number, 'impar')
    end

    def test_right_even_parity
      # Gera numero de 7 bits aleatorio
      number = '%07b' % Faker::Number.number(2)

      # Adiciona o bit de paridade certo
      if generate_parity(number) == "par"
        number = "0" + number
      else
        number = "1" + number
      end

      assert !Parity.error?(number, 'par')
    end
    def test_right_odd_parity
      # Gera numero de 7 bits aleatorio
      number = '%07b' % Faker::Number.number(2)

      # Adiciona o bit de paridade certo
      if generate_parity(number) == "impar"
        number = "1" + number
      else
        number = "0" + number
      end

      assert !Parity.error?(number, 'par')
    end
 
    private
    def generate_parity(number)
      uppers = 0
      parity = ""
      number.each_char do |bit|
        if bit == '1'
          uppers += 1
        end
      end
      if uppers % 2 == 0
        parity = "par"
      else
        parity = "impar"
      end
      parity
    end
  end
end
