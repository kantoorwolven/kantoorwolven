class VotingsController < ApplicationController
  def index
    respond_with round.votings
  end

  def create
    respond_with round.votings.create(votings_params)
  end

  private

  def votings_params
    params.require(:votings).permit(:voter_id, :voted_id)
  end

  def game
    Game.find(params[:game_id])
  end

  def round
    Round.find(params[:round_id])
  end
end
