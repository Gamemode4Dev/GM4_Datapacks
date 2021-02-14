# no @s.
# at world spawn
# called by init

# randomly marks flower types as poisonous on module installation

# initialise fixed values
scoreboard players set modulo gm4_zc_chorus 64
scoreboard players set divider gm4_zc_chorus 10

# copy seed to scoreboard
execute store result score seed gm4_zc_chorus run seed

# set chorus and popped chorus to a digit of the seed
scoreboard players operation required_chorus_fruit gm4_zc_chorus = seed gm4_zc_chorus
scoreboard players operation required_chorus_fruit gm4_zc_chorus /= divider gm4_zc_chorus
scoreboard players operation required_popped_chorus_fruit gm4_zc_chorus = required_chorus_fruit gm4_zc_chorus
scoreboard players operation required_popped_chorus_fruit gm4_zc_chorus /= divider gm4_zc_chorus

# scale down to 1-64 (mod64):
scoreboard players operation required_chorus_fruit gm4_zc_chorus %= modulo gm4_zc_chorus
scoreboard players operation required_popped_chorus_fruit gm4_zc_chorus %= modulo gm4_zc_chorus
scoreboard players add required_chorus_fruit gm4_zc_chorus 1
scoreboard players add required_popped_chorus_fruit gm4_zc_chorus 1

# count total
scoreboard players operation required_total gm4_zc_chorus = required_chorus_fruit gm4_zc_chorus
scoreboard players operation required_total gm4_zc_chorus += required_popped_chorus_fruit gm4_zc_chorus
