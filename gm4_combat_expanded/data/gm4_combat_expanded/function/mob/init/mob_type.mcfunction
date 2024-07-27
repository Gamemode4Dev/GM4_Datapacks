# check what mob is being processed
# @s = mobs that can be buffed
# at @s
# run from mob/init/initiate

# zombie, zombie_villager, husk, drowned
execute if entity @s[type=#gm4_combat_expanded:zombie_types] run function gm4_combat_expanded:mob/init/mob_type/zombie/base
# skeleton, bogged, stray
execute if entity @s[type=#gm4_combat_expanded:skeleton_types] run function gm4_combat_expanded:mob/init/mob_type/skeleton/skeleton
execute if entity @s[type=spider] run function gm4_combat_expanded:mob/init/mob_type/spider/spider
execute if entity @s[type=creeper] run function gm4_combat_expanded:mob/init/mob_type/creeper/base
execute if entity @s[type=cave_spider] run function gm4_combat_expanded:mob/init/mob_type/spider/cave_spider
execute if entity @s[type=slime] run function gm4_combat_expanded:mob/init/mob_type/slime/base
execute if entity @s[type=magma_cube] run function gm4_combat_expanded:mob/init/mob_type/slime/base
execute if entity @s[type=enderman] run function gm4_combat_expanded:mob/init/mob_type/enderman/base
execute if entity @s[type=phantom] run function gm4_combat_expanded:mob/init/mob_type/phantom/base
execute if entity @s[type=wither_skeleton] run function gm4_combat_expanded:mob/init/mob_type/skeleton/wither_skeleton
execute if entity @s[type=piglin] run function gm4_combat_expanded:mob/init/mob_type/piglin/base
execute if entity @s[type=pillager] run function gm4_combat_expanded:mob/init/mob_type/raider/pillager
execute if entity @s[type=vindicator] run function gm4_combat_expanded:mob/init/mob_type/raider/vindicator
execute if entity @s[type=zombified_piglin] run function gm4_combat_expanded:mob/init/mob_type/zombified_piglin/base
execute if entity @s[type=hoglin] run function gm4_combat_expanded:mob/init/mob_type/hoglin/base
execute if entity @s[type=silverfish] run function gm4_combat_expanded:mob/init/mob_type/silverfish/base
execute if entity @s[type=guardian] run function gm4_combat_expanded:mob/init/mob_type/guardian/base
execute if entity @s[type=blaze] run function gm4_combat_expanded:mob/init/mob_type/blaze/base
execute if entity @s[type=evoker] run function gm4_combat_expanded:mob/init/mob_type/raider/evoker
execute if entity @s[type=ravager] run function gm4_combat_expanded:mob/init/mob_type/raider/ravager
execute if entity @s[type=zoglin] run function gm4_combat_expanded:mob/init/mob_type/hoglin/base
execute if entity @s[type=endermite] run function gm4_combat_expanded:mob/init/mob_type/silverfish/base

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
