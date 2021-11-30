# @s = armor_stand to be modified
# at @s
# run from book/apply

tag @s add gm4_bas_valid_code

scoreboard players operation @s gm4_bas_id = @a[tag=gm4_bas_active,limit=1] gm4_bas_id

scoreboard players set @s gm4_bas_mode 8
function gm4_better_armour_stands:pose/select/success
