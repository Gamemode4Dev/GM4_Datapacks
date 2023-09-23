# summon new zombie/husk/drowned when spore is grown
# @s = spore item
# at @s
# run from mob/effect/spores/advance

summon zombie ~ ~ ~ {Tags:["gm4_ce_extra_mob","gm4_ce_spore_mob"]}
execute if entity @s[nbt={Item:{id:"minecraft:cherry_leaves"}}] run tag @e[type=zombie,limit=1,sort=nearest,tag=gm4_ce_spore_mob] add gm4_ce_spore_zombie.cherry

execute store result score $generation gm4_ce_data run data get entity @s Item.tag.gm4_ce_spore.generation

particle block flowering_azalea_leaves ~ ~1 ~ 0.35 1 0.35 0.1 32
playsound block.grass.break hostile @a ~ ~ ~ 0.6 0.6

kill @s

execute as @e[tag=gm4_ce_spore_mob,distance=..1] at @s run function gm4_combat_expanded:mob/effect/spores/set_generation
