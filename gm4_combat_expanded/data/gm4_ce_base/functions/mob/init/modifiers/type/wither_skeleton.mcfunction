# calculate modifiers for newly spawned wither skeleton
# @s = wither skeleton
# at @s
# run from mob/init/difficulty/check_type

# knockback resistance
attribute @s generic.knockback_resistance modifier add 4e46c16d-ba22-495c-bbca-613c97176918 "gm4_ce_base_kb_resist" 0.666 add_value
