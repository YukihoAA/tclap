#!/bin/bash

let "suc = 0"
let "fail = 0"

for tnam in `ls test*.sh`
  do 
  echo "Running test $tnam"
  if ./$tnam && echo "OK" || echo "FAIL" ; then
      let "suc = $(($suc + 1))"
  else
      let "fail = $(($fail + 1))"
  fi
done

let "total = $(($suc + $fail))"
echo "======================"
echo "|     TESTS DONE     |"
echo "======================"
echo " TOTAL: $total"
echo "    OK: $suc"
echo "FAILED: $fail"

if [ $fail -ne 0 ]; then
    exit 1
fi
    
