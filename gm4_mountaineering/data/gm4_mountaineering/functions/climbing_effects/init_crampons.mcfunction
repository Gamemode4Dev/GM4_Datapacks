# Add crampon tag and add slowness
# @s = player wearing crampons for the first time
# at @s
# run from main

# Add a tag to indicate crampons are in use
tag @s add gm4_mountaineering_using_crampons

# Add slowness effects
attribute @s minecraft:generic.movement_speed modifier add 4e6464b7-24dd-4750-a428-74898a251ead "gm4_mountaineering_crampon_slowness" -0.2 multiply_base
