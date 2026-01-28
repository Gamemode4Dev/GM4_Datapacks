# Action for hooked leash knot
# @s = leash knot
# at bobber in @s
# run from hooked_entity/select_type

tag @s add gm4_reeling_rods.leash_knot

# distance=..12 is leash distance
execute at @s as @e[type=#gm4_reeling_rods:leashable,distance=..12] \
  if function gm4_reeling_rods:hooked_entity/leash_knot/leaded_by_knot \
  run function gm4_reeling_rods:hooked_entity/leash_knot/change_leader

kill @s

execute at @p[tag=gm4_reeling_rods.player] run playsound minecraft:entity.leash_knot.place neutral @a[distance=..16] ~ ~ ~
