class Rack::Attack
  Rack::Attack.blocklist('any php request') do |req|
    req.path =~ /\.php/ && (req.get? || req.post?)
  end
end
