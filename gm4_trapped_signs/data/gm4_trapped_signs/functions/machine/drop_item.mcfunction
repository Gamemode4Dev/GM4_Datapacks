# drops the trapped sign item
# @s = trapped sign marker
# located at @s
# run from gm4_trapped_signs:machine/destroy

execute if entity @s[tag=gm4_acacia_trapped_sign,tag=!gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/trapped_acacia_sign
execute if entity @s[tag=gm4_birch_trapped_sign,tag=!gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/trapped_birch_sign
execute if entity @s[tag=gm4_crimson_trapped_sign,tag=!gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/trapped_crimson_sign
execute if entity @s[tag=gm4_dark_oak_trapped_sign,tag=!gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/trapped_dark_oak_sign
execute if entity @s[tag=gm4_jungle_trapped_sign,tag=!gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/trapped_jungle_sign
execute if entity @s[tag=gm4_oak_trapped_sign,tag=!gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/trapped_oak_sign
execute if entity @s[tag=gm4_spruce_trapped_sign,tag=!gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/trapped_spruce_sign
execute if entity @s[tag=gm4_warped_trapped_sign,tag=!gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/trapped_warped_sign

execute if entity @s[tag=gm4_acacia_trapped_sign,tag=gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/secret_trapped_acacia_sign
execute if entity @s[tag=gm4_birch_trapped_sign,tag=gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/secret_trapped_birch_sign
execute if entity @s[tag=gm4_crimson_trapped_sign,tag=gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/secret_trapped_crimson_sign
execute if entity @s[tag=gm4_dark_oak_trapped_sign,tag=gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/secret_trapped_dark_oak_sign
execute if entity @s[tag=gm4_jungle_trapped_sign,tag=gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/secret_trapped_jungle_sign
execute if entity @s[tag=gm4_oak_trapped_sign,tag=gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/secret_trapped_oak_sign
execute if entity @s[tag=gm4_spruce_trapped_sign,tag=gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/secret_trapped_spruce_sign
execute if entity @s[tag=gm4_warped_trapped_sign,tag=gm4_secret_trapped_sign] run loot spawn ~ ~ ~ loot gm4_trapped_signs:items/secret_trapped_warped_sign
