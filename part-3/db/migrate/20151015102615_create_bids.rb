class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.belongs_to :user, null: false
      t.belongs_to :auction, null: false
      t.decimal :price, :precision => 8, :scale => 2, null: false
      t.timestamps null: false
    end
  end
end
