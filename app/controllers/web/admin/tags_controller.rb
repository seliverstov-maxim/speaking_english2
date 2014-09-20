class Web::Admin::TagsController < Web::Admin::ApplicationController
  def index
    @q = Tag.search(params[:q])
    @tags = @q.result.order(id: :asc).page(params[:page])
  end

  def new
    @form = TagForm.new(Tag.new)
  end

  def create
    @form = TagForm.new(Tag.new)
    if @form.validate(params[:tag] || {})
      @form.save
      redirect_to admin_tags_path
    end
  end

  def edit
    @form = TagForm.new(Tag.find(params[:id]))
  end

  def update
    @form = TagForm.new(Tag.find(params[:id]))
    if @form.validate(params[:tag] || {})
      @form.save
      redirect_to admin_tags_path
    else
      render :edit
    end
  end

  def destroy
    tag = Tag.find params[:id]
    tag.mark_as_deleted
    redirect_to admin_tags_path
  end
end