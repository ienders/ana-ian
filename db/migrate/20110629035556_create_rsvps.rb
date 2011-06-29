class CreateRsvps < ActiveRecord::Migration
  def self.up
    create_table :rsvps do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :attend
      t.string :meal_choice
      t.text :considerations
      t.timestamps
    end
  end

  def self.down
    drop_table :rsvps
  end
end
