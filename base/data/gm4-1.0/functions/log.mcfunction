data modify storage gm4:log log set from storage gm4:log queue[0]
execute if data storage gm4:log log{type:"text"} run tellraw @a[gamemode=creative] {"nbt":"log.message","storage":"gm4:log","interpret":true}
execute if data storage gm4:log log{type:"install"} run tellraw @a[gamemode=creative] [{"nbt":"log.module","storage":"gm4:log"},{"translate":"%1$s%3427655$s","with":[" Installed!",{"translate":"text.gm4.modules.update.installed"}],"color":"white"}]
execute if data storage gm4:log log{type:"missing"} run tellraw @a[gamemode=creative] [{"nbt":"log.module","storage":"gm4:log","color":"red"},{"translate":"%1$s%3427655$s","with":[" is disabled because it requires a different version of ",{"translate":"text.gm4.modules.base.missing"}],"color":"red"},{"nbt":"log.require","storage":"gm4:log","color":"red"}]
execute if data storage gm4:log log{type:"outdated"} run tellraw @a[gamemode=creative] [{"nbt":"log.module","storage":"gm4:log","color":"gold"},{"translate":"%1$s%3427655$s","with":[" is outdated! Click here to download the latest version.",{"translate":"text.gm4.modules.base.outdated"}],"color":"gold","clickEvent":{"action":"open_url","value":"https://www.gm4.co/modules"},"hoverEvent":{"action":"show_text","value":{"translate":"%1$s%3427655$s","with":["Click to visit gm4.co/modules",{"translate":"text.gm4.modules.update.hover_text"}],"color":"aqua"}}}]
data remove storage gm4:log queue[0]
execute store result score #log_size gm4_data run data get storage gm4:log queue
execute if score #log_size gm4_data matches 1.. run function gm4-1.0:log
