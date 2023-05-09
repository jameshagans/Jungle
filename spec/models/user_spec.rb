require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user = User.new(email: "test@test.com", first_name: "Jazzy", last_name: "Jay", password: "password", password_confirmation: "password")
      @user.save
    end

    context 'given email, password, password confirmation, first name, and last name' do
      it 'validates that user is created when all three fields are filled' do
        expect(@user).to be_valid
      end
    end
      it 'validates that password and password confirmation do not match' do
        @user.password_confirmation = "pass"
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'validates that password is not valid when it is not present' do
        @user.password = nil
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'validates that emails are not case sensitive' do
        @user1 = User.new(email: "EXAMPLE@EXAMPLE.COM", first_name: "Rosanna", last_name: "Zhang", password: "password", password_confirmation: "password")
        expect(@user1).to_not be_valid
        expect(@user1.errors.full_messages).to include("Email has already been taken")
      end
      it 'validates that user is not valid when email is blank' do
        @user.email = nil
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'validates that user is not valid when first name is blank' do
        @user.first_name = nil
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'validates that user is not valid when last name is blank' do
        @user.last_name = nil
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'validates that password must be longer than six characters' do
        @user.password = "pass"
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end
