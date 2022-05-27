# spawn nametag with wolf's name before despawning it (to give used nametag back)
# @s = named wolf without corresponding armor piece
# at @s
# run from armor/active/canine/wolf_kill

summon item ~ ~0.2 ~ {Age:0s,PickupDelay:30,Motion:[0.0,0.25,0.0],Tags:["gm4_ce_canine_nametag"],Item:{id:"minecraft:name_tag",Count:1b,tag:{display:{Name:'{"text":"wolfname"}'}}}}
data modify entity @e[type=item,tag=gm4_ce_canine_nametag,nbt={Age:0s},limit=1,sort=nearest] Item.tag.display.Name set from entity @s CustomName
