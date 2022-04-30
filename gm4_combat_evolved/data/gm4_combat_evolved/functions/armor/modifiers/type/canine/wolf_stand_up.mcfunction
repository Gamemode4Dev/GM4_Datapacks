# let sitting canine wolves lose anger, then stand up
# @s = wolf that is sitting
# run from armor/active/canine/wolf_interact_check

data remove entity @s AngryAt
data modify entity @s AngerTime set value 0
data modify entity @s Sitting set value 0
