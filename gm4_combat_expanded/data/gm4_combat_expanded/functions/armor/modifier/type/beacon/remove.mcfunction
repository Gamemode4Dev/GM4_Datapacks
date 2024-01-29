# remove beacon that is no longer linked to a player
# @s = beacon block_display
# at @s
# run from tick

# remove light block
execute if entity @s[tag=gm4_ce_beacon.main] positioned ~ ~-1 ~ unless entity @e[type=marker,tag=gm4_ce_beacon.store_light,distance=..0.5] run fill ~ ~ ~ ~ ~ ~ air replace light[waterlogged=false,level=14]
execute if entity @s[tag=gm4_ce_beacon.main] positioned ~ ~-1 ~ unless entity @e[type=marker,tag=gm4_ce_beacon.store_light,distance=..0.5] run fill ~ ~ ~ ~ ~ ~ water replace light[waterlogged=true,level=9]
execute if entity @s[tag=gm4_ce_beacon.main] positioned ~ ~-1 ~ run kill @e[type=marker,tag=gm4_ce_beacon.store_light,distance=..0.5]

kill @s
