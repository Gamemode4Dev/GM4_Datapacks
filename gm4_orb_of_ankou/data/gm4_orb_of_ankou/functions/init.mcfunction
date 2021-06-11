# declare and initialise scoreboards and settings

# soul forge scoreboard stuff
scoreboard objectives add gm4_count dummy
scoreboard objectives add gm4_oa_forge dummy
scoreboard objectives add gm4_oa_powder dummy
scoreboard objectives add gm4_oa_glowstone dummy
scoreboard objectives add gm4_oa_tears dummy
scoreboard objectives add gm4_oa_roses dummy
scoreboard objectives add gm4_oa_essence dummy

function gm4_orb_of_ankou:soul_forge/recipes/initiate_recipe_amounts

# pneuma scoreboard stuff
scoreboard objectives add gm4_pneuma_data dummy
scoreboard objectives add gm4_oa_snk_num dummy
scoreboard objectives add gm4_oa_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add gm4_oa_swim minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add gm4_oa_bow minecraft.used:minecraft.bow
scoreboard objectives add gm4_oa_fns minecraft.used:minecraft.flint_and_steel

# check if players are in the nether and tag them if they are
tag @a remove gm4_oa_in_nether
execute in minecraft:the_nether run tag @a[distance=0..] add gm4_oa_in_nether

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_corripio_shamir:band/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_corripio_shamir:band/v0",name:"[Drop to Fix Item] gm4_corripio_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"corripio",metal:{type:"copper",amount:[12s],castable:1b},item:"obsidian_cast"},CustomModelData:116,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"gold","translate":"%1$s%3427655$s","with":["Copper Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.copper"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Corripio",{"translate":"item.gm4.shamir.corripio"}]}']}}}

execute unless score orb_of_ankou gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Orb of Ankou"}
scoreboard players set orb_of_ankou gm4_modules 1

schedule function gm4_orb_of_ankou:main 1t
schedule function gm4_orb_of_ankou:tick 1t

#$moduleUpdateList
