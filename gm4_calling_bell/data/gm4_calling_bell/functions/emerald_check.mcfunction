# check if player is off cooldown and holding an emerald
# @s = player right clicking bell
# at @s anchored eyes positioned ^ ^ ^
# run from gm4_calling_bell:tick

scoreboard players reset @s gm4_calling_bell_rung
execute unless score @s gm4_calling_bell matches 1.. if predicate gm4_calling_bell:holding_emerald run function gm4_calling_bell:bell/ray/setup
execute if score @s gm4_calling_bell matches 1.. run playsound entity.wandering_trader.no neutral @a[distance=..16] ~ ~ ~ 1 1 0.6
