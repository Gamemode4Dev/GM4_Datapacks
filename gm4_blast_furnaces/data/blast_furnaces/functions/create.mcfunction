# @s - custom crafter with blast furnance recipe
# called by recipe_check

data merge entity @s {CustomName:'"gm4_blast_furnace"',ArmorItems:[{},{},{},{id:gray_stained_glass,Count:1}],Tags:["gm4_blast_furnace","gm4_no_edit","gm4_bf_has_furnace"],Silent:1}
setblock ~ ~ ~ hopper{CustomName:'{"translate":"%1$s%3427655$s","with":["Blast Furnace",{"translate":"block.gm4.blast_furnace"}]}'}
playsound block.anvil.use block @a[distance=..4] ~ ~ ~ 1 0.8 1
advancement grant @a[distance=..4] only gm4:blast_furnaces
