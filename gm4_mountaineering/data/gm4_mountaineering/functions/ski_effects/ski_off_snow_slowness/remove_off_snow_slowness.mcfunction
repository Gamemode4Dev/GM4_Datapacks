# Remove slowness when player stops wearing skis on a non-snowy block
# @s = player not wearing skis on non-snowy block, with ski_slowness tag
# at @s
# run from check_snowy_block

attribute @s minecraft:generic.movement_speed modifier remove bd5e1dd5-58e8-40fc-9028-cc0d390e7902
tag @s remove gm4_mountaineering_ski_slowness
