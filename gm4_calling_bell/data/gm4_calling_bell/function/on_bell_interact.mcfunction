# @s = player who used an emerald on a bell
# at @s
# run from advancement: ring_bell

advancement revoke @s only gm4_calling_bell:ring_bell

# fail if player already used today
execute store result score $day gm4_calling_bell run time query day repetition
execute if score @s gm4_calling_bell = $day gm4_calling_bell run return run playsound entity.wandering_trader.no neutral @a[distance=..16] ~ ~ ~ 1 1 0.6

execute store result score $ray gm4_calling_bell run attribute @s minecraft:block_interaction_range get 10
execute anchored eyes positioned ^ ^ ^ run function gm4_calling_bell:raycast
