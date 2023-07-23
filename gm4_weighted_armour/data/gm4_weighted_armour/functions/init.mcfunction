scoreboard objectives add gm4_armor armor
scoreboard objectives add gm4_armor_weight dummy

execute unless score weighted_armour gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Weighted Armour"}
execute unless score weighted_armour gm4_earliest_version < weighted_armour gm4_modules run scoreboard players operation weighted_armour gm4_earliest_version = weighted_armour gm4_modules
scoreboard players set weighted_armour gm4_modules 1

data remove storage gm4_player_heads:register heads[{id:"gm4_helious_shamir:band/v0"}]

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_helious_shamir:band/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_helious_shamir:band/v1",name:"[Drop to Fix Item] gm4_helious_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"helious",metal:{type:"aluminium",amount:[12s],castable:1b},item:"obsidian_cast"},SkullOwner:"$gm4_metallurgy:band/aluminium_2",CustomModelData:3420103,display:{Name:'{"italic":false,"translate":"item.gm4.metallurgy.obsidian_cast","fallback":"Obsidian Cast"}',Lore:['{"italic":false,"color":"#F47989","translate":"item.gm4.metallurgy.band","fallback":"Aluminium Band","with":[{"translate":"item.gm4.metallurgy.aluminium"}]}','{"italic":false,"color":"aqua","translate":"item.gm4.metallurgy.shamir","fallback":"Shamir"}','{"italic":false,"color":"gray","translate":"item.gm4.shamir.helious","fallback":"Helious"}']}}}

schedule function gm4_weighted_armour:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4776.242502981829 ~ {CustomName:'"gm4_weighted_armour_guide"',Tags:["gm4_guide"],data:{type:"module",id:"weighted_armour",page_count:1,line_count:1,module_name:"Weighted Armour"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1688.746464910336 ~ {CustomName:'"gm4_helious_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"helious_shamir",page_count:2,line_count:1,module_name:"Helious Shamir"}}

#$moduleUpdateList
