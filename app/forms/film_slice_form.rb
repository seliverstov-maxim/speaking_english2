class FilmSliceForm < Reform::Form
  property :title
  property :description
  property :state_event
  property :start_at
  property :stop_at

  property :tag_ids
  property :film_id
end