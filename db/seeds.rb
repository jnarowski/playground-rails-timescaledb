Stat.delete_all

(Date.new(2010, 1, 1)..Date.today).each do |date|
  stats = []
  1.upto(1) do |website_id|
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
  p "inserting all for #{date}"
  Stat.insert_all(stats)
end
