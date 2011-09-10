class UploadPictureController < ApplicationController

  # POST /pictures
  def create
    @report = Report.find(params[:report_id], :include => {:user => :company})
    if @report.user.tour_rep?
      Company.all.each do |c|
        @picture = Picture.create!(:company => c,:report_id => params[:report_id], :image => params[:picture][:image])
      end
      redirect_to edit_tour_rep_report_url(@report)
    else
      @picture = Picture.new(:company => @report.user.company,:report_id => params[:report_id], :image => params[:picture][:image])
      if @picture.save
        #head :ok
        redirect_to edit_company_rep_report_url(@report) if current_user.company_rep?
        redirect_to edit_admin_report_url(@report) if current_user.admin?
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
