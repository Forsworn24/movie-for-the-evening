# Парсер для фильмов
module FilmParser
  extend self

  WIKI_IMDB_250_URL = 'https://ru.wikipedia.org/wiki/250_лучших_фильмов_по_версии_IMDb'

  def from_wiki_imdb250
    url = URI.open(Addressable::URI.parse(WIKI_IMDB_250_URL).normalize)
    doc = Nokogiri::HTML(url)
    url.close

    doc.css('tr > td[2], td[3], td[4]').each_slice(3).map do |params|
      Film.new(params[0].text.strip, params[1].text.to_i, params[2].text.strip)
    end
  end
end
