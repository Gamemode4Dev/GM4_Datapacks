# catches when the player opens the auto crafter
# @s = player who opened the auto crafter interface
# located at @s
# run from advancement gm4_auto_crafting:open_auto_crafter

advancement revoke @s only gm4_auto_crafting:open_auto_crafter

# mark as updating recipe
execute anchored eyes positioned ^ ^ ^2.5 run tag @e[type=marker,tag=gm4_auto_crafter,distance=..3] add gm4_ac_updating

# start temp clock
schedule function gm4_auto_crafting:auto_crafter/caching/temp_clock 16t
