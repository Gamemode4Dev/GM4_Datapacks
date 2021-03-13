# @s = command block placed by "gm4_relocators:place_down/replace_head"
# located at the command block (where the player head was)

execute if block ~ ~ ~ command_block[facing=east] run setblock ~ ~ ~ hopper[facing=east]
execute if block ~ ~ ~ command_block[facing=west] run setblock ~ ~ ~ hopper[facing=west]
execute if block ~ ~ ~ command_block[facing=south] run setblock ~ ~ ~ hopper[facing=south]
execute if block ~ ~ ~ command_block[facing=north] run setblock ~ ~ ~ hopper[facing=north]
execute if block ~ ~ ~ command_block[facing=down] run setblock ~ ~ ~ hopper[facing=down]

data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Smeltery",{"translate":"block.gm4.smeltery"}]}'}
summon armor_stand ~ ~-.4 ~ {Silent:1b,Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_smeltery","gm4_no_edit","gm4_machine"],Rotation:[45f,0f],Fire:200000,CustomName:'"gm4_smeltery"',ArmorItems:[{},{},{},{id:"minecraft:gray_stained_glass",Count:1,tag:{CustomModelData:1}}],HandItems:[{},{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:5}}],Pose:{LeftArm:[0f, 0f, 0f]}}
playsound block.anvil.use block @a[distance=..4] ~ ~ ~ 1 0.8 1
