execute if score gm4_guidebook load.status matches 1 run function gm4_guidebook:init
execute unless score gm4_guidebook load.status matches 1 run schedule clear gm4_guidebook:main
execute unless score gm4_guidebook load.status matches 1 run schedule clear gm4_guidebook:tick
