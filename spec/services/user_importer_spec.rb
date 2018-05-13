require "rails_helper"

describe UserImporter do
  describe "#import" do
    let(:user_importer) { UserImporter.new("http://csv.com") }

    it "reads the csv from the provided url" do
      csv_reader = stub_csv_reader
      stub_csv_processor

      user_importer.import

      expect(csv_reader).to have_received(:read)
    end

    it "processes the csv_text into user_record" do
      stub_csv_reader
      processor = stub_csv_processor

      user_importer.import

      expect(processor).to have_received(:call)
    end
  end

  def stub_csv_reader
    reader = UserCSVReader.new("http://test.com/csv")
    allow(reader).to receive(:read)
    allow(UserCSVReader).to receive(:new).and_return(reader)
    reader
  end

  def stub_csv_processor
    processor = UserCSVProcessor.new("")
    allow(processor).to receive(:call)
    allow(UserCSVProcessor).to receive(:new).and_return(processor)
    processor
  end
end
