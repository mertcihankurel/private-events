class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :description
      t.datetime :event_date
      t.string :title

      t.timestamps
    end

    add_reference :events, :creator, references: :users, index: true
    add_foreign_key :events, :users, column: :creator_id
  end
end
