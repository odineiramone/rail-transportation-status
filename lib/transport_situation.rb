require_relative 'crawlers/subway_crawler'
require_relative 'crawlers/train_crawler'

class TransportSituation
  class << self
    LINE_TITLE_REGEX = /^\w+\ \d+-/

    def check_situations
      crawler_list = [SubwayCrawler, TrainCrawler]

      crawler_list.map do |crawler|
        situations = situations(crawler)
        Situations.new(title: crawler.title, situations: situations)
      end
    end

    private

    def situations(crawler)
      crawler.crawl.map do |line, situation|
        line = line.text.sub(LINE_TITLE_REGEX, '').capitalize
        situation = situation.text.strip.capitalize

        { line: line, status: situation }
      end
    end
  end
end
