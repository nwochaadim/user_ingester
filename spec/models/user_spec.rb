require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email_address) }

  it { is_expected.to validate_uniqueness_of(:email_address) }
end
