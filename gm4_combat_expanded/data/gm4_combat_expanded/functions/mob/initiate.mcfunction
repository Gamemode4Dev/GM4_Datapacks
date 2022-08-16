# initiate newly spawned mobs (mobs without any tags)
# @s = mobs that can be buffed
# at @s
# run from mob/check_mob

# get difficulty score from the nearest player
scoreboard players operation $difficulty gm4_ce_data = @p[gamemode=!spectator] gm4_ce_difficult

# reset scoreboards
scoreboard players reset $mob_extras gm4_ce_data
scoreboard players set $mob_stats gm4_ce_data 0
scoreboard players set $mob_health gm4_ce_data 0
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 0
scoreboard players set $mob_armor gm4_ce_data 0
scoreboard players set $mob_toughness gm4_ce_data 0

# initialize different mobs
execute if entity @s[type=zombie] run function gm4_combat_expanded:mob/mob_type/zombie
execute if entity @s[type=zombie_villager] run function gm4_combat_expanded:mob/mob_type/zombie
execute if entity @s[type=husk] run function gm4_combat_expanded:mob/mob_type/husk
execute if entity @s[type=drowned] run function gm4_combat_expanded:mob/mob_type/drowned
execute if entity @s[type=skeleton] run function gm4_combat_expanded:mob/mob_type/skeleton
execute if entity @s[type=stray] run function gm4_combat_expanded:mob/mob_type/stray
execute if entity @s[type=spider] run function gm4_combat_expanded:mob/mob_type/spider
execute if entity @s[type=cave_spider] run function gm4_combat_expanded:mob/mob_type/cave_spider
execute if entity @s[type=creeper] run function gm4_combat_expanded:mob/mob_type/creeper
execute if entity @s[type=slime] run function gm4_combat_expanded:mob/mob_type/slime
execute if entity @s[type=magma_cube] run function gm4_combat_expanded:mob/mob_type/slime
execute if entity @s[type=enderman] run function gm4_combat_expanded:mob/mob_type/enderman
execute if entity @s[type=phantom] run function gm4_combat_expanded:mob/mob_type/phantom
execute if entity @s[type=wither_skeleton] run function gm4_combat_expanded:mob/mob_type/wither_skeleton
execute if entity @s[type=piglin] run function gm4_combat_expanded:mob/mob_type/piglin
execute if entity @s[type=zombified_piglin] run function gm4_combat_expanded:mob/mob_type/zombified_piglin
execute if entity @s[type=ghast] run function gm4_combat_expanded:mob/mob_type/ghast
execute if entity @s[type=blaze] run function gm4_combat_expanded:mob/mob_type/blaze
execute if entity @s[type=#gm4_combat_expanded:basic_modifiers_only] run function gm4_combat_expanded:mob/mob_type/other

# heal to max health
effect give @s[type=#gm4_combat_expanded:undead] instant_damage 1 10 true
effect give @s[type=!#gm4_combat_expanded:undead] instant_health 1 10 true

# process any spawned mobs
execute if score $mob_extras gm4_ce_data matches 1.. unless entity @s[tag=gm4_ce_extra_mob] as @e[tag=gm4_ce_extra_mob] at @s run function gm4_combat_expanded:mob/initiate
tag @s remove gm4_ce_extra_mob

# mark mob as initiated
tag @s add gm4_ce_processed
