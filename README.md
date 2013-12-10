Battleship Server
=================

Battleship Server for CIS 219 In-class lecture.  Has an API for use by other clients, especially Android clients, that will allow players to connect and play each other or alternatively play against  the "computer" which will be the server.

## Official Rules for Battleship  
http://www.hasbrocom/commoninstruct/battleship.pdf


## API for Game Play between 2 clients

available_players
  returns list of available players

challenge_player
  returns acceptance?
  
accept_challenge
  returns acceptance?
  
setup_board
  send initial board setup from client
  
attack
  send one attack sequence
  returns hit/miss
  
status
  returns current board and hit/miss board