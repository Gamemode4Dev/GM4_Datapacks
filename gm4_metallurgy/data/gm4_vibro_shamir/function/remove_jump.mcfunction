# @s = vibro player no longer sneaking on the ground
# run from gm4_metallurgy:tick

scoreboard players reset @s gm4_vibro_sneak
attribute @s jump_strength modifier remove gm4_vibro_shamir:jump_boost
