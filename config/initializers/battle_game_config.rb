$custom_host = 'http://battlegameserver.com'

$available_directions = {
  north: 0,
  east: 2,
  south: 4,
  west: 6
}

$available_ships = {
  carrier: 5,
  battleship: 4,
  cruiser: 3,
  submarine: 3,
  destroyer: 2
}
$available_ships_rev = $available_ships.invert
$available_ships_form = $available_ships.keys
$available_directions_form = $available_directions.invert