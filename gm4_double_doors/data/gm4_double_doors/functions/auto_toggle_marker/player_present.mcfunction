# test if a player has entered the space previously occupied by the door's collision box
# @s = marker entity with the gm4_double_doors_auto_toggle_marker tag
# at @s align xyz
# run as conditional check from gm4_double_doors:auto_toggle_marker/maintain

execute if entity @s[tag=gm4_double_doors_collision_box_east] as @a[dx=0,dy=1,dz=0,limit=1,gamemode=!spectator] positioned ~0.8125 ~ ~ if entity @s[dx=0,dy=1,dz=0] run return 1
execute if entity @s[tag=gm4_double_doors_collision_box_north] as @a[dx=0,dy=1,dz=0,limit=1,gamemode=!spectator] positioned ~ ~ ~-0.8125 if entity @s[dx=0,dy=1,dz=0] run return 1
execute if entity @s[tag=gm4_double_doors_collision_box_south] as @a[dx=0,dy=1,dz=0,limit=1,gamemode=!spectator] positioned ~ ~ ~0.8125 if entity @s[dx=0,dy=1,dz=0] run return 1
execute if entity @s[tag=gm4_double_doors_collision_box_west] as @a[dx=0,dy=1,dz=0,limit=1,gamemode=!spectator] positioned ~-0.8125 ~ ~ if entity @s[dx=0,dy=1,dz=0] run return 1

# no match -> no player has entered the space
return fail
