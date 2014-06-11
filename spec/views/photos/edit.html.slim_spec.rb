require 'rails_helper'

RSpec.describe "photos/edit", :type => :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :nsid => "MyString",
      :username => "MyString",
      :description => "MyText",
      :url => "MyString"
    ))
  end

  it "renders the edit photo form" do
    render

    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do

      assert_select "input#photo_nsid[name=?]", "photo[nsid]"

      assert_select "input#photo_username[name=?]", "photo[username]"

      assert_select "textarea#photo_description[name=?]", "photo[description]"

      assert_select "input#photo_url[name=?]", "photo[url]"
    end
  end
end
