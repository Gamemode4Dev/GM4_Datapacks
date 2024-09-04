# process totems
# @s = totem armor stand
# at @s
# run from clocks/temp/totem

execute unless entity @a[distance=..32,gamemode=!spectator] run return run function gm4_augmented_armor:armor/augment/type/totem/remove

tp @s ~ ~ ~ ~90 ~
playsound minecraft:block.radiant.ambient block @a ~ ~ ~ 0.4 2
playsound minecraft:block.radiant.ambient block @a ~ ~ ~ 0.8 0.6

execute if entity @s[tag=gm4_aa_totem.freezing] run function gm4_augmented_armor:armor/augment/type/totem/freezing/run
execute if entity @s[tag=gm4_aa_totem.haste] run function gm4_augmented_armor:armor/augment/type/totem/haste/run
execute if entity @s[tag=gm4_aa_totem.healing] run function gm4_augmented_armor:armor/augment/type/totem/healing/run
execute if entity @s[tag=gm4_aa_totem.strength] run function gm4_augmented_armor:armor/augment/type/totem/strength/run

execute if entity @s[tag=gm4_aa_totem.freezing] run particle entity_effect{color:[0.56,0.27,0.93,0.33]} ~ ~1.2 ~ 0.1 0.1 0.1 0.05 12
execute if entity @s[tag=gm4_aa_totem.haste] run particle entity_effect{color:[0.2,0.92,1.0,0.33]} ~ ~1.2 ~ 0.1 0.1 0.1 0.05 12
execute if entity @s[tag=gm4_aa_totem.healing] run particle entity_effect{color:[0.8,0.36,0.67,0.33]} ~ ~1.2 ~ 0.1 0.1 0.1 0.05 12
execute if entity @s[tag=gm4_aa_totem.strength] run particle entity_effect{color:[1.0,0.78,0.0,0.33]} ~ ~1.2 ~ 0.1 0.1 0.1 0.05 12

scoreboard players set $keep_tick.totem gm4_aa_keep_tick 1
