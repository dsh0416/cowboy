module Toros::Token
  attr_reader :access_key, :secret_key

  def generate_token(encoded)
    digest = OpenSSL::Digest.new('sha1')
    hmac = OpenSSL::HMAC.digest(digest, @secret_key, encoded)
    encoded_sign = Base64.urlsafe_encode64(hmac)
    "#{@access_key}:#{encoded_sign}"
  end

  def access_token(path, query={}, body="")
    query_str = URI.encode_www_form(query)
    str = "#{path}#{query_str.empty? ? '' : '?'}#{query_str}\n#{body}"
    generate_token(str)
  end

  def download_token(url, query={}, expire=(Time.now.to_i + 3600))
    # TODO: Deal with non-ASCII characters later
    query[:e] = expire
    query_str = URI.encode_www_form(query)
    str = "#{url}?#{query_str}"
    generate_token(str)
  end

  def upload_token(put_policy)
    encoded = Base64.urlsafe_encode64(put_policy)
    token = generate_token(encoded)
    "#{token}:#{encoded}"
  end
end
