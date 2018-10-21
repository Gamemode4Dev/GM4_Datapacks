#@s = unchecked arrows in ground
#runs by dest_arrows:main

#adds checked tag
tag @s add gm4_dest_arrows_checked

#turns colour to -1 to fix a weird bug... grrr
data merge entity @s {Color:-1}

#runs function on all sides of arrows to change blocks
execute positioned ~0.1 ~ ~ run function dest_arrows:run/check_block
execute positioned ~-0.1 ~ ~ run function dest_arrows:run/check_block
execute positioned ~ ~0.1 ~ run function dest_arrows:run/check_block
execute positioned ~ ~-0.1 ~ run function dest_arrows:run/check_block
execute positioned ~ ~ ~0.1 run function dest_arrows:run/check_block
execute positioned ~ ~ ~-0.1 run function dest_arrows:run/check_block