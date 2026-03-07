# process active furniture stations
# @s = furniture station villager
# at @s
# run from slow_clock

# reapply invisibility in case it was lost
effect give @s invisibility infinite 0 true

# check if there are still players close to actually trade
execute unless entity @a[distance=..12,gamemode=!spectator] run function gm4_furniture:technical/furniture_station/activation/turn_inactive
