#@s=emerald next to ender eye next to/on wither skull on grass block on cobblestone wall (N,W,E,S=false, Up=true)]

#get rid of wither skull
setblock ~ ~ ~ air destroy
kill @e[type=item,limit=1,sort=nearest,nbt={Item:{id:"minecraft:wither_skeleton_skull",Count:1b}}]

#summon deactivator
execute align xyz run summon armor_stand ~.5 ~-1.45 ~.5 {CustomName:"\"gm4_endermen_deactivator\"",Tags:["gm4_end_deact","gm4_end_deact_new","gm4_end_deact_live"],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1,Damage:3,tag:{CustomModelData:23,SkullOwner:{Id:"013b4f4b-ce15-4c84-a720-16369eb504dd",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOThlZTM1YjYxNWFjMzg3ODdmNGNiYjY2NjljN2Y2YjRkNzUxMTdlMDZmODFlMzNkNWQ0NjM3ODRiOWNhM2MifX19"}]}}}}],NoGravity:1,Marker:1,Invisible:1,Invulnerable:1,DisabledSlots:2039552}

#get rid of items
kill @e[type=item,limit=1,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:emerald",Count:1b},OnGround:1b}]
kill @e[type=item,limit=1,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:ender_eye",Count:1b},OnGround:1b}]

#make it look at cha
execute as @e[type=minecraft:armor_stand,tag=gm4_end_deact_new,limit=1,sort=nearest] at @s run teleport @s ~ ~ ~ facing entity @p eyes

#score stuff
scoreboard players set @e[type=armor_stand,tag=gm4_end_deact_new] end_deact_timer 0
tag @e[type=armor_stand,tag=gm4_end_deact_new] remove gm4_end_deact_new

#flair
playsound entity.evoker.prepare_wololo block @a[distance=..16] ~ ~ ~ 1 1
playsound entity.enderman.hurt block @a[distance=..16] ~ ~ ~ .5 1.2
particle minecraft:instant_effect ~ ~ ~ 0 1 0 1 20