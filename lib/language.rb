require 'base64'
require 'json'
require 'net/https'

module Language
  class << self
    def get_data(text)
      # APIのURL作成
      api_url = "https://language.googleapis.com/v1beta1/documents:analyzeSentiment?key=#{ENV['GOOGLE_API_KEY']}"
      # APIリクエスト用のJSONパラメータ
      params = {
        document: {
          type: 'PLAIN_TEXT',
          content: text
        }
      }.to_json
      # Google Cloud Natural Language APIにリクエスト
      uri = URI.parse(api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri,{ 'Referer' => 'https://3ce63b26b0934f4ea5b3de9c33dd3537.vfs.cloud9.ap-northeast-1.amazonaws.com/' })
      request['Content-Type'] = 'application/json'
      response = https.request(request, params)
      # APIレスポンス出力
      response_body = JSON.parse(response.body)
      if (error = response_body['error']).present?
        raise error['message']
      else
        response_body['documentSentiment']['score']
      end  
    end
  end
end