# summon new zombie/husk/drowned when spore is grown
# @s = spore item
# at @s
# run from mobs/effects/spores/advance

execute if data entity @s Item.tag{gm4_ce_spore:zombie} run summon zombie ~ ~ ~ {Tags:["gm4_ce_extra_mob","gm4_ce_spore_mob"]}
execute if data entity @s Item.tag{gm4_ce_spore:husk} run summon husk ~ ~ ~ {Tags:["gm4_ce_extra_mob","gm4_ce_spore_mob"]}
execute if data entity @s Item.tag{gm4_ce_spore:drowned} run summon drowned ~ ~ ~ {Tags:["gm4_ce_extra_mob","gm4_ce_spore_mob"]}

particle block flowering_azalea_leaves ~ ~1 ~ 0.35 1 0.35 0.1 32
playsound block.grass.break hostile @a ~ ~ ~ 0.6 0.6

kill @s

execute as @e[tag=gm4_ce_extra_mob] at @s run function gm4_combat_expanded:mobs/initiate
