execute unless data storage gm4:log queue[{type:"install"}] run data modify storage gm4:log queue append value {type:"text",message:'{"text":"[GM4]: No updates found.","color":"aqua"}'}
execute if data storage gm4:log queue[{type:"install"}] run data modify storage gm4:log queue append value {type:"text",message:'{"text":"[GM4]: Updates completed.","color":"aqua"}'}

function gm4-1.1:log_wait
