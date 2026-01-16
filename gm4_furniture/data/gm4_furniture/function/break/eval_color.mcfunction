# eval color and add to held brush
# @s = furniture main interaction entity
# at @s
# run from break/get_color
# with {rgb}

$item modify entity @p[tag=gm4_furniture_target] weapon.mainhand {function:set_components,components:{"minecraft:dyed_color":$(rgb)}}
