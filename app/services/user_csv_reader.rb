require "open-uri"

class UserCSVReader
  def initialize(url)
    @url = url
  end

  def read
    open(url)
  rescue SocketError => e
    Rails.logger.error(e.message)
    nil
  end

  private

  attr_reader :url
end
