# Player placing water using Infinitas Water Bucket
# @s = player using an Infinitas Water Bucket
# at @s
# run from advancement, gm4_infinitas_shamir:water/place

tag @s add gm4_infinitas_delay_replace
tag @s add gm4_infinitas_delay_replace_water
schedule function gm4_infinitas_shamir:delayed_replace/call 1t
