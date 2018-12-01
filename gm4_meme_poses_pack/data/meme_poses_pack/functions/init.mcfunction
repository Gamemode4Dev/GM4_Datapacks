#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Meme Poses Pack..."}]
execute unless entity @p run say GM4: Installing Meme Poses Pack...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set meme_poses_pack gm4_modules 1
scoreboard players set meme_poses_pack gm4_clock_tick 0
scoreboard players set meme_poses_pack_2 gm4_clock_tick 8

scoreboard objectives add gm4_meme_pose dummy

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Meme Poses Pack Installed!"}]
execute unless entity @p run say GM4: Meme Poses Pack Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
