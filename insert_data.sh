#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


echo $($PSQL "TRUNCATE games, teams")
echo -e "\nTruncating Tables..."

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
 #remove the top line of the file
 if [[ $YEAR != year ]]
 then
  #get winner_id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name LIKE '$WINNER' ")
  #while 'winner_id' isn't empty
  if [[ -z $WINNER_ID ]]
  then
    #insert team names from WINNERS
    INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER') ")
    #Change output text during INSERT
    if [[ $INSERT_WINNER = 'INSERT 0 1' ]]
    then
    echo -e "\nInserting $WINNER into Teams table... "
    fi
    #get new winner_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name LIKE '$WINNER' ")
  fi

  #get opponent_id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name LIKE '$OPPONENT' ")
  #while 'opponent_id' isn't empty
  if [[ -z $OPPONENT_ID ]]
  then
    #insert team names from OPPONENT
    INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    #Change output during INSERT
    if [[ $INSERT_OPPONENT = 'INSERT 0 1' ]]
    then
     echo -e "\nInserting $OPPONENT into Teams table"
    fi
    #get new opponent_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name LIKE '$OPPONENT' ")
  fi

   #get game_id
   GAME_ID=$($PSQL "SELECT game_id FROM games where winner_id = '$WINNER_ID' AND opponent_id = '$OPPONENT_ID' ")
   #while game_id isn't empty
    if [[ -z $GAME_ID ]]
    then
      #Insert info into Games table
      INSERT_GAMES=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES('$YEAR','$ROUND','$WINNER_ID','$OPPONENT_ID','$WINNER_GOALS','$OPPONENT_GOALS') ")
       #Change Insert message
       if [[ $INSERT_GAMES = 'INSERT 0 1' ]]
       then
        echo -e "Inserting records to Games table..."
       fi
    #get new games_id
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE winner_id = '$WINNER_ID' AND opponent_id = '$OPPONENT_ID' ")
   fi 
 
 fi
done