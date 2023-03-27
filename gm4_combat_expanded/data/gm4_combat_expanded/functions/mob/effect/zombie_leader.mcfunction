# replace Zombie leaders with replacement zombies
# @s = zombie leader
# at @s
# run from mob/mob_type/zombie

summon zombie ~ ~ ~ {Tags:["gm4_ce_extra_mob","gm4_ce_miniboss"],IsBaby:0b,CanBreakDoors:1b}
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_ce_data 1
