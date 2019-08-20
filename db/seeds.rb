# ActiveRecord::Base.connection.execute("TRUNCATE stats RESTART IDENTITY")

(Date.new(2010, 1, 1)..Date.today).each do |date|
  stats = []
  p "........................................"
  p "[INFO] date: #{date}"
  1.upto(100) do |website_id|
    p "........................................"
    p "[INFO] website_id: #{website_id} #{date}"
    1.upto(1000) do |webpage_id|
      stats << {
        date: date,
        clicks: rand(1..100),
        url: "https://www.example.com/#{webpage_id}.html",
        webpage_id: webpage_id,
        website_id: website_id,
        account_id: 1
      }
    end
  end
  
  Stat.insert_all(stats)
end
