#@s = server
#scheduled from standard_liquids:util/honey_casting/honey_cauldron and self

execute as @e[type=item_display,tag=gm4_lt_honey_display] at @s run function gm4_standard_liquids:util/honey_casting/honey_rise

schedule function gm4_standard_liquids:util/honey_casting/scheduled_honey_rise 4t
