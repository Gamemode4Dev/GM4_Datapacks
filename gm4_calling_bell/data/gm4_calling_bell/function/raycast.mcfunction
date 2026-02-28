# @s = player right clicking bell with emerald
# at @s anchored eyes marched forward over and over
# run from gm4_calling_bell:on_bell_interact and self

scoreboard players remove $ray gm4_calling_bell 1

execute if block ~ ~ ~ bell align xyz positioned ~0.5 ~1 ~0.5 run return run function gm4_calling_bell:check_trader_hitbox

execute if score $ray gm4_calling_bell matches 1.. positioned ^ ^ ^0.1 run function gm4_calling_bell:raycast
