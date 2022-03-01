scoreboard objectives add gm4_lm_data dummy
scoreboard players set #5 gm4_lm_data 5
scoreboard players set #2 gm4_lm_data 2
scoreboard players set #100 gm4_lm_data 100

data merge storage gm4_liquid_minecarts:compare {liquid:"null"}

execute unless score liquid_minecarts gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Liquid Minecarts"}
scoreboard players set liquid_minecarts gm4_modules 1

schedule function gm4_liquid_minecarts:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 2544.348483314364 ~ {CustomName:'"gm4_liquid_minecarts_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"liquid_tanks",id:"liquid_minecarts",page_count:1,line_count:1,module_name:"Liquid Minecarts"}}

#$moduleUpdateList
