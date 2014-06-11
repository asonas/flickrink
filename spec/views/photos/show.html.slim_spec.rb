require 'rails_helper'

RSpec.describe "photos/show", :type => :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :nsid => "Nsid",
      :username => "Username",
      :description => "MyText",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nsid/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Url/)
  end
end
