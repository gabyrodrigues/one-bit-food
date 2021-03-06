class Order < ApplicationRecord
  belongs_to :restaurant
  has_many :order_products

  validates :name, :phone_number, :total_value, :city, :neighborhood, :street, :number, presence: true

  enum status: { waiting: 0, delivered: 1 }

  before_validation :set_price

  accepts_nested_attributes_for :order_products, allow_destroy: true #dentro do controller de order, também tem coisas do order product

  private
  def set_price
    final_price = 0

    order_products.each do |order_product|
      final_price += order_product.quantity * order_product.product.price #somando no preço final do pedido toda a quantidade de itens * o preço
    end

    self.total_value = final_price + self.restaurant.delivery_tax 
  end
end
