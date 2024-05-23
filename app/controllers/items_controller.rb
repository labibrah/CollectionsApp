# app/controllers/items_controller.rb

class ItemsController < ApplicationController
  before_action :set_collection

  def new
    @collection = Collection.find(params[:collection_id])
    @item = @collection.items.build
  end

  def create
    @item = @collection.items.build(item_params)
    if @item.save
      redirect_to collection_path(locale: I18n.locale, id: params[:collection_id]), notice: "Item was successfully created."
    else
      render :new
    end
  end

  def edit
    @item = @collection.items.find(params[:id])
  end

  def update
    @item = @collection.items.find(params[:id])
    if @item.update(item_params)
      redirect_to @collection, notice: "Item was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @item = @collection.items.find(params[:id])
    @item.destroy
    redirect_to @collection, notice: "Item was successfully deleted."
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :other_attributes)
  end
end
