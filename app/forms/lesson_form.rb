class LessonForm < Reform::Form
  property :title
  property :description
  property :state_event

  property :tag_ids
  property :film_slice_ids
end