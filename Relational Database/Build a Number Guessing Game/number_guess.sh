#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt for username
echo "Enter your username:"
read USERNAME

# Retrieve user data
USER_DATA=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]
then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL)" > /dev/null
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  GAMES_PLAYED=0
  BEST_GAME="no recorded"
else
  # Existing user
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  if [[ -z $BEST_GAME ]]
  then
    BEST_GAME="no recorded"
  fi
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate a random number
SECRET_NUMBER=$((1 + RANDOM % 1000))
echo "Guess the secret number between 1 and 1000:"
GUESSES=0

while true
do
  read GUESS
  ((GUESSES++))

  # Validate input
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    # Correct guess
    echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done

# Update user stats
GAMES_PLAYED=$((GAMES_PLAYED + 1))
if [[ $BEST_GAME == "no recorded" || $GUESSES -lt $BEST_GAME ]]
then
  $PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $GUESSES WHERE user_id = $USER_ID" > /dev/null
else
  $PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE user_id = $USER_ID" > /dev/null
fi
