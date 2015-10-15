class BidValidator < ActiveModel::Validator
  def validate(record)
    unless Bid.where(user: record.user, auction: record.auction).empty?
      record.errors[:base] << "You have already bid on this item"
    end
  end
end


class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction
  validates_with BidValidator
  validates :user, :auction, :price, presence: true
end
