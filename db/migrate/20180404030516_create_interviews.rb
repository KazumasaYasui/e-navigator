class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :interview_datetime, null: false, default: DateTime.now
      t.integer :interview_status, null: false, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
