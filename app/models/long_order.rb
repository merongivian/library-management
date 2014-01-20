class LongOrder < ActiveRecord::Base
  PICK_DAYS = 6.week
  LOAN_DAYS = 14.weeks

  has_one :author, through: :book
  belongs_to :book
  belongs_to :user

  scope :by_section, -> (section) { LongOrder.joins(:book).where(books: { section: section }) }

  def pick_days
    PICK_DAYS * order_importance / 3
  end

  def loan_days
    LOAN_DAYS * order_importance / 4
  end
end
