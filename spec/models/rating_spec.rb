require 'spec_helper'

describe Rating do

  let(:wine) { FactoryGirl.create(:wine) }
  let(:user) { FactoryGirl.create(:user) }

  before do
  	# This code is wrong!
    @rating = user.ratings.build(
    						wine_id: 90,
					      #user_id: user.id,
					      overall_rating: 5,
					      smell1: "smell1",
					      smell2: "smell2",
					      smell3: "smell3",
					      taste1: "taste1",
					      taste2: "taste2",
					      taste3: "taste3") 
  end

  subject { @rating }

  it { should respond_to(:wine_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:overall_rating) }
  it { should respond_to(:smell1) }
  it { should respond_to(:smell2) }
  it { should respond_to(:smell3) }
  it { should respond_to(:taste1) }
  it { should respond_to(:taste2) }
  it { should respond_to(:taste3) }

  it { should respond_to(:user) }
	its(:user) { should == user }
	it { should respond_to(:wine) }
#	its(:wine) { should == wine }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @rating.user_id = nil }
    it { should_not be_valid }
  end

  describe "when wine_id is not present" do
    before { @rating.wine_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Rating.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

#    it "should not allow access to wine_id" do
#      expect do
#        Rating.new(wine_id: wine.id)
#      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
#    end
  end
end
