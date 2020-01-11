execute unless data storage gm4:log queue[{type:"install"}] run data modify storage gm4:log queue append value {type:"text",message:'[{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}],"color":"aqua"},{"translate":"%1$s%3427655$s","with":["No updates found.",{"translate":"text.gm4.modules.update.none_found"}],"color":"aqua"}]'}
execute if data storage gm4:log queue[{type:"install"}] run data modify storage gm4:log queue append value {type:"text",message:'[{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}],"color":"aqua"},{"translate":"%1$s%3427655$s","with":["Updates completed.",{"translate":"text.gm4.modules.update.completed"}],"color":"aqua"}]'}

function gm4-1.0:log_wait
