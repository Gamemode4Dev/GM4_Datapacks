# sells out a trade
# @s = villager
# at bobber in @s
# with {mainhand}
# run from reeling/villager/action

# for some reason on the first item after a restock?? it fails to set uses, but succeeds after that? This double set doesn't fix that though
# | needs more investigation
$data modify entity @s Offers.Recipes[{sell:$(mainhand)}] merge value {uses:0}
$data modify entity @s Offers.Recipes[{sell:$(mainhand)}].uses set from entity @s Offers.Recipes[{sell:$(mainhand)}].maxUses
