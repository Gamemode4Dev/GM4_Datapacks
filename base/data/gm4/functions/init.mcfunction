#This function runs if gamemode 4 has never been used before.
#It adds global scoreboards and other gamemode 4 base code.

tellraw @a [{"translate": "%1$s","with":["[GM4]: ",{"translate": "text.gm4.prefix"}],"color":"green"},{"translate": "%1$s","with":["Welcome to Gamemode 4. Initialising...",{"translate": "text.gm4.modules.init"}],"color":"green"}]
execute unless entity @p run say [GM4]: Welcome to Gamemode 4. Initialising...

# ============================ SCOREBOARDS ============================
scoreboard objectives add gm4_clock_tick dummy
scoreboard objectives add gm4_modules dummy

# =========================== FAKE ENTITIES ===========================
scoreboard players set gm4 gm4_up_check 1
scoreboard players set update_happened gm4_up_check 1
