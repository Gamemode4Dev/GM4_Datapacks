# Player picking up a liquid using Infinitas Empty Bucket
# @s = player using an Infinitas Empty Bucket
# at @s
# run from advancement, gm4_infinitas_shamir:empty/pickup_(mainhand or offhand)

tag @s add gm4_infinitas_delay_replace
tag @s add gm4_infinitas_delay_replace_empty
schedule function gm4_infinitas_shamir:delayed_replace/call 1t
