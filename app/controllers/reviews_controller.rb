class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def create
    @review = @recipe.reviews.build(review_params)
    @review.user = current_user

    if review.save
      redirect_to recipe_path(@recipe), notice: "Merci pour ton avis !"
    else
      flash.now[:alert] = "Impossible d'enregistrer l'avis."
      render "recipes/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to recipe_path(@recipe), notice: "Avis mis à jour avec succès."
    else
      flash.now[:alert] = "Impossible de mettre à jour l'avis."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to recipe_path(@recipe), notice: "Avis supprimé avec succès"
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_review
    @review = @recipe.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def authorize_user!
    unless @review.user == current_user
      redirect_to recipe_path(@recipe), alert: "Vous n'êtes pas autorisé(e) à modifier cet avis"
    end
  end
end
