# @s = command block placed by "gm4_relocators:backwards_compatibility/place_down/replace_head"
# located at the command block (where the player head was)

execute if block ~ ~ ~ command_block[facing=east] run setblock ~ ~ ~ dropper[facing=west]
execute if block ~ ~ ~ command_block[facing=west] run setblock ~ ~ ~ dropper[facing=east]
execute if block ~ ~ ~ command_block[facing=south] run setblock ~ ~ ~ dropper[facing=north]
execute if block ~ ~ ~ command_block[facing=north] run setblock ~ ~ ~ dropper[facing=south]
execute if block ~ ~ ~ command_block[facing=down] run setblock ~ ~ ~ dropper[facing=up]

data merge block ~ ~ ~ {CustomName:'{"translate":"container.gm4.tinkering_compressor","fallback":"Tinkering Compressor"}'}
summon armor_stand ~ ~-.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_tinkering_compressor"],HasVisualFire:1,CustomName:'"gm4_tinkering_compressor"',ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:3420001,SkullOwner:{Id:[I;690199207,-409122254,-1436298594,1358624862],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWQyZTU2OTkwOTI4ZWM2ZjI1NzY5YTczNjE2M2MxOWFjOTcwNmYyNTM0Y2YwM2FlOWNhMzgyOWY2MzdiYTMwMCJ9fX0="}]}}}}],HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:3420002}}],Pose:{RightArm:[0f, 0f, 0f]}}
playsound minecraft:entity.firework_rocket.blast block @a[distance=..5]
particle cloud ~ ~ ~ 0.1 0.1 0.1 0.05 10
