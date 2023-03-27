tellraw @a[tag=gm4_show_log] [{"text":"The following modules are outdated! Click here to download the latest versions.","color":"gold","clickEvent":{"action":"open_url","value":"https://www.gm4.co/modules"},"hoverEvent":{"action":"show_text","value":{"text":"Click to visit gm4.co/modules","color":"#4AA0C7"}}}]

data modify storage gm4:log outdated_list set from storage gm4:log queue
data remove storage gm4:log outdated_list[{type:"text"}]
data remove storage gm4:log outdated_list[{type:"install"}]
data remove storage gm4:log outdated_list[{type:"missing"}]
data remove storage gm4:log outdated_list[{type:"version_conflict"}]
function gm4:outdated_logs/traverse

data remove storage gm4:log outdated_list
data remove storage gm4:log queue[{type:"outdated"}]
data modify storage gm4:log queue prepend value {type:"outdated",module:"log_placeholder"}
