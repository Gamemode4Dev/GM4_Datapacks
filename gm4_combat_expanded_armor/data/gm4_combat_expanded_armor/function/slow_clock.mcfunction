schedule function gm4_combat_expanded_armor:slow_clock 30s

# cleanup totems
execute as @e[type=armor_stand,tag=gm4_ce_totem] at @s unless entity @a[distance=..32,gamemode=!spectator] run function gm4_combat_expanded_armor:armor/modifier/type/totem/remove
execute as @e[type=block_display,tag=gm4_ce_totem_display] at @s unless entity @e[type=armor_stand,tag=gm4_ce_totem,distance=..5] run kill @s

# cleanup beacon light markers
execute as @e[type=marker,tag=gm4_ce_beacon.store_light] at @s unless entity @e[type=block_display,tag=gm4_ce_beacon,distance=..5] run kill @s
