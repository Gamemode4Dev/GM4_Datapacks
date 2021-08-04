scoreboard objectives add gm4_vecto_id dummy

team add gm4_vecto_nocoll
team modify gm4_vecto_nocoll collisionRule never

execute unless score vecto_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Vecto Shamir"}
scoreboard players set vecto_shamir gm4_modules 1

data remove storage gm4_player_heads:register heads[{id:"gm4_vecto_shamir:band/v0"}]

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_vecto_shamir:band/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_vecto_shamir:band/v1",name:"[Drop to Fix Item] gm4_vecto_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"vecto",metal:{type:"bismuth",amount:[12s],castable:1b},item:"obsidian_cast"},CustomModelData:121,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"#8EFF63","translate":"%1$s%3427655$s","with":["Bismuth Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.bismuth"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Vecto",{"translate":"item.gm4.shamir.vecto"}]}']}}}

schedule function gm4_vecto_shamir:main 4t

#$moduleUpdateList
