scoreboard objectives add gm4_sh_health dummy
scoreboard objectives add gm4_sh_data dummy
scoreboard players set #10 gm4_sh_health 10 

execute unless score sweethearts gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Sweethearts"}
scoreboard players set sweethearts gm4_modules 1

schedule function gm4_sweethearts:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4088.792567293057 ~ {CustomName:'"gm4_sweethearts_guide"',Tags:["gm4_guide"],data:{type:"module",id:"sweethearts",page_count:1,line_count:1,module_name:"Sweethearts"}}

#$moduleUpdateList
