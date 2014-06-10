require 'spec_helper'

describe "photos/new" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :nsid => "MyString",
      :username => "MyString",
      :description => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photos_path, "post" do
      assert_select "input#photo_nsid[name=?]", "photo[nsid]"
      assert_select "input#photo_username[name=?]", "photo[username]"
      assert_select "input#photo_description[name=?]", "photo[description]"
      assert_select "input#photo_url[name=?]", "photo[url]"
    end
  end
end
