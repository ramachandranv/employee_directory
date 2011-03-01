class ProfilesController < ApplicationController
  def index
   @profiles = Profile.all

   respond_to do |format|
     format.html
   end
  end

  def new
    @profile = Profile.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  
  def show 
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to(@profile, :notice => 'Profile was successfully created.') }
        format.xml  { render :xml => @profile, :status => :created, :location => @profile } 
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(@profile, :notice => 'Profile was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end
end
