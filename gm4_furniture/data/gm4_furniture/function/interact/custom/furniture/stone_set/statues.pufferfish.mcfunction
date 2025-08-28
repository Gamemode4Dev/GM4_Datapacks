# 2% chance to play an animal sound
# @s = interacted furniture's item display
# at @s
# run from interact/custom/resolve_function

execute if predicate gm4_furniture:chance/animal_statue_sound run playsound entity.puffer_fish.blow_up block @a[distance=..16] ~ ~ ~ 1 0.95
scoreboard players set $interaction_processed gm4_furniture_data 1
