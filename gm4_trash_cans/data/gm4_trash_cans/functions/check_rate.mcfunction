# @s = trash_can that has items in it and has not been disabled
# run from check_dropper

# Set the rate of deletion
execute if block ~ ~ ~ dropper[triggered=false] if entity @a[distance=..15,gamemode=!spectator] run scoreboard players set @s gm4_trash_rate 0
execute if block ~ ~ ~ dropper[triggered=false] unless entity @a[distance=..15,gamemode=!spectator] run scoreboard players set @s gm4_trash_rate 16
execute if block ~ ~ ~ dropper[triggered=true] run scoreboard players set @s gm4_trash_rate 64

# Visuals
execute if score @s gm4_trash_rate matches 1.. run particle lava ~ ~1 ~ 0 0 0 1 1

# Delete items in trashcan
function gm4_trash_cans:delete_items
