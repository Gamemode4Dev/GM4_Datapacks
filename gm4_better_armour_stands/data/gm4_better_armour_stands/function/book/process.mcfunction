# @s = armor_stand to be modified
# at @s
# run from book/use

# get book pages
data modify storage gm4_better_armour_stands:temp pages set from entity @s equipment.mainhand.components."minecraft:writable_book_content".pages

# restore item held by armor stand and book from player
item replace entity @a[tag=gm4_bas_active,limit=1,gamemode=creative,predicate=gm4_better_armour_stands:holding/mainhand/book_and_quill,predicate=!gm4_better_armour_stands:holding/mainhand/book_ignore] weapon.mainhand with minecraft:air
# swap items between armor stand and player, using player.cursor as temporary slot
item replace entity @a[tag=gm4_bas_active,limit=1] player.cursor from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from entity @a[tag=gm4_bas_active,limit=1] weapon.mainhand
item replace entity @a[tag=gm4_bas_active,limit=1] weapon.mainhand from entity @a[tag=gm4_bas_active,limit=1] player.cursor
item replace entity @a[tag=gm4_bas_active,limit=1] player.cursor with minecraft:air

# check valid codes and apply to armor_stand
scoreboard players reset $valid_code gm4_bas_data
function #gm4_better_armour_stands:apply_book
execute unless score $valid_code gm4_bas_data matches 1 run function gm4_better_armour_stands:book/invalid

# show invisible armour stand
effect give @s[nbt={Invisible:1b}] glowing 2 0

# reset storage
data remove storage gm4_better_armour_stands:temp pages

# schedule checks in case it stopped early (e.g. player logging out)
execute if entity @e[type=armor_stand,tag=gm4_bas_no_arms] run schedule function gm4_better_armour_stands:toggle/arms/check 16t
execute if entity @e[type=armor_stand,tag=gm4_bas_temp_unlock] run schedule function gm4_better_armour_stands:toggle/lock/check 16t
execute if entity @e[type=armor_stand,tag=gm4_bas_track] run schedule function gm4_better_armour_stands:pose/check_no_player 16t
