require 'spec_helper'

describe User do
  describe "associations" do
  	it { should have_many :orders }
  	it { should have_many(:books).through :orders }
  end
end
