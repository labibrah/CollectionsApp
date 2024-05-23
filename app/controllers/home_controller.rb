require 'httparty'

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @collections = current_user.collections
    @collection = Collection.new
  end

  def create_collection
    @collection = current_user.collections.build(collection_params)
    custom_fields = extract_custom_fields(params[:custom_fields])

    if @collection.save
      @collection.update(custom_fields: custom_fields)
      response = upload_to_imgbb(params[:collection][:image])

      if response['success']
        @collection.update(image: response['data']['url'])
        redirect_to root_path, notice: 'Collection created successfully.'
      else
        @collection.destroy # Rollback the collection creation if image upload fails
        flash.now[:alert] = 'Failed to upload image to ImgBB.'
        render :index
      end
    else
      flash.now[:alert] = 'Failed to create collection.'
      render :index
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :description, :topic, :image)
  end


  def extract_custom_fields(custom_fields_params)
    custom_fields = {}
    custom_fields_params.each do |field|
      name = field[:name]
      type = field[:type]
      custom_fields[name] = type
    end
    custom_fields
  end
  def upload_to_imgbb(image)
    response = HTTParty.post("https://api.imgbb.com/1/upload?expiration=1800&key=b37054e8a844200ee755fd9c62237ddd",
                             body: {
                               image: image.tempfile
                             })

    # Parse the JSON response
    puts "ImgBB API Response: #{response.body}"
    JSON.parse(response.body)
  end
end
