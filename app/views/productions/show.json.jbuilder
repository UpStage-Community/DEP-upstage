json.production @production, :id, :title, :rating, :qritique_count, :price_range, :description
json.production do
  json.image @production.image.url(:thumb)
  json.performances @production.performances do |perf|
    json.date perf.date
  end
end
json.qritiques @production.qritiques do |qritique|
  json.id qritique.id
  json.rating qritique.rating
  json.description qritique.description
  json.date qritique.created_at
  json.score qritique.score
  json.qritic do
    json.id qritique.qritic_id
    json.imageUrl qritique.qritic.image_url
    json.name qritique.qritic.name
    json.handle qritique.qritic.handle
  end
end