class MoviesController < ApplicationController
  def show
    if params[:id] == '1'
      title = 'Parasite' 
      director = 'Bong Joon-ho'
    else 
      title = 'Titanic' 
      director = 'James Cameron'
    end

    render :show, locals: { title: title, director: director }
  end
end

