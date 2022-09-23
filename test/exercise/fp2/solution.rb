module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        first, *other = self
        block.call(first)
        other.size.zero? ? [first] : [first, *MyArray.new(other).my_each(&block)]
      end

      # Написать свою функцию my_map
      def my_map(&block)
        MyArray.new(my_reduce([]) { |acc, el| acc << block.call(el) })
      end

      # Написать свою функцию my_compact
      def my_compact
        MyArray.new(my_reduce([]) { |accumulator, element| element.nil? ? accumulator : accumulator << element })
      end

      # Написать свою функцию my_reduce
      def my_reduce(accumulator = nil, &block)
        return accumulator if size.zero?

        accumulator = accumulator.nil? ? first : block.call(accumulator, first)
        MyArray.new(self[1..size]).my_reduce(accumulator, &block)
      end
    end
  end
end
