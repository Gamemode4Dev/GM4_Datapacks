# marks thrown potion for tracking by lib_potion tracking
# @s = @e[type=potion,tag=!gm4_potion_tracking_checked]
# at @s
# run from function tag #gm4_potion_tracking:tag_potion

execute if items entity @s[tag=!gm4_potion] contents *[custom_data~{gm4_zauber_cauldrons:{bottle:{multi_use:1b}}}] run tag @s add gm4_potion
execute if items entity @s[tag=!gm4_potion] contents *[custom_data~{gm4_zauber_cauldrons:{item:"bottled_magicol"}}] run tag @s add gm4_potion
