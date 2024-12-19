# process totems
# @s = totem armor stand
# at @s
# run from clocks/temp/totemic

execute unless entity @a[distance=..32,gamemode=!spectator] run return run function gm4_augmented_armor:armor/augment/type/totemic/remove

scoreboard players set $keep_tick.totemic gm4_aa_keep_tick 1

tp @s ~ ~ ~ ~90 ~
playsound minecraft:block.radiant.ambient block @a ~ ~ ~ 0.4 2
playsound minecraft:block.radiant.ambient block @a ~ ~ ~ 0.8 0.6

execute if entity @s[tag=gm4_aa_totem.freezing] run function gm4_augmented_armor:armor/augment/type/totemic/freezing/run
execute if entity @s[tag=gm4_aa_totem.haste] run function gm4_augmented_armor:armor/augment/type/totemic/haste/run
execute if entity @s[tag=gm4_aa_totem.healing] run function gm4_augmented_armor:armor/augment/type/totemic/healing/run
execute if entity @s[tag=gm4_aa_totem.strength] run function gm4_augmented_armor:armor/augment/type/totemic/strength/run

