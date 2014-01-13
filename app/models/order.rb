class Order < ActiveRecord::Base
  has_one :author, through: :book
  belongs_to :book
  belongs_to :user

  scope :by_section, -> (section) { Order.joins(:book).where(books: { section: section }) }
end
