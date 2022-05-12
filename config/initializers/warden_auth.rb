Warden::JWTAuth.configure do |config|
  config.secret = ENV['DEVISE_JWT_SECRET_KEY']
  config.dispatch_requests = [
                               ['POST', %r{^/api/sign_in$}],
                               ['POST', %r{^/api/sign_in.json$}]
                             ]
  config.revocation_requests = [
                                 ['DELETE', %r{^/api/sign_out$}],
                                 ['DELETE', %r{^/api/sign_out.json$}]
                               ]
end