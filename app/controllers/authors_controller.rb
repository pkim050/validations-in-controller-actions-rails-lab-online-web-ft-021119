class AuthorsController < ApplicationController
  before_action :set_author!, only: [:new, :create, :show]

  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.create!(author_params)
    if @author.save
      redirect_to @author
    else
      render :new
    end
  end

  private

  def author_params
    params.permit(:email, :name)
  end

  def set_author!
    @author = Author.find(params[:id])
  end
end
