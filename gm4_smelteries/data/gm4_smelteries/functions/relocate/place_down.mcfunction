# @s = command block placed by gm4_relocators:place_down/place_block

setblock ~ ~ ~ hopper{CustomName:'{"translate":"%1$s%3427655$s","with":["Smeltery",{"translate":"block.gm4.smeltery"}]}'}
summon armor_stand ~ ~-.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_smeltery","gm4_no_edit","gm4_bf_has_furnace"],Rotation:[45f,0f],Fire:200000,CustomName:'"gm4_smeltery"',ArmorItems:[{},{},{},{id:gray_stained_glass,Count:1,tag:{CustomModelData:1}}]}
playsound block.anvil.use block @a[distance=..4] ~ ~ ~ 1 0.8 1
