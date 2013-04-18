class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :description
      t.string :author
      t.decimal :resolved
      t.timestamps
    end
  end
end
