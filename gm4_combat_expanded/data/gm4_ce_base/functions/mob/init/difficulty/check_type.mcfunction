# check what mob is being processed
# @s = mobs that can be buffed
# at @s
# run from function tag #gm4_ce_base:mob/init/difficulty

execute if entity @s[type=pillager] run function gm4_ce_base:mob/init/difficulty/type/pillager
execute if entity @s[type=vindicator] run function gm4_ce_base:mob/init/difficulty/type/vindicator
execute if entity @s[type=evoker] run function gm4_ce_base:mob/init/difficulty/type/evoker
execute if entity @s[type=ravager] run function gm4_ce_base:mob/init/difficulty/type/ravager
