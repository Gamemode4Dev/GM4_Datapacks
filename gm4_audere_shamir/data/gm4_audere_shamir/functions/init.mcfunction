execute unless score audere_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Audere Shamir"}
scoreboard players set audere_shamir gm4_modules 1

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_audere_shamir:band/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_audere_shamir:band/v0",name:"[Drop to Fix Item] gm4_audere_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"audere",metal:{type:"barium",amount:[12s],castable:1b},item:"obsidian_cast"},CustomModelData:0,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"white","translate":"%1$s%3427655$s","with":["Barium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.thorium_brass"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Audere",{"translate":"item.gm4.shamir.audere"}]}']}}}

schedule function gm4_audere_shamir:main 4t

#$moduleUpdateList
