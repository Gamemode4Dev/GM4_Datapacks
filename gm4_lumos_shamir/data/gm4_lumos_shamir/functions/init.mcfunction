execute unless score lumos_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Lumos Shamir"}
execute unless score lumos_shamir gm4_earliest_version < lumos_shamir gm4_modules run scoreboard players operation lumos_shamir gm4_earliest_version = lumos_shamir gm4_modules
scoreboard players set lumos_shamir gm4_modules 1

# unregister old shamir
data remove storage gm4_player_heads:register heads[{id:"gm4_lumos_shamir:band/v0"}]

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_lumos_shamir:band/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_lumos_shamir:band/v1",name:"[Drop to Fix Item] gm4_lumos_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"lumos",metal:{type:"curies_bismium",amount:[9s,3s],castable:1b},item:"obsidian_cast"},SkullOwner:"$gm4_metallurgy:band/curies_bismium",CustomModelData:3420114,display:{Name:'{"italic":false,"translate":"item.gm4.metallurgy.obsidian_cast","fallback":"Obsidian Cast"}',Lore:['{"italic":false,"color":"#467A1B","translate":"item.gm4.metallurgy.band","fallback":"Curie\'s Bismium Band","with":[{"translate":"item.gm4.metallurgy.curies_bismium"}]}','{"italic":false,"color":"aqua","translate":"item.gm4.metallurgy.shamir","fallback":"Shamir"}','{"italic":false,"color":"gray","translate":"item.gm4.shamir.lumos","fallback":"Lumos"}']}}}

schedule function gm4_lumos_shamir:main 4t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 2634.667259492286 ~ {CustomName:'"gm4_lumos_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"lumos_shamir",page_count:2,line_count:1,module_name:"Lumos Shamir"}}

#$moduleUpdateList
