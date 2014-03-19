#Battle Game Server
=================

Battle Game Server for CIS 219 Mobile III In-class lecture.  Has an API for use by other clients, especially Android clients, that will allow players to connect and play each other or alternatively play against  the "computer" which will be the server.

Will eventually be a "Battle" server for any type of turn based fighting game

## Official Rules for Battleship  
http://www.hasbro.com/commoninstruct/battleship.pdf


## API for Game Play between 2 clients  
## API Version 1  
All API calls must be prefixed with /api/v1/XXX  
![API Actions and Return Results](http://battlegameserver.com/api_graph.png)  
[API Actions and Return Results](http://battlegameserver.com/api_graph.pdf)  

![Attack Sequence](http://battlegameserver.com/attack_sequence.png)  
[Attack Sequence](http://battlegameserver.com/attack_sequence.pdf)  

## login  
GET /api/v1/login.json  
Uses basic authentication to login to the server  

### returns: Your user profile as a JSON object:  
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

## logout  
GET /api/v1/logout.json  
Logs the user out from the server  

##available_players  
GET /api/v1/available_users.json  
  returns list of available players  

##all_users  
GET /api/v1/all_users.json  
  returns list of ALL players whether they are available or not

##available_ships  
GET /api/v1/available_ships.json  
###returns a list of all of the available ships names and their respective sizes.  
    {
    "carrier":5,
    "battleship":4,
    "cruiser":3,
    "submarine":3,
    "destroyer":2
    }

##available_directions  
GET /api/v1/available_directions.json  
###returns a list of all of the available directions for placing ships.  
    {
    "north":0,
    "east":2,
    "south":4,
    "west":6
    }

##challenge_computer  
GET api/v1/challenge_computer.json  
###returns the game id which is used in future calls  
    {
    "game_id":7
    }

##add_ship  
GET api/v1/game/:id/add_ship/:ship/:row/:col/:direction.json  
e.g.  /api/v1/game/7/add_ship/carrier/b/8/0.json  
####Success:  
    {"game_id":7,"status":"carrier ship added"}

####ERROR:  
    {"error":"illegal ship placement"}

##attack  
send one attack sequence  
GET api/v1/game/34/attack/h/3.json  
####returns hit/miss in addition to the computer's turn  
    {
    "game_id":34,       
    "row":h,          # Your Attack Row/Col
    "col":3,
    "hit":true,       # Did your attack hit a ship?
    "comp_row":c,     # Computers Attack Row/Col
    "comp_col":5,
    "comp_hit":false  # Did the computer hit your ship?
    "user_ship_sunk": "no",
    "comp_ship_sunk": "cruiser",
    "num_computer_ships_sunk": 3,
    "num_your_ships_sunk": 2,
    "winner": ""  #"computer", "you"
    }

##status  
Get the status of the boards and turns  
GET api/v1/game/42/status/(type).json  
all => return both boards
defend => return defending board
attack => return attacking board
turn => NOT YET IMPLEMENTED
####returns a string representing the board status with S for a ship, - for a Miss, * for a Hit.  
    {
    "game_id":42,
    "attack_board":
        "          \n          \n          \n          \n          \n          \n          \n          \n          \n          \n",
    "defend_board":
        "        S \n       S  \n  S  SS   \n  S  SS   \n  S SS S  \n     S    \n          \n          \n          \n  SSSS    \n"
    }
- - -  

#All API's below are NOT YET IMPLEMENTED

###challenge_player  
  returns acceptance?  
  
###accept_challenge  
  returns acceptance?
  
###setup_board  
  send initial board setup from client
      
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

### Available Ships:  
    carrier: 5,
    battleship: 4,
    cruiser: 3,
    submarine: 3,
    destroyer: 2


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

![dave](http://battlegameserver.com/assets/avatars/davejones-0764ffe5d8b49b113003ab60c54881f5.jpg)
