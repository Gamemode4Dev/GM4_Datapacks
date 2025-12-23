tellraw @s {text:"          "}
tellraw @s {text:"----------------------", color:"#4AA0C7"}
tellraw @s {text:" Desire Lines Config ",color:"#a0dcf7",bold:true}

execute if score ?break_flowers gm4_desire_lines matches 1 run tellraw @s ["Destroy Flowers: ",{"bold":true,"click_event":{"action":"run_command","command":"function gm4_desire_lines:config/set {'id':1}"},"color":"green","hover_event":{"action":"show_text","value":[{"text":"Toggle OFF","color":"red"}]},"text":"ON"}]
execute if score ?break_flowers gm4_desire_lines matches 0 run tellraw @s ["Destroy Flowers: ",{"bold":true,"click_event":{"action":"run_command","command":"function gm4_desire_lines:config/set {'id':2}"},"color":"red","hover_event":{"action":"show_text","value":[{"text":"Toggle ON","color":"green"}]},"text":"OFF"}]

execute if score ?break_grass gm4_desire_lines matches 1 run tellraw @s ["Destroy Grass: ",{"bold":true,"click_event":{"action":"run_command","command":"function gm4_desire_lines:config/set {'id':3}"},"color":"green","hover_event":{"action":"show_text","value":[{"text":"Toggle OFF","color":"red"}]},"text":"ON"}]
execute if score ?break_grass gm4_desire_lines matches 0 run tellraw @s ["Destroy Grass: ",{"bold":true,"click_event":{"action":"run_command","command":"function gm4_desire_lines:config/set {'id':4}"},"color":"red","hover_event":{"action":"show_text","value":[{"text":"Toggle ON","color":"green"}]},"text":"OFF"}]

tellraw @s {text:"----------------------", color:"#4AA0C7"}
tellraw @s {text:"          "}
