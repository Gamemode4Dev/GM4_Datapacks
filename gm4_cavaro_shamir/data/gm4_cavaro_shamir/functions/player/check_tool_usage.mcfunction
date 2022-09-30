# Checks if the player has used a Cavaro tool.
# @s = @a[gamemode=!spectator]
# at world spawn
# run from gm4_cavaro_shamir:tick

# check pickaxe usage
execute if score @s gm4_use_pickaxe_net matches 1.. if predicate gm4_cavaro_shamir:holding_cavaro at @s run function gm4_cavaro_shamir:player/break_block
execute if score @s gm4_use_pickaxe_dia matches 1.. if predicate gm4_cavaro_shamir:holding_cavaro at @s run function gm4_cavaro_shamir:player/break_block
execute if score @s gm4_use_pickaxe_gol matches 1.. if predicate gm4_cavaro_shamir:holding_cavaro at @s run function gm4_cavaro_shamir:player/break_block
execute if score @s gm4_use_pickaxe_iro matches 1.. if predicate gm4_cavaro_shamir:holding_cavaro at @s run function gm4_cavaro_shamir:player/break_block
execute if score @s gm4_use_pickaxe_sto matches 1.. if predicate gm4_cavaro_shamir:holding_cavaro at @s run function gm4_cavaro_shamir:player/break_block
execute if score @s gm4_use_pickaxe_woo matches 1.. if predicate gm4_cavaro_shamir:holding_cavaro at @s run function gm4_cavaro_shamir:player/break_block

# check shovel usage
execute if score @s gm4_use_shovel_net matches 1.. if predicate gm4_cavaro_shamir:holding_cavaro at @s run function gm4_cavaro_shamir:player/break_block
execute if score @s gm4_use_shovel_dia matches 1.. if predicate gm4_cavaro_shamir:holding_cavaro at @s run function gm4_cavaro_shamir:player/break_block
execute if score @s gm4_use_shovel_gol matches 1.. if predicate gm4_cavaro_shamir:holding_cavaro at @s run function gm4_cavaro_shamir:player/break_block
execute if score @s gm4_use_shovel_iro matches 1.. if predicate gm4_cavaro_shamir:holding_cavaro at @s run function gm4_cavaro_shamir:player/break_block
execute if score @s gm4_use_shovel_sto matches 1.. if predicate gm4_cavaro_shamir:holding_cavaro at @s run function gm4_cavaro_shamir:player/break_block
execute if score @s gm4_use_shovel_woo matches 1.. if predicate gm4_cavaro_shamir:holding_cavaro at @s run function gm4_cavaro_shamir:player/break_block

# check if cavaro is still being held
execute if entity @s[tag=gm4_used_cavaro] unless predicate gm4_cavaro_shamir:holding_cavaro run function gm4_cavaro_shamir:player/clear_cavaro

# reset scores
scoreboard players reset @s gm4_use_pickaxe_net
scoreboard players reset @s gm4_use_pickaxe_dia
scoreboard players reset @s gm4_use_pickaxe_gol
scoreboard players reset @s gm4_use_pickaxe_iro
scoreboard players reset @s gm4_use_pickaxe_sto
scoreboard players reset @s gm4_use_pickaxe_woo
scoreboard players reset @s gm4_use_shovel_net
scoreboard players reset @s gm4_use_shovel_dia
scoreboard players reset @s gm4_use_shovel_gol
scoreboard players reset @s gm4_use_shovel_iro
scoreboard players reset @s gm4_use_shovel_sto
scoreboard players reset @s gm4_use_shovel_woo
