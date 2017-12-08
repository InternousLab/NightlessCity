class IndexController < ApplicationController

  before_action :startLogger
  after_action :endLogger

  def index

  end

  def login
    puts "来ました"

    # 最初のステップ
    uri = URI.parse("http://localhost:8080/UserInfo/")
    http = Net::HTTP.new(uri.host, uri.port)

    # 次のステップ
    http.use_ssl = false
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    # リクエスト
    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data({'name' => 'hoge', 'user' => 'hogehoge'})

    # レスポンス
    response = http.request(req)
  end

private
  def startLogger
    logger.debug("[Start]:" + Time.now.to_s)
  end

  def endLogger
    logger.debug("[End]:" + Time.now.to_s)
  end
end
