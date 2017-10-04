class VentureBrosController < ApplicationController

  def index
    @venture_bros = Unirest.get("#{ ENV['HOST_NAME']}/api/v2/venture_bros.json").body
  end

  def new
    
  end

  def create
    @venture_bro = Unirest.post("#{ ENV['HOST_NAME']}/api/v2/venture_bros.json",
                                headers:{"Accept" => "application/json"},
                                parameters: {character: params[:character],
                                              vehicle: params[:vehicle],
                                              organization: params[:organization],
                                              quote: params[:quote]}
                                ).body
    redirect_to '/venture_bros'
  end

  def show
    @venture_bro = Unirest.get("#{ ENV['HOST_NAME']}/api/v2/venture_bros/#{params[:id]}").body
  end

  def edit
    @venture_bro = Unirest.get("#{ ENV['HOST_NAME']}/api/v2/venture_bros/#{params[:id]}").body
  end

  def update
    @venture_bro = Unirest.patch("#{ ENV['HOST_NAME']}/api/v2/venture_bros/#{params[:id]}.json",
                                headers:{"Accept" => "application/json"},
                                parameters: {character: params[:character],
                                              vehicle: params[:vehicle],
                                              organization: params[:organization],
                                              quote: params[:quote]}
                                ).body

    redirect_to "/venture_bros/#{@venture_bro['id']}"
  end

  def destroy
    response = Unirest.delete(
                              "#{ ENV['HOST_NAME']}/api/v2/venture_bros/#{params[:id]}.json",
                              headers: { "Accept" => "application/json"}
                              )
    redirect_to "/venture_bros"
  end
end
