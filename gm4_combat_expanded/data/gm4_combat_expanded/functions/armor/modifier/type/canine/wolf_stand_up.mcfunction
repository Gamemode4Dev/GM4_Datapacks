# let sitting canine wolves lose anger, then stand up
# @s = wolf that is sitting
# at world spawn
# run from armor/type/canine/wolf_interact_check

data remove entity @s AngryAt
data modify entity @s AngerTime set value 0
data modify entity @s Sitting set value 0
