# returns 1 if max durability reached
# @s = player holding axe
# at @s
# run from mechanics/interactions/waxed_copper_lantern/used_mainhand_axe

execute if items entity @s weapon.mainhand golden_axe[damage=32] run return 1
execute if items entity @s weapon.mainhand wooden_axe[damage=59] run return 1
execute if items entity @s weapon.mainhand stone_axe[damage=131] run return 1
execute if items entity @s weapon.mainhand copper_axe[damage=190] run return 1
execute if items entity @s weapon.mainhand iron_axe[damage=250] run return 1
execute if items entity @s weapon.mainhand diamond_axe[damage=1561] run return 1
execute if items entity @s weapon.mainhand netherite_axe[damage=2031] run return 1

return fail
