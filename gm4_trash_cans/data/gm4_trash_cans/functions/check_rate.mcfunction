# @s = trash_can that has items in it and has not been disabled
# run from update

# Set the rate of deletion
scoreboard players set @s gm4_trash_rate 0
execute if block ~ ~ ~ dropper[triggered=false] unless entity @p[distance=..15,gamemode=!spectator] run scoreboard players set @s gm4_trash_rate 16
execute if block ~ ~ ~ dropper[triggered=true] run scoreboard players set @s gm4_trash_rate 64

# Delete items in trashcan
execute if score @s gm4_trash_rate matches 1.. run function gm4_trash_cans:delete_items

