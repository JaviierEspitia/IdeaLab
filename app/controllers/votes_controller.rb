class VotesController < ApplicationController
  before_action :set_product, only: :create
  def create
    Vote.create votable:@product
    flash[:success] = 'Gracias por tu voto'
    redirect_to @product
  end

  private

  def set_product
    @product = Product.find_by(slug: params[:product_id])
  end

end