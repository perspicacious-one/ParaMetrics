class RegisteredAppsController < ApplicationController
  before_action :authenticate_user!, except: [:events_by_day, :events_by_name]

  def index
    @apps = current_user.registered_apps
  end

  def show
    @app = RegisteredApp.find(params[:id])
    @events = @app.events.group_by(&:name)
  end

  def edit
    @app = RegisteredApp.find(params[:id])
  end

  def update
    @app.assign_attributes(app_params)

    if @app.save
      flash[:notice] = "App was updated successfully."
      redirect_to @app
    else
      flash.now[:alert] = "Unable to save changes. Please try again later."
      render :edit
    end
  end

  def new
    @app = RegisteredApp.new
  end

  def create
    @app = current_user.registered_apps.build(app_params)
    if @app.save
      flash[:notice] = "Your App: #{@app.name} was created successfully."
      redirect_to user_registered_apps_path
    else
      flash[:alert] = "Your App: #{@app.name} could not be created."
      redirect_to user_registered_app_path
    end
  end

  def destroy
    @app = RegisteredApp.find(params[:id])
    if @app.delete
      flash[:notice] = "App was deleted successfully."
      redirect_to  user_registered_apps_path
    else
      flash.now[:alert] = "Unable to delete. Please try again later."
      render :show
    end
  end

  private

  def app_params
    params.require(:registered_app).permit(:name, :url, :description)
  end
end
