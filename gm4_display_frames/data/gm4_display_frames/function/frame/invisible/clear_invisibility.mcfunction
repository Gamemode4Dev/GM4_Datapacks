# @s = display frame that lost its item
# run from frame/invisible/process

tag @s remove gm4_df_invisible
data modify entity @s Invisible set value 0b
