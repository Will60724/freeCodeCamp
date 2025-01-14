#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 ]]
then
  
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # Input is numeric, query by atomic_number
    ARGUMENT_EXISTS=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE atomic_number = $1")
  else
    # Input is text, query by symbol or name
    ARGUMENT_EXISTS=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE symbol = '$1' OR name ILIKE '$1'")
  fi
  
  if [[ -z $ARGUMENT_EXISTS ]]
	then
	  echo "I could not find that element in the database."
	else
    if [[ $1 =~ ^[0-9]+$ ]]; then
      # Input is numeric
      ARGUMENT=$($PSQL "
        SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
        FROM elements 
        INNER JOIN properties USING(atomic_number) 
        INNER JOIN types USING(type_id)  
        WHERE atomic_number = $1")
    else
      # Input is text (string)
      ARGUMENT=$($PSQL "
        SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
        FROM elements 
        INNER JOIN properties USING(atomic_number) 
        INNER JOIN types USING(type_id)  
        WHERE symbol = '$1' OR name ILIKE '$1'")
    fi
    echo "$ARGUMENT" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
	fi
else
  echo "Please provide an element as an argument."
fi
