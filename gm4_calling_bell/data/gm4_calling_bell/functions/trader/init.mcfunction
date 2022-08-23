# summon a wandering trader for the player
# @s = player right clicking bell with emerald
# at bell
# run from gm4_calling_bell:bell/ray/loop

# give 2s delay for bell summoning
scoreboard players add @s gm4_calling_bell 2

# once bell is found
execute align xyz positioned ~0.5 ~1 ~0.5 run function gm4_calling_bell:trader/summon
