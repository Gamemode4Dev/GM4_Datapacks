# Action for hooked shulker
# @s = shulker
# at bobber in @s
# run from hooked_entity/select_type

execute at @s facing entity @a[tag=gm4_reeling_rods.player,distance=..33,limit=1] eyes if block ^ ^ ^1 #gm4:replaceable run tp @s ^ ^ ^1
