scoreboard objectives add gm4_armor armor
scoreboard objectives add gm4_armor_weight dummy

execute unless score weighted_armour gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Weighted Armour"}
scoreboard players set weighted_armour gm4_modules 1

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_helious_shamir:band/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_helious_shamir:band/v0",name:"[Drop to Fix Item] gm4_helious_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"helious",metal:{type:"aluminium",amount:[12s],castable:1b},item:"obsidian_cast"},CustomModelData:3420103,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"red","translate":"%1$s%3427655$s","with":["Aluminium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.aluminium"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Helious",{"translate":"item.gm4.shamir.helious"}]}']}}}

schedule function gm4_weighted_armour:main 1t

#$moduleUpdateList
