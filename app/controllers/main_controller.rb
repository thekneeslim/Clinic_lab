class MainController < ApplicationController
  def index
    @doctors = Doctor.all
    @specialties = Specialty.all
  end
end
