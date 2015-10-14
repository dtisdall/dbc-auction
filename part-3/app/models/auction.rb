class Auction < ActiveRecord::Base
  validates :name, :description, :start_time, :end_time, presence: true
  belongs_to :user

end
