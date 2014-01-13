require 'spec_helper'

describe Order do
  describe "associations" do
  	it { should belong_to :book }
  	it { should belong_to :user }
  	it { should have_one(:author).through :book }
  end
end
