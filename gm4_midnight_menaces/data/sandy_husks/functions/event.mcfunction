#@s = none
#at world spawn
#called by mysterious midnights base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

execute as @e[type=zombie,nbt={PersistenceRequired:0b}] unless entity @s[nbt={DeathLootTable:"null"}] unless score @s gm4_menace matches 0.. at @s run function sandy_husks:convert
