module V1
  class PlayersController < ApplicationController
    def index
      render json: Player.all
    end
  end
end
