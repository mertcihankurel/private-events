class CreateEventAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendances do |t|
      t.timestamps
    end

    add_reference :event_attendances, :attendee, references: :users, index: true
    add_foreign_key :event_attendances, :users, column: :attendee_id, on_delete: :cascade

    add_reference :event_attendances, :attended_event, references: :events, index: true
    add_foreign_key :event_attendances, :events, column: :attended_event_id, on_delete: :cascade
  end
end
