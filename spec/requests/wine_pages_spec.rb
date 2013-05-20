require 'spec_helper'

describe "Wine pages" do

	subject { page }

	describe "new wine page" do
    before { visit new_wine_path }

    it { should have_selector('h1',    text: 'Add a new wine') }
    it { should have_selector('title', text: full_title('Add a new wine')) }
  end

	describe "adding a wine" do

    before { visit new_wine_path }

    let(:submit) { "Add wine" }

    describe "with invalid information" do
      it "should not create a wine" do
        expect { click_button submit }.not_to change(Wine, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Winery",     with: "Sample Winery"
        fill_in "Varietal",   with: "Sample Varietal"
        select  "2011",		    from: "Vintage"
        fill_in "Region", 		with: "Sample Region"
      end

	    describe "without wine name" do
      	it "should create a wine" do
	        expect { click_button submit }.to change(Wine, :count).by(1)
	      end
	    end

      describe "with wine name" do
      	before { fill_in "Wine name (optional)", with: "Random Name" }
      	it "should create a wine" do
	        expect { click_button submit }.to change(Wine, :count).by(1)
	      end
	    end
    end
  end

  describe "wine profile page" do
    let(:wine) { FactoryGirl.create(:wine) }

    before { visit wine_path(wine) }

    it { should have_selector('title', text: wine.winery) }
    it { should have_selector('title', text: wine.region) }
    it { should have_selector('title', text: wine.vintage) }

    # should also show stats and links to ratings
    # also show users who have tried it
  end

  describe "edit" do
    let(:wine) { FactoryGirl.create(:wine) }
    before { visit edit_wine_path(wine) }

    describe "page" do
	    it { should have_selector('title', text: "Edit wine profile") }
	    it { should have_selector('h1', text: "Edit wine profile") }
    end

    describe "with valid information" do
    	let(:new_winery)				{ "New Winery" }
    	let(:new_varietal)			{ "New Varietal" }
    	let(:new_vintage)				{ "2010" }
    	let(:new_region)				{ "New Region" }
    	let(:new_name)					{ "New Name" }

      before do
        fill_in "Winery",     with: new_winery
        fill_in "Varietal",   with: new_varietal
        select  new_vintage,	from: "Vintage"
        fill_in "Region", 		with: new_region
        fill_in "Wine name (optional)", 			
        											with: new_name
        click_button "Save changes"
      end

	    it { should have_selector('title', text: new_winery) }
	    it { should have_selector('title', text: new_vintage) }
	    it { should have_selector('title', text: new_region) }
      it { should have_selector('div.alert.alert-success') }
      specify { wine.reload.winery.should  == new_winery }
      specify { wine.reload.vintage.should == new_vintage }
      specify { wine.reload.region.should == new_region }
    end
  end


end
