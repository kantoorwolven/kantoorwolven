class RoundsController < ApplicationController
  def show
    respond_with type: Round.find(params[:id]).type
  end
end
