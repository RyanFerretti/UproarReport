class UploadPictureController < ApplicationController

  # POST /pictures
  def create
    if current_user.is_tour_rep?
      @report = Report.find(params[:report_id])
      Company.all.each do |c|
        @picture = Picture.create!(:report_id => params[:report_id], :image => params[:picture][:image], :logo_path => c.logo.path, :company_id => c.id)
      end
      redirect_to edit_tour_rep_report_url(@report)
    else
      @report = Report.find(params[:report_id], :include => {:user => :company})
      @picture = Picture.new(:report_id => params[:report_id], :image => params[:picture][:image])
      if @picture.save
        #head :ok
        redirect_to edit_company_rep_report_url(@report)
      else
        head :bad_request
      end
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
