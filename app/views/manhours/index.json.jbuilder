json.array!(@manhours) do |manhour|
  json.extract! manhour, :id, :heading, :union147, :union15
  json.url manhour_url(manhour, format: :json)
end
