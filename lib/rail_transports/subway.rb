require 'open-uri'

class Subway
  def self.status
    url = 'http://www.metro.sp.gov.br/Sistemas/direto-do-metro-via4/diretodoMetroHome.aspx'
    doc = Nokogiri::HTML(open(url))

    situations = doc.css('#statusLinhaMetro')[1].css('div span') + doc.css('#statusLinhaMetro')[0].css('div span')
    situations = situations.each_slice(2).to_a
    situations.map { |line| "linha: #{line[0].text.capitalize} - status: #{line[1].text.strip.capitalize}" }
  end
end
