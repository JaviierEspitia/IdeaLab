# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  slug        :string
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_products_on_slug  (slug) UNIQUE
#
class Product < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates :name, length: { maximum: 200, minimum: 2}

  has_one_attached :image, dependent: :destroy
  has_many :product_categories

  has_many :categories, through: :product_categories # join get categories of product

  accepts_nested_attributes_for :categories # podremos relacionar categorias con los productos

  has_many :comments
end
