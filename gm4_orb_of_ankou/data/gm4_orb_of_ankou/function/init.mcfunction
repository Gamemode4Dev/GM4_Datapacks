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
scoreboard objectives add gm4_oa_id dummy
scoreboard objectives add gm4_pneuma_data dummy
scoreboard objectives add gm4_oa_snk_num dummy
scoreboard objectives add gm4_oa_marker dummy
scoreboard objectives add gm4_oa_feign_t dummy
scoreboard objectives add gm4_oa_sniff dummy
scoreboard objectives add gm4_health health
scoreboard objectives add gm4_oa_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add gm4_oa_swim minecraft.custom:minecraft.swim_one_cm
scoreboard objectives add gm4_oa_bow minecraft.used:minecraft.bow

# check if players are in the nether and tag them if they are
tag @a remove gm4_oa_in_nether
execute in minecraft:the_nether run tag @a[x=0] add gm4_oa_in_nether

execute unless score orb_of_ankou gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Orb of Ankou"}
execute unless score orb_of_ankou gm4_earliest_version < orb_of_ankou gm4_modules run scoreboard players operation orb_of_ankou gm4_earliest_version = orb_of_ankou gm4_modules
scoreboard players set orb_of_ankou gm4_modules 1

schedule function gm4_orb_of_ankou:main 1t
schedule function gm4_orb_of_ankou:tick 1t


execute if score gm4_guidebook load.status matches 1 run summon marker ~ 737.333098032259 ~ {CustomName:'"gm4_corripio_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"corripio_shamir",page_count:2,line_count:1,module_name:"Corripio Shamir"}}

#$moduleUpdateList
