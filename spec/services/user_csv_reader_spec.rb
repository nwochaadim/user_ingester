require "rails_helper"

describe UserCSVReader do

  describe "#read" do
    let(:csv_reader) { UserCSVReader.new("http://cahootify.com/csv") }

    it "opens the provided url" do
      allow(OpenURI).to receive(:open_uri)

      csv_reader.read

      expect(OpenURI).to have_received(:open_uri)
    end

    context "when an error is encountered while reading from the url" do
      before { allow(OpenURI).to receive(:open_uri).and_raise(SocketError) }

      it "returns nil" do
        result = csv_reader.read

        expect(result).to be_nil
      end

      it "logs the error" do
        allow(Rails.logger).to receive(:error)
        result = csv_reader.read

        expect(Rails.logger).to have_received(:error)
      end
    end
  end

end
