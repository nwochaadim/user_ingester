require "csv"

class UserCSVProcessor
  def initialize(csv_text)
    @csv_text = csv_text
  end

  def call
    parsed_records = CSV.parse(csv_text, headers: true)
    parsed_records.each do |record|
      process_record(record)
    end
  end

  private

  attr_reader :csv_text

  def process_record(record)
    user = build_user_from_record(record)
    user.save!
    Rails.logger.info "Processed #{record}!"
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error(e.message)
  end

  def build_user_from_record(record)
    User.new(name: record["Name"],
             email_address: record["Email Address"],
             telephone_no: record["Telephone Number"],
             website: record["Website"])
  end
end
