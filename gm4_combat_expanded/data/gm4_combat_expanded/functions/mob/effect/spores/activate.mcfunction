# summon new zombie/husk/drowned when spore is grown
# @s = spore item
# at @s
# run from mob/effect/spores/advance

execute if data entity @s Item.tag{gm4_ce_spore:{type:zombie}} run summon zombie ~ ~ ~ {Tags:["gm4_ce_extra_mob","gm4_ce_spore_mob"]}
execute if data entity @s Item.tag{gm4_ce_spore:{type:husk}} run summon husk ~ ~ ~ {Tags:["gm4_ce_extra_mob","gm4_ce_spore_mob"]}
execute if data entity @s Item.tag{gm4_ce_spore:{type:drowned}} run summon drowned ~ ~ ~ {Tags:["gm4_ce_extra_mob","gm4_ce_spore_mob"]}

execute store result score $generation gm4_ce_data run data get entity @s Item.tag.gm4_ce_spore.generation

particle block flowering_azalea_leaves ~ ~1 ~ 0.35 1 0.35 0.1 32
playsound block.grass.break hostile @a ~ ~ ~ 0.6 0.6

kill @s

execute as @e[tag=gm4_ce_spore_mob,distance=..1] at @s run function gm4_combat_expanded:mob/effect/spores/set_generation
