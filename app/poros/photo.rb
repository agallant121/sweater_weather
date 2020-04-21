class Photo
  attr_reader :id

  def initialize(location)
    @id = nil
    @connection = PhotoService.new(location).connection
  end

  def photo_url
    get_json[:photos][:results][0][:urls][:raw]
  end

  private

  def get_json
    JSON.parse(@connection.get.body, symbolize_names: true)
  end
end
