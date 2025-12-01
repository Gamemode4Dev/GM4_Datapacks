# returns 1 if max durability reached
# @s = player holding axe
# at @s
# run from mechanics/interactions/waxed_copper_lantern/used_offhand_axe

execute if items entity @s weapon.offhand golden_axe[damage=32] run return 1
execute if items entity @s weapon.offhand wooden_axe[damage=59] run return 1
execute if items entity @s weapon.offhand stone_axe[damage=131] run return 1
execute if items entity @s weapon.offhand copper_axe[damage=190] run return 1
execute if items entity @s weapon.offhand iron_axe[damage=250] run return 1
execute if items entity @s weapon.offhand diamond_axe[damage=1561] run return 1
execute if items entity @s weapon.offhand netherite_axe[damage=2031] run return 1

return fail
