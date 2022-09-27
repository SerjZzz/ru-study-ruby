module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filter_films = array.map do |film|
          film['rating_kinopoisk'].to_f if !film['country'].nil? && film['country'].rstrip.split(',').size > 1 && film['rating_kinopoisk'].to_f.positive?
        end.compact

        filter_films.reduce(0) { |sum, value| sum + value } / filter_films.size
      end

      def chars_count(films, threshold)
        films.map { |film| film['name'] if film['rating_kinopoisk'].to_f >= threshold }.compact.reduce(0) { |sum, name| sum + name.count('и') }
      end
    end
  end
end
