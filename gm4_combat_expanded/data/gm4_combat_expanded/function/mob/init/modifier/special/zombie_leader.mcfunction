# replace Zombie leaders with replacement zombies
# @s = zombie leader
# at @s
# run from mob/init/mob_type/zombie

execute if entity @s[type=zombie] run summon zombie ~ ~ ~ {Tags:["gm4_ce_extra_mob","gm4_ce_miniboss"],IsBaby:0b,CanBreakDoors:1b}
execute if entity @s[type=drowned] run summon drowned ~ ~ ~ {Tags:["gm4_ce_extra_mob","gm4_ce_miniboss"],IsBaby:0b,CanBreakDoors:1b}
execute if entity @s[type=husk] run summon husk ~ ~ ~ {Tags:["gm4_ce_extra_mob","gm4_ce_miniboss"],IsBaby:0b,CanBreakDoors:1b}
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_ce_data 1
scoreboard players set $replaced_mob gm4_ce_data 1
