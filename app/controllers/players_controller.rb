class PlayersController < ApplicationController

  skip_before_action :verify_authenticity_token, if: :json_request?
  respond_to :json

  def index
    @players = game.players
    respond_with @players
  end

  def create
    @player = game.players.create player_params
    respond_with @player
  end

  private

  def game
    Game.find(params[:game_id])
  end

  def player_params
    params.require(:player).permit(:name, :type)
  end
end
