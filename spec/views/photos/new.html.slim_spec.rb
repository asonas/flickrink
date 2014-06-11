require 'rails_helper'

RSpec.describe "photos/new", :type => :view do
  before(:each) do
    assign(:photo, Photo.new(
      :nsid => "MyString",
      :username => "MyString",
      :description => "MyText",
      :url => "MyString"
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input#photo_nsid[name=?]", "photo[nsid]"

      assert_select "input#photo_username[name=?]", "photo[username]"

      assert_select "textarea#photo_description[name=?]", "photo[description]"

      assert_select "input#photo_url[name=?]", "photo[url]"
    end
  end
end
