class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  before_action :verify_password, only: [:update]

  def index
    @admins = Admin.all.page(params[:page])
  end
  
  def edit

  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to admins_backoffice_admins_path, notice: "Administrador criado com sucesso"
    else
      render :new
    end
  end
  
  def destroy
    if @admin.destroy
      redirect_to admins_backoffice_admins_path, notice: "Administrador excluido com sucesso"
    else
      render :index
    end
  end

  def update
    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to admins_backoffice_admins_path, notice: "Administrador atualizado"
    else
      render :edit
    end
  end

  private

  def params_admin
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def verify_password
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
  end
end
