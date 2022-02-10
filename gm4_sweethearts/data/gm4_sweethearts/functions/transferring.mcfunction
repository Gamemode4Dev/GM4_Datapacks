# @s = sneaking player holding flower
# run from main

tag @s add gm4_sweethearts_donor

#get max health of player
execute as @a[gamemode=!creative,gamemode=!spectator,distance=..3] store result score @s gm4_sh_data run attribute @s minecraft:generic.max_health get

# transfer health to nearest player
execute as @p[gamemode=!creative,gamemode=!spectator,tag=!gm4_sweethearts_donor,distance=..3,predicate=gm4_sweethearts:not_sneaking] unless score @s gm4_health >= @s gm4_sh_data at @s run function gm4_sweethearts:transfer_recipient 

tag @s remove gm4_sweethearts_donor
