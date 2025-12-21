# transfers item data to display entity, kills marker
# @s = type=minecraft:marker, tag=gm4_blossoming_pots.data.flower_pot
# at @s
# run from upgrade_paths/3.4

data modify entity @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.flower_pot.0,distance=..0.1,limit=1] data.gm4_blossoming_pots.Item set from entity @s data.gm4_blossoming_pots

kill @s
