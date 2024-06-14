tellraw @a[tag=gm4_show_log] [{"text":"  - ","color":"gold"},{"nbt":"outdated_list[0].render","storage":"gm4:log","color":"gold","interpret":true}]

data remove storage gm4:log outdated_list[0]
execute store result score #list_size gm4_data run data get storage gm4:log outdated_list
execute if score #list_size gm4_data matches 1.. run function gm4:outdated_logs/traverse
