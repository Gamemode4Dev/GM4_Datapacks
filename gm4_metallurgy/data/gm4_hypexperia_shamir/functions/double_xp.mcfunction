# run from hypexperia:find_orbs
# @s = experience orb that hasn't been doubled yet

execute store result score xp_value gm4_ml_data run data get entity @s Value 1
execute if score xp_value gm4_ml_data matches 1..12 store result entity @s Value short 2 run scoreboard players get xp_value gm4_ml_data
execute if score xp_value gm4_ml_data matches 1..12 run particle totem_of_undying ~ ~0.2 ~ 0 0 0 0.2 10
execute if score xp_value gm4_ml_data matches 1..12 run playsound block.note_block.xylophone player @a ~ ~ ~ 0.1 0.3
tag @s add gm4_doubled_xp
