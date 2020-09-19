# @s = command block placed by "gm4_relocators:place_down/replace_head"
# located at the command block (where the player head was)

execute if block ~ ~ ~ command_block[facing=east] run setblock ~ ~ ~ dropper[facing=west]
execute if block ~ ~ ~ command_block[facing=west] run setblock ~ ~ ~ dropper[facing=east]
execute if block ~ ~ ~ command_block[facing=south] run setblock ~ ~ ~ dropper[facing=north]
execute if block ~ ~ ~ command_block[facing=north] run setblock ~ ~ ~ dropper[facing=south]
execute if block ~ ~ ~ command_block[facing=down] run setblock ~ ~ ~ dropper[facing=down]

data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Mastercraftsman\'s Bench",{"translate":"block.gm4.master_crafter"}]}'}
summon armor_stand ~ ~-.4 ~ {NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_custom_crafter","gm4_master_crafting"],Fire:200000,CustomName:'"gm4_master_crafter"',ArmorItems:[{},{},{},{id:"minecraft:piston",Count:1b,tag:{CustomModelData:1}}],Pose:{Head:[180f,0f,0f]}}
playsound entity.blaze.hurt block @a[distance=..4] ~ ~ ~ 1 0.8 1
