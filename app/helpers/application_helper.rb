module ApplicationHelper
  def tag_collection
    Tag.pluck(:name, :id)
  end
end
