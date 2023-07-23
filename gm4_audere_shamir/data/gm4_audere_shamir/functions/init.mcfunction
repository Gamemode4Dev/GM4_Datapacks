execute unless score audere_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Audere Shamir"}
execute unless score audere_shamir gm4_earliest_version < audere_shamir gm4_modules run scoreboard players operation audere_shamir gm4_earliest_version = audere_shamir gm4_modules
scoreboard players set audere_shamir gm4_modules 1

# unregister shamir
data remove storage gm4_player_heads:register heads[{id:"gm4_audere_shamir:band/v0"}]

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_audere_shamir:band/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_audere_shamir:band/v1",name:"[Drop to Fix Item] gm4_audere_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"audere",metal:{type:"barium",amount:[12s],castable:1b},item:"obsidian_cast"},SkullOwner:"gm4_metallurgy:band/barium",CustomModelData:3420120,display:{Name:'{"italic":false,"translate":"item.gm4.metallurgy.obsidian_cast","fallback":"Obsidian Cast"}',Lore:['{"italic":false,"color":"#F0EAD6","translate":"item.gm4.metallurgy.band","fallback":"Barium Band","with":[{"translate":"item.gm4.metallurgy.barium"}]}','{"italic":false,"color":"aqua","translate":"item.gm4.metallurgy.shamir","fallback":"Shamir"}','{"italic":false,"color":"gray","translate":"item.gm4.shamir.audere","fallback":"Audere"}']}}}

schedule function gm4_audere_shamir:main 16t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 367.217754760584 ~ {CustomName:'"gm4_audere_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"audere_shamir",page_count:2,line_count:1,module_name:"Audere Shamir"}}

#$moduleUpdateList
