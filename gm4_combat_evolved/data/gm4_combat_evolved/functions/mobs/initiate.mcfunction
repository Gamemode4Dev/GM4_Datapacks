# run from main
# @s = mobs that can be buffed
# at @s

scoreboard players reset $mob_extras gm4_ce_data

# get difficulty score from the nearest player
scoreboard players operation $difficulty gm4_ce_data = @p[gamemode=!spectator] gm4_ce_difficult

# reset scoreboards
scoreboard players set $mob_stats gm4_ce_data 0
scoreboard players set $mob_health gm4_ce_data 0
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 0
scoreboard players set $mob_armor gm4_ce_data 0
scoreboard players set $mob_toughness gm4_ce_data 0

# initialize different mobs
execute if entity @s[type=#gm4_combat_evolved:zombie] run function gm4_combat_evolved:mobs/zombie
execute if entity @s[type=husk] run function gm4_combat_evolved:mobs/husk
execute if entity @s[type=drowned] run function gm4_combat_evolved:mobs/drowned
execute if entity @s[type=skeleton] run function gm4_combat_evolved:mobs/skeleton
execute if entity @s[type=stray] run function gm4_combat_evolved:mobs/stray
execute if entity @s[type=spider] run function gm4_combat_evolved:mobs/spider
execute if entity @s[type=cave_spider] run function gm4_combat_evolved:mobs/cave_spider
execute if entity @s[type=creeper] run function gm4_combat_evolved:mobs/creeper
execute if entity @s[type=#gm4_combat_evolved:cubes] run function gm4_combat_evolved:mobs/slime
execute if entity @s[type=enderman] run function gm4_combat_evolved:mobs/enderman
execute if entity @s[type=phantom] run function gm4_combat_evolved:mobs/phantom
execute if entity @s[type=wither_skeleton] run function gm4_combat_evolved:mobs/wither_skeleton
execute if entity @s[type=piglin] run function gm4_combat_evolved:mobs/piglin
execute if entity @s[type=zombified_piglin] run function gm4_combat_evolved:mobs/zombified_piglin
execute if entity @s[type=ghast] run function gm4_combat_evolved:mobs/ghast
execute if entity @s[type=blaze] run function gm4_combat_evolved:mobs/blaze

# mark mob as processed
tag @s add gm4_ce_initiated
tag @s remove gm4_ce_extra_mob

# heal to max health
execute if predicate gm4_combat_evolved:mobs/undead run effect give @s instant_damage 1 10 true
execute unless predicate gm4_combat_evolved:mobs/undead run effect give @s instant_health 1 10 true

# process any spawned mobs
execute if score $mob_extras gm4_ce_data matches 1.. as @e[tag=gm4_ce_extra_mob] at @s run function gm4_combat_evolved:mobs/initiate
