# @s = trash_can
# run from check_disable

# Netherite items can not be burned
tag @s add gm4_trash_disable
execute unless data block ~ ~ ~ Items.[{id:"minecraft:netherite_helmet"}] unless data block ~ ~ ~ Items.[{id:"minecraft:netherite_chestplate"}] unless data block ~ ~ ~ Items.[{id:"minecraft:netherite_leggings"}] unless data block ~ ~ ~ Items.[{id:"minecraft:netherite_boots"}] unless data block ~ ~ ~ Items.[{id:"minecraft:netherite_sword"}] unless data block ~ ~ ~ Items.[{id:"minecraft:netherite_shovel"}] unless data block ~ ~ ~ Items.[{id:"minecraft:netherite_pickaxe"}] unless data block ~ ~ ~ Items.[{id:"minecraft:netherite_axe"}] unless data block ~ ~ ~ Items.[{id:"minecraft:netherite_hoe"}] unless data block ~ ~ ~ Items.[{id:"minecraft:ancient_debris"}] unless data block ~ ~ ~ Items.[{id:"minecraft:netherite_scrap"}] unless data block ~ ~ ~ Items.[{id:"minecraft:netherite_ingot"}] unless data block ~ ~ ~ Items.[{id:"minecraft:netherite_block"}] run tag @s remove gm4_trash_disable

# Visuals
execute if entity @s[tag=gm4_trash_disable] run particle minecraft:angry_villager ~ ~.5 ~ 0 0 0 1 1

# Change Tag
tag @s[tag=gm4_trash_disable] add gm4_trash_disabled
tag @s[tag=gm4_trash_disable] remove gm4_trash_disable