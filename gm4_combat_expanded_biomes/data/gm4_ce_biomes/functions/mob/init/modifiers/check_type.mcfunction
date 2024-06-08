# check what mob is being processed
# @s = mobs that can be buffed
# at @s
# run from function tag #gm4_ce_base:mob/init/modifiers

# zombie, zombie_villager, husk, drowned
execute if entity @s[type=#gm4_ce_base:zombie_types] run function gm4_ce_biomes:mob/init/modifiers/type/zombie
execute if entity @s[type=skeleton] run function gm4_ce_biomes:mob/init/modifiers/type/skeleton
execute if entity @s[type=spider] run function gm4_ce_biomes:mob/init/modifiers/type/spider
execute if entity @s[type=creeper] run function gm4_ce_biomes:mob/init/modifiers/type/creeper
execute if entity @s[type=stray] run function gm4_ce_biomes:mob/init/modifiers/type/skeleton
execute if entity @s[type=cave_spider] run function gm4_ce_biomes:mob/init/modifiers/type/cave_spider
execute if entity @s[type=slime] run function gm4_ce_biomes:mob/init/modifiers/type/slime
execute if entity @s[type=magma_cube] run function gm4_ce_biomes:mob/init/modifiers/type/slime
execute if entity @s[type=enderman] run function gm4_ce_biomes:mob/init/modifiers/type/enderman
execute if entity @s[type=phantom] run function gm4_ce_biomes:mob/init/modifiers/type/phantom
execute if entity @s[type=wither_skeleton] run function gm4_ce_biomes:mob/init/modifiers/type/wither_skeleton
execute if entity @s[type=piglin] run function gm4_ce_biomes:mob/init/modifiers/type/piglin
execute if entity @s[type=pillager] run function gm4_ce_biomes:mob/init/modifiers/type/pillager
execute if entity @s[type=vindicator] run function gm4_ce_biomes:mob/init/modifiers/type/vindicator
execute if entity @s[type=zombified_piglin] run function gm4_ce_biomes:mob/init/modifiers/type/zombified_piglin
execute if entity @s[type=hoglin] run function gm4_ce_biomes:mob/init/modifiers/type/hoglin
execute if entity @s[type=silverfish] run function gm4_ce_biomes:mob/init/modifiers/type/silverfish
execute if entity @s[type=guardian] run function gm4_ce_biomes:mob/init/modifiers/type/guardian
execute if entity @s[type=blaze] run function gm4_ce_biomes:mob/init/modifiers/type/blaze
execute if entity @s[type=evoker] run function gm4_ce_biomes:mob/init/modifiers/type/evoker
execute if entity @s[type=ravager] run function gm4_ce_biomes:mob/init/modifiers/type/ravager
execute if entity @s[type=zoglin] run function gm4_ce_biomes:mob/init/modifiers/type/hoglin
execute if entity @s[type=endermite] run function gm4_ce_biomes:mob/init/modifiers/type/silverfish
