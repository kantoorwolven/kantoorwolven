class PlayersController < ApplicationController

  skip_before_action :verify_authenticity_token, if: :json_request?
  respond_to :json

  def index
    respond_with game.players
  end

  def create
    type_of_player = [Werewolf, Villager, Villager, Villager].sample
    player = type_of_player.create(player_params.merge(game_id: game.id))
    respond_with player
  end

  private

  def game
    Game.find(params[:game_id])
  end

  def player_params
    params.require(:player).permit(:name, :type)
  end
end
