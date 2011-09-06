class UrlShortener
  @@url_starter = [('a'..'z'),('A'..'Z'),(1..9)].map{|i| i.to_a}.flatten

  def self.generate
    url = (0..12).map{@@url_starter[rand(@@url_starter.length)]}.join
    unless Report.where(:public_url => url).count == 0
      url = generate
    end
    url
  end
end
