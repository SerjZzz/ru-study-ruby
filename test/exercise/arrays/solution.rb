module Exercise
  module Arrays
    class << self
      def replace(array)
        max_el = array[0]
        array.each { |el| max_el = el if max_el < el }
        array.map { |el| el.positive? ? max_el : el }
      end

      def search(_array, _query)
        return -1 if _array.empty?
        return 0 if _array.first == _query

        recursive_search(_array, _query, 0, _array.size - 1)
      end

      private

      def recursive_search(arr, target, low, high)
        return -1 if low > high

        mid = (low + high) / 2
        return mid if target == arr[mid]

        target < arr[mid] ? recursive_search(arr, target, low, mid - 1) : recursive_search(arr, target, mid + 1, high)
      end
    end
  end
end
