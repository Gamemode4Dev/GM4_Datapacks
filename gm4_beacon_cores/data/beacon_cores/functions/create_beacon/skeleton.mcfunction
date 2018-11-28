# @s - Skeleton Core item on a beacon block
# run from check_core

# Particles and sound effects
particle cloud ~ ~ ~ 0 0 0 0.2 50
particle witch ~ ~ ~ 0 0 0 0.3 40
playsound minecraft:entity.skeleton.death block @a ~ ~ ~ 1 0 0

# Create a marker entity for the beacon core named gm4_beacon_core
execute unless entity @e[name=gm4_beacon_core,distance=..0.4] run summon armor_stand ~ ~ ~ {DisabledSlots:2039583,Small:1,Tags:["gm4_beacon_core","gm4_no_edit"],CustomName:"\"gm4_beacon_core\"",Marker:1,Invisible:1,NoGravity:1,ArmorItems:[{},{},{},{id:"minecraft:sea_lantern",Count:1b}]}
tag @e[name=gm4_beacon_core,limit=1,distance=..0.5] add gm4_beacon_skeleton

scoreboard players add @e[name=gm4_beacon_core,limit=1,distance=..0.5] gm4_beacon_cores 1

kill @s