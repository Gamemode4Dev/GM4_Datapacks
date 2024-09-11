# @s = wither_rose_catcher marker at @s
# run from soul_forge/wither_roses/summon_indicator

#move the AEC to the chosen x and z
execute at @s if score random_x gm4_oa_roses matches 8.. run tp @s ~8 ~ ~
execute if score random_x gm4_oa_roses matches 8.. run scoreboard players remove random_x gm4_oa_roses 8
execute at @s if score random_x gm4_oa_roses matches 4.. run tp @s ~4 ~ ~
execute if score random_x gm4_oa_roses matches 4.. run scoreboard players remove random_x gm4_oa_roses 4
execute at @s if score random_x gm4_oa_roses matches 2.. run tp @s ~2 ~ ~
execute if score random_x gm4_oa_roses matches 2.. run scoreboard players remove random_x gm4_oa_roses 2
execute at @s if score random_x gm4_oa_roses matches 1.. run tp @s ~1 ~ ~
execute if score random_x gm4_oa_roses matches 1.. run scoreboard players remove random_x gm4_oa_roses 1

execute at @s if score random_z gm4_oa_roses matches 8.. run tp @s ~ ~ ~8
execute if score random_z gm4_oa_roses matches 8.. run scoreboard players remove random_z gm4_oa_roses 8
execute at @s if score random_z gm4_oa_roses matches 4.. run tp @s ~ ~ ~4
execute if score random_z gm4_oa_roses matches 4.. run scoreboard players remove random_z gm4_oa_roses 4
execute at @s if score random_z gm4_oa_roses matches 2.. run tp @s ~ ~ ~2
execute if score random_z gm4_oa_roses matches 2.. run scoreboard players remove random_z gm4_oa_roses 2
execute at @s if score random_z gm4_oa_roses matches 1.. run tp @s ~ ~ ~1
execute if score random_z gm4_oa_roses matches 1.. run scoreboard players remove random_z gm4_oa_roses 1

#kill if not in air or on unsupported block
execute at @s if block ~ ~ ~ #gm4:no_collision unless block ~ ~-1 ~ #gm4:no_collision run tag @s add gm4_oa_rose_indicator_valid

kill @s[tag=!gm4_oa_rose_indicator_valid]

# play sound to indicate
execute at @s[tag=gm4_oa_rose_indicator_valid] run playsound minecraft:entity.wither.ambient block @a ~ ~ ~ 0.6 1.4
