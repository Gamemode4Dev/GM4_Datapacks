scoreboard objectives add gm4_intro_song dummy
scoreboard objectives add gm4_intro_song_t dummy

scoreboard objectives add gm4_intro_walked minecraft.custom:walk_one_cm

# enable intro song by default, upon first installation
execute unless score $enabled gm4_intro_song = $enabled gm4_intro_song run scoreboard players set $enabled gm4_intro_song 1

execute unless score intro_song gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Intro Song"}
scoreboard players set intro_song gm4_modules 1

#$moduleUpdateList
