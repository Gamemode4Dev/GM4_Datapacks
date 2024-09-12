# detect interacting (right-click) on furniture
# @s = player interacting with furniture
# at @s
advancement revoke @s only gm4_furniture:interact_with_furniture

# find interaction entity that was interacted with
tag @s add gm4_furniture_target
execute as @e[type=interaction,tag=gm4_furniture,distance=..8] if data entity @s interaction at @s run function gm4_furniture:interact/process
tag @s remove gm4_furniture_target
