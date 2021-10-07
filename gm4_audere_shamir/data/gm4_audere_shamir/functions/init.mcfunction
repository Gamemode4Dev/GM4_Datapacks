execute unless score audere_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Audere Shamir"}
scoreboard players set audere_shamir gm4_modules 1

# unregister shamir
data remove storage gm4_player_heads:register heads[{id:"gm4_audere_shamir:band/v0"}]

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_audere_shamir:band/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_audere_shamir:band/v1",name:"[Drop to Fix Item] gm4_audere_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"audere",metal:{type:"barium",amount:[12s],castable:1b},item:"obsidian_cast"},SkullOwner:{Id:[I;-758190455,118414880,1677653096,2076204799],Properties:{textures:[{Value:"ewogICJ0aW1lc3RhbXAiIDogMTYyODg4MzkzODA4MiwKICAicHJvZmlsZUlkIiA6ICJmNThkZWJkNTlmNTA0MjIyOGY2MDIyMjExZDRjMTQwYyIsCiAgInByb2ZpbGVOYW1lIiA6ICJ1bnZlbnRpdmV0YWxlbnQiLAogICJzaWduYXR1cmVSZXF1aXJlZCIgOiB0cnVlLAogICJ0ZXh0dXJlcyIgOiB7CiAgICAiU0tJTiIgOiB7CiAgICAgICJ1cmwiIDogImh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZGMxMzcwMGVlMGViYzgwOTU2N2IxYTNjOTFhYzhjMWFhMmJiNWNlYjQ4YWRlNzZlOGJkN2QzMWE5Y2EzYjdkIgogICAgfQogIH0KfQ=="}]}},CustomModelData:3420120,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"#F0EAD6","translate":"%1$s%3427655$s","with":["Barium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.barium"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Audere",{"translate":"item.gm4.shamir.audere"}]}']}}}

schedule function gm4_audere_shamir:main 16t

# guidebook
execute if score gm4_guidebook load.status matches 1.. run summon marker ~ 367.217754760584 ~ {CustomName:'"gm4_audere_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"audere_shamir",page_count:1,line_count:1,module_name:"Audere Shamir"}}

#$moduleUpdateList
