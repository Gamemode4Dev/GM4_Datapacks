# Changes a leashed entities leader from a leash knot to a tagged player
# @s = entity leaded to leash knot
# at leash knot
# run from hooked_entity/leash_knot/action

data remove entity @s leash
data modify entity @s leash.UUID set from entity @p[tag=gm4_reeling_rods.player] UUID
