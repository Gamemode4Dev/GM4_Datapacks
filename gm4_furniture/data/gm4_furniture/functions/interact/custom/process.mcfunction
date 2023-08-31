# process custom furniture interactions
# @s = furniture's interacted interaction entity 
# at @s
# run from interact/process

data modify storage gm4_furniture:temp technical_id set string entity @s CustomName 23 -2
function gm4_furniture:interact/custom/resolve_function with storage gm4_furniture:temp
data remove storage gm4_furniture:temp technical_id
