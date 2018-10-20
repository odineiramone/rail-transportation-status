require_relative 'crawlers/subway_crawler'
require_relative 'crawlers/train_crawler'

class TransportSituation
  class << self
    LINE_TITLE_REGEX = /^\w+\ \d+-/

    def check_situations
      crawler_list = [SubwayCrawler, TrainCrawler]

      crawler_list.map do |crawler|
        status = status(crawler)
        Situations.new(title: crawler.title, status: status)
      end
    end

    private

    def status(crawler)
      crawler.crawl.map do |line, description|
        line = line.text.sub(LINE_TITLE_REGEX, '').capitalize
        description = description.text.strip.capitalize

        { line: line, description: description }
      end
    end
  end
end
