#
# Works in survival and with no op permissions because it works with a trigger command.
#
# Description:  Runs the function master_armor_stands:givebook at one player at the time
# Entity @s/@r:	A random player
execute as @r at @s run function master_armor_stands:givebook

#
# Description:	Check for players with trigger score set
# Entity @s:	All players with a specific score
#
execute as @a[scores={gm4_as_trigger=1..}] at @s run function master_armor_stands:trigger
