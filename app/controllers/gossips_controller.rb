class GossipsController < ApplicationController
    def show
      @gossip = Gossip.find(params[:id])
    end

    def index
        @gossips = Gossip.all
    end
  end