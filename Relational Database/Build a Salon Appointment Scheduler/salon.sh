#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME" | sed -r 's/^ *| *$//g'
  done
  read SERVICE_ID_SELECTED
  SERVICE_EXISTS=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_EXISTS ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    SERVICE_MENU "$SELECTED_SERVICE_ID"
  fi

}

SERVICE_MENU(){
  local SELECTED_SERVICE_ID=$1
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
  fi
  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  # get booking time
  SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  SERVICE_SELECTED_FORMATTED=$(echo "$SERVICE_SELECTED" | sed -r 's/^ *| *$//g')
  echo -e "\nWhat time would you like your $SERVICE_SELECTED_FORMATTED, $CUSTOMER_NAME?"
  read SERVICE_TIME
  # make appointment
  SERVICE_TIME_FORMATTED=$(echo "$SERVICE_TIME" | sed -r 's/^ *| *$//g')
  INSERT_BOOKING_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME_FORMATTED')")
  echo -e "\nI have put you down for a $SERVICE_SELECTED_FORMATTED at $SERVICE_TIME_FORMATTED, $CUSTOMER_NAME."
	}

MAIN_MENU
