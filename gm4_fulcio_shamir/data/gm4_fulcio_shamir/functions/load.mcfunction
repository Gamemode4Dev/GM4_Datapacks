execute if score gm4 load.status matches 1 if score gm4_metallurgy load.status matches 1 run scoreboard players set gm4_fulcio_shamir load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Fulcio Shamir",require:"Gamemode 4"}
execute unless score gm4_metallurgy load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Fulcio Shamir",require:"Metallurgy"}

execute if score gm4_fulcio_shamir load.status matches 1 run function gm4_fulcio_shamir:init
execute unless score gm4_fulcio_shamir load.status matches 1 run schedule clear gm4_fulcio_shamir:main
execute unless score gm4_fulcio_shamir load.status matches 1 run schedule clear gm4_fulcio_shamir:4_tick
