# @s = player who drank from level 2 of a honey bottle and should get level 8
# run from ambrosia:honey_bottle/consume_honey

# update bottle level
tag @s[gamemode=!creative,nbt={SelectedItem:{id:"minecraft:glass_bottle",Count:1b}}] add gm4_drank_honey_from_mainhand
replaceitem entity @s[gamemode=!creative,tag=gm4_drank_honey_from_mainhand] weapon.mainhand potion{gm4_ambrosia:{item:"honey_bottle",honey_level:1},display:{Name:'{"translate":"%1$s","with":["Almost Empty Bottle of Honey","item.gm4.honey_bottle.1"],"italic":"false"}',Lore:['["1/9 ",{"translate":"%1$s%3427655$s","with":["Spoons",{"translate":"item.gm4.honey_bottle.lore.spoons"}]}]']},CustomPotionColor:16754944,CustomPotionEffects:[{Id:10,Amplifier:0,Duration:1600}]}
replaceitem entity @s[gamemode=!creative,tag=!gm4_drank_honey_from_mainhand,nbt={Inventory:[{Slot:-106b,id:"minecraft:glass_bottle",Count:1b}]}] weapon.offhand potion{gm4_ambrosia:{item:"honey_bottle",honey_level:1},display:{Name:'{"translate":"%1$s","with":["Almost Empty Bottle of Honey",[{"translate":"item.gm4.honey_bottle.level.almost_empty"},{"translate":"item.gm4.honey_bottle"}]],"italic":"false"}',Lore:['["1/9 ",{"translate":"%1$s%3427655$s","with":["Spoons",{"translate":"item.gm4.honey_bottle.lore.spoons"}]}]']},CustomPotionColor:16754944,CustomPotionEffects:[{Id:10,Amplifier:0,Duration:1600}]}
tag @s remove gm4_drank_honey_from_mainhand

# reset tags
tag @s remove gm4_drank_honey_level_2
