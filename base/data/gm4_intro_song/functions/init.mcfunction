scoreboard objectives add gm4_intro_song dummy
scoreboard objectives add gm4_intro_song_t dummy

# to enable intro song on first join, set to 1
scoreboard players set $first_join gm4_intro_song 0

execute unless score intro_song gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Intro Song"}
scoreboard players set intro_song gm4_modules 1

#$moduleUpdateList
