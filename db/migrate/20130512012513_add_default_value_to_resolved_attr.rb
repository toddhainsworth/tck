class AddDefaultValueToResolvedAttr < ActiveRecord::Migration
  def change
  	change_column :tickets, :resolved, :decimal, :default => 0
  end
end
