require 'spec_helper'

describe Author do
  describe "validations" do
    it { should validate_uniqueness_of :name }
  end

  describe "associations" do
  	it { should have_many :books }
  end
end
