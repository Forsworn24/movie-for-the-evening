# Класс Фильм
class Film
  attr_reader :title, :year, :director

  def initialize(title, year, director)
    @title = title.to_s
    @year = year.to_i
    @director = director.to_s
  end
  
  def to_s
    "#{@title} (#{@year})"
  end
end
