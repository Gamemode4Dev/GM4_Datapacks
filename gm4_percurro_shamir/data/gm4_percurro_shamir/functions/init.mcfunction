execute unless score percurro_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Percurro Shamir"}
scoreboard players set percurro_shamir gm4_modules 1

# unregister old shamir
data remove storage gm4_player_heads:register heads[{id:"gm4_percurro_shamir:band/v0"}]

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_percurro_shamir:band/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_percurro_shamir:band/v1",name:"[Drop to Fix Item] gm4_percurro_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"percurro",metal:{type:"curies_bismium",amount:[9s,3s],castable:1b},item:"obsidian_cast"},CustomModelData:117,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"#467A1B","translate":"%1$s%3427655$s","with":["Curie\'s Bismium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.curies_bismium"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Percurro",{"translate":"item.gm4.shamir.percurro"}]}']}}}

schedule function gm4_percurro_shamir:main 10t

#$moduleUpdateList
