# checks if potions should be tracked
# @s = all potions that haven't yet been checked
# located at world spawn
# run from gm4_potion_tracking-1.0:potion


# set storage to be used when the function tag below is called
data modify storage gm4_potion_tracking:temp entity_data set from entity @s {}

# function tag to allow modules to tag their custom potions (add tag gm4_potion)
function #gm4_potion_tracking:tag_potion

# don't check this potion again
tag @s add gm4_potion_tracking_checked
