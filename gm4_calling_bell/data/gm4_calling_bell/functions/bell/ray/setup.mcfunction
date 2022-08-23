# ray cast setup to find bell
# @s = player right clicking bell with emerald
# at @s anchored eyes positioned ^ ^ ^
# run from gm4_calling_bell:emerald_check

scoreboard players set $ray gm4_calling_bell 50

function gm4_calling_bell:bell/ray/loop
