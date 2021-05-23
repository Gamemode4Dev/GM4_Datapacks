execute unless score lumos_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Lumos Shamir"}
scoreboard players set lumos_shamir gm4_modules 1

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_lumos_shamir:band/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_lumos_shamir:band/v0",name:"[Drop to Fix Item] gm4_lumos_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"lumos",metal:{type:"thorium_brass",amount:[9s,3s],castable:1b},item:"obsidian_cast"},CustomModelData:114,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"dark_green","translate":"%1$s%3427655$s","with":["Thorium Brass Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.thorium_brass"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Lumos",{"translate":"item.gm4.shamir.lumos"}]}']}}}

schedule function gm4_lumos_shamir:main 4t

#$moduleUpdateList
