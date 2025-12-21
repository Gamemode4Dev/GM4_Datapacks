# processes the "right click detection" interaction so that it is despawned when unneeded
# @s = gm4_llp_placement_rcd interaction 
# at @s
# run from mechanics/right_click_detection/loop

# refresh timer
scoreboard players set $timer gm4_llp.data 10

# kill rcd if uneeded
execute unless entity @p[tag=gm4_llp_holding_item,distance=..6] run return run kill @s
execute unless block ~ ~ ~ lily_pad run return run kill @s
execute align xyz if entity @e[type=block_display,tag=gm4_llp_display,dx=0] run return run kill @s

# kill if multiple interaction with the same id, which therefore belong to the same player
scoreboard players set $duplicate_exists gm4_llp.data 0
scoreboard players operation $check_id gm4_llp.id = @s gm4_llp.id
execute as @e[type=interaction,tag=gm4_llp_placement_rcd,distance=0.1..16] if score @s gm4_llp.id = $check_id gm4_llp.id run scoreboard players set $duplicate_exists gm4_llp.data 1
execute if score $duplicate_exists gm4_llp.data matches 1 run kill @s
