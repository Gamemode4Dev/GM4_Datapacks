# ray cast to find bell
# @s = player right clicking bell with emerald
# at @s anchored eyes positioned ^ ^ ^
# run from gm4_calling_bell:bell/ray/setup and recursive call

# removes 1 from raycast
scoreboard players remove $ray gm4_calling_bell 1

# tests for bell
execute if block ~ ~ ~ bell align xyz positioned ~0.5 ~1 ~0.5 run function gm4_calling_bell:trader/summon

# runs the loop again
execute unless block ~ ~ ~ bell if score $ray gm4_calling_bell matches 1.. positioned ^ ^ ^0.1 run function gm4_calling_bell:bell/ray/loop
