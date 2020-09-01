# @s = command block placed by gm4_master_crafting:relocate/replace_head

function gm4_relocators:place_down/place_block

setblock ~ ~ ~ dropper[facing=up]{CustomName:'{"translate":"%1$s%3427655$s","with":["Mastercraftsman\'s Bench",{"translate":"block.gm4.master_crafter"}]}'}
summon armor_stand ~ ~-.4 ~ {NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_custom_crafter","gm4_master_crafting"],Fire:200000,CustomName:'"gm4_master_crafter"',ArmorItems:[{},{},{},{id:"minecraft:piston",Count:1b,tag:{CustomModelData:1}}],Pose:{Head:[180f,0f,0f]}}
playsound entity.blaze.hurt block @a[distance=..4] ~ ~ ~ 1 0.8 1
