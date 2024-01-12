# get lowest health between linked players
# @s = unspecified
# at unspecified
# run from armor/modifier/type/link/process/general

scoreboard players set $link.health gm4_ce_data 40
execute as @a[tag=gm4_ce_linked] run scoreboard players operation $link.health gm4_ce_data < @s gm4_ce_health
