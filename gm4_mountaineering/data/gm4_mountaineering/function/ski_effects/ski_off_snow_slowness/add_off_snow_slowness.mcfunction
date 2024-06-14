# Add slowness when a player wears skis on a non-snowy block
# @s = player wearing skis on a non-snowy block, without ski_slowness tag
# at @s
# run from check_snowy_block

attribute @s minecraft:generic.movement_speed modifier add minecraft:bd5e1dd5-58e8-40fc-9028-cc0d390e7902 -0.2 add_multiplied_base
tag @s add gm4_mountaineering_ski_slowness
