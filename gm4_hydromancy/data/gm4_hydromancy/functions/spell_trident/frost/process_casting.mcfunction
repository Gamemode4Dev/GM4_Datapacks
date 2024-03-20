
particle snowflake ~ ~1 ~ 2 2 2 0.05 2

scoreboard players add @s gm4_hy_duration 1
execute if score @s gm4_hy_duration matches 225.. run function gm4_hydromancy:spell_trident/frost/end_casting
