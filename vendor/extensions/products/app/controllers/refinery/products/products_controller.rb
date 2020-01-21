module Refinery
  module Products
    class ProductsController < ::ApplicationController

      before_action :find_all_products
      before_action :find_page

      def index

        present(@page)
      end

      def show
        @product = Product.find(params[:id])

        present(@page)
      end

    protected

      def find_all_products
        @products = Product.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/products").first
      end

    end
  end
end
