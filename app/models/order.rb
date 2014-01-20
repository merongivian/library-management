class Order < ActiveRecord::Base
  PICK_DAYS = 1.week
  LOAN_DAYS = 4.weeks

  has_one :author, through: :book
  belongs_to :book
  belongs_to :user

  scope :by_section, -> (section) { Order.joins(:book).where(books: { section: section }) }

  def pick_days
    PICK_DAYS * order_importance
  end

  def loan_days
    LOAN_DAYS * order_importance
  end
end
