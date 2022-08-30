#!/usr/bin/env bash

# Decodes a value base64 encoded.
#
# Param[1]: Value to be decoded. I.e.: ZXhhbXBsZQ==
# Return: Decoded value. I.e.: example
function base64_decode {
  local P_ENCODED_VALUE="$1"

  # DECODING WILL NOT WORK PROPERLY IF THE "P_ENCODED_VALUE" WAS ONLY NUMBERS
  if [[ ${P_ENCODED_VALUE} =~ ^[0-9]+$ ]]; then
    echo ${P_ENCODED_VALUE}
    return
  fi

  # DECODE "P_ENCODED_VALUE" ONLY IF IT IS REALLY BASE64 ENCODED
  echo ${P_ENCODED_VALUE} | base64 --decode >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo ${P_ENCODED_VALUE} | base64 --decode
  else
    echo ${P_ENCODED_VALUE}
  fi
}

# Encodes a string in base64.
#
# Param[1]: Value to be encoded
# Return: Encoded value
function base64_encode {
  echo "$1" | base64
}