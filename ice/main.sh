#!/bin/sh

[ ! -z $2 ] && icecast -c $2 &
sleep 5
[ ! -z $1 ] && ices $1
