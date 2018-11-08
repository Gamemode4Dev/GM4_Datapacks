#This function runs if gamemode 4 has never been used before.
#It adds global scoreboards and other gamemode 4 base code.

tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Welcome to Gamemode 4. Initialising...","color":"green"}]
execute unless entity @p run say GM4: Welcome to Gamemode 4. Initialising...

# ============================ SCOREBOARDS ============================
scoreboard objectives add gm4_clockTick dummy
scoreboard objectives add gm4_modules dummy

# =========================== FAKE ENTITIES ===========================
scoreboard players set gm4 gm4_upCheck 1
scoreboard players set updateHappened gm4_upCheck 1
