#
#
#
#

# tag @s add gm4_infinitas_delay_replace_stack
say pickup using stack
# scoreboard objectives add temp minecraft.used:bucket

advancement revoke @s only gm4_infinitas_shamir:empty/stack/pickup_mainhand
# schedule function gm4_infinitas_shamir:delayed_replace/call 1t
