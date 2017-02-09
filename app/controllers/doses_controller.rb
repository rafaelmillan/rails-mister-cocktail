class DosesController < ApplicationController
  before_action :set_dose, only: [ :destroy ]

  def new
    @dose = Dose.new
  end

  def create
    @ingredient = Ingredient.find_by_name(params[:dose][:ingredient])
    @cocktail = Cocktail.find_by_name(params[:dose][:cocktail])
    @dose = Dose.new(description: params[:dose][:description], ingredient: @ingredient, cocktail: @cocktail)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to @cocktail
  end

  private

  # def dose_params
  #   params.require(:dose).permit(:description, :ingredient, :cocktail)
  # end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
