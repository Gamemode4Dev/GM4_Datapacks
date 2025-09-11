# Upgrade flower pots to no longer need the marker
# @s = player
# at @s
# run via upgrade paths util

# target <3.4 perma marker to delete
execute as @e[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot] at @s \
  run function gm4_blossoming_pots:upgrade_paths/3.4/remove_perma_marker
