class WerewolvesController < ApplicationController
  def index
    respond_with game.werewolves
  end

  private

  def game
    Game.find params[:game_id]
  end
end
