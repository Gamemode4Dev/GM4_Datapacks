#unless the module is already initialized
execute unless score meme_poses_pack gm4_modules matches 1.. run function meme_poses_pack:init
scoreboard players add installed_modules gm4_up_check 1
