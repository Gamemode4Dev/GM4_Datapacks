# run smeltery in lit state
# @s = smeltery marker
# run from process

execute unless entity @s[tag=gm4_smeltery_lit] positioned ~ ~-0.3 ~ run item replace entity @e[type=armor_stand,tag=gm4_smeltery_stand,distance=..0.1,limit=1] armor.head with iron_block{CustomModelData:3420003}
tag @s add gm4_smeltery_lit

particle large_smoke ~ ~ ~ 0 0.3 0 0 5 normal @a
execute if block ^ ^1 ^-1 #gm4:air if block ^ ^ ^-1 #gm4_smelteries:valid_cauldron if block ^1 ^ ^ iron_block if block ^1 ^ ^-1 iron_block if block ^1 ^ ^-2 iron_block if block ^ ^ ^-2 iron_block if block ^-1 ^ ^ iron_block if block ^-1 ^ ^-1 iron_block if block ^-1 ^ ^-2 iron_block if block ^1 ^1 ^ iron_block if block ^1 ^1 ^-1 iron_block if block ^1 ^1 ^-2 iron_block if block ^ ^1 ^-2 iron_block if block ^-1 ^1 ^ iron_block if block ^-1 ^1 ^-1 iron_block if block ^-1 ^1 ^-2 iron_block run function gm4_smelteries:smelt/check_cook_time
