#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Installing Enchantment Extractors...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.eenchantment_extractors"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Enchantment Extractors...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set enchantment_extractors gm4_modules 1
scoreboard players set enchantment_extractors gm4_clock_tick 0

scoreboard objectives add gm4_ench_random dummy
execute unless score seed gm4_ench_random matches 0.. run scoreboard players set seed gm4_ench_random 731031
scoreboard players set mult gm4_ench_random 1664525
scoreboard players set incr gm4_ench_random 1013904223
scoreboard players set #100 gm4_ench_random 100

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s","with":["Enchantment Extractors Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.enchantment_extractors"}]}]}]
execute unless entity @a[limit=1] run say GM4: Enchantment Extractors Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
