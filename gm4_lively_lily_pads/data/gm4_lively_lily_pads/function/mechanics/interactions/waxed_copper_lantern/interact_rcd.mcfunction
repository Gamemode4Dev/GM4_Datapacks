# waxed copper lantern right click
# @s = player who right clicked on an waxed copper lantern
# at @s
# run from advancement: waxed_copper_rcd

advancement revoke @s only gm4_lively_lily_pads:waxed_copper_rcd

# reset scoreboards
scoreboard players set $mainhand gm4_llp.data 0
scoreboard players set $offhand gm4_llp.data 0
scoreboard players set $holding_axe gm4_llp.data 0
scoreboard players set $scraped gm4_llp.data 0

# item data, only care about axes
execute if items entity @s weapon.mainhand #minecraft:axes store success score $holding_axe gm4_llp.data run scoreboard players set $mainhand gm4_llp.data 1
execute unless score $mainhand gm4_llp.data matches 1 if items entity @s weapon.offhand #minecraft:axes store success score $holding_axe gm4_llp.data run scoreboard players set $offhand gm4_llp.data 1

# find interaction
execute as @e[type=interaction,tag=gm4_llp_waxed_copper_rcd,distance=..8] if data entity @s interaction at @s run function gm4_lively_lily_pads:mechanics/interactions/waxed_copper_lantern/process_interaction

# fail if not scraped
execute if score $scraped gm4_llp.data matches 0 run return fail

# update axe durability
execute if score $mainhand gm4_llp.data matches 1 if entity @s[gamemode=!creative] run function gm4_lively_lily_pads:mechanics/interactions/waxed_copper_lantern/used_mainhand_axe
execute if score $offhand gm4_llp.data matches 1 if entity @s[gamemode=!creative] run function gm4_lively_lily_pads:mechanics/interactions/waxed_copper_lantern/used_offhand_axe
