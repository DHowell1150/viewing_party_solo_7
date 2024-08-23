class MovieSerializer
  include JSONAPI::Serializer

  attributes :title, :id, :vote_average
end
