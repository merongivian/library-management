require 'spec_helper'

describe Book do
  describe "validations" do
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :section }
  end

  describe "associations" do
  	it { should belong_to :author }
  end
end
