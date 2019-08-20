# ActiveRecord::Base.connection.execute("TRUNCATE stats RESTART IDENTITY")

number_of_websites = 5
number_of_webpages = 1000
start_date = Date.new(2010, 1, 1)
end_date = Date.today

(start_date..end_date).each do |date|
  p "........................................"
  p "[INFO] date: #{date}"

  1.upto(number_of_websites) do |website_id|
    stats = []

    p "........................................"
    p "[INFO] website_id: #{website_id} #{date}"

    1.upto(number_of_webpages) do |webpage_id|
      stats << {
        date: date,
        clicks: rand(1..100),
        url: "https://www.example.com/#{webpage_id}.html",
        webpage_id: webpage_id,
        website_id: website_id,
        account_id: 1
      }
    end
    
    Stat.insert_all(stats)
  end

end
