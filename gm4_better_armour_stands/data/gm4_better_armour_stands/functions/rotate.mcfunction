# @s = armor_stand to be modified
# at @s
# run from apply_book

tag @s add gm4_bas_valid_code

scoreboard players operation @s gm4_bas_id = @p[tag=gm4_bas_active] gm4_bas_id

scoreboard players set @s gm4_bas_mode 8
function gm4_better_armour_stands:pose/select/success
