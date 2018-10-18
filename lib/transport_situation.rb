require_relative 'crawlers/subway_crawler'
require_relative 'crawlers/train_crawler'

class TransportSituation
  class << self
    def status
      crawler_list = [SubwayCrawler, TrainCrawler]

      crawler_list.map do |crawler|
        { title: crawler.title, situations: situations(crawler) }
      end
    end

    private

    def situations(crawler)
      crawler.crawl.map do |line, situation|
        line = line.text.capitalize
        situation = situation.text.strip.capitalize

        { line: line, status: situation }
      end
    end
  end
end
