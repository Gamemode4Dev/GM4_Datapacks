scoreboard objectives add gm4_iacio_tridnt minecraft.used:minecraft.trident
scoreboard objectives add gm4_iacio_item minecraft.custom:minecraft.drop
scoreboard objectives add gm4_iacio_pearl minecraft.used:minecraft.ender_pearl
scoreboard objectives add gm4_iacio_snowbl minecraft.used:minecraft.snowball
scoreboard objectives add gm4_iacio_egg minecraft.used:minecraft.egg
scoreboard objectives add gm4_iacio_splash minecraft.used:minecraft.splash_potion
scoreboard objectives add gm4_iacio_linger minecraft.used:minecraft.lingering_potion

execute unless score iacio_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Iacio shamir"}
scoreboard players set iacio_shamir gm4_modules 1

# unregister old shamir
data remove storage gm4_player_heads:register heads[{id:"gm4_iacio_shamir:band/v0"}]

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_iacio_shamir:band/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_iacio_shamir:band/v1",name:"[Drop to Fix Item] gm4_iacio_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"iacio",metal:{type:"barium",amount:[12s],castable:1b},item:"obsidian_cast"},SkullOwner:{Id:[I;-758190455,118414880,1677653096,2076204799],Properties:{textures:[{Value:"ewogICJ0aW1lc3RhbXAiIDogMTYyODg4MzkzODA4MiwKICAicHJvZmlsZUlkIiA6ICJmNThkZWJkNTlmNTA0MjIyOGY2MDIyMjExZDRjMTQwYyIsCiAgInByb2ZpbGVOYW1lIiA6ICJ1bnZlbnRpdmV0YWxlbnQiLAogICJzaWduYXR1cmVSZXF1aXJlZCIgOiB0cnVlLAogICJ0ZXh0dXJlcyIgOiB7CiAgICAiU0tJTiIgOiB7CiAgICAgICJ1cmwiIDogImh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZGMxMzcwMGVlMGViYzgwOTU2N2IxYTNjOTFhYzhjMWFhMmJiNWNlYjQ4YWRlNzZlOGJkN2QzMWE5Y2EzYjdkIgogICAgfQogIH0KfQ=="}]}},CustomModelData:3420122,display:{Name:'{"italic":false,"translate":"item.gm4.metallurgy.obsidian_cast","fallback":"Obsidian Cast"}',Lore:['{"italic":false,"color":"#F0EAD6","translate":"item.gm4.metallurgy.band","fallback":"Barium Band","with":[{"translate":"item.gm4.metallurgy.barium"}]}','{"italic":false,"color":"aqua","translate":"item.gm4.metallurgy.shamir","fallback":"Shamir"}','{"italic":false,"color":"gray","translate":"item.gm4.shamir.iacio","fallback":"Iacio"}']}}}

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1861.593306342615 ~ {CustomName:'"gm4_iacio_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"iacio_shamir",page_count:2,line_count:1,module_name:"Iacio Shamir"}}

#$moduleUpdateList
