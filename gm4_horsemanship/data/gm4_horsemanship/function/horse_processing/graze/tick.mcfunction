# process grazing gm4_horses
# @s = unspecified
# at unspecified
# schedule from horse_processing/graze/start
# schedule from here

execute as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse.grazing,nbt={EatingHaystack:0b}] at @s run function gm4_horsemanship:horse_processing/graze/complete
execute if entity @e[type=#gm4_horsemanship:trainable,tag=gm4_horse.grazing] run schedule function gm4_horsemanship:horse_processing/graze/tick 1t
