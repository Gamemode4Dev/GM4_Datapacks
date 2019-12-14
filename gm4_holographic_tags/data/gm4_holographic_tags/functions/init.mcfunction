team add gm4_ht_white
team add gm4_ht_orange
team add gm4_ht_magenta
team add gm4_ht_lightblue
team add gm4_ht_yellow
team add gm4_ht_lime
team add gm4_ht_pink
team add gm4_ht_gray
team add gm4_ht_lightgray
team add gm4_ht_cyan
team add gm4_ht_purple
team add gm4_ht_blue
team add gm4_ht_brown
team add gm4_ht_green
team add gm4_ht_red
team add gm4_ht_black

team modify gm4_ht_white color white
team modify gm4_ht_orange color gold
team modify gm4_ht_magenta color light_purple
team modify gm4_ht_lightblue color aqua
team modify gm4_ht_yellow color yellow
team modify gm4_ht_lime color green
team modify gm4_ht_pink color red
team modify gm4_ht_gray color dark_gray
team modify gm4_ht_lightgray color gray
team modify gm4_ht_cyan color dark_aqua
team modify gm4_ht_purple color dark_purple
team modify gm4_ht_blue color blue
team modify gm4_ht_brown color dark_blue
team modify gm4_ht_green color dark_green
team modify gm4_ht_red color dark_red
team modify gm4_ht_black color black

execute unless score holographic_tags gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Holographic Tags"}
scoreboard players set holographic_tags gm4_modules 1

schedule function gm4_holographic_tags:main 1t

#$moduleUpdateList
