require 'spec_helper'

describe Search do
  context "with products" do
    it "returns products between $10 and $30" do
      search = Search.create!(:min_price => 10, :max_price => 30)
      products = search.products
      products.each do |product_item|
        product_item.price.to_i.should be >= 10
        product_item.price.to_i.should be <= 30
      end
    end

    it "returns products under $30" do
      search = Search.create!(:max_price => 30)
      products = search.products
      products.each do |product_item|
        product_item.price.to_i.should be <= 30
      end
    end

    it "returns products over $50" do
      search = Search.create!(:min_price => 50)
      products = search.products
      products.each do |product_item|
        product_item.price.to_i.should be >= 50
      end
    end
  end
end

