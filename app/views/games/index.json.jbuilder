json.array!(@games) do |game|
  json.extract! game, :id
  json.url game_url(game, format: :json)
  json.avatar_image game.player1.avatar_url
end
