# @s - Stray Core item on a beacon block
# run from check_core

# Particles and sound effects
particle cloud ~ ~ ~ 0 0 0 0.2 50
particle witch ~ ~ ~ 0 0 0 0.3 40
playsound minecraft:entity.stray.death block @a ~ ~ ~ 1 0 0

# Create a marker entity for the beacon core named gm4_beacon_core
execute unless entity @e[name=gm4_beacon_core,distance=..2] align xyz positioned ~.5 ~ ~.5 run summon armor_stand ~ ~-1 ~ {DisabledSlots:2039583,Small:1,Tags:["gm4_beacon_core"],CustomName:"\"gm4_beacon_core\"",Marker:1,Invisible:1,NoGravity:1}
tag @e[name=gm4_beacon_core,limit=1,distance=..2] add gm4_beacon_stray

scoreboard players add @e[name=gm4_beacon_core,limit=1,distance=..2] gm4_beacon_cores 1

kill @s