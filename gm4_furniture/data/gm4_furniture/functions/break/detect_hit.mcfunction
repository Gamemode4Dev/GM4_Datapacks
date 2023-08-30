# detect hitting a furniture
# @s = player punching furniture
# at @s
advancement revoke @s only gm4_furniture:hit_furniture

# mark if the player is in creative mode
execute store success score $creative gm4_furniture_data if entity @s[gamemode=creative]

# locate the hit furniture
execute as @e[type=interaction,tag=gm4_furniture,distance=..8] if data entity @s attack at @s run function gm4_furniture:break/find_main
