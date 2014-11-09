class GamesController < ApplicationController
  def index
    respond_with Game.all, include: [:players]
  end

  def show
    respond_with Game.find(params[:id]), include: [:players, :rounds]
  end

  def create
    respond_with Game.create!(game_params)
  end

  private

  def game_params
    params.require(:game).permit(:name, :max_players, :starttime)
  end
end
