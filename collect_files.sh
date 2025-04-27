#!/bin/bash

input_directory="$1"
output_directory="$2"

function recursion() {
  local input="$1"
  local result="$2"

  for element in "$input"/* 
  do  
    if [[ -f "$element" ]] 
    then
      name=$(basename "$element")
      changed_name="$name"
      counter=1
      while [[ -f "$result/$changed_name" ]]
      do
        changed_name="${name%.*}(${counter}).${name##*.}"  
        ((counter++))
      done
      cp "$element" "$result/$changed_name"
    elif [[ -d "$element" ]]
    then
      recursion "$element" "$result"
    fi
  done
}

recursion "$input_directory" "$output_directory"