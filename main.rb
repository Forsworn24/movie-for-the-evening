require_relative 'lib/film'
require_relative 'lib/film_parser'
require 'nokogiri'
require 'open-uri'
require 'addressable/uri'

collection = FilmParser.from_wiki_imdb250

# Создаем массив со всеми режиссёрами
directors = collection.map { |film| film.director }

# Убираем повторы из режиссёров
uniq_directors = directors.uniq

puts "Программа «Фильм на вечер»"
puts

uniq_directors.map.with_index { |director, index| puts "#{index + 1}: #{director}" }

puts "Фильм какого режиссёра вы хотите посмотреть?"
user_input = STDIN.gets.to_i
puts

input_director = uniq_directors[user_input - 1]

films = collection.select { |film| film.director == input_director }

recommended_movie = films.sample

puts "И сегодня вечером рекомендую посмотреть:"

puts "#{input_director} - #{recommended_movie}"
