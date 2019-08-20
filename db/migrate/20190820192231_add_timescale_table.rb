class AddTimescaleTable < ActiveRecord::Migration[6.0]
  def change
    unless extensions.include?('timescaledb')
      connection.execute('CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE')
    end

    create_table :stats, id: false, force: :cascade do |t|
      t.date     :date, null: false
      t.integer  :clicks
      t.string   :url
      t.integer  :webpage_id, null: false
      t.integer  :website_id, null: false
      t.integer  :account_id, null: false
    end

    connection.execute("CREATE INDEX ON stats (date DESC, webpage_id, website_id, account_id)")
    connection.execute("SELECT create_hypertable('stats', 'date', chunk_time_interval => interval '1 day')")
  end
end
