# apply instant_health to entities hit
# @s = player wielding the weapon
# at @s
# run from weapon/modifier/heal/activate

# instant_health entity hit
execute if score $level gm4_ce_data matches 1 run effect give @s instant_health 1 0
execute if score $level gm4_ce_data matches 2 run effect give @s instant_health 1 1
execute if score $level gm4_ce_data matches 3 run effect give @s instant_health 1 2

# particles
execute anchored eyes run particle entity_effect ^ ^ ^ 0.973 0.141 0.137 1 0
execute anchored eyes run particle entity_effect ^ ^ ^ 0.973 0.141 0.137 1 0
execute anchored eyes run particle entity_effect ^ ^ ^ 0.973 0.141 0.137 1 0
execute anchored eyes run particle entity_effect ^ ^ ^ 0.973 0.141 0.137 1 0
