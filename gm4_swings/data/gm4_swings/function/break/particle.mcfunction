# Make a break particles for the swing
# @s = Item display, swing main body
# at @s
# run from gm4_swings:break/main
# with $item_model = Item model to produce a particle of

$execute align xyz run particle minecraft:item{item:{id:"minecraft:diamond","components":{"minecraft:item_model":"$(item_model)"}}} ~0.5 ~0.8 ~0.5 0.3 0.2 0.3 0.1 10
