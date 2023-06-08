scoreboard objectives add gm4_count dummy
scoreboard objectives add gm4_fulcio_sneak minecraft.custom:minecraft.sneak_time

execute unless score fulcio_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Fulcio Shamir"}
scoreboard players set fulcio_shamir gm4_modules 1

data remove storage gm4_player_heads:register heads[{id:"gm4_fulcio_shamir:band/v0"}]

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_fulcio_shamir:band/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_fulcio_shamir:band/v1",name:"[Drop to Fix Item] gm4_fulcio_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"fulcio",metal:{type:"barimium",amount:[9s,3s],castable:1b},item:"obsidian_cast"},SkullOwner:{Id:[I;-340714413,1525011343,50560746,-1948445052],Properties:{textures:[{Value:"ewogICJ0aW1lc3RhbXAiIDogMTYyODc5MjUwNDk5MiwKICAicHJvZmlsZUlkIiA6ICI5MWYwNGZlOTBmMzY0M2I1OGYyMGUzMzc1Zjg2ZDM5ZSIsCiAgInByb2ZpbGVOYW1lIiA6ICJTdG9ybVN0b3JteSIsCiAgInNpZ25hdHVyZVJlcXVpcmVkIiA6IHRydWUsCiAgInRleHR1cmVzIiA6IHsKICAgICJTS0lOIiA6IHsKICAgICAgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS85MzU2MjZhYzgwZmZmYWFiOTkyOWMwYWViNTg5N2RkN2FlOThjOWI5NTY1NjVjZTc3YTEyNjE0MjExYWI2NTg0IgogICAgfQogIH0KfQ=="}]}},CustomModelData:3420115,display:{Name:'{"italic":false,"translate":"item.gm4.metallurgy.obsidian_cast","fallback":"Obsidian Cast"}',Lore:['{"italic":false,"color":"#D18A8A","translate":"item.gm4.metallurgy.band","fallback":"Barimium Band","with":[{"translate":"item.gm4.metallurgy.barimium"}]}','{"italic":false,"color":"aqua","translate":"item.gm4.metallurgy.shamir","fallback":"Shamir"}','{"italic":false,"color":"gray","translate":"item.gm4.shamir.fulcio","fallback":"Fulcio"}']}}}

schedule function gm4_fulcio_shamir:main 1t
schedule function gm4_fulcio_shamir:4_tick 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1398.90858752394 ~ {CustomName:'"gm4_fulcio_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"fulcio_shamir",page_count:2,line_count:1,module_name:"Fulcio Shamir"}}

#$moduleUpdateList
