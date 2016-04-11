require 'support/model_helper'

describe User, type: :model do
  
  ## Attributes
  it_behaves_like "it has attributes", User,
  {
    :id=>:integer,
    :username=>:string,
    :email=>:string,
    :encrypted_password=>:string,
    :reset_password_token=>:string,
    :reset_password_sent_at=>:datetime,
    :remember_created_at=>:datetime,
    :sign_in_count=>:integer,
    :current_sign_in_at=>:datetime,
    :last_sign_in_at=>:datetime,
    :current_sign_in_ip=>:string,
    :last_sign_in_ip=>:string,
    :confirmation_token=>:string,
    :confirmed_at=>:datetime,
    :confirmation_sent_at=>:datetime,
    :unconfirmed_email=>:string,
    :created_at=>:datetime,
    :updated_at=>:datetime,
    :last_name=>:string,
    :first_name=>:string
  } {}

  ## Validations

  ## Class Methods

  ## Instance Methods
  describe "Instance Methods" do
    before do
      @user = create(:user)
    end

    describe "#full_name"do
      it "returns users's full name" do
        expect( @user.full_name ).to eq( "#{@user.first_name} #{@user.last_name}" )
      end
    end
  end
end
