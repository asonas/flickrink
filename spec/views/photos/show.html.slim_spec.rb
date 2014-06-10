require 'spec_helper'

describe "photos/show" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :nsid => "Nsid",
      :username => "Username",
      :description => "Description",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nsid/)
    rendered.should match(/Username/)
    rendered.should match(/Description/)
    rendered.should match(/Url/)
  end
end
