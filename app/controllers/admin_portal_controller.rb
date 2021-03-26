class AdminPortalController < ApplicationController
  before_action :authenticate_user!, :redirect_unless_admin
  before_action :set_user, only: %i[ edit update destroy ]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  # # GET /users/1/edit
  # def edit
  # end

  # # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to portal_path, notice: "User account successfully created. A password reset email has been sent to the user." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /users/1 or /users/1.json
  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: "User was successfully updated." }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /users/1 or /users/1.json
  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: "User was successfully destroyed." }
  #   end
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:full_name, :email, :phone_number, :company_name, :company_address)
  end

  def redirect_unless_admin
    unless current_user.admin_role?
      flash[:error] = "Access Denied!"
      redirect_to root_path
    end
  end

  def sign_up(resource_name, resource)
    true
  end
end
