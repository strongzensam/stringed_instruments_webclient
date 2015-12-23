class StringedInstrument

  attr_accessor :id, :name, :tuning, :fretless, :body_type, :number_of_strings

  def initialize(hash)
    @name = hash["name"]
    @tuning = hash["tuning"]
    @fretless = hash["fretless"]
    @body_type = hash["body_type"]
    @number_of_strings = hash["number_of_strings"]
  end

  def self.find(id)
    stringed_instrument_hash = Unirest.get("#{ENV['API_BASE_URL']}/stringed_instruments/#{id}.json", headers: {"X-User-Email": "test@test.com", "Authorization": "Token token=FartSchema"}).body
    StringedInstrument.new(stringed_instrument_hash)
  end
  def self.all
    all_array = []
    Unirest.get("#{ENV['API_BASE_URL']}/stringed_instruments.json", headers: {"X-User-Email": "test@test.com", "Authorization": "Token token=FartSchema"}).body.each do |hash|
      all_array << StringedInstrument.new(hash)
    end
    return all_array
  end
  def destroy
    Unirest.delete("#{ENV['API_BASE_URL']}/stringed_instruments/#{id}.json").body
  end
  def create(parameters)
    Unirest.post("#{ENV['API_BASE_URL']}/stringed_instruments.json", headers: {"Accept" => "application/json"}, parameters: {name: params[:name], number_of_strings: params[:number_of_strings]}).body
  end

end