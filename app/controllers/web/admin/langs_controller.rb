class Web::Admin::LangsController < Web::Admin::ApplicationController
  def index
    @q = Lang.search(params[:q])
    @langs = @q.result.order(id: :asc).page(params[:page])
  end

  def new
    @form = LangForm.new(Lang.new)
  end

  def create
    @form = LangForm.new(Lang.new)
    if @form.validate(params[:lang] || {})
      @form.save
      redirect_to admin_langs_path
    end
  end

  def edit
    @form = LangForm.new(Lang.find(params[:id]))
  end

  def update
    @form = LangForm.new(Lang.find(params[:id]))
    if @form.validate(params[:lang] || {})
      @form.save
      redirect_to admin_langs_path
    else
      render :edit
    end
  end

  def destroy
    lang = Lang.find params[:id]
    lang.mark_as_deleted
    redirect_to admin_langs_path
  end
end