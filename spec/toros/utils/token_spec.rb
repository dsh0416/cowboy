require './spec/spec_helper'

RSpec.describe Toros do
  describe Toros::Token do
    class ExampleToken
      include Toros::Token
      def initialize(access_key, secret_key)
        @access_key = access_key
        @secret_key = secret_key
      end
    end

    it 'should generate access token correctly' do
      token = ExampleToken.new('MY_ACCESS_KEY', 'MY_SECRET_KEY')
      path = "/move/bmV3ZG9jczpmaW5kX21hbi50eHQ=/bmV3ZG9jczpmaW5kLm1hbi50eHQ="
      expect(token.access_token(path)).to eq('MY_ACCESS_KEY:FXsYh0wKHYPEsIAgdPD9OfjkeEM=')
    end

    it 'should generate download token correctly' do
      token = ExampleToken.new('abcdefghklmnopq', '1234567890')
      url = 'http://www.qiniu.com'
      expire = 1234567890 + 3600
      expect(token.download_token(url, {go: 1}, expire)).to eq('abcdefghklmnopq:8vzBeLZ9W3E4kbBLFLW0Xe0u7v4=')
    end

    it 'should generate upload token correctly' do
      token = ExampleToken.new('MY_ACCESS_KEY', 'MY_SECRET_KEY')
      put_policy = "{\"scope\":\"my-bucket:sunflower.jpg\",\"deadline\":1451491200,\"returnBody\":\"{\\\"name\\\":$(fname),\\\"size\\\":$(fsize),\\\"w\\\":$(imageInfo.width),\\\"h\\\":$(imageInfo.height),\\\"hash\\\":$(etag)}\"}"
      expect(token.upload_token(put_policy)).to eq('MY_ACCESS_KEY:wQ4ofysef1R7IKnrziqtomqyDvI=:eyJzY29wZSI6Im15LWJ1Y2tldDpzdW5mbG93ZXIuanBnIiwiZGVhZGxpbmUiOjE0NTE0OTEyMDAsInJldHVybkJvZHkiOiJ7XCJuYW1lXCI6JChmbmFtZSksXCJzaXplXCI6JChmc2l6ZSksXCJ3XCI6JChpbWFnZUluZm8ud2lkdGgpLFwiaFwiOiQoaW1hZ2VJbmZvLmhlaWdodCksXCJoYXNoXCI6JChldGFnKX0ifQ==')
    end
  end
end
