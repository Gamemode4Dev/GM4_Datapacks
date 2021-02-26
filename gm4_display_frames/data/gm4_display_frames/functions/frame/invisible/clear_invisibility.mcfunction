# @s = display frame that lost its item
# run from process

tag @s remove gm4_df_invisible
data modify entity @s Invisible set value 0b
