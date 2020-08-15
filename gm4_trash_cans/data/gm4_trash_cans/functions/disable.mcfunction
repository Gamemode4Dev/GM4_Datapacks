# @s = trash_can
# run from check_dropper

execute if block ~ ~-1 ~ water run tag @s add gm4_trash_wet
execute if block ~ ~1 ~ water run tag @s add gm4_trash_wet
execute if block ~-1 ~ ~ water run tag @s add gm4_trash_wet
execute if block ~1 ~ ~ water run tag @s add gm4_trash_wet
execute if block ~ ~ ~-1 water run tag @s add gm4_trash_wet
execute if block ~ ~ ~1 water run tag @s add gm4_trash_wet

execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_helmet"}] run tag @s add gm4_trash_exclude
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_chestplate"}] run tag @s add gm4_trash_exclude
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_leggings"}] run tag @s add gm4_trash_exclude
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_boots"}] run tag @s add gm4_trash_exclude
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_sword"}] run tag @s add gm4_trash_exclude
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_shovel"}] run tag @s add gm4_trash_exclude
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_pickaxe"}] run tag @s add gm4_trash_exclude
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_axe"}] run tag @s add gm4_trash_exclude
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_hoe"}] run tag @s add gm4_trash_exclude
execute if data block ~ ~ ~ Items.[{id:"minecraft:ancient_debris"}] run tag @s add gm4_trash_exclude
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_scrap"}] run tag @s add gm4_trash_exclude
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_ingot"}] run tag @s add gm4_trash_exclude
execute if data block ~ ~ ~ Items.[{id:"minecraft:netherite_block"}] run tag @s add gm4_trash_exclude

execute if entity @s[tag=gm4_trash_exclude] run particle minecraft:angry_villager ~ ~.5 ~ 0 0 0 1 1
execute if entity @s[tag=gm4_trash_wet] run particle dolphin ~ ~1.2 ~ .05 0 .05 0.1 3

tag @s[tag=gm4_trash_wet] add gm4_trash_disable
tag @s[tag=gm4_trash_wet] remove gm4_trash_wet
tag @s[tag=gm4_trash_exclude] add gm4_trash_disable
tag @s[tag=gm4_trash_exclude] remove gm4_trash_exclude