# Charges the mace while right click is held
# @s = player
# at @s
# run from advancement gm4_blasting_maces:using_blasting_mace

advancement revoke @s only gm4_blasting_maces:using_blasting_mace

# do nothing in adventure mode, where players cannot break blocks normally
execute if entity @s[gamemode=adventure] run return 0

# only a mace actually enchanted with Blasting
execute unless predicate gm4_blasting_maces:mace_needs_consumable run return 0

# remember which hand is using the mace (main hand 0, off hand -1)
# the main hand only counts if its mace is usable (has the component)
execute if items entity @s weapon.mainhand minecraft:mace[minecraft:enchantments~[{enchantment:"gm4_blasting_maces:blasting"}],minecraft:consumable] run scoreboard players set @s gm4_blast_slot 0
execute unless items entity @s weapon.mainhand minecraft:mace[minecraft:enchantments~[{enchantment:"gm4_blasting_maces:blasting"}],minecraft:consumable] run scoreboard players set @s gm4_blast_slot -1

# track how many ticks the mace has been charged; charging holds 3 (not 2) for a tick of grace against a gap in the use
execute unless score @s gm4_blast_charging matches 2.. run scoreboard players set @s gm4_blast_charge_ticks 0
scoreboard players add @s gm4_blast_charge_ticks 1
scoreboard players set @s gm4_blast_charging 3
