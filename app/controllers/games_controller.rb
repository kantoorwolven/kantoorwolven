class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?
  respond_to :json

  def index
    respond_with Game.all
  end

  def show
    respond_with Game.find(params[:id]), include: [:players, :rounds ]
  end

  def create
    respond_with Game.create(game_params)
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
