scoreboard objectives add gm4_vigere_use minecraft.used:minecraft.shield
scoreboard objectives add gm4_health health

execute unless score vigere_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Vigere Shamir"}
scoreboard players set vigere_shamir gm4_modules 1

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_vigere_shamir:band/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_vigere_shamir:band/v0",name:"[Drop to Fix Item] gm4_vigere_shamir:band",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"vigere",metal:{type:"barimium",amount:[12s],castable:1b},item:"obsidian_cast"},CustomModelData:3420119,display:{Name:'{"italic":false,"translate":"item.gm4.metallurgy.obsidian_cast","fallback":"Obsidian Cast"}',Lore:['{"italic":false,"color":"#D18A8A","translate":"item.gm4.metallurgy.band","fallback":"Barimium Band","with":[{"translate":"item.gm4.metallurgy.barimium"}]}','{"italic":false,"color":"aqua","translate":"item.gm4.metallurgy.shamir","fallback":"Shamir"}','{"italic":false,"color":"gray","translate":"item.gm4.shamir.vigere","fallback":"Vigere"}']}}}

schedule function gm4_vigere_shamir:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4600.271647537812 ~ {CustomName:'"gm4_vigere_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"vigere_shamir",page_count:2,line_count:1,module_name:"Vigere Shamir"}}

#$moduleUpdateList
