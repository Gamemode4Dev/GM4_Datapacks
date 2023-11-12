# Dismantles a Zauber Cauldron, thereby removing the marker and any related entities.
# @s = a Zauber Cauldron marker which is no longer within a minecraft:cauldron block
# at @s
# run from cauldron/structure/validate/cauldron

# remove marker
kill @s

# remove liquid displays if present
kill @e[type=item_display,tag=gm4_zc_liquid,dx=0,limit=1]
