execute store success score #not_match gm4_data run data modify storage gm4:log traverse_versions[0].id set from storage gm4:log log.require_id
execute if data storage gm4:log traverse_versions[0].from run data modify storage gm4:log temp set value '[{"text":" (packaged in ","color":"red"},{"nbt":"traverse_versions[0].from","storage":"gm4:log","color":"red"},{"text":")","color":"red"}]'

execute if score #not_match gm4_data matches 0 run tellraw @a[tag=gm4_show_log] [{"nbt":"log.module","storage":"gm4:log","color":"red"},{"text":" is disabled. It requires ","color":"red"},{"nbt":"log.require","storage":"gm4:log","color":"red"},{"text":" v","color":"red"},{"nbt":"log.require_ver","storage":"gm4:log"},{"text":" but ","color":"red"},{"nbt":"traverse_versions[0].module","storage":"gm4:log"},{"text":" v"},{"nbt":"traverse_versions[0].version","storage":"gm4:log","color":"red"},{"text":" is installed instead","color":"red"},{"nbt":"temp","storage":"gm4:log","interpret":true}]

data remove storage gm4:log temp
execute if score #not_match gm4_data matches 1 run data remove storage gm4:log traverse_versions[0]
execute store result score #match_size gm4_data run data get storage gm4:log traverse_versions
execute if score #not_match gm4_data matches 1 if score #match_size gm4_data matches 1.. run function gm4:conflict_logs/traverse
