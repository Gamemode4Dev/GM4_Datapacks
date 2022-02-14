# @s = new armor_stand with copied data
# at player who placed armor_stand
# run from place/check

tag @s remove gm4_bas_copy

# copy exact pose from copied armor_stand item to remove randomness
data modify entity @s Pose set from entity @p[predicate=gm4_better_armour_stands:holding/mainhand/armor_stand_copy] SelectedItem.tag.EntityTag.Pose
