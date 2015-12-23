class StringedInstrumentsController < ApplicationController
  
  def index
    @stringed_instruments = StringedInstrument.all
  end

  def show
    @stringed_instrument = StringedInstrument.find(params[:id])
  end

  def new
  end

  def create 
    @stringed_instrument = Unirest.post("#{ENV['API_BASE_URL']}/stringed_instruments.json", headers: {"Accept" => "application/json"}, parameters: {name: params[:name], number_of_strings: params[:number_of_strings]}).body
    redirect_to "/stringed_instruments/#{@stringed_instrument["id"]}"
  end

  def edit
    @stringed_instrument = Unirest.get("#{ENV['API_BASE_URL']}/stringed_instruments/#{params[:id]}.json").body
  end

  def update
    @stringed_instrument = Unirest.patch("#{ENV['API_BASE_URL']}/stringed_instruments/#{params[:id]}.json", headers: {"Accept" => "application/json"}, parameters: {name: params[:name], number_of_strings: params[:number_of_strings]}).body
    redirect_to "/stringed_instruments/#{@stringed_instrument["id"]}"
  end
  def destroy
    StringedInstrument.find(params[:id]).destroy
    redirect_to "/stringed_instruments"
  end

end
