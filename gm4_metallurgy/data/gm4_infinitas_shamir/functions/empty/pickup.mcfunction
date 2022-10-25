#
#
#
#

tag @s add gm4_infinitas_delay_replace_empty
schedule function gm4_infinitas_shamir:delayed_replace/call 1t



#### ?

# debug
# say empty pickup
# execute store result score @s gm4_infinitas_empty_held_stack run data get entity @s SelectedItem.Count
# tellraw @s {"score":{"objective": "gm4_infinitas_empty_held_stack","name":"@s"}}

# check if infinitas empty bucket stack

# function gm4_infinitas_shamir:empty/delay_replace
# execute if score @s[advancements={gm4_infinitas_shamir:mainhand/empty=true}] gm4_infinitas_empty_held_stack matches 0 run function gm4_infinitas_shamir:empty/delay_replace
# execute if score @s[advancements={gm4_infinitas_shamir:offhand/empty=true}] gm4_infinitas_empty_held_stack matches 0 run function gm4_infinitas_shamir:empty/offhand/delay_replace
