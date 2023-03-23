execute unless data storage gm4:log queue[{type:"install"}] run data modify storage gm4:log queue append value {type:"text",message:'{"text":"[GM4]: No updates found.","color":"#4AA0C7"}'}
execute if data storage gm4:log queue[{type:"install"}] run data modify storage gm4:log queue append value {type:"text",message:'{"text":"[GM4]: Updates completed.","color":"#4AA0C7"}'}

function gm4:log_wait
