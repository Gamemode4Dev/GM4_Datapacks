# check what mob is being processed
# @s = mobs that can be buffed
# at @s
# run from mob/init/initiate

# zombie, zombie_villager, husk, drowned
execute if entity @s[type=#gm4_survival_refightalized:zombie_types] run return run function gm4_survival_refightalized:mob/init/mob_type/zombie
# skeleton, bogged, stray
execute if entity @s[type=#gm4_survival_refightalized:skeleton_types] run return run function gm4_survival_refightalized:mob/init/mob_type/skeleton
execute if entity @s[type=spider] run return run function gm4_survival_refightalized:mob/init/mob_type/spider
execute if entity @s[type=creeper] run return run function gm4_survival_refightalized:mob/init/mob_type/creeper
execute if entity @s[type=cave_spider] run return run function gm4_survival_refightalized:mob/init/mob_type/spider
execute if entity @s[type=enderman] run return run function gm4_survival_refightalized:mob/init/mob_type/enderman
execute if entity @s[type=phantom] run return run function gm4_survival_refightalized:mob/init/mob_type/phantom
execute if entity @s[type=wither_skeleton] run return run function gm4_survival_refightalized:mob/init/mob_type/skeleton
execute if entity @s[type=piglin] run return run function gm4_survival_refightalized:mob/init/mob_type/piglin
execute if entity @s[type=zombified_piglin] run return run function gm4_survival_refightalized:mob/init/mob_type/zombified_piglin
