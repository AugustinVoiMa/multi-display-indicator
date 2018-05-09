#!/bin/bash

DISPLAYS=$(xrandr | grep \ connected | cut -d \  -f 1)
_PRIMARY=$(xrandr | grep \ connected\ primary | cut -d \  -f 1)
_SECONDARY=$(xrandr | grep \ connected | grep -v primary | cut -d \  -f 1 | head -1)
MONO=''
PRIMARY=''
SECONDARY=''

echo "Connected displays:"
sed  's/ /\n/' <<< $DISPLAYS
DISPLAYS=$(echo -n "${DISPLAYS//[[:space:]]/}")
echo $DISPLAYS

until [[ $DISPLAYS = *$MONO* && $MONO != '' ]]
do
  read -p "Display used for mono screen mode [$_PRIMARY]" MONO;
  MONO=${MONO:-$_PRIMARY}
done

until [[ $DISPLAYS = *$PRIMARY* && $PRIMARY != '' ]]
do
  read -p "Primary display used for dual screen mode [$_PRIMARY]" PRIMARY;
  PRIMARY=${PRIMARY:-$_PRIMARY}
done

until [[ $DISPLAYS = *$SECONDARY* && $SECONDARY != '' ]]
do
  read -p "Second display used for dual screen mode [$_SECONDARY]" SECONDARY;
  SECONDARY=${SECONDARY:-$_SECONDARY}
done

echo 'Dual Screen || xrandr --output '$SECONDARY' --auto --right-of '$PRIMARY' --auto
Mono Screen || xrandr --output '$SECONDARY' --off --output '$PRIMARY' --off --output '$MONO' --auto' > commands
