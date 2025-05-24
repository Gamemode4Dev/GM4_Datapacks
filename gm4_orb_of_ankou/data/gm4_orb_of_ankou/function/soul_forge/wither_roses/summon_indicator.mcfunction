# @s = soul forge with an orb and shard
# run from soul_forge/wither_roses/steps

#calculate random position
execute store result storage gm4_orb_of_ankou:temp pos.x int 1 run random value -6..6
execute store result storage gm4_orb_of_ankou:temp pos.z int 1 run random value -6..6

#move the entity
execute summon marker run function gm4_orb_of_ankou:soul_forge/wither_roses/move_indicator with storage gm4_orb_of_ankou:temp pos
data remove storage gm4_orb_of_ankou:temp pos
