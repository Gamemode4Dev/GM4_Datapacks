# @s = command block placed by gm4_relocators:place_down/place_block

setblock ~ ~ ~ dropper[facing=up]{CustomName:'{"translate":"%1$s%3427655$s","with":["Tinkering Compressor",{"translate":"block.gm4.tinkering_compressor"}]}'}
summon armor_stand ~ ~-.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_tinkering_compressor"],Fire:200000,CustomName:'"gm4_tinkering_compressor"',ArmorItems:[{},{},{},{id:player_head,Count:1b,tag:{CustomModelData:1,SkullOwner:{Id:"29239aa7-e79d-4a32-aa63-d29e50faf85e",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWQyZTU2OTkwOTI4ZWM2ZjI1NzY5YTczNjE2M2MxOWFjOTcwNmYyNTM0Y2YwM2FlOWNhMzgyOWY2MzdiYTMwMCJ9fX0="}]}}}}]}
playsound minecraft:entity.firework_rocket.blast block @a[distance=..5]
particle cloud ~ ~ ~ 0.1 0.1 0.1 0.05 10
