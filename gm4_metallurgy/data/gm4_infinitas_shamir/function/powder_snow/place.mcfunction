# Player placing powder snow using Infinitas Powder Snow Bucket
# @s = player using an Infinitas Powder Snow Bucket
# at @s
# run from advancement, gm4_infinitas_shamir:powder_snow/place_(mainhand or offhand)

tag @s add gm4_infinitas_delay_replace
tag @s add gm4_infinitas_delay_replace_powder_snow
schedule function gm4_infinitas_shamir:delayed_replace/call 1t
