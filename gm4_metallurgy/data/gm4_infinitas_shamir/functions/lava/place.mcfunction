# Player placing lava using Infinitas Lava Bucket
# @s = player using an Infinitas Lava Bucket
# at @s
# run from advancement, gm4_infinitas_shamir:lava/place_(mainhand or offhand)

tag @s add gm4_has_infinitas
tag @s add gm4_infinitas_delay_replace_lava
schedule function gm4_infinitas_shamir:delayed_replace/call 1t
