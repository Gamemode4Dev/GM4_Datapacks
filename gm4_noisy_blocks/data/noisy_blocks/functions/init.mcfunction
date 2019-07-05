#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Noisy Blocks...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.noisy_blocks"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Noisy Blocks...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set noisy_blocks gm4_modules 1
scoreboard players set noisy_blocks gm4_clock_tick 0

#Block interaction scoreboards
scoreboard objectives add gm4_nbk_crafting minecraft.custom:minecraft.interact_with_crafting_table
scoreboard objectives add gm4_nbk_furnace minecraft.custom:minecraft.interact_with_furnace
scoreboard objectives add gm4_nbk_beacon minecraft.custom:minecraft.interact_with_beacon
scoreboard objectives add gm4_nbk_loom minecraft.custom:minecraft.interact_with_loom
scoreboard objectives add gm4_nbk_brewing minecraft.custom:minecraft.interact_with_brewingstand
scoreboard objectives add gm4_nbk_smoker minecraft.custom:minecraft.interact_with_smoker
scoreboard objectives add gm4_nbk_blast minecraft.custom:minecraft.interact_with_blast_furnace
scoreboard objectives add gm4_nbk_cartog minecraft.custom:minecraft.interact_with_cartography_table
scoreboard objectives add gm4_nbk_stonecut minecraft.custom:minecraft.interact_with_stonecutter
scoreboard objectives add gm4_nbk_dropper minecraft.custom:minecraft.inspect_dropper
scoreboard objectives add gm4_nbk_disp minecraft.custom:minecraft.inspect_dispenser
scoreboard objectives add gm4_nbk_lectern minecraft.custom:minecraft.interact_with_lectern
scoreboard objectives add gm4_nbk_hopper minecraft.custom:minecraft.inspect_hopper
scoreboard objectives add gm4_nbk_campfire minecraft.custom:minecraft.interact_with_campfire

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Noisy Blocks Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.noisy_blocks"}]}]}]
execute unless entity @a[limit=1] run say GM4: Noisy Blocks Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
