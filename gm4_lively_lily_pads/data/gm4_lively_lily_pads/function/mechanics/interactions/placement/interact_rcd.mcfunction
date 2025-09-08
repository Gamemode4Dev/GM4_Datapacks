# place interaction logic
# @s = player who right clicked on interaction holding a supported item
# at @s
# run from advancement: placement_rcd

advancement revoke @s only gm4_lively_lily_pads:placement_rcd

# brief check to enable Upgrade_Path 3.0
execute if entity @e[type=minecraft:interaction,tag=lilyPadInt,limit=1,distance=..64] run scoreboard players set lively_lily_pads gm4_earliest_version 0

# reset
scoreboard players set $mainhand gm4_llp.data 0
scoreboard players set $offhand gm4_llp.data 0

# item information
execute if predicate gm4_lively_lily_pads:mainhand_placeable_item run function gm4_lively_lily_pads:mechanics/interactions/placement/get_mainhand_data
execute unless score $mainhand gm4_llp.data matches 1 if predicate gm4_lively_lily_pads:offhand_placeable_item run function gm4_lively_lily_pads:mechanics/interactions/placement/get_offhand_data

# process interaction
execute as @e[type=interaction,tag=gm4_llp_placement_rcd,distance=..8] if data entity @s interaction at @s run function gm4_lively_lily_pads:mechanics/interactions/placement/process_interaction

# remove item if successful
execute if score $placement_success gm4_llp.data matches 1 if score $mainhand gm4_llp.data matches 1 run item modify entity @s[gamemode=!creative] weapon.mainhand {function:"minecraft:set_count",count:-1,add:1b}
execute if score $placement_success gm4_llp.data matches 1 if score $offhand gm4_llp.data matches 1 run item modify entity @s[gamemode=!creative] weapon.offhand {function:"minecraft:set_count",count:-1,add:1b}

# reset
scoreboard players reset $placement_success gm4_llp.data
