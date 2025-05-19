class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.new
  end

  def edit
  end
end
