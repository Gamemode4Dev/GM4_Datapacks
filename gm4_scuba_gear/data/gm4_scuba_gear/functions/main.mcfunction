# check if SCUBA gear is in inventory
execute as @a[gamemode=!spectator,predicate=gm4_scuba_gear:scuba_gear_equipped] run function gm4_scuba_gear:equipped

# fix broken SCUBA helmet
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;505437377,1176259381,-1878264711,-101560156]}}}}] run data merge entity @s {Item:{tag:{gm4_scuba_gear:{item:"helmet"},display:{Name:'{"translate":"%1$s%3427655$s","with":["SCUBA Helmet",{"translate":"item.gm4.scuba_helmet"}],"italic":false}'},AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:2,Operation:0,UUID:[I;0,190244,0,554768],Slot:"head"},{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:-.5,Operation:0,UUID:[I;0,193195,0,454101],Slot:"head"}]}}}

# reset scores and tags
scoreboard players reset @a gm4_sg_swim
execute as @a[tag=gm4_in_water] run function gm4_scuba_gear:check_gear

#reward advancement
advancement grant @a[gamemode=!spectator,predicate=gm4_scuba_gear:all_gear_equipped] only gm4:scuba_gear

schedule function gm4_scuba_gear:main 16t
