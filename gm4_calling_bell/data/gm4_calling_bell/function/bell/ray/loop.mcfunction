# ray cast to find bell
# @s = player right clicking bell with emerald
# at @s anchored eyes positioned ^ ^ ^
# run from gm4_calling_bell:bell/ray/setup and recursive call

# removes 1 from raycast
scoreboard players remove $ray gm4_calling_bell 1

# tests for bell
execute if block ~ ~ ~ bell align xyz positioned ~0.5 ~1 ~0.5 if predicate gm4_calling_bell:trader_hitbox_no_collision run function gm4_calling_bell:trader/summon
execute if block ~ ~ ~ bell align xyz positioned ~0.5 ~1 ~0.5 unless predicate gm4_calling_bell:trader_hitbox_no_collision run playsound entity.wandering_trader.no neutral @a[distance=..16] ~ ~ ~ 1 1 0.6

# runs the loop again
execute unless block ~ ~ ~ bell if score $ray gm4_calling_bell matches 1.. positioned ^ ^ ^0.1 run function gm4_calling_bell:bell/ray/loop
