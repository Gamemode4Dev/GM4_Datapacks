# @s = newly spawned entity
# run from soul_forge/entities/severed_soul, soul_forge_entities/fire_sprite, soul_forge/entities/congealed_shard, soul_forge/entites/living_orb, and soul_forge/outputs/fuse_pneuma

# modify motion
execute store result entity @s Motion[0] double 0.01 run random value -25..25
execute store result entity @s Motion[2] double 0.01 run random value -25..25

# mark as modified
tag @s remove gm4_oa_unset
