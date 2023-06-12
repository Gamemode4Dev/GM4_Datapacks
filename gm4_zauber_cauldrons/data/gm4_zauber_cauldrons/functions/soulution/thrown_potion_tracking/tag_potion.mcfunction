# marks thrown potion for tracking by lib_potion tracking
# @s = @e[type=potion,tag=!gm4_potion_tracking_checked]
# at @s
# run from function tag #gm4_potion_tracking:tag_potion

tag @s[tag=!gm4_potion,nbt={Item:{tag:{gm4_zauber_cauldrons:{bottle:{multi_use:1b}}}}}] add gm4_potion
