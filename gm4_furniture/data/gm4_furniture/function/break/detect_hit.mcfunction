# detect hitting a furniture
# @s = player punching furniture
# at @s
advancement revoke @s only gm4_furniture:hit_furniture

# mark if the player is in creative mode
execute store success score $creative gm4_furniture_data if entity @s[gamemode=creative]

# mark if the player is holding a paintbrush in their mainhand
execute store success score $get_color gm4_furniture_data if entity @s[predicate=gm4_furniture:holding_paintbrush]

# locate the hit furniture
tag @s add gm4_furniture_target
execute as @e[type=interaction,tag=gm4_furniture,distance=..8] if data entity @s attack at @s run function gm4_furniture:break/find_main
tag @s remove gm4_furniture_target
