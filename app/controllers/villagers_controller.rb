class VillagersController < ApplicationController
  def index
    respond_with game.villagers
  end

  private

  def game
    Game.find params[:game_id]
  end
end
