# process coral cores (30s)
# @s = coral core
# at @s
# run from clock_coral_core

# vfx
particle bubble_column_up ~ ~-.5 ~ 0.25 0.1 0.25 0.3 64
particle minecraft:bubble ~ ~-0.48 ~ 0.15 0.05 0.15 0.5 16
playsound minecraft:block.bubble_column.whirlpool_ambient block @a[distance=..12] ~ ~-.5 ~ 1 1.5
playsound minecraft:block.bubble_column.upwards_inside block @a[distance=..12] ~ ~-.5 ~ 0.6 0

# tag up to 6 local fish with a goal
execute positioned ~-7.5 ~-1.5 ~-7.5 as @e[type=tropical_fish,tag=!gm4_hy_tracked_fish,limit=6,sort=random,dx=14,dy=7,dz=14,tag=!smithed.strict] run function gm4_hydromancy:fish/tag

# growth only happens during daytime (05:00 - 19:00)
execute if predicate gm4_hydromancy:daytime positioned ~-7 ~7 ~-7 summon marker run function gm4_hydromancy:coral_core/growth/pick_location
