#!/bin/sh

if [ $1 = "MSG" ]; then
  case "$2" in
    IN)
      if [ -n "$4" -a -f "$4" ]; then
        message="$(cat $4)"
        echo 'naughty.notify({title = "'$3'", text = "'"$1: $message"'"})' | awesome-client
        rm $4
      fi
      ;;
    MUC)
      if [ -n "$4" && -f "$4" ]; then
        message="$(cat $4)"
        echo 'naughty.notify({title = "'$3'", text = "'"$1: $message"'"})' | awesome-client
        rm $4
      fi
      ;;
    OUT)
        echo > /dev/null
      ;;
  esac
elif [ $1 = "STATUS" ]; then
  case "$2" in
    _)
      echo 'naughty.notify({title = "'$3'", text = "'"$1: has signed off."'"})' | awesome-client
     ;;
    O)
      echo 'naughty.notify({title = "'$3'", text = "'"$1: is now online."'"})' | awesome-client
     ;;
    F)
      echo 'naughty.notify({title = "'$3'", text = "'"$1: is chatty."'"})' | awesome-client
     ;;
    A)
      echo 'naughty.notify({title = "'$3'", text = "'"$1: has gone away."'"})' | awesome-client
     ;;
    N)
      echo 'naughty.notify({title = "'$3'", text = "'"$1: is now extended away."'"})' | awesome-client
     ;;
    D)
     echo 'naughty.notify({title = "'$3'", text = "'"$1: does not want to be disturbed."'"})' | awesome-client
     ;;
    I)
      echo 'naughty.notify({title = "'$3'", text = "'"$1: is now invisible."'"})' | awesome-client
     ;;
    ?)
      echo 'naughty.notify({title = "'ERROR'", text = "'"Something broke."'"})' | awesome-client
     ;;
    X)
      echo 'naughty.notify({title = "'$3'", text = "'"$1: has a request."'"})' | awesome-client
     ;;
  esac
elif [ $1 = "UNREAD" ]; then
  echo 'naughty.notify({title = "'$1'", text = "'"There are $2 new messages."'"})' | awesome-client
fi
