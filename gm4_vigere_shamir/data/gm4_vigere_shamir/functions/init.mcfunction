scoreboard objectives add gm4_vigere_use minecraft.used:minecraft.shield
scoreboard objectives add gm4_health health

execute unless score vigere_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Vigere Shamir"}
scoreboard players set vigere_shamir gm4_modules 1

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_vigere_shamir:band/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_vigere_shamir:band/v0",name:"[Drop to Fix Item] gm4_vigere_shamir:band",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"vigere",metal:{type:"barimium",amount:[12s],castable:1b},item:"obsidian_cast"},CustomModelData:119,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"#D18A8A","translate":"%1$s%3427655$s","with":["Barimium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.barimium"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Vigere",{"translate":"item.gm4.shamir.vigere"}]}']}}}

schedule function gm4_vigere_shamir:main 1t

#$moduleUpdateList
