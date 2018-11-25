# @s - Phantom membrane item on a beacon block
# run from main

kill @s

# Particles and sound effects
particle cloud ~ ~ ~ 0 0 0 0.2 50
particle witch ~ ~ ~ 0 0 0 0.3 40
playsound minecraft:item.totem.use block @a ~ ~ ~ 1 0 0

# Create a marker entity for the phantom beacon named gm4_phantom_beacon
execute align xyz positioned ~.5 ~ ~.5 run summon armor_stand ~ ~-1 ~ {DisabledSlots:2039583,Small:1,Tags:["gm4_phantom_beacon"],CustomName:"\"gm4_phantom_beacon\"",Marker:1,Invisible:1,NoGravity:1}

# Advancement for creating the beacon: Peace in the Sky 
advancement grant @a[distance=..7] only gm4:phantom_beacons
