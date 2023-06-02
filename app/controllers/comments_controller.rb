class CommentsController < ApplicationController

  before_action :set_product, only: :create
  def create
    comment = Comment.new(comment_params)
    comment.product_id = @product.id
    if comment.save
      flash[:success] = "Comentario creado exitosamente"
      redirect_to @product
    else
      flash[:danger] = "Error al crear comentario #{comment.errors.messages}"
      redirect_to @product
    end

  end

  private

  def set_product
    @product = Product.find_by(slug: params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end