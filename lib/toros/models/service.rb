class Toros::Service
  include Toros::Token
  def initialize(access_key, secret_key)
    @access_key = access_key
    @secret_key = secret_key
  end
end
