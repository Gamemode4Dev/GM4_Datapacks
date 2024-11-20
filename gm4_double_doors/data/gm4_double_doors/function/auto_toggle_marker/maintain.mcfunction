# manages the lifetime and functionality of auto toggle markers
# @s = marker entity with the gm4_double_doors_auto_toggle_marker tag
# at @s align xyz
# run from gm4_double_doors:auto_toggle_marker/find

# decay marker
scoreboard players remove @s gm4_double_doors_auto_toggle_liftime 1

# an auto toggle marker has three states stored in the gm4_double_doors_auto_toggle_state scoreboard: 0='waiting_for_player', 1='player_present', 2='player_departed'
# depending on the state the marker is handled differently:
# - 'waiting_for_player' markers look for the presence of a player every tick, if one is found the state is set to 'player_present'
# - 'player_present' markers look for the disappearance if the present player every tick, if so the state is set to 'player_departed' and the lifetime is reduced to 60 ticks
# - 'player_departed' markers do not check for players
# all states decay at 1 score per tick
execute if score @s gm4_double_doors_auto_toggle_state matches ..0 if function gm4_double_doors:auto_toggle_marker/player_present run scoreboard players set @s gm4_double_doors_auto_toggle_state 1
execute if score @s gm4_double_doors_auto_toggle_state matches 1 unless function gm4_double_doors:auto_toggle_marker/player_present run function gm4_double_doors:auto_toggle_marker/player_departed
execute if score @s gm4_double_doors_auto_toggle_state matches 2.. if score @s gm4_double_doors_auto_toggle_liftime matches 0 run function gm4_double_doors:auto_toggle_marker/select_material

# kill old auto toggle markers
execute if score @s gm4_double_doors_auto_toggle_liftime matches ..0 run kill @s

# kill auto toggle markers which are not in a door anymore
execute unless block ~ ~ ~ #minecraft:doors run kill @s

# set flag that an auto toggle marker was found
scoreboard players set $found_auto_toggle_marker gm4_double_doors_data 1
