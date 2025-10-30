# calculates damage for axe
# @s = player who scraped wax
# at @s
# run from mechanics/interactions/waxed_copper_lantern/interact_rcd and mechanics/interactions/unwaxed_copper_lantern/interact_rcd

# damage
execute store result score $level gm4_llp.data run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:unbreaking"
scoreboard players add $level gm4_llp.data 1
scoreboard players set $chance gm4_llp.data 100
scoreboard players operation $chance gm4_llp.data /= $level gm4_llp.data
execute store result score $rand gm4_llp.data run random value 1..100
execute if score $rand gm4_llp.data < $chance gm4_llp.data run function gm4_lively_lily_pads:mechanics/interactions/waxed_copper_lantern/damage_mainhand_axe

# fail if not max durability
execute unless function gm4_lively_lily_pads:mechanics/interactions/waxed_copper_lantern/max_durability_mainhand_axe run return fail

# 0 durability remaining, break item
item replace entity @s weapon.mainhand with air
playsound minecraft:entity.item.break player @a[distance=..16]
