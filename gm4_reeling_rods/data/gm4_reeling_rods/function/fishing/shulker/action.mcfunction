# Action for reeled shulker
# @s = shulker
# at @s
# run from gm4_reeling_rods:fishing/shulker/adv

execute facing entity @a[tag=gm4_reeling_rods.player,distance=..33,limit=1] eyes run tp @s ^ ^ ^1
