class FilmForm < Reform::Form
  property :title
  property :description
  property :state_event

  property :tag_ids
end