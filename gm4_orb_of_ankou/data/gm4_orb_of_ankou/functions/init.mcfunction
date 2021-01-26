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


execute unless score orb_of_ankou gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Orb of Ankou"}
scoreboard players set orb_of_ankou gm4_modules 1

schedule function gm4_orb_of_ankou:main 1t
schedule function gm4_orb_of_ankou:tick 1t

#$moduleUpdateList
