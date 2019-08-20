Stat.delete_all

(Date.new(2010, 1, 1)..Date.today).each do |date|
  stats = []
  1.upto(1000) do |i|
    stats << {
      date: date,
      clicks: rand(1..100),
      webpage_id: i,
      created_at: Time.now,
      updated_at: Time.now
    }
  end
  Stat.insert_all(stats)
end
