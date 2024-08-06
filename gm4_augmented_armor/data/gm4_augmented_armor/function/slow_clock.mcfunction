schedule function gm4_augmented_armor:slow_clock 30s

# cleanup totems
execute as @e[type=armor_stand,tag=gm4_aa_totem] at @s unless entity @a[distance=..32,gamemode=!spectator] run function gm4_augmented_armor:armor/modifier/type/totem/remove
execute as @e[type=block_display,tag=gm4_aa_totem_display] at @s unless entity @e[type=armor_stand,tag=gm4_aa_totem,distance=..5] run kill @s

# cleanup beacon light markers
execute as @e[type=marker,tag=gm4_aa_beacon.store_light] at @s unless entity @e[type=block_display,tag=gm4_aa_beacon,distance=..5] run kill @s
