# Player drinking milk using Infinitas Milk Bucket
# @s = player drinking an Infinitas Milk Bucket
# at @s
# run from advancement, gm4_infinitas_shamir:milk/drink_(mainhand or offhand)

tag @s add gm4_infinitas_delay_replace
tag @s add gm4_infinitas_delay_replace_milk
schedule function gm4_infinitas_shamir:delayed_replace/call 1t
