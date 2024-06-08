# check what mob is being processed
# @s = mobs that can be buffed
# at @s
# run from function tag #gm4_ce_base:mob/init/modifiers

execute if entity @s[type=#gm4_ce_base:zombie_types] run function gm4_ce_base:mob/init/modifiers/type/zombie
execute if entity @s[type=skeleton] run function gm4_ce_base:mob/init/modifiers/type/skeleton
execute if entity @s[type=stray] run function gm4_ce_base:mob/init/modifiers/type/skeleton
execute if entity @s[type=slime] run function gm4_ce_base:mob/init/modifiers/type/slime
execute if entity @s[type=magma_cube] run function gm4_ce_base:mob/init/modifiers/type/slime
execute if entity @s[type=enderman] run function gm4_ce_base:mob/init/modifiers/type/enderman
execute if entity @s[type=wither_skeleton] run function gm4_ce_base:mob/init/modifiers/type/wither_skeleton
execute if entity @s[type=zombified_piglin] run function gm4_ce_base:mob/init/modifiers/type/zombified_piglin
