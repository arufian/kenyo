#!/bin/sh
for i in $(ifconfig -l); do
   case $i in
   (lo0)
      ;;
   (*)
      set -- $(ifconfig $i | grep "inet [1-9]")
      if test $# -gt 1; then
         echo $i: $2 |  awk '{ print $2}'
      fi
   esac
done