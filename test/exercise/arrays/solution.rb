module Exercise
  module Arrays
    class << self
      def replace(array)
        max_el = array[0]
        array.each { |el| max_el = el if max_el < el }
        array.map { |el| el.positive? ? max_el : el }
      end

      def search(array, query, low = 0, high = array.size - 1)
        return -1 if (low > high) || array.empty?

        mid = (low + high) / 2
        return mid if query == array[mid]

        query < array[mid] ? search(array, query, low, mid - 1) : search(array, query, mid + 1, high)
      end
    end
  end
end
