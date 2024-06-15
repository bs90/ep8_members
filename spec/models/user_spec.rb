# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    let(:user) {build(:user)}

    it {is_expected.to validate_length_of(:name_roma).is_at_most(Settings.user.max_length.name_roma)}
    it {is_expected.to validate_length_of(:name_kata).is_at_most(Settings.user.max_length.name_kata)}
    it {is_expected.to validate_length_of(:email).is_at_most(Settings.user.max_length.email)}
    it {is_expected.to validate_presence_of(:email)}
    # it {is_expected.to validate_uniqueness_of(:email)}
    it {is_expected.to allow_value("example@sun-asterisk.com").for(:email)}
    it {is_expected.not_to allow_value("invalid_email").for(:email)}
    it {is_expected.to validate_length_of(:address).is_at_most(Settings.user.max_length.address)}
  end

  describe "associations" do
    it {is_expected.to have_one_attached(:avatar)}
    it {is_expected.to have_many(:progoses).dependent(:destroy)}
    it {is_expected.to have_many(:tokens).dependent(:destroy)}
  end

  describe "enums" do
    it {is_expected.to define_enum_for(:original_role).with_values(engineer: 0, brse: 1)}
    it {is_expected.to define_enum_for(:training_role).with_values(be: 0, fe: 1, mobile: 2)}
    it {is_expected.to define_enum_for(:role).with_values(admin: 0, user: 1)}
  end
end
