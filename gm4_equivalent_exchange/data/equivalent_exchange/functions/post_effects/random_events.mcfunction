#@s = alchemical crafters containing a recipe results
#Run from post_effects/apply_multiplier

#check fail multiplier
execute store result score fail_increase gm4_ee_curse run data get block ~ ~ ~ Items[1].tag.gm4_alchemical_crafters.fail_increase

#calculate random integer
summon area_effect_cloud ~ ~ ~ {Duration:1,CustomName:"\"gm4_ee_curse_randomizer\"",Tags:["gm4_ee_curse_randomizer"]}

execute store result score random_int gm4_ee_curse run data get entity @e[tag=gm4_ee_curse_randomizer,limit=1] UUIDMost 0.00000000023283064365386962890625

kill @e[tag=gm4_ee_curse_randomizer,limit=1]

scoreboard players set 100 gm4_ee_curse 100
scoreboard players operation random_int gm4_ee_curse %= 100 gm4_ee_curse
scoreboard players add random_int gm4_ee_curse 1

scoreboard players operation random_int gm4_ee_curse += fail_increase gm4_ee_curse
execute if entity @a[distance=..6,scores={gm4_ee_curse=50..}] run scoreboard players add random_int gm4_ee_curse 50

execute if score random_int gm4_ee_curse matches 65.. run function equivalent_exchange:post_effects/curse_check

#player curse
execute as @a[distance=..6] unless score @s gm4_ee_curse matches 60.. run scoreboard players add @s gm4_ee_curse 1
execute as @a[distance=..6,scores={gm4_ee_curse=50..}] at @s run function equivalent_exchange:post_effects/curse_player_check

scoreboard players remove @s gm4_ee_curse 1
execute if score @s gm4_ee_curse matches 1.. run function equivalent_exchange:post_effects/random_events
