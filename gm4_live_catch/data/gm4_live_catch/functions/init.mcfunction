
execute unless score live_catch gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Live Catch"}
scoreboard players set live_catch gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 2545.590901373343 ~ {CustomName:'"gm4_live_catch_guide"',Tags:["gm4_guide"],data:{type:"module",id:"live_catch",page_count:1,line_count:1,module_name:"Live Catch"}}

#$moduleUpdateList
