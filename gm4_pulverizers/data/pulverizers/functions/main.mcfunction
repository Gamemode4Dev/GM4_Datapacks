#pulverizer destruction
execute as @e[type=armor_stand,tag=gm4_pulverizer] at @s unless block ~ ~ ~ dropper run function pulverizers:destroy

#crafter maintenance
execute as @e[tag=gm4_pulverizer,type=armor_stand] run data merge entity @s {Fire:2000}

#recipes
execute as @e[tag=gm4_pulverizer,type=armor_stand] at @s if block ~ ~ ~ dropper[triggered=false]{Items:[{Slot:0b}]} run function pulverizers:recipe_validity_check
