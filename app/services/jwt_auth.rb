class JsonWebToken
  HMAC_SECRET_KEY = 'mysecretkey'.freeze
  def self.encode(payload)
    JWT.encode payload, HMAC_SECRET_KEY, 'HS256'
  end

  def self.decode(token)
    JWT.decode(token, HMAC_SECRET_KEY, true, { algorithm: 'HS256' })
  end
end
