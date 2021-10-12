# init
scoreboard objectives add gm4_podzol_data dummy
scoreboard players set #100 gm4_podzol_data 100
scoreboard players set #200 gm4_podzol_data 200

# base
execute unless score podzol_rooting_soil gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Podzol Rooting Soil"}
scoreboard players set podzol_rooting_soil gm4_modules 1

schedule function gm4_podzol_rooting_soil:main 10t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3410.049756485277 ~ {CustomName:'"gm4_podzol_rooting_soil_guide"',Tags:["gm4_guide"],data:{type:"module",id:"podzol_rooting_soil",page_count:1,line_count:1,module_name:"Podzol Rooting Soil"}}

#$moduleUpdateList
