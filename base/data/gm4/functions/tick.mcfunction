#runs every tick
scoreboard players add current_tick gm4_clock_tick 1
execute if score current_tick gm4_clock_tick matches 16.. run scoreboard players set current_tick gm4_clock_tick 0
function #gm4:pulse_check
function #gm4:repeat

#prints scheduled out-of-date messages to chat
execute if score current_tick gm4_clock_tick matches 0 if entity @a[limit=1] if entity @e[limit=1,tag=gm4_update_message,type=area_effect_cloud] run tellraw @a [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}],"color":"aqua"},{"translate":"%1$s","with":[["Some of your modules are outdated: ",{"selector":"@e[type=area_effect_cloud,tag=gm4_update_message]","color":"gold"}],{"translate":"text.gm4.modules.outdated","with":[{"selector":"@e[type=area_effect_cloud,tag=gm4_update_message]","color":"gold"}]}]}]
execute if score current_tick gm4_clock_tick matches 0 if entity @a[limit=1] if entity @e[limit=1,tag=gm4_update_message,type=area_effect_cloud] run tellraw @a [{"translate": "%1$s","with":["[GM4]: ",{"translate": "text.gm4.prefix"}],"color":"aqua"},{"translate": "%1$s","with":["Click to visit our site with the latest versions.",{"translate": "text.gm4.modules.outdated_link"}],"color":"white","underlined":true,"clickEvent":{"action":"open_url","value":"https://www.gm4.co/modules/"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"Click to visit gm4.co/modules/","color":"aqua"}]}}}]
execute if score current_tick gm4_clock_tick matches 0 if entity @a[limit=1] if entity @e[limit=1,tag=gm4_update_message,type=area_effect_cloud] run kill @e[type=area_effect_cloud,tag=gm4_update_message]
