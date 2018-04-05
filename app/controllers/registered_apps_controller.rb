class RegisteredAppsController < ApplicationController
  def index
    @apps = RegisteredApp.belongs_to_current
  end

  def show
    @app = RegisteredApp.find(params[:id])
  end

  def edit
    @app = RegisteredApp.find(params[:id])
  end
  def new
    @app = RegisterApp.new
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
  end


  private

  def app_params
    params.require(:app).permit(:name, :description)
  end
end
