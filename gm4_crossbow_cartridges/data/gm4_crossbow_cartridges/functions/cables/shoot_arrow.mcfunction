# Checks to shoot tripwire
# @s = player using the crossbow
# at arrow, align xyz positioned ~0.5 ~ ~0.5
# run from check_projectile

tag @s add gm4_cb_use

# store amount of string on the player, with max value of 40
execute store result score @s gm4_cb_string run data get entity @s Inventory[-1].Count

# check for tripwire hook on the player
execute store success score @s gm4_cb_tw_hook run clear @s minecraft:tripwire_hook 0

# reset score for string placed 
scoreboard players set @s gm4_cb_tw_length 0

# check for tripwire hook in player hitbox
execute if block ~ ~ ~ minecraft:tripwire_hook run function gm4_crossbow_cartridges:cables/determine_direction
execute unless block ~ ~ ~ minecraft:tripwire_hook positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:tripwire_hook run function gm4_crossbow_cartridges:cables/determine_direction
