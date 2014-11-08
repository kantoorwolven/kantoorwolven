class PlayersController < ApplicationController

  skip_before_action :verify_authenticity_token, if: :json_request?
  respond_to :json

  def index
    respond_with game.players
  end

  def create
    respond_with game.players.create(player_params)
  end

  private

  def game
    Game.find(params[:game_id])
  end

  def player_params
    params.require(:player).permit(:name, :email)
  end
end
