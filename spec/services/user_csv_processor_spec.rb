require "rails_helper"

describe UserCSVProcessor do
  let(:processor) { UserCSVProcessor.new(csv_text) }

  describe "#call" do
    let(:csv_text) { build_csv_text }

    it "parses the csv_text into records" do
      allow(CSV).to receive(:parse).and_return([])

      processor.call

      expect(CSV).to have_received(:parse).with(csv_text, headers: true)
    end

    context "when successful" do
      it "creates users" do
        expect { processor.call }.to change { User.count }.by(1)
      end

      it "logs the record" do
        allow(Rails.logger).to receive(:info)
        processor.call

        expect(Rails.logger).to have_received(:info)
      end
    end

    context "when the name field is blank" do
      let(:csv_text) { build_csv_text(name: nil) }

      it "does not save the record" do
        expect { processor.call }.to_not change { User.count }
      end

      it "logs the error" do
        allow(Rails.logger).to receive(:error)
        processor.call

        expect(Rails.logger).to have_received(:error)
      end
    end

    context "when the email_address is blank" do
      let(:csv_text) { build_csv_text(email: nil) }

      it "does not save the record" do
        expect { processor.call }.to_not change { User.count }
      end

      it "logs the error" do
        allow(Rails.logger).to receive(:error)
        processor.call

        expect(Rails.logger).to have_received(:error)
      end
    end

    context "when the email_address already exists" do
      before { create(:user, email_address: "charles@charles.com") }

      let(:csv_text) { build_csv_text(email: "charles@charles.com") }

      it "does not save the record" do
        expect { processor.call }.to_not change { User.count }
      end

      it "logs the error" do
        allow(Rails.logger).to receive(:error)
        processor.call

        expect(Rails.logger).to have_received(:error)
      end
    end

    context "when the csv_text is nil" do
      let(:csv_text) { nil }

      it "does not parse the text" do
        allow(CSV).to receive(:parse)

        processor.call

        expect(CSV).to_not have_received(:parse)
      end
    end
  end
end
