# @s = locked armor_stand
# at @s
# run from book/hold

# enable temporary interaction
data merge entity @s {Marker:0b,Glowing:1b}
tag @s add gm4_bas_temp_unlock

# start check loop to remove temporary unlock
schedule function gm4_better_armour_stands:toggle/lock/check 16t
