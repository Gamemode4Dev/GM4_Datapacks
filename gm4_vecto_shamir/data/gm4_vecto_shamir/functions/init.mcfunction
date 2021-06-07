scoreboard objectives add gm4_vecto_id dummy

team add gm4_vecto_nocoll
team modify gm4_vecto_nocoll collisionRule never

execute unless score vecto_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Vecto Shamir"}
scoreboard players set vecto_shamir gm4_modules 1

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_vecto_shamir:band/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_vecto_shamir:band/v0",name:"[Drop to Fix Item] gm4_vecto_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"vecto",metal:{type:"copper",amount:[12s],castable:1b},item:"obsidian_cast"},CustomModelData:121,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"gold","translate":"%1$s%3427655$s","with":["Copper Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.copper"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Vecto",{"translate":"item.gm4.shamir.vecto"}]}']}}}

schedule function gm4_vecto_shamir:main 4t

#$moduleUpdateList
