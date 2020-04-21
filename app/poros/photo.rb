class Photo
  attr_reader :id

  def initialize(location)
    @id = nil
    @photo_info ||= PhotoService.new(location).get_json
  end

  def photo_url
    @photo_info[:photos][:results][0][:urls][:raw]
  end
end
