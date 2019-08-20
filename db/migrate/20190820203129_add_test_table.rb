class AddTestTable < ActiveRecord::Migration[6.0]
  def change
    create_table :widgets, force: :cascade do |t|
      t.date     :date, null: false
      t.integer  :clicks
    end
    
    # example of dropping the primary key to allow for hypertable indexing
    connection.execute("ALTER TABLE widgets DROP CONSTRAINT widgets_pkey")
    connection.execute("CREATE INDEX ON widgets (date DESC)")
    connection.execute("SELECT create_hypertable('widgets', 'date', chunk_time_interval => interval '1 day')")
  end
end
