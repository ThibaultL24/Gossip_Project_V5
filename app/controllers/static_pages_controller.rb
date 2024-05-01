class StaticPagesController < ApplicationController
  def welcome
    @first_name = params[:first_name]
  end

  def team
  end

  def contact
  end

  def home
    @gossips = Gossip.all
    @gossip = @gossips.first
  end
  
  def show
    @gossip = Gossip.find(params[:id])
  end
end
