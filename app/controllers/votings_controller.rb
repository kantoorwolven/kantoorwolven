class VotingsController < ApplicationController
  def index
    respond_with round.votings
  end

  def create
    voting = round.votings.find_or_create_by voter_id: votings_params[:voter_id]
    voting.update voted_id: votings_params[:voted_id]
    respond_with voting
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
