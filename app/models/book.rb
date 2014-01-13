class Book < ActiveRecord::Base
  belongs_to :author

  validates_uniqueness_of :name
  validates_presence_of :quantity
  validates_presence_of :section
end
