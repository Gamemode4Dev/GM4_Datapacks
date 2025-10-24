# check what mob is being processed
# @s = mobs that can be buffed
# at @s
# run from mob/init/initiate

# these are reset to 0, otherwise if the spawn function fails it can cause a crash due constantly increasing scores
scoreboard players set $mob_health gm4_sr_data 0
scoreboard players set $mob_damage gm4_sr_data 0
scoreboard players set $mob_speed gm4_sr_data 0

# zombie, zombie_villager, husk, drowned
execute if entity @s[type=#gm4_survival_refightalized:zombie_types] run return run function gm4_survival_refightalized:mob/init/mob_type/zombie
# skeleton, bogged, stray
execute if entity @s[type=#gm4_survival_refightalized:skeleton_types,type=!wither_skeleton] run return run function gm4_survival_refightalized:mob/init/mob_type/skeleton
execute if entity @s[type=spider] run return run function gm4_survival_refightalized:mob/init/mob_type/spider
execute if entity @s[type=creeper] run return run function gm4_survival_refightalized:mob/init/mob_type/creeper
execute if entity @s[type=cave_spider] run return run function gm4_survival_refightalized:mob/init/mob_type/spider
execute if entity @s[type=enderman] run return run function gm4_survival_refightalized:mob/init/mob_type/enderman
execute if entity @s[type=wither_skeleton] run return run function gm4_survival_refightalized:mob/init/mob_type/wither_skeleton
execute if entity @s[type=phantom] run return run function gm4_survival_refightalized:mob/init/mob_type/phantom
execute if entity @s[type=piglin] run return run function gm4_survival_refightalized:mob/init/mob_type/piglin
execute if entity @s[type=piglin_brute] run return run function gm4_survival_refightalized:mob/init/mob_type/piglin_brute
execute if entity @s[type=zombified_piglin] run return run function gm4_survival_refightalized:mob/init/mob_type/zombified_piglin
execute if entity @s[type=silverfish] run return run function gm4_survival_refightalized:mob/init/mob_type/silverfish
