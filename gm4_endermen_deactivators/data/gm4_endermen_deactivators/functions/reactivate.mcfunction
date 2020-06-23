#@s formerly inactive endermen_deactivator
#from endermen_deactivator_dead

#reactivate
data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1,Damage:3,tag:{CustomModelData:23,SkullOwner:{Id:"013b4f4b-ce15-4c84-a720-16369eb504dd",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOThlZTM1YjYxNWFjMzg3ODdmNGNiYjY2NjljN2Y2YjRkNzUxMTdlMDZmODFlMzNkNWQ0NjM3ODRiOWNhM2MifX19"}]}}}}]}
tag @s remove gm4_end_deact_dead
tag @s add gm4_end_deact_live
scoreboard players set @s gm4_end_deact 0

#destroy items
kill @e[type=item,limit=1,sort=nearest,distance=..1,nbt={Item:{id:"minecraft:emerald",Count:1b},OnGround:1b}]
kill @e[type=item,limit=1,sort=nearest,distance=..1,nbt={Item:{id:"minecraft:ender_eye",Count:1b},OnGround:1b}]


#flair
playsound entity.evoker.prepare_wololo block @a[distance=..16] ~ ~ ~ 1 1
playsound entity.enderman.hurt block @a[distance=..16] ~ ~ ~ .5 1.2
particle minecraft:instant_effect ~ ~ ~ 0 1 0 1 10