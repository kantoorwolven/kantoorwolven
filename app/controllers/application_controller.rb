class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :build_rounds
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # For all responses in this controller, return the CORS access control headers.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render text: '', content_type: 'text/plain'
    end
  end

  # def build_rounds
  #   day   = Chronic.parse('today 16:30')
  #   night = Chronic.parse('today 22:00')
  #
  #   Game.all.each do |game|
  #     players = game.players.size
  #     # next if Time.zone.now < game.starttime
  #     next if players < 8
  #     next if game.rounds.any?
  #     rounds = players - 2
  #     rest = rounds.modulo(2)
  #     rounds = (rounds - rest) / 2
  #     rounds.times do |i|
  #       game.rounds.create deadline: night + i.days, type: 'Night', active: i == 0
  #       game.rounds.create deadline: day + i.days,   type: 'Day',   active: i == 0
  #       # day_number = day_number + 1 if i.odd?
  #     end
  #   end
  # end

  def build_rounds
    Game.build_rounds
  end


  protected

  def json_request?
    request.format.json?
  end
end
