# Drop the correct swing item
# @s = Item display, swing main body
# at @s
# run from gm4_swings:break/main
# with $type = Type of swing to drop

$execute align xyz run loot spawn ~0.5 ~0.5 ~0.5 loot gm4_swings:swings/$(type)
