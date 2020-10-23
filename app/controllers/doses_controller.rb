class DosesController < ApplicationController

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    @ingredients = Ingredient.all
    if @dose.save!
      redirect_to cocktails_path
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private
  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
