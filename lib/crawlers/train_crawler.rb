require 'open-uri'
require_relative '../transport'

class TrainCrawler < Transport
  class << self
    def crawl
      url = 'http://www.cptm.sp.gov.br/Pages/Home.aspx'
      doc = Nokogiri::HTML(open(url))

      cptm_lines = doc.css('div.situacao_linhas').first.css('div span')
      cptm_lines.each_slice(2).to_a
    end
  end
end
