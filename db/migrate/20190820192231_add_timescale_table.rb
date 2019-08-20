class AddTimescaleTable < ActiveRecord::Migration[6.0]
  def change
    unless extensions.include?('timescaledb')
      connection.execute('CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE')
    end

    create_table :stats, id: false, force: :cascade do |t|
      t.date     :date, null: false
      t.integer  :clicks
      t.integer  :webpage_id, null: false
      t.timestamps
    end

    add_index :stats, [:date], unique: true

    connection.execute("CREATE INDEX ON stats (date DESC, clicks)")
    connection.execute("SELECT create_hypertable('stats', 'date')")
  end
end
