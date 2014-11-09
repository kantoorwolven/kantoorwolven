class PlayersController < ApplicationController
  def index
    respond_with game.players
  end

  def create
    respond_with game.players.create!(player_params)
  end

  def show
    respond_with type: Player.find_by!(email: params[:email]).type
  end

  private

  def game
    Game.find(params[:game_id])
  end

  def player_params
    params.require(:player).permit(:name, :email)
  end
end
