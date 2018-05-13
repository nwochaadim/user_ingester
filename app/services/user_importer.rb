class UserImporter
  def initialize(import_url)
    @import_url = import_url
  end

  def import
    reader = UserCSVReader.new(import_url)
    csv_text = reader.read
    UserCSVProcessor.new(csv_text).call
  end

  private

  attr_reader :import_url
end
