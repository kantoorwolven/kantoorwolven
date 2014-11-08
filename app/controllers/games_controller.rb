class GamesController < ApplicationController
  before_filter :create_rounds, only: [:show]

  skip_before_action :verify_authenticity_token, if: :json_request?
  respond_to :json

  def index
    respond_with Game.all, include: [:players ]
  end

  def show
    respond_with Game.find(params[:id]), include: [:players, :rounds ]
  end

  def create
    respond_with Game.create(game_params)
  end

  private

  def game_params
    params.require(:game).permit(:name, :max_players)
  end

  # def create_rounds
  #   deadline     = nil
  #   now          = Time.zone.now
  #   day_starts   = Chronic.parse('today 8:00')
  #   day_ends     = Chronic.parse('today 16:30')
  #   night_starts = Chronic.parse('today 17:30')
  #   night_ends   = Chronic.parse('today 22:00')
  #
  #   if now > day_starts
  #     round_type = 'Day'
  #     deadline = day_ends
  #   end
  #
  #   if now > night_starts
  #     round_type = 'Night'
  #     deadline = night_ends
  #   end
  #   Game.find(params[:id]).rounds.create deadline: deadline, type: round_type
  # end
end
