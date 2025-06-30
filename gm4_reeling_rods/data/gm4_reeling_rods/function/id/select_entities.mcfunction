# selects entities to assign an id and schedules the loop to run again
# @s = fishing_bobber
# at @s
# run from id/loop 

# set new id tags if needed
# distance from bobber to entity is ..42 as that represents a vanilla entity of 3.28 blocks tall at a max of 16x scale and then 80% of the height to find the fishing bobber
execute as @e[type=!#gm4_reeling_rods:ignore,tag=!gm4_reeling_rods.id.tagged,distance=..42] at @s run function gm4_reeling_rods:id/set

# schedule again, since bobber still exists
schedule function gm4_reeling_rods:id/loop 2t
