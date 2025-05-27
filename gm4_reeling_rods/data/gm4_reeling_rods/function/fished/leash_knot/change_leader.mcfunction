# Changes a leashed entities leader from a leash knot to a tagged player
# @s = entity leaded to leash knot
# at leash knot
# run from fished/leash_knot/action

data remove entity @s leash
data modify entity @s leash.UUID set from entity @e[type=player,tag=gm4_reeling_rods.player,distance=..45,limit=1] UUID
