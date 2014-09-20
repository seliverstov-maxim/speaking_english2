class Web::Admin::SubFilesController < Web::Admin::ApplicationController
  def index
    @q = SubFile.search(params[:q])
    @sub_files = @q.result.order(id: :asc).page(params[:page])
  end

  def new
    @form = SubFileForm.new(SubFile.new)
  end

  def create
    @form = SubFileForm.new(SubFile.new)
    if @form.validate(params[:sub_file] || {})
      @form.save
      redirect_to admin_sub_files_path
    end
  end

  def edit
    @form = SubFileForm.new(SubFile.find(params[:id]))
  end

  def update
    @form = SubFileForm.new(SubFile.find(params[:id]))
    if @form.validate(params[:sub_file] || {})
      @form.save
      redirect_to admin_sub_files_path
    else
      render :edit
    end
  end

  def destroy
    sub_file = SubFile.find params[:id]
    sub_file.mark_as_deleted
    redirect_to admin_sub_files_path
  end
end