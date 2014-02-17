Battle Game Server
=================

Battle Game Server for CIS 219 In-class lecture.  Has an API for use by other clients, especially Android clients, that will allow players to connect and play each other or alternatively play against  the "computer" which will be the server.

Will eventually be a "Battle" server for any type of turn based fighting game

## Official Rules for Battleship  
http://www.hasbro.com/commoninstruct/battleship.pdf


## API for Game Play between 2 clients  
### API Version 1
All API calls must be prefixed with /api/v1/XXX

### login  
Uses basic authentication to login to the server  
#### returns: Your user profile as a JSON object:  
    {
    id: 1,
    first_name: "Dave",
    last_name: "Jones",
    avatar_name: "Dr.Dave",
    level: 1,
    coins: 0,
    battles_won: 0,
    battles_lost: 0,
    battles_tied: 0,
    experience_points: 0,
    available: false,
    online: false,
    gaming: false,
    email: "dave@lockersoft.com",
    avatar_image: "avatars/davejones.jpg"
    }

###available_players  
  returns list of available players  

###challenge_player  
  returns acceptance?  
  
###accept_challenge  
  returns acceptance?
  
###setup_board  
  send initial board setup from client
  
###attack  
  send one attack sequence  
  returns hit/miss  
  
###status  
  returns current board and hit/miss board  
  
- - -  

## Structures

### User  
    first_name  
    last_name  
    avatar_name 
    avatar_image
    level                  
    coins                  
    battles_won            
    battles_lost           
    battles_tied           
    experience_points     
    available     
    online              
    gaming               
    email                
    admin  
    All Other Devise Fields  
    
### Ship  
    name  
    size  
    start_row
    start_col
    end_row
    end_col
    image
    belongs_to :board

### Board  
    height  
    width  
    cells (double array)  
    has_many ships  
    
### Cell
    has_ship? 
    hit?
    miss?
    
### Game
    belongs_to player1, :class_name => 'User', :foreign_key => 'player_id_1'
    belongs_to player2, :class_name => 'User', :foreign_key => 'player_id_2'
    :has_many turns
    game_time
    winner
    awarded_coins
    
### Comment
    belongs_to user
    belongs_to game
    content
    
### Turn
    (Full description of damage inflicted/received, etc.)
    belongs_to :user
    belongs_to :game
    row
    col
    hit  
    sunk  
    ship  
    
# Notes

User makes themselves available to play or challenges a player
Other player accepts challenge or chooses an available player to challenge