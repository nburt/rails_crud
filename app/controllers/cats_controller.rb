class CatsController < ApplicationController

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(secure_params)
    if @cat.save
      redirect_to cats_path
    else
      render new_cat_path
    end
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    cat = Cat.find(params[:id])
    cat.update(secure_params)
    redirect_to cat_path
  end

  def destroy
    Cat.delete(params[:id])
    redirect_to cats_path
  end

  private

  def secure_params
    params.require(:cat).permit(:name, :color)
  end

end

