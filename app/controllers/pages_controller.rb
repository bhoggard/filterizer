class PagesController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all
  end
end
