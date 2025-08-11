# check what mob is being processed
# @s = mobs that can be buffed
# at @s
# run from function call gm4_survival_refightalized:init_mob, from gm4_survival_refightalized:mob/init/initiate

# zombie, zombie_villager, husk, drowned
execute if entity @s[type=#gm4_survival_refightalized:zombie_types] run return run function gm4_monsters_unbound:mob/init/mob_type/zombie/base
# skeleton, bogged, stray
execute if entity @s[type=#gm4_survival_refightalized:skeleton_types,type=!wither_skeleton] run return run function gm4_monsters_unbound:mob/init/mob_type/skeleton/base
execute if entity @s[type=spider] run return run function gm4_monsters_unbound:mob/init/mob_type/spider/spider
execute if entity @s[type=creeper] run return run function gm4_monsters_unbound:mob/init/mob_type/creeper/base
execute if entity @s[type=cave_spider] run return run function gm4_monsters_unbound:mob/init/mob_type/spider/cave_spider
execute if entity @s[type=enderman] run return run function gm4_monsters_unbound:mob/init/mob_type/enderman/base
