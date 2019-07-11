#@s = alchemical crafters containing a recipe results
#Run from post_effects/random_events

#calculate random integer
summon area_effect_cloud ~ ~ ~ {Duration:1,CustomName:'"gm4_ee_curse_randomizer"',Tags:["gm4_ee_curse_randomizer"]}

execute store result score random_int gm4_ee_curse run data get entity @e[tag=gm4_ee_curse_randomizer,limit=1] UUIDMost 0.00000000023283064365386962890625

kill @e[tag=gm4_ee_curse_randomizer,limit=1]

scoreboard players set 100 gm4_ee_curse 100
scoreboard players operation random_int gm4_ee_curse %= 100 gm4_ee_curse

execute if score random_int gm4_ee_curse matches 0..39 run scoreboard players set lightning gm4_ee_curse 1

execute if score random_int gm4_ee_curse matches 40..79 run scoreboard players set cloud gm4_ee_curse 1

execute if score random_int gm4_ee_curse matches 80.. run scoreboard players add vex gm4_ee_curse 1
