# check which SCUBA item is equipped
execute as @a[tag=!gm4_in_water,gamemode=!spectator,nbt={Inventory:[{Slot:103b,tag:{gm4_scuba_gear:{item:"helmet"}}},{Slot:102b,tag:{gm4_scuba_gear:{item:"tank"}}}]}] at @s if block ~ ~1 ~ water run function scuba_gear:breathe
execute as @a[tag=!gm4_in_water,gamemode=!spectator,nbt={Inventory:[{Slot:103b,tag:{gm4_scuba_gear:{item:"helmet"}}},{Slot:102b,tag:{gm4_scuba_gear:{item:"tank"}}}]}] at @s if block ~ ~1 ~ #scuba_gear:water_loggable[waterlogged=true] run function scuba_gear:breathe
execute as @a[scores={gm4_sg_swim=1..},gamemode=!spectator,nbt={Inventory:[{Slot:100b,tag:{gm4_scuba_gear:{item:"flippers"}}}]}] run effect give @s dolphins_grace 1 0 true

# fix broken SCUBA helmet
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"1e205cc1-461c-4b35-900b-f479f9f250a4"}}}}] run data merge entity @s {Item:{tag:{gm4_scuba_gear:{item:"helmet"},display:{Name:"{\"text\":\"SCUBA Helmet\",\"italic\":\"false\"}"},AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:2,Operation:0,UUIDLeast:554768,UUIDMost:190244,Slot:"head"},{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:-.5,Operation:0,UUIDLeast:454101,UUIDMost:193195,Slot:"head"}]}}}

# reset scores and tags
scoreboard players reset @a gm4_sg_swim
execute as @a[tag=gm4_in_water] unless entity @s[nbt={Inventory:[{Slot:103b,tag:{gm4_scuba_gear:{item:"helmet"}}},{Slot:102b,tag:{gm4_scuba_gear:{item:"tank"}}}]}] run function scuba_gear:remove_effect
execute as @a[tag=gm4_in_water] at @s unless block ~ ~1 ~ water unless block ~ ~1 ~ #scuba_gear:water_loggable[waterlogged=true] unless block ~ ~1 ~ #scuba_gear:seagrass run function scuba_gear:remove_effect

#reward advancement
advancement grant @a[gamemode=!spectator,nbt={Inventory:[{Slot:103b,tag:{gm4_scuba_gear:{item:"helmet"}}},{Slot:102b,tag:{gm4_scuba_gear:{item:"tank"}}},{Slot:100b,tag:{gm4_scuba_gear:{item:"flippers"}}}]}] only gm4:scuba_gear
