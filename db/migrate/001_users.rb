class Users < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :flash, :string
      t.column :recent_transactions, :string, :limit => 1024
      t.column :savings_goal, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :send_now, :boolean, :default => false
      t.column :spending_goal, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :spent_this_month, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :spent_today, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :temporary_spending_cut, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :timezone_offset, :integer, :default => 0
      t.column :reset_at, :datetime
      t.column :send_at, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
