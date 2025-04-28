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
      cp "$element" "$result/$name"
    elif [[ -d "$element" ]]
    then
      recursion "$element" "$result"
    fi
  done
}

recursion "$input_directory" "$output_directory"