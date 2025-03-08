# stores players postion
# @s = Player
# at @s
# run from fishing/{entity}/adv

data modify storage gm4_reeling_rods:temp player_data.Pos set from entity @s Pos
execute store result score $motionX gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp player_data.Pos[0] 1
execute store result score $motionY gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp player_data.Pos[1] 1
execute store result score $motionZ gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp player_data.Pos[2] 1
