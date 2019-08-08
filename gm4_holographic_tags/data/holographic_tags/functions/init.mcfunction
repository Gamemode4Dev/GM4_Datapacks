#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Holographic Tags...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.holographic_tags"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Holographic Tags...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set holographic_tags gm4_modules 1
scoreboard players set holographic_tags gm4_clock_tick 0

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

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Holographic Tags Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.holographic_tags"}]}]}]
execute unless entity @a[limit=1] run say GM4: Holographic Tags Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
