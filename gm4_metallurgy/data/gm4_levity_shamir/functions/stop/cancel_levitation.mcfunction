#@s = player using levity that stopped sneaking
#ran from levity_shamir:stop/check_cancel_buffer

effect clear @s levitation
effect clear @s jump_boost
tag @s remove gm4_levity_is_floating
scoreboard players reset @s gm4_levity_buf
