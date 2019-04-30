#unless the module is already initialized
execute unless score storage_drawers gm4_modules matches 1.. run function storage_drawers:init
scoreboard players add installed_modules gm4_up_check 1
