# Spawns a new soulution item at the location where a splash or lingering soulution hit the ground, with one less sip
# @s = thrown zauber splash soulution that hit the ground (signaled by lib_potion_tracking)
# at @s
# run from zauber_cauldrons:soulution/thrown_potion_tracking/potion_landed

# use sip and provided edited potion item in yellow shulker box (gamemode 4 lib_forceload standard)
function gm4_zauber_cauldrons:soulution/use_sip

# spawn potion item
loot spawn ~ ~ ~ mine 29999998 1 7134 minecraft:air{drop_contents:1b}
