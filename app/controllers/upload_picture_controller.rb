class UploadPictureController < ApplicationController

  # POST /pictures
  def create
    @picture = Picture.find(params[:picture])

    if @picture.save
      head :ok
    else
      head :bad_request
    end
  end

  # PUT /pictures/1
  def update
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(params[:picture])
      head :ok
    else
      head :bad_request
    end
  end

  # DELETE /pictures/1
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    head :ok
  end
end
