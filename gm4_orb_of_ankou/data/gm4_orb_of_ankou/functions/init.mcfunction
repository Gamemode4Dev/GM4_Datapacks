# declare and initialise scoreboards and settings
team add gm4_hide_name
team modify gm4_hide_name nametagVisibility never

# soul forge scoreboard stuff
scoreboard objectives add gm4_count dummy
scoreboard objectives add gm4_oa_forge dummy
scoreboard objectives add gm4_oa_powder dummy
scoreboard objectives add gm4_oa_glowstone dummy
scoreboard objectives add gm4_oa_tears dummy
scoreboard objectives add gm4_oa_roses dummy
scoreboard objectives add gm4_oa_essence dummy
scoreboard objectives add gm4_oa_fns minecraft.used:minecraft.flint_and_steel

function gm4_orb_of_ankou:soul_forge/recipes/initiate_recipe_amounts

# pneuma scoreboard stuff
scoreboard objectives add gm4_pneuma_data dummy
scoreboard objectives add gm4_oa_snk_num dummy
scoreboard objectives add gm4_oa_marker dummy
scoreboard objectives add gm4_oa_feign_t dummy
scoreboard objectives add gm4_health health
scoreboard objectives add gm4_oa_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add gm4_oa_swim minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add gm4_oa_bow minecraft.used:minecraft.bow

# check if players are in the nether and tag them if they are
tag @a remove gm4_oa_in_nether
execute in minecraft:the_nether run tag @a[x=0] add gm4_oa_in_nether

# unregister old shamir
data remove storage gm4_player_heads:register heads[{id:"gm4_corripio_shamir:band/v0"}]

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_corripio_shamir:band/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_corripio_shamir:band/v1",name:"[Drop to Fix Item] gm4_corripio_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"corripio",metal:{type:"bismuth",amount:[12s],castable:1b},item:"obsidian_cast"},SkullOwner:{Id:[I;-359255454,30123560,-1513962184,-616842323],Properties:{textures:[{Value:"ewogICJ0aW1lc3RhbXAiIDogMTYyODAxNDc0OTQ2MSwKICAicHJvZmlsZUlkIiA6ICJiMWMyNWQ0YjMwZDU0N2Y4YTk3NmZlYTllOGU1YzBjMyIsCiAgInByb2ZpbGVOYW1lIiA6ICJvd29FbmRlciIsCiAgInNpZ25hdHVyZVJlcXVpcmVkIiA6IHRydWUsCiAgInRleHR1cmVzIiA6IHsKICAgICJTS0lOIiA6IHsKICAgICAgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS82NmM0ODcwYmNiMDdkYWJjMjNiNTZkMzJlNzI5OWI5NTE4ZTU1N2VmMzU2YTNiZGRmNDBkNGM3MDIwYzI3MTdhIgogICAgfQogIH0KfQ=="}]}},CustomModelData:3420116,display:{Name:'{"italic":false,"translate":"item.gm4.metallurgy.obsidian_cast","fallback":"Obsidian Cast"}',Lore:['[{"translate":"item.gm4.metallurgy.bismuth.red","fallback":"Bi","italic":false,"color":"#F47989"},{"translate":"item.gm4.metallurgy.bismuth.orange","fallback":"sm","italic":false,"color":"#F5B478"},{"translate":"item.gm4.metallurgy.bismuth.yellow","fallback":"ut","italic":false,"color":"#F5DD79"},{"translate":"item.gm4.metallurgy.bismuth.green","fallback":"h ","italic":false,"color":"#78F4AE"},{"translate":"item.gm4.metallurgy.bismuth.blue","fallback":"Ba","italic":false,"color":"#79D6F5"},{"translate":"item.gm4.metallurgy.bismuth.purple","fallback":"nd","italic":false,"color":"#8378F5"},{"translate":"item.gm4.metallurgy.bismuth.magenta","fallback":"","italic":false,"color":"#D579F5"}]','{"italic":false,"color":"aqua","translate":"item.gm4.metallurgy.shamir","fallback":"Shamir"}','{"italic":false,"color":"gray","translate":"item.gm4.shamir.corripio","fallback":"Corripio"}']}}}

execute unless score orb_of_ankou gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Orb of Ankou"}
scoreboard players set orb_of_ankou gm4_modules 1

schedule function gm4_orb_of_ankou:main 1t
schedule function gm4_orb_of_ankou:tick 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3226.351847060538 ~ {CustomName:'"gm4_orb_of_ankou_guide"',Tags:["gm4_guide"],data:{type:"module",id:"orb_of_ankou",page_count:15,line_count:1,module_name:"Orb of Ankou"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 737.333098032259 ~ {CustomName:'"gm4_corripio_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"corripio_shamir",page_count:2,line_count:1,module_name:"Corripio Shamir"}}

#$moduleUpdateList
