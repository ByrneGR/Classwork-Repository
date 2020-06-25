require 'rails_helper'

RSpec.describe User do
  subject(:user) do
    # FactoryBot.build(:user,
    #   email: "jonathan@fakesite.com",
    #   password: "good_password")
      User.create(email: "jonathan@fakesite.com",
      password: "good_password")
#   end
  end
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals).class_name(:Goal) }
  
  describe ".find_by_credentials" do #put the method in the describe
    before { user.save! } #save the user to database in development
    
    it "returns user given good credentials" do
        expect(User.find_by_credentials("jonathan@fakesite.com", "good_password")).to eq(user)
    end
    
    it "returns nil given bad credentials" do
        expect(User.find_by_credentials("jonathan@fakesite.com", "bad_password")).to eq(nil)
    end
  end  
    
end  



# RSpec.describe User, type: :model do #overarching User class spec

#   it { should validate_presence_of(:email) }
#   it { should validate_presence_of(:password_digest)}
# #   it { should validate_length_of(:password).is_at_least(4)}
# end  

# RSpec.describe User, type: :model do
#   subject{ User.create(email: "bloggerboi@fakeblog.com") }
#   it { should validate_presence_of(:email) }
#   it { should validate_uniqueness_of(:email) }
#   it { should have_many(:blogs).class_name(:Blog)}
#   it { should have_many(:comments).class_name(:Comment)}
#   it { should have_many(:comments_on_blogs).through(:blogs).source(:comments) }
#   it { should have_many(:blogs_commented_on).through(:comments).source(:blog) }
#    it { should belong_to(:author).class_name(:User) }
# end
