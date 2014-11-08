class GamesController < ApplicationController

  skip_before_action :verify_authenticity_token, if: :json_request?
  respond_to :json

  def create
    @game = Game.create game_params
    respond_with @game
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end

  def json_request?
    request.format.json?
  end
end
