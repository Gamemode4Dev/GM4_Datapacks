# @s = trash_can
# run from check_dropper

# Netherite items can not be burned
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_helmet"}] run tag @s add gm4_trash_disable
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_chestplate"}] run tag @s add gm4_trash_disable
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_leggings"}] run tag @s add gm4_trash_disable
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_boots"}] run tag @s add gm4_trash_disable
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_sword"}] run tag @s add gm4_trash_disable
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_shovel"}] run tag @s add gm4_trash_disable
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_pickaxe"}] run tag @s add gm4_trash_disable
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_axe"}] run tag @s add gm4_trash_disable
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_hoe"}] run tag @s add gm4_trash_disable
execute if data block ~ ~ ~ Items.[{id:"minecraft:ancient_debris"}] run tag @s add gm4_trash_disable
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_scrap"}] run tag @s add gm4_trash_disable
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_ingot"}] run tag @s add gm4_trash_disable
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_block"}] run tag @s add gm4_trash_disable

# Visuals
execute if entity @s[tag=gm4_trash_disable] run particle minecraft:angry_villager ~ ~.5 ~ 0 0 0 1 1

# Change Tag
tag @s[tag=gm4_trash_disable] add gm4_trash_disabled
tag @s[tag=gm4_trash_disable] remove gm4_trash_disable