# @s = spawner minecarts (fully fueled)
# run from process

execute positioned ~.29 ~ ~ if block ~ ~ ~ detector_rail[shape=east_west] run setblock ~ ~ ~ detector_rail[powered=false,shape=east_west]
execute positioned ~-.29 ~ ~ if block ~ ~ ~ detector_rail[shape=east_west] run setblock ~ ~ ~ detector_rail[powered=false,shape=east_west]
execute positioned ~ ~ ~.29 if block ~ ~ ~ detector_rail[shape=north_south] run setblock ~ ~ ~ detector_rail[powered=false,shape=north_south]
execute positioned ~ ~ ~-.29 if block ~ ~ ~ detector_rail[shape=north_south] run setblock ~ ~ ~ detector_rail[powered=false,shape=north_south]
execute positioned ~.29 ~ ~ if block ~ ~ ~ detector_rail[shape=ascending_east] run setblock ~ ~ ~ detector_rail[powered=false,shape=ascending_east]
execute positioned ~-.29 ~ ~ if block ~ ~ ~ detector_rail[shape=ascending_west] run setblock ~ ~ ~ detector_rail[powered=false,shape=ascending_west]
execute positioned ~ ~ ~.29 if block ~ ~ ~ detector_rail[shape=ascending_south] run setblock ~ ~ ~ detector_rail[powered=false,shape=ascending_south]
execute positioned ~ ~ ~-.29 if block ~ ~ ~ detector_rail[shape=ascending_north] run setblock ~ ~ ~ detector_rail[powered=false,shape=ascending_north]

# cap the fuel at 2000 and remove temporary tag
scoreboard players set @s gm4_spawner_fuel 2000
tag @s remove gm4_spawner_minecart_full
