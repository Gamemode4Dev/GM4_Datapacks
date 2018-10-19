#@s = unchecked arrows in ground
#runs by dest_arrows:main

#adds checked tag
tag @s add gm4_dest_arrows_checked

#runs function on all sides of arrows to change blocks
execute positioned ~0.1 ~ ~ run function dest_arrows:run/check_block
execute positioned ~-0.1 ~ ~ run function dest_arrows:run/check_block
execute positioned ~ ~0.1 ~ run function dest_arrows:run/check_block
execute positioned ~ ~-0.1 ~ run function dest_arrows:run/check_block
execute positioned ~ ~ ~0.1 run function dest_arrows:run/check_block
execute positioned ~ ~ ~-0.1 run function dest_arrows:run/check_block