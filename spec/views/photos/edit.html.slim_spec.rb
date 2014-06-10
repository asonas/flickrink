require 'spec_helper'

describe "photos/edit" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :nsid => "MyString",
      :username => "MyString",
      :description => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do
      assert_select "input#photo_nsid[name=?]", "photo[nsid]"
      assert_select "input#photo_username[name=?]", "photo[username]"
      assert_select "input#photo_description[name=?]", "photo[description]"
      assert_select "input#photo_url[name=?]", "photo[url]"
    end
  end
end
