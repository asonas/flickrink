require 'rails_helper'

RSpec.describe "photos/index", :type => :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :nsid => "Nsid",
        :username => "Username",
        :description => "MyText",
        :url => "Url"
      ),
      Photo.create!(
        :nsid => "Nsid",
        :username => "Username",
        :description => "MyText",
        :url => "Url"
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => "Nsid".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
