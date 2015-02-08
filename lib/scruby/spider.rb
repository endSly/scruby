require 'open-uri'

module Scruby
  class Spider
    attr_accessor :start_url

    def run
      parse_url(start_url)
    end

    def parse(element)
      raise NotImplementedError
    end

  protected
    def emit(spider_class, element_or_url, *attrs)
      if element_or_url.is_a?(Nokogiri::XML::Node)
        spider = spider_class.new(*attrs)
        spider.parse(element_or_url)

      elsif element_or_url.is_a?(Nokogiri::XML::NodeSet)
        element_or_url.map do |element|
          spider = spider_class.new(*attrs)
          spider.parse(element)
        end

      else
        spider = spider_class.new(*attrs)
        spider.start_url = element_or_url
        spider.run
      end

    end

    def next(url)
      parse_url(url)
    end

  private
    def parse_url(url)
      document = Nokogiri::HTML(open(url))
      parse(document)
    end
  end
end
