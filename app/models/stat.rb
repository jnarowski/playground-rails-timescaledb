class Stat < ApplicationRecord
  class << self
    def get_webpage_clicks_for_month
      sql = "select sum(clicks) from stats where website_id = 1 and date > '2010-01-01' and date < '2010-02-01'"
      self.find_by_sql(sql).values
    end

    def get_entire_website_stats_for_month
      # not sure if we need the timebucket
      # sql = "select time_bucket('1 day', date) AS daily, sum(clicks) as clicks from stats where website_id = 1 and date >= '2010-01-01' and date < '2010-02-01' group by date"
      sql = "select date, sum(clicks) from stats where website_id = 1 and date >= '2011-01-01' and date < '2011-02-01' group by date"
      self.find_by_sql(sql)
    end
  end
end