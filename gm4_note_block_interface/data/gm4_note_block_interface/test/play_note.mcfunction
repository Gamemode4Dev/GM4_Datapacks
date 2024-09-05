# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5

setblock ~1 ~1 ~1 note_block
execute at @s run tp @s ~ ~ ~ facing ~ ~-1 ~1
# fake click a note block
scoreboard players add @s gm4_nbi_play 1

await entity @e[type=area_effect_cloud,tag=gm4_nbi_display] inside
