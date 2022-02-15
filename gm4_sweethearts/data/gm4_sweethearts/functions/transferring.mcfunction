# @s = sneaking player holding flower
# run from main

tag @s add gm4_sh_donor

# get max and current health of players
execute as @a[gamemode=!creative,gamemode=!spectator,distance=..3] run function gm4_sweethearts:get_health

# transfer health to nearest player
execute as @p[gamemode=!creative,gamemode=!spectator,tag=!gm4_sh_donor,distance=..3,predicate=gm4_sweethearts:not_sneaking] unless score @s gm4_sh_health >= @s gm4_sh_data at @s run function gm4_sweethearts:transfer_recipient 

tag @s remove gm4_sh_donor
