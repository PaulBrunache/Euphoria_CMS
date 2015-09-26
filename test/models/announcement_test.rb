require "test_helper"

describe Announcement do
  let(:announcement) { Announcement.new }

  it "must be valid" do
    value(announcement).must_be :valid?
  end
end
