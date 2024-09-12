# 2% chance to play an animal sound
# @s = furniture's interacted interaction entity 
# at @s
# run from interact/custom/resolve_function

execute if predicate gm4_furniture:chance/animal_statue_sound run playsound entity.bee.loop block @a[distance=..16] ~ ~ ~ 1 0.95
scoreboard players set $interaction_processed gm4_furniture_data 1
