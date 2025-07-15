# get facing direction towards target
# @s = marker
# at elite anchored eyes positioned ^ ^ ^0.2
# run from mob/process/elite/pearlescent/laser

tp @s ~ ~ ~ facing entity @p[tag=gm4_mu_target] eyes
data modify storage gm4_monsters_unbound:temp Rotation set from entity @s Rotation
kill @s
