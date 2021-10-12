scoreboard objectives add gm4_st_sand minecraft.mined:minecraft.sand
scoreboard objectives add gm4_st_gravel minecraft.mined:minecraft.gravel
scoreboard objectives add gm4_st_random dummy

execute unless score sunken_treasure gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Sunken Treasure"}
scoreboard players set sunken_treasure gm4_modules 1

schedule function gm4_sunken_treasure:tick 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4076.140283352973 ~ {CustomName:'"gm4_sunken_treasure_guide"',Tags:["gm4_guide"],data:{type:"module",id:"sunken_treasure",page_count:1,line_count:1,module_name:"Sunken Treasure"}}

#$moduleUpdateList
