# ray cast setup to find bell
# @s = player right clicking bell with emerald
# run from gm4_calling_bell:emerald_check

scoreboard players operation @s gm4_calling_bell = $day gm4_calling_bell
scoreboard players set $ray gm4_calling_bell 50

execute at @s anchored eyes positioned ^ ^ ^ run function gm4_calling_bell:bell/ray/loop
