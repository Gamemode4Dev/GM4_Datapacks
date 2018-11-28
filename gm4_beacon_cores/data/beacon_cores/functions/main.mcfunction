# If mob core item on top of a beacon and the beacon does not yet have that core, and the beacon is not full, run the appropriate create_beacon function
execute as @e[type=item,nbt={Item:{tag:{gm4_beacon_cores:{custom_core:1b}}}}] at @s if block ~ ~-1 ~ beacon align xyz positioned ~.5 ~-1 ~.5 run function beacon_cores:check_core

# Runs commands as the beacon core entity
execute as @e[name=gm4_beacon_core] at @s run function beacon_cores:beacon