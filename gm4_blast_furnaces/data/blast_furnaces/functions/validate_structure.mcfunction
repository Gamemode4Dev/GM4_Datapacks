tag @s remove gm4_blast_furnace_valid
execute if block ^ ^ ^1 furnace if block ^-1 ^ ^1 iron_block if block ^-1 ^ ^ iron_block if block ^-1 ^ ^-1 iron_block if block ^ ^ ^-1 iron_block if block ^1 ^ ^-1 iron_block if block ^1 ^ ^ iron_block if block ^1 ^ ^1 iron_block if block ^-1 ^1 ^1 iron_block if block ^-1 ^1 ^ iron_block if block ^-1 ^1 ^-1 iron_block if block ^ ^1 ^-1 iron_block if block ^1 ^1 ^-1 iron_block if block ^1 ^1 ^ iron_block if block ^1 ^1 ^1 iron_block run tag @s add gm4_blast_furnace_valid

data merge entity @s[tag=!gm4_blast_furnace_valid] {ArmorItems:[{},{},{},{}]}
