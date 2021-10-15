# initializes this falling star
# @s = @e[type=marker,tag=gm4_star_impact_point]
# at @s positioned ~ 260 ~
# run from gm4_falling_stars:falling_star/spawn

# apply motion
data modify entity @s Motion set from storage gm4_falling_stars:motion temp.motion

# remove tag
tag @s remove gm4_new_falling_star
