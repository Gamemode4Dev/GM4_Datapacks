# Gets player rotation data for later
# @s = player who interacted with a decorated pot
# at @s
# run from decorated/as_player

# player facing west
execute if entity @s[y_rotation=45..135] unless entity @s[y_rotation=45] run return run data modify storage gm4_blossoming_pots:decorated_pots temp.rotation set value 0
# player facing north
execute if entity @s[y_rotation=135..225] unless entity @s[y_rotation=135] run return run data modify storage gm4_blossoming_pots:decorated_pots temp.rotation set value 90
# player facing east
execute if entity @s[y_rotation=225..315] unless entity @s[y_rotation=225] run return run data modify storage gm4_blossoming_pots:decorated_pots temp.rotation set value 180
# player facing south
execute if entity @s[y_rotation=315..405] unless entity @s[y_rotation=315] run return run data modify storage gm4_blossoming_pots:decorated_pots temp.rotation set value -90
