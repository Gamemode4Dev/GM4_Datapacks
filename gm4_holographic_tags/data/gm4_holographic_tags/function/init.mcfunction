team add gm4_white
team add gm4_orange
team add gm4_magenta
team add gm4_lightblue
team add gm4_yellow
team add gm4_lime
team add gm4_pink
team add gm4_gray
team add gm4_lightgray
team add gm4_cyan
team add gm4_purple
team add gm4_blue
team add gm4_brown
team add gm4_green
team add gm4_red
team add gm4_black

team modify gm4_white color white
team modify gm4_orange color gold
team modify gm4_magenta color light_purple
team modify gm4_lightblue color aqua
team modify gm4_yellow color yellow
team modify gm4_lime color green
team modify gm4_pink color red
team modify gm4_gray color dark_gray
team modify gm4_lightgray color gray
team modify gm4_cyan color dark_aqua
team modify gm4_purple color dark_purple
team modify gm4_blue color blue
team modify gm4_brown color dark_blue
team modify gm4_green color dark_green
team modify gm4_red color dark_red
team modify gm4_black color black

scoreboard objectives add gm4_entity_version dummy

execute unless score holographic_tags gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Holographic Tags"}
execute unless score holographic_tags gm4_earliest_version < holographic_tags gm4_modules run scoreboard players operation holographic_tags gm4_earliest_version = holographic_tags gm4_modules
scoreboard players set holographic_tags gm4_modules 1

schedule function gm4_holographic_tags:main 1t



#$moduleUpdateList
