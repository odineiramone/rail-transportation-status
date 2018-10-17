require 'open-uri'

class Train
  def self.status
    url = 'http://www.cptm.sp.gov.br/Pages/Home.aspx'
    doc = Nokogiri::HTML(open(url))

    situations = doc.css('div.situacao_linhas').first.css('div span')
    situations = situations.each_slice(2).to_a

    situations.map { |line| "linha: #{line[0].children.first.text.capitalize} - status: #{line[1].children.first.text.capitalize}" }
  end
end
