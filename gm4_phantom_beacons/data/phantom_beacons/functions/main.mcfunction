# If phantom membrane item on top of a beacon is in the same block as an enchanted golden apple item and the beacon is not yet a phantom beacon, run create_beacon
execute as @e[type=item,nbt={Item:{id:"minecraft:phantom_membrane",Count:1b,tag:{Enchantments:[{lvl:1,id:""}],display:{Name:"{\"text\":\"Phantom Core\",\"italic\":\"false\",\"color\":\"yellow\"}"}}}}] at @s unless entity @e[name=gm4_phantom_beacon,distance=..2] if block ~ ~-1 ~ beacon run function phantom_beacons:create_beacon

# Runs commands as the phantom beacon entity if the beacon is active
execute as @e[name=gm4_phantom_beacon] at @s run function phantom_beacons:beacon

# Particles to identify a phantom beacon
execute at @e[name=gm4_phantom_beacon] run particle witch ~ ~1 ~ 0.1 0.1 0.1 0.05 3

# Detection for crafting the phantom core in a custom crafter
# Note: Not sure if this is how you are supposed to make something craftable in another module, but it does work as far as I have been able to test.
execute as @e[name=gm4_custom_crafter] at @s if block ~ ~ ~ dropper{CustomName: "{\"text\":\"Custom Crafter\"}", Items: [{Slot: 0b, id: "minecraft:phantom_membrane", Count: 1b}, {Slot: 1b, id: "minecraft:phantom_membrane", Count: 1b}, {Slot: 2b, id: "minecraft:phantom_membrane", Count: 1b}, {Slot: 3b, id: "minecraft:phantom_membrane", Count: 1b}, {Slot: 4b, id: "minecraft:elytra", Count: 1b}, {Slot: 5b, id: "minecraft:phantom_membrane", Count: 1b}, {Slot: 6b, id: "minecraft:phantom_membrane", Count: 1b}, {Slot: 7b, id: "minecraft:phantom_membrane", Count: 1b}, {Slot: 8b, id: "minecraft:phantom_membrane", Count: 1b}], id: "minecraft:dropper", Lock: ""} run data merge block ~ ~ ~ {Items:[{Slot:4b,id:"minecraft:phantom_membrane",Count:1b,tag:{Enchantments:[{id:"",lvl:1}],display:{Name:"{\"text\":\"Phantom Core\",\"italic\":\"false\",\"color\":\"yellow\"}"}}}]}