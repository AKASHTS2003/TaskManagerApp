class AddCalendarFieldsToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :summary, :string
    add_column :tasks, :organizer_email, :string
    add_column :tasks, :attendees_emails, :text
    add_column :tasks, :location, :string
    add_column :tasks, :time_zone, :string
    add_column :tasks, :start_time, :string
    add_column :tasks, :end_time, :string
    add_column :tasks, :meeting_date, :string
    add_column :tasks, :recurring, :boolean
    add_column :tasks, :recurrence_frequency, :string
    add_column :tasks, :recurrence_count, :integer
  end
end
