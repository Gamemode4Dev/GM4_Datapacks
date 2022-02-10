# @s = invulnerable item after 32 ticks
# run from main

tag @s remove gm4_oa_invulnerable
data merge entity @s {Invulnerable:0b}
