class Auction < ActiveRecord::Base
  validates :name, :description, :start_time, :end_time, presence: true
  belongs_to :user
  has_many :bids, dependent: :destroy

  def self.active
    Auction.all.select{|auction| auction.active? }
  end

  def self.complete
    Auction.all.select{|auction| auction.complete? }
  end

  def self.pending
    Auction.all.select{|auction| auction.pending? }
  end

  def active?
    if self.start_time < Time.now && self.end_time > Time.now
      return true 
    else
      return false
    end
  end

  def complete?
    if self.start_time < Time.now && self.end_time < Time.now
      return true 
    else
      return false
    end
  end

  def pending?
    if self.start_time > Time.now && self.end_time > Time.now
      return true 
    else
      return false
    end
  end

  def sold?
    if self.bids.empty? == false && self.active? == false
      return true 
    else
      return false
    end
  end

  def highest_bid
    bid = Bid.where(auction: self).order("price DESC").first
    if bid
      return bid.price
    else
      return 0.00
    end
  end

  def bid_count
    self.bids.count
  end

  def status
    if self.active?
      return "Active"
    elsif self.pending?
      return "Pending"
    elsif self.complete?
      if self.sold?
        return "Sold"
      else
        return "Not Sold"
      end
    else
      return "Unknown"
    end
  end
end
