# Checks if an entity is leashed by the knot in question
# @s = a leashable entity
# at owner
# run from hooked_entity/leash_knot/action

return run execute on leasher if entity @s[tag=gm4_reeling_rods.leash_knot]
