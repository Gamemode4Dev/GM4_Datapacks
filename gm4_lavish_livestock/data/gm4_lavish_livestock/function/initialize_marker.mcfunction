# Initializes the breeding site marker which sticks around awaiting birth
# @s = new breeding site marker
# at location of player who has fed the parent
# run from gm4_lavish_livestock:determine_parent

scoreboard players operation @s gm4_lavish_livestock_size = $size gm4_lavish_livestock_size
tag @s add gm4_lavish_livestock_breeding_site
