require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    User.destroy_all
    user = User.create!(
      email: Faker::Name.name,
      password_digest:SecureRandom.urlsafe_base64(16),
      session_token: SecureRandom.urlsafe_base64(16)
    )
    @jane = User.create!(
      email: "jane@doe.com",
      password_digest: BCrypt::Password.create("password"),
      session_token: SecureRandom.urlsafe_base64(16)
    )
  end
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6)}


  describe "::find_by_credentials" do
    it "finds users by email and password" do

      email = "jane@doe.com"
      password = "password"

      expect(User.find_by_credentials(email,password)).to eq(@jane)
    end
  end


  describe "#is_password?" do
    it "returns wether the given password is correct(true) or incorrect(false)" do
      expect(@jane.is_password?("not_my_password")).to be false
      expect(@jane.is_password?("password")).to be true
    end
  end


  describe "#reset_session_token" do
    it "resets the users session token" do
      before_reset = @jane.session_token
      @jane.reset_session_token!
      expect(@jane.session_token).not_to eq(before_reset)
    end
  end

end
