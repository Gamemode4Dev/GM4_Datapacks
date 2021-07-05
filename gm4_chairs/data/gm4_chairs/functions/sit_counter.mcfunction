#run from advancement sitting_in_chair
# @s = player sitting on the chair

advancement revoke @s only gm4_chairs:sitting_in_chair

scoreboard players add @s gm4_chairs_sit 1
execute if score @s gm4_chairs_sit matches 3600.. run advancement grant @s only gm4:chairs_sit
