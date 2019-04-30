#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Storage Drawers..."}]
execute unless entity @p run say GM4: Installing Storage Drawers...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set storage_drawers gm4_modules 1
scoreboard players set storage_drawers gm4_clock_tick 0

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Storage Drawers Installed!"}]
execute unless entity @p run say GM4: Storage Drawers Installed!

#--Storage Drawers scoreboards
scoreboard objectives add gm4_sd_amount dummy "GM4 Drawer Amount"
scoreboard objectives add gm4_sd_same dummy "GM4 Drawer Item Same?"
scoreboard objectives add gm4_sd_itm_amnt dummy "GM4 Item Amount"
scoreboard objectives add gm4_sd_sneaking minecraft.custom:minecraft.sneak_time "GM4 Player Sneaking?"
scoreboard objectives add gm4_sd_hop_amnt dummy "GM4 Hopper Amount"
scoreboard objectives add gm4_sd_upgrade dummy "GM4 Upgrade Level"
scoreboard objectives add gm4_sd_max dummy "GM4 Limit"
scoreboard objectives add gm4_sd_storable dummy "GM4 Item Storable?"

#check other modules to make sure they're up to date.
$moduleUpdateList
