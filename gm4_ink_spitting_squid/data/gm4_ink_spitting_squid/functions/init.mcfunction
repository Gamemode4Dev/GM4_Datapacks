execute unless score ink_spitting_squid gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Ink Spitting Squid"}
scoreboard players set ink_spitting_squid gm4_modules 1

schedule function gm4_ink_spitting_squid:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1963.09036415122 ~ {CustomName:'"gm4_ink_spitting_squid_guide"',Tags:["gm4_guide"],data:{type:"module",id:"ink_spitting_squid",page_count:2,line_count:1,module_name:"Ink Spitting Squid"}}

#$moduleUpdateList
