schedule function gm4_augmented_armor:slow_clock 30s

# cleanup totems
execute as @e[type=armor_stand,tag=gm4_aa_totem] at @s unless entity @a[distance=..32,gamemode=!spectator] run function gm4_augmented_armor:armor/augment/type/totemic/remove
execute as @e[type=block_display,tag=gm4_aa_totem_display] at @s unless entity @e[type=armor_stand,tag=gm4_aa_totem,distance=..5] run kill @s

# cleanup radiant light markers
execute as @e[type=marker,tag=gm4_aa_radiant.store_light] at @s unless entity @a[predicate=gm4_augmented_armor:modified_armor/augment/radiant,gamemode=!spectator,distance=..5] run function gm4_augmented_armor:armor/augment/type/radiant/remove
