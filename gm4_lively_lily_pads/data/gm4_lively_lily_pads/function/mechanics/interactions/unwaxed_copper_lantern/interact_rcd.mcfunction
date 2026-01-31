# unwaxed copper lantern right click
# @s = player who right clicked on an unwaxed copper lantern
# at @s
# run from advancement: unwaxed_copper_rcd

advancement revoke @s only gm4_lively_lily_pads:unwaxed_copper_rcd

# reset scoreboards
scoreboard players set $mainhand gm4_llp.data 0
scoreboard players set $offhand gm4_llp.data 0
scoreboard players set $wax_used gm4_llp.data 0
scoreboard players set $axe_used gm4_llp.data 0

# item data, need both mainhand and offhand
execute if items entity @s weapon.mainhand #minecraft:axes run scoreboard players set $mainhand gm4_llp.data 1
execute if items entity @s weapon.mainhand honeycomb run scoreboard players set $mainhand gm4_llp.data 2
execute if items entity @s weapon.offhand #minecraft:axes run scoreboard players set $offhand gm4_llp.data 1
execute if items entity @s weapon.offhand honeycomb run scoreboard players set $offhand gm4_llp.data 2

# find interaction
execute as @e[type=interaction,tag=gm4_llp_unwaxed_copper_rcd,distance=..8] if data entity @s interaction at @s run function gm4_lively_lily_pads:mechanics/interactions/unwaxed_copper_lantern/process_interaction

# item usage
execute if score $wax_used gm4_llp.data matches 1 run item modify entity @s[gamemode=!creative] weapon.mainhand {function:"minecraft:set_count",count:-1,add:1b}
execute if score $wax_used gm4_llp.data matches 2 run item modify entity @s[gamemode=!creative] weapon.offhand {function:"minecraft:set_count",count:-1,add:1b}
execute if score $axe_used gm4_llp.data matches 1 if entity @s[gamemode=!creative] run function gm4_lively_lily_pads:mechanics/interactions/waxed_copper_lantern/used_mainhand_axe
execute if score $axe_used gm4_llp.data matches 2 if entity @s[gamemode=!creative] run function gm4_lively_lily_pads:mechanics/interactions/waxed_copper_lantern/used_offhand_axe
