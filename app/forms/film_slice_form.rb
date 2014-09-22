class FilmSliceForm < Reform::Form
  property :title
  property :description
  property :state_event

  property :tag_ids
  property :film_id
end