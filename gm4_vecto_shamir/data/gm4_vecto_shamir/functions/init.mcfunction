scoreboard objectives add gm4_vecto_id dummy

team add gm4_vecto_nocoll
team modify gm4_vecto_nocoll collisionRule never

execute unless score vecto_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Vecto Shamir"}
execute unless score vecto_shamir gm4_earliest_version < vecto_shamir gm4_modules run scoreboard players operation vecto_shamir gm4_earliest_version = vecto_shamir gm4_modules
scoreboard players set vecto_shamir gm4_modules 1

data remove storage gm4_player_heads:register heads[{id:"gm4_vecto_shamir:band/v0"}]

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_vecto_shamir:band/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_vecto_shamir:band/v1",name:"[Drop to Fix Item] gm4_vecto_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"vecto",metal:{type:"bismuth",amount:[12s],castable:1b},item:"obsidian_cast"},SkullOwner:"$gm4_metallurgy:band/bismuth",CustomModelData:"shamir/vecto",display:{Name:'{"italic":false,"translate":"item.gm4.metallurgy.obsidian_cast","fallback":"Obsidian Cast"}',Lore:['[{"translate":"item.gm4.metallurgy.bismuth.red","fallback":"Bi","italic":false,"color":"#F47989"},{"translate":"item.gm4.metallurgy.bismuth.orange","fallback":"sm","italic":false,"color":"#F5B478"},{"translate":"item.gm4.metallurgy.bismuth.yellow","fallback":"ut","italic":false,"color":"#F5DD79"},{"translate":"item.gm4.metallurgy.bismuth.green","fallback":"h ","italic":false,"color":"#78F4AE"},{"translate":"item.gm4.metallurgy.bismuth.blue","fallback":"Ba","italic":false,"color":"#79D6F5"},{"translate":"item.gm4.metallurgy.bismuth.purple","fallback":"nd","italic":false,"color":"#8378F5"},{"translate":"item.gm4.metallurgy.bismuth.magenta","fallback":"","italic":false,"color":"#D579F5"}]','{"italic":false,"color":"aqua","translate":"item.gm4.metallurgy.shamir","fallback":"Shamir"}','{"italic":false,"color":"gray","translate":"item.gm4.shamir.vecto","fallback":"Vecto"}']}}}

schedule function gm4_vecto_shamir:main 4t



#$moduleUpdateList
