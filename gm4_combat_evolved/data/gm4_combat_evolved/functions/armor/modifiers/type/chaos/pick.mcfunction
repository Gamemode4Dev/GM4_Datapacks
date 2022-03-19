# run from slow_clock

# get a random number between 1-21
execute store result score $chaos gm4_ce_data run data get entity @r UUID[0]
scoreboard players operation $chaos gm4_ce_data %= #21 gm4_ce_data

# oh dear
execute if score $chaos gm4_ce_data matches 1

