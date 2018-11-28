execute if entity @s[type=item,nbt={Item:{id:"minecraft:phantom_membrane",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b}}}}] unless entity @e[name=gm4_beacon_core,distance=..0.4,tag=gm4_beacon_phantom] unless entity @e[name=gm4_beacon_core,distance=..0.4,tag=gm4_beacon_full] run function beacon_cores:create_beacon/phantom

execute if entity @s[type=item,nbt={Item:{id:"minecraft:rotten_flesh",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b,type:2}}}}] unless entity @e[name=gm4_beacon_core,distance=..0.4,tag=gm4_beacon_zombie] unless entity @e[name=gm4_beacon_core,distance=..0.4,tag=gm4_beacon_full] run function beacon_cores:create_beacon/zombie

execute if entity @s[type=item,nbt={Item:{id:"minecraft:bone",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b,type:2}}}}] unless entity @e[name=gm4_beacon_core,distance=..0.4,tag=gm4_beacon_skeleton] unless entity @e[name=gm4_beacon_core,distance=..0.4,tag=gm4_beacon_full] run function beacon_cores:create_beacon/skeleton

execute if entity @s[type=item,nbt={Item:{id:"minecraft:ender_pearl",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b}}}}] unless entity @e[name=gm4_beacon_core,distance=..0.4,tag=gm4_beacon_enderman] unless entity @e[name=gm4_beacon_core,distance=..0.4,tag=gm4_beacon_full] run function beacon_cores:create_beacon/enderman

execute if entity @s[type=item,nbt={Item:{id:"minecraft:spider_eye",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b}}}}] unless entity @e[name=gm4_beacon_core,distance=..0.4,tag=gm4_beacon_spider] unless entity @e[name=gm4_beacon_core,distance=..0.4,tag=gm4_beacon_full] run function beacon_cores:create_beacon/spider

execute if entity @s[type=item,nbt={Item:{id:"minecraft:gunpowder",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b}}}}] unless entity @e[name=gm4_beacon_core,distance=..0.4,tag=gm4_beacon_creeper] unless entity @e[name=gm4_beacon_core,distance=..0.4,tag=gm4_beacon_full] run function beacon_cores:create_beacon/creeper


#execute if entity @s[type=item,nbt={Item:{id:"minecraft:bone",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b,type:1}}}}] unless entity @e[name=gm4_beacon_core,distance=..2,tag=gm4_beacon_stray] unless entity @e[name=gm4_beacon_core,distance=..2,tag=gm4_beacon_full] run function beacon_cores:create_beacon/stray

#execute if entity @s[type=item,nbt={Item:{id:"minecraft:rotten_flesh",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b,type:1}}}}] unless entity @e[name=gm4_beacon_core,distance=..2,tag=gm4_beacon_husk] unless entity @e[name=gm4_beacon_core,distance=..2,tag=gm4_beacon_full] run function beacon_cores:create_beacon/husk