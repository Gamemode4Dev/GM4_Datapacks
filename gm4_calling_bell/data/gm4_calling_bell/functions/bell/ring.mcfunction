# player ringing a bell while holding an emerald
# @s = player
# at @s
# run from advancement, gm4_calling_bell:ring_bell

advancement revoke @s only gm4_calling_bell:ring_bell

tag @s add gm4_calling_bell_bell_ringer
execute unless score @s gm4_calling_bell matches 1.. run function gm4_calling_bell:trader/init
tag @s remove gm4_calling_bell_bell_ringer