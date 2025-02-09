data modify storage gm4:log log set from storage gm4:log queue[0]
execute if data storage gm4:log log{type:"text"} run tellraw @a[tag=gm4_show_log] {"nbt":"log.message","storage":"gm4:log","interpret":true}
execute if data storage gm4:log log{type:"install"} run tellraw @a[tag=gm4_show_log] [{"nbt":"log.module","storage":"gm4:log"},{"text":" Installed!","color":"white"}]
execute if data storage gm4:log log{type:"missing"} run tellraw @a[tag=gm4_show_log] [{"nbt":"log.module","storage":"gm4:log","color":"red"},{"text":" is disabled because ","color":"red"},{"nbt":"log.require","storage":"gm4:log","color":"red"},{"text":" is not installed."}]
execute if data storage gm4:log log{type:"outdated"} run function gm4:outdated_logs/outdated_start
execute if data storage gm4:log log{type:"version_conflict"} run function gm4:conflict_logs/version_conflict_start
execute if data storage gm4:log log{type:"environment_check_failed"} run tellraw @a[tag=gm4_show_log] [{"nbt":"log.module","storage":"gm4:log","color":"red"},{"text":" is disabled because the required environment check '","color":"red"},{"nbt":"log.environment_check","storage":"gm4:log","color":"red"},{"text":"' failed! ","color":"red"}, {"nbt":"log.probable_cause","storage":"gm4:log","color":"red", "interpret": true}]

data remove storage gm4:log queue[0]
execute store result score #log_size gm4_data run data get storage gm4:log queue
execute if score #log_size gm4_data matches 1.. run function gm4:log
