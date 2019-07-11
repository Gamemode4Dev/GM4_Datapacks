#unless the module is already initialized
execute unless score private_lockers gm4_modules matches 1.. run function private_lockers:init
scoreboard players add installed_modules gm4_up_check 1
