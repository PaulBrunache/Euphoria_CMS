require "test_helper"

describe Page do
  let(:page) { Page.new }

  it "must be valid" do
    value(page).must_be :valid?
  end
end
