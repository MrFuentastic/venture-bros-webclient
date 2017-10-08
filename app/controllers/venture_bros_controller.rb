class VentureBrosController < ApplicationController

  def index
    @venture_bros = VentureBro.all
  end

  def new
    
  end

  def create
    @venture_bro = VentureBro.create(
                                    character: params[:character],
                                    vehicle: params[:vehicle],
                                    organization: params[:organization],
                                    quote: params[:quote]
                                    )


    redirect_to "/venture_bros/#{@venture_bro.id}"
  end

  def show
    @venture_bro = VentureBro.find(params[:id])
  end

  def edit
    @venture_bro = VentureBro.find(params[:id])
    @venture_bro.update(
                        character: params[:character],
                        vehicle: params[:vehicle],
                        organization: params[:organization],
                        quote: params[:quote]      
                        )
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
    @venture_bro = VentureBro.find(params[:id])
    @venture_bro.destroy
    redirect_to "/venture_bros"
  end
end
