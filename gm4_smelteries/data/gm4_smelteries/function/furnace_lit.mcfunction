# run smeltery in lit state
# @s = smeltery marker
# at @s
# run from process

execute unless entity @s[tag=gm4_smeltery_lit] run item replace entity @e[type=item_display,tag=gm4_smeltery_display,distance=..0.1,limit=1] contents with iron_block[custom_model_data={strings:["gm4_smelteries:block/smeltery_lit"]}]
tag @s add gm4_smeltery_lit

particle large_smoke ~ ~ ~ 0 0.3 0 0 5 normal @a
execute if block ^ ^1 ^-1 #minecraft:air if block ^ ^ ^-1 #gm4_smelteries:valid_cauldron if block ^1 ^ ^ iron_block if block ^1 ^ ^-1 iron_block if block ^1 ^ ^-2 iron_block if block ^ ^ ^-2 iron_block if block ^-1 ^ ^ iron_block if block ^-1 ^ ^-1 iron_block if block ^-1 ^ ^-2 iron_block if block ^1 ^1 ^ iron_block if block ^1 ^1 ^-1 iron_block if block ^1 ^1 ^-2 iron_block if block ^ ^1 ^-2 iron_block if block ^-1 ^1 ^ iron_block if block ^-1 ^1 ^-1 iron_block if block ^-1 ^1 ^-2 iron_block run function gm4_smelteries:smelt/check_cook_time
