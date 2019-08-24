#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Area Markers...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.area_markers"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Area Markers...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set area_markers gm4_modules 1
scoreboard players set area_markers gm4_clock_tick 0

#create teams for the colours

team add gm4_am_white
team add gm4_am_orange
team add gm4_am_magenta
team add gm4_am_lightblue
team add gm4_am_yellow
team add gm4_am_lime
team add gm4_am_pink
team add gm4_am_gray
team add gm4_am_lightgray
team add gm4_am_cyan
team add gm4_am_purple
team add gm4_am_blue
team add gm4_am_brown
team add gm4_am_green
team add gm4_am_red
team add gm4_am_black

team modify gm4_am_white color white
team modify gm4_am_orange color gold
team modify gm4_am_magenta color light_purple
team modify gm4_am_lightblue color aqua
team modify gm4_am_yellow color yellow
team modify gm4_am_lime color green
team modify gm4_am_pink color red
team modify gm4_am_gray color dark_gray
team modify gm4_am_lightgray color gray
team modify gm4_am_cyan color dark_aqua
team modify gm4_am_purple color dark_purple
team modify gm4_am_blue color blue
team modify gm4_am_brown color dark_blue
team modify gm4_am_green color dark_green
team modify gm4_am_red color dark_red
team modify gm4_am_black color black

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Area Markers Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.area_markers"}]}]}]
execute unless entity @a[limit=1] run say GM4: Area Markers Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
