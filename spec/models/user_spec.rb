require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { build(:user) }

  it "has a valid factory" do
    user.should be_valid
  end

  it "has a present name" do
    build(:user, user_name: "   ", first_name: "    ", last_name: "").should_not be_valid
  end

  it "has a present user name" do
    build(:user, user_name: "   ").should_not be_valid
  end

  it "has a present first name" do
    build(:user, first_name: "  ").should_not be_valid
  end

  it "has a present last name" do
    build(:user, last_name: "    ").should_not be_valid
  end

  it "user name has most 50 characters" do
    long_name = "a" * 51
    build(:user, user_name: long_name).should_not be_valid
    shorter_name = "a" * 50
    build(:user, user_name: shorter_name).should be_valid
  end

  it "first name has most 50 characters" do
    long_name = "a" * 51
    build(:user, first_name: long_name).should_not be_valid
    shorter_name = "a" * 50
    build(:user, first_name: shorter_name).should be_valid
  end

  it "last name has most 50 characters" do
    long_name = "a" * 51
    build(:user, last_name: long_name).should_not be_valid
    shorter_name = "a" * 50
    build(:user, last_name: shorter_name).should be_valid
  end

  it "email has most 255 characters" do    longer_mail = "m" * 252 + "@a.c"
    build(:user, email: longer_mail).should_not be_valid
    shorter_mail = "m" * 251 + "@a.c"
    build(:user, email: shorter_mail).should be_valid
  end

  it "email format is correct" do
    build(:user, email: "fe.ffwe@e").should_not be_valid
    build(:user, email: "@greger.com").should_not be_valid
    build(:user, email: "a@c.q").should be_valid
    build(:user, email: "   ").should_not be_valid
    build(:user, email: "gerge").should_not be_valid
  end

  it "email is unique" do
    user_dup = user.dup
    user_dup.email = user.email.upcase
    user.save
    user_dup.should_not be_valid
  end

  it "email presents" do
    build(:user, email: "    ").should_not be_valid
  end

  it "password should be present " do
    build(:user, password: "b" * 6, password_confirmation: "b" * 6).should be_valid
  end

  it "password and confirmation password should be the same" do
    build(:user, password: "b" * 6, password_confirmation: "b" * 7).should_not be_valid
    build(:user, password: "b" * 6, password_confirmation: "a" * 6).should_not be_valid
  end

  it "password should has minimum length" do
    build(:user, password: "a", password_confirmation: "a").should_not be_valid
    build(:user, password: "b" * 5, password_confirmation: "b" * 5).should_not be_valid
  end


  it { should have_many(:projects).through(:user_projects) }
end
