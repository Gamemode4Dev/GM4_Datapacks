# set flowering zombie stats
# @s = zombie
# at @s
# run from mob/mob_type/drowned
# run from mob/mob_type/husk
# run from mob/mob_type/zombie

execute unless score @s gm4_ce_generation matches 10.. run data modify entity @s ArmorDropChances[3] set value 2F
execute if biome ~ ~ ~ cherry_grove run tag @s add gm4_ce_spore_zombie.cherry
loot replace entity @s armor.head loot gm4_combat_expanded:mob/equip_armor/spore
execute store result entity @s ArmorItems[3].tag.gm4_ce_spore.generation int 1 run scoreboard players add @s gm4_ce_generation 1
