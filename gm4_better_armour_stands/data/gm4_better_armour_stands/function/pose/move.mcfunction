# @s = armor_stand to be modified
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1
scoreboard players operation @s gm4_bas_id = @a[tag=gm4_bas_active,limit=1] gm4_bas_id

function gm4_better_armour_stands:pose/select/move/move
function gm4_better_armour_stands:pose/select/success
