#!/bin/bash

input_directory="$1"
output_directory="$2"
max_depth="$3"

function recursion() {
  local input="$1"
  local result="$2"
  local depth="$3"

  if [[ "$depth" -eq 0 ]]
    then
    return
  fi

  for element in "$input"/* 
  do  
    if [[ -f "$element" ]] 
    then
      name=$(basename "$element")
      cp "$element" "$result/$name"
    elif [[ -d "$element" ]]
    then
      changed=$((depth - 1))
      recursion "$element" "$result" "$changed"
    fi
  done
}

recursion "$input_directory" "$output_directory" "$max_depth"




