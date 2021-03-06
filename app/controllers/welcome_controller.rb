class WelcomeController < ApplicationController
  def index
  end

  def clinics
    if request.xhr?
      if (params[:type] == "FP")
        @clinics = Clinic.where(:clinic_type => ["FP", "PP"])
      else
        @clinics = Clinic.where(clinic_type: params[:type])
      end
      render :json => @clinics
    end
  end

  def geolocate
    if request.xhr?
      @clinics = Clinic.near(params[:location], 100)
      render :json => @clinics
    end
  end
end
