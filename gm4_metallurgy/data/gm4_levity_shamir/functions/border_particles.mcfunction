#@s = gm4_levity_epicenter cloud at @s
#run from find_floating_players

particle end_rod ^ ^1 ^16 0 0 0 0.01 1 normal @a[tag=gm4_has_levity,scores={gm4_levity_sneak=1..}]
particle end_rod ^13.856 ^1 ^-8 0 0 0 0.01 1 normal @a[tag=gm4_has_levity,scores={gm4_levity_sneak=1..}]
particle end_rod ^-13.856 ^1 ^-8 0 0 0 0.01 1 normal @a[tag=gm4_has_levity,scores={gm4_levity_sneak=1..}]
teleport @s ~ ~ ~ ~1 ~
