# run from main
# @s = mobs that can be buffed
# at @s

scoreboard players reset $mob_extras gm4_ai_data

# get difficulty score from the nearest player
scoreboard players operation $difficulty gm4_ai_data = @p[gamemode=!creative,gamemode=!spectator] gm4_ai_difficult

# reset scoreboards
scoreboard players set $mob_stats gm4_ai_data 0
scoreboard players set $mob_health gm4_ai_data 0
scoreboard players set $mob_damage gm4_ai_data 0
scoreboard players set $mob_speed gm4_ai_data 0
scoreboard players set $mob_armor gm4_ai_data 0
scoreboard players set $mob_toughness gm4_ai_data 0

# initialize different mobs
execute if entity @s[type=#gm4_armor_identification:zombie] run function gm4_armor_identification:mobs/zombie
execute if entity @s[type=husk] run function gm4_armor_identification:mobs/husk
execute if entity @s[type=drowned] run function gm4_armor_identification:mobs/drowned
execute if entity @s[type=skeleton] run function gm4_armor_identification:mobs/skeleton
execute if entity @s[type=stray] run function gm4_armor_identification:mobs/stray
execute if entity @s[type=spider] run function gm4_armor_identification:mobs/spider
execute if entity @s[type=cave_spider] run function gm4_armor_identification:mobs/cave_spider
execute if entity @s[type=#gm4_armor_identification:cubes] run function gm4_armor_identification:mobs/slime
execute if entity @s[type=enderman] run function gm4_armor_identification:mobs/enderman
execute if entity @s[type=phantom] run function gm4_armor_identification:mobs/phantom
execute if entity @s[type=wither_skeleton] run function gm4_armor_identification:mobs/wither_skeleton
execute if entity @s[type=piglin] run function gm4_armor_identification:mobs/piglin
execute if entity @s[type=zombified_piglin] run function gm4_armor_identification:mobs/zombified_piglin
execute if entity @s[type=ghast] run function gm4_armor_identification:mobs/ghast
execute if entity @s[type=blaze] run function gm4_armor_identification:mobs/blaze

# mark mob as processed
tag @s add gm4_ai_initiated
tag @s remove gm4_ai_extra_mob

# heal to max health
execute if predicate gm4_armor_identification:mobs/undead run effect give @s instant_damage 1 10 true
execute unless predicate gm4_armor_identification:mobs/undead run effect give @s instant_health 1 10 true

# process any spawned mobs
execute if score $mob_extras gm4_ai_data matches 1.. as @e[tag=gm4_ai_extra_mob] at @s run function gm4_armor_identification:mobs/initiate
