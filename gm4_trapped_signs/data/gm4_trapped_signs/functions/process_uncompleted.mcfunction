# @s = trapped sign without the gm4_trapped_signs_completed tag
# run from process

data modify storage gm4_trapped_signs:temp Text1 set from block ~ ~ ~ front_text.messages[0]
data modify storage gm4_trapped_signs:temp Text2 set from block ~ ~ ~ front_text.messages[1]
data modify storage gm4_trapped_signs:temp Text3 set from block ~ ~ ~ front_text.messages[2]
data modify storage gm4_trapped_signs:temp Text4 set from block ~ ~ ~ front_text.messages[3]

execute unless data storage gm4_trapped_signs:temp {Text1:"{\"text\":\"\"}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}"} run function gm4_trapped_signs:complete
