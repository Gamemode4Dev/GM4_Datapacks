# set flowering zombie stats
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie

# in cherry grove make stronger spore zombie
execute if biome ~ ~ ~ cherry_grove run tag @s add gm4_ce_spore_zombie.cherry

# put spore on head and store generation
loot replace entity @s armor.head loot gm4_combat_expanded:mob/equip_armor/spore
execute store result entity @s ArmorItems[3].components."minecraft:custom_data".gm4_ce_spore.generation int 1 run scoreboard players add @s gm4_ce_generation 1

# let generation determine dropchance of spore
scoreboard players set $spore_dropchange gm4_ce_data 11
execute store result entity @s ArmorDropChances[3] float 0.1 run scoreboard players operation $spore_dropchange gm4_ce_data -= @s gm4_ce_generation
