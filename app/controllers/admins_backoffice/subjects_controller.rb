class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  before_action :set_subject, only: [:edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html { @subjects = Subject.all.order(:id).page(params[:page]) }
      format.pdf { @subjects = Subject.all.order(:id) }
    end
  end
  
  def edit
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params_subject)
    if @subject.save
      redirect_to admins_backoffice_subjects_path, notice: "Assunto/Área criado com sucesso"
    else
      render :new
    end
  end
  
  def destroy
    if @subject.destroy
      redirect_to admins_backoffice_subjects_path, notice: "Assunto/Área excluido com sucesso"
    else
      render :index
    end
  end

  def update
    if @subject.update(params_subject)
      redirect_to admins_backoffice_subjects_path, notice: "Assunto/Área atualizado"
    else
      render :edit
    end
  end

  private

  def params_subject
    params.require(:subject).permit(:description)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

end
