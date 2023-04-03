data modify storage gm4:log traverse_versions set from storage gm4:log versions
function gm4:conflict_logs/traverse

execute if score #not_match gm4_data matches 1 run tellraw @a[tag=gm4_show_log] [{"nbt":"log.module","storage":"gm4:log","color":"red"},{"text":" is disabled. It requires ","color":"red"},{"nbt":"log.require","storage":"gm4:log","color":"red"},{"text":" v","color":"red"},{"nbt":"log.require_ver","storage":"gm4:log"},{"text":" but ?Unknown Version? is installed instead","color":"red"}]

data remove storage gm4:log traverse_versions
