team add gm4_chairs
team modify gm4_chairs collisionRule never
scoreboard objectives add gm4_chairs_sit dummy
scoreboard objectives add gm4_entity_version dummy

execute unless score chairs gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Chairs"}
execute unless score chairs gm4_earliest_version < chairs gm4_modules run scoreboard players operation chairs gm4_earliest_version = chairs gm4_modules
scoreboard players set chairs gm4_modules 1

schedule function gm4_chairs:main 1t
schedule function gm4_chairs:sit/check 1t



#$moduleUpdateList
