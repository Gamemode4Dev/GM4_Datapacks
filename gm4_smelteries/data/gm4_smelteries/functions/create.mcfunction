# @s - custom crafter with smeltery recipe
# called by recipe_check

data merge entity @s {CustomName:'"gm4_smeltery"',Rotation:[45f,0f],ArmorItems:[{},{},{},{id:gray_stained_glass,Count:1,tag:{CustomModelData:1}}],Tags:["gm4_smeltery","gm4_no_edit","gm4_machine"],Silent:1b}
setblock ~ ~ ~ hopper{CustomName:'{"translate":"%1$s%3427655$s","with":["Smeltery",{"translate":"block.gm4.smeltery"}]}'}
playsound block.anvil.use block @a[distance=..4] ~ ~ ~ 1 0.8
advancement grant @a[distance=..4] only gm4:smelteries
