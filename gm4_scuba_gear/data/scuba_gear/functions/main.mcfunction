# check if SCUBA gear is in inventory
execute as @a[gamemode=!spectator,nbt={Inventory:[{tag:{gm4_scuba_gear:{}}}]}] run function scuba_gear:equipped

# fix broken SCUBA helmet
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"1e205cc1-461c-4b35-900b-f479f9f250a4"}}}}] run data merge entity @s {Item:{tag:{gm4_scuba_gear:{item:"helmet"},display:{Name:'{"translate":"%1$s%3427655$s","with":["SCUBA Helmet",{"translate":"item.gm4.scuba_helmet"}]},"italic":false'},AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:2,Operation:0,UUIDLeast:554768,UUIDMost:190244,Slot:"head"},{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:-.5,Operation:0,UUIDLeast:454101,UUIDMost:193195,Slot:"head"}]}}}

# reset scores and tags
scoreboard players reset @a gm4_sg_swim
execute as @a[tag=gm4_in_water] run function scuba_gear:check_gear

#reward advancement
advancement grant @a[gamemode=!spectator,nbt={Inventory:[{Slot:103b,tag:{gm4_scuba_gear:{item:"helmet"}}},{Slot:102b,tag:{gm4_scuba_gear:{item:"tank"}}},{Slot:100b,tag:{gm4_scuba_gear:{item:"flippers"}}}]}] only gm4:scuba_gear

schedule function scuba_gear:main 16t
