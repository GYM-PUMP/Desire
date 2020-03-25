class Admins::SupplementsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @supplements = Supplement.all
  end

  def new
    @supplement = Supplement.new
    @genres = Genre.all
  end

  def create
    @supplement = Supplement.new(supplement_params)
    @genres = Genre.all
    if @supplement.save
      redirect_to admins_supplement_path(@supplement)
    else
      render 'new'
    end
  end

  def edit
    @supplement = Supplement.find(params[:id])
  end

  def update
    @supplement = Supplement.find(params[:id])
    if @supplement.update(supplement_params)
      redirect_to admins_supplement_path
    else
      render "edit"
    end
  end

  def destroy
      @supplement = Supplement.find(params[:id])
      @supplement.destroy
      redirect_to admins_supplements_path, notice: "successfully delete supplement!"
  end

  private

  def supplement_params
      params.require(:supplement).permit(:genre_id,:item_name,:description,:price,:maker,:supple_image, :sales_target_url)
  end

end
