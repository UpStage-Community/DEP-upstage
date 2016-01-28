json.(production, :id, :title, :rating)
json.performances production.performances do |perf|
  json.date perf.date
end
json.image production.image.url(:thumb)
