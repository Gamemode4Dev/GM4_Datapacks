# converts a zauber crystal in the offhand into a firework star.
# @s = player who has moved a zauber crystal into their offhand
# at @s
# run from advancement gm4_zauber_cauldrons:equipment/crystal/moved_into_offhand

# the following code is a modified implementation stolen from BPR's Hotswap Hotbars (PR #850)
advancement revoke @s only gm4_zauber_cauldrons:equipment/crystal/moved_into_offhand

# get item data
data modify storage gm4_zauber_cauldrons:temp/item/crystal Item set from entity @s Inventory[{Slot:-106b}]
# TODO 1.20.5: disabled command, check why removing this was necessary
# data remove storage gm4_zauber_cauldrons:temp/item/crystal Item.tag.HideFlags

# set color
for effect_data in ctx.meta['crystal_effects']:
    execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/item/crystal {Item:{components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{type:effect_data['effect']}}}}} run loot replace entity @s weapon.offhand loot f"gm4_zauber_cauldrons:technical/replace_offhand_crystal/{effect_data['effect']}"

data remove storage gm4_zauber_cauldrons:temp/item/crystal Item
