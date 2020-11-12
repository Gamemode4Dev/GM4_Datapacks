# @s = command block placed by "gm4_relocators:place_down/replace_head"
# located at the command block (where the player head was)

execute if block ~ ~ ~ command_block[facing=east] run setblock ~ ~ ~ dropper[facing=west]
execute if block ~ ~ ~ command_block[facing=west] run setblock ~ ~ ~ dropper[facing=east]
execute if block ~ ~ ~ command_block[facing=south] run setblock ~ ~ ~ dropper[facing=north]
execute if block ~ ~ ~ command_block[facing=north] run setblock ~ ~ ~ dropper[facing=south]
execute if block ~ ~ ~ command_block[facing=down] run setblock ~ ~ ~ dropper[facing=up]

data merge block ~ ~ ~ {CustomName:'{"color":"dark_purple","translate":"%1$s%3427655$s","with":["Teleportation Jammer",{"translate":"block.gm4.teleportation_jammer"}]}'}
summon armor_stand ~ ~-.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_new_teleportation_jammer","gm4_teleportation_jammer"],Fire:200000,CustomName:'"gm4_teleportation_jammer"',ArmorItems:[{},{},{},{id:purpur_pillar,Count:1b,tag:{CustomModelData:1}}]}
playsound minecraft:block.chorus_flower.death block @a[distance=..8] ~ ~ ~ 100 1.3
playsound minecraft:block.beacon.power_select block @a[distance=..8] ~ ~ ~ 0.3 0.3

execute as @e[type=armor_stand,distance=..0.5,tag=gm4_new_teleportation_jammer,limit=1] store result score @s gm4_ta_jam_id run data get entity @s UUID[3]
tag @e[type=armor_stand,distance=..0.5] remove gm4_new_teleportaion_jammer
