# @s = player right clicking bell with emerald
# at block above bell
# run from raycast

execute if predicate gm4_calling_bell:trader_hitbox_no_collision run return run function gm4_calling_bell:summon_trader
# invalid spawn, fail
playsound entity.wandering_trader.no neutral @a[distance=..16] ~ ~ ~ 1 1 0.6
