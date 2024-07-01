# update age for some mobs
# @s = none
# located at world spawn
# run from aging_clock

# if age_count is less than 100, age one mob with that chance
execute if score $age_count gm4_es_data matches 1..99 run function gm4_everstone:aging/single

# if age_count is greater than or equal to 100, age one mob then reiterate
execute if score $age_count gm4_es_data matches 100.. run function gm4_everstone:aging/multiple
