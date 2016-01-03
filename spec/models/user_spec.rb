require 'spec_helper'

describe User do
	let(:valid_attributes) {
		{
			first_name: "Brandon",
			last_name: "Burton",
			email: "brandon@gmail.com",
      password: "treehouse1234",
      password_confirmation: "treehouse1234"
		}
	}

  context "relationships" do
    it { should have_many(:todo_lists) }
  end
  
  context "validations" do
  	let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

  	it "requires an email" do
  		expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do 
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requies a unique email (case insensitive)" do 
      user.email = "BURTON@GMAIL.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires the email address to look like an email" do
      user.email = "jason"
      expect(user).to_not be_valid
    end
    
  end


  context "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "BURTON@GMAIL.COM"))
      expect { user.downcase_email }.to change { user.email }.
      from("BURTON@GMAIL.COM").
      to("burton@gmail.com")
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "BRANDON@GMAIL.COM"
      expect(user.save).to be_true
      expect(user.email).to eq("brandon@gmail.com")
    end
  end
end
