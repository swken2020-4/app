class CreateNotification
  include HTTParty

  API_URI = 'https://onesignal.com/api/v1/notifications'.freeze

  def self.call(*args)
    new(*args).call
  end

  def initialize(contents:, type:)
    @contents = contents
    @type     = type
  end

  def call
    HTTParty.post(API_URI, headers: headers, body: body)
  end

  private

  attr_reader :contents, :type

  def headers
    {
      'Authorization' => 'Basic your-rest-api-key',
      'Content-Type'  => 'application/json'
    }
  end

  def body
    {
      'app_id' => 'your-app-id',
      'url'    => 'https://515ab8e55c404364bc59379f2f3c15a2.vfs.cloud9.us-east-1.amazonaws.com/',
      'data'   => { 'type': type },
      'included_segments' => ['All'],
      'contents' => contents
    }.to_json
  end
end