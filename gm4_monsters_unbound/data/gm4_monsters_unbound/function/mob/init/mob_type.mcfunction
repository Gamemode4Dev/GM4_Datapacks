# check what mob is being processed
# @s = mobs that can be buffed
# at @s
# run from function call gm4_survival_refightalized:init_mob, from gm4_survival_refightalized:mob/init/initiate

# zombie, zombie_villager, husk, drowned
execute if entity @s[type=#gm4_survival_refightalized:zombie_types] run function gm4_monsters_unbound:mob/init/mob_type/zombie/base
# skeleton, bogged, stray
execute if entity @s[type=#gm4_survival_refightalized:skeleton_types] run function gm4_monsters_unbound:mob/init/mob_type/skeleton/base
execute if entity @s[type=spider] run function gm4_monsters_unbound:mob/init/mob_type/spider/spider
execute if entity @s[type=creeper] run function gm4_monsters_unbound:mob/init/mob_type/creeper/base
execute if entity @s[type=cave_spider] run function gm4_monsters_unbound:mob/init/mob_type/spider/cave_spider
execute if entity @s[type=slime] run function gm4_monsters_unbound:mob/init/mob_type/slime/base
execute if entity @s[type=magma_cube] run function gm4_monsters_unbound:mob/init/mob_type/slime/base
execute if entity @s[type=enderman] run function gm4_monsters_unbound:mob/init/mob_type/enderman/base
execute if entity @s[type=phantom] run function gm4_monsters_unbound:mob/init/mob_type/phantom/base
execute if entity @s[type=piglin] run function gm4_monsters_unbound:mob/init/mob_type/piglin/base
execute if entity @s[type=zombified_piglin] run function gm4_monsters_unbound:mob/init/mob_type/zombified_piglin/base
execute if entity @s[type=guardian] run function gm4_monsters_unbound:mob/init/mob_type/guardian/base
execute if entity @s[type=blaze] run function gm4_monsters_unbound:mob/init/mob_type/blaze/base
