# Player picking up a fish using Infinitas Water Bucket
# @s = player using an Infinitas Water Bucket
# at @s
# run from advancement, gm4_infinitas_shamir:water/pickup_(mainhand or offhand)

tag @s add gm4_has_infinitas
tag @s add gm4_infinitas_delay_replace_fish

schedule function gm4_infinitas_shamir:delayed_replace/call 1t
