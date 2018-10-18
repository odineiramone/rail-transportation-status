require 'open-uri'
require_relative '../transport'

class SubwayCrawler < Transport
  class << self
    YELLOW_LINE = 1
    OTHER_LINES = 0

    def crawl
      url = 'http://www.metro.sp.gov.br/Sistemas/direto-do-metro-via4/diretodoMetroHome.aspx'
      doc = Nokogiri::HTML(open(url))

      yellow_line = doc.css('#statusLinhaMetro')[YELLOW_LINE].css('div span')
      other_lines = doc.css('#statusLinhaMetro')[OTHER_LINES].css('div span')

      (yellow_line + other_lines)
        .yield_self { |situations| situations.each_slice(2) }
        .yield_self(&:to_a)
    end
  end
end
