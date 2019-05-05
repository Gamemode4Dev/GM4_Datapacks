#no @s.
#at world spawn
#called by init

#randomly marks flower types as poisonous on module installation

#initialise fixed values
scoreboard players set modulo gm4_sm_flowers 2
scoreboard players set divider gm4_sm_flowers 10

#copy seed to scoreboard
execute store result score seed gm4_sm_flowers run seed

#set all flowers to a digit of the seed
scoreboard players operation red_tulip gm4_sm_flowers = seed gm4_sm_flowers
scoreboard players operation red_tulip gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation orange_tulip gm4_sm_flowers = red_tulip gm4_sm_flowers
scoreboard players operation orange_tulip gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation white_tulip gm4_sm_flowers = orange_tulip gm4_sm_flowers
scoreboard players operation white_tulip gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation pink_tulip gm4_sm_flowers = white_tulip gm4_sm_flowers
scoreboard players operation pink_tulip gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation oxeye_daisy gm4_sm_flowers = pink_tulip gm4_sm_flowers
scoreboard players operation oxeye_daisy gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation dandelion gm4_sm_flowers = oxeye_daisy gm4_sm_flowers
scoreboard players operation dandelion gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation blue_orchid gm4_sm_flowers = dandelion gm4_sm_flowers
scoreboard players operation blue_orchid gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation allium gm4_sm_flowers = blue_orchid gm4_sm_flowers
scoreboard players operation allium gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation azure_bluet gm4_sm_flowers = allium gm4_sm_flowers
scoreboard players operation azure_bluet gm4_sm_flowers /= divider gm4_sm_flowers
scoreboard players operation poppy gm4_sm_flowers = azure_bluet gm4_sm_flowers
scoreboard players operation poppy gm4_sm_flowers /= divider gm4_sm_flowers

#scale down to 1 bit (mod2): 1=poisonous 0=normal
scoreboard players operation red_tulip gm4_sm_flowers %= modulo gm4_sm_flowers
scoreboard players operation orange_tulip gm4_sm_flowers %= modulo gm4_sm_flowers
scoreboard players operation white_tulip gm4_sm_flowers %= modulo gm4_sm_flowers
scoreboard players operation pink_tulip gm4_sm_flowers %= modulo gm4_sm_flowers
scoreboard players operation oxeye_daisy gm4_sm_flowers %= modulo gm4_sm_flowers
scoreboard players operation dandelion gm4_sm_flowers %= modulo gm4_sm_flowers
scoreboard players operation blue_orchid gm4_sm_flowers %= modulo gm4_sm_flowers
scoreboard players operation allium gm4_sm_flowers %= modulo gm4_sm_flowers
scoreboard players operation azure_bluet gm4_sm_flowers %= modulo gm4_sm_flowers
scoreboard players operation poppy gm4_sm_flowers %= modulo gm4_sm_flowers

#store amount of non poisonous flowers as 10-<sum of flower scores>
scoreboard players set required_flowers gm4_sm_flowers 10
scoreboard players operation required_flowers gm4_sm_flowers -= red_tulip gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= orange_tulip gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= white_tulip gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= pink_tulip gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= oxeye_daisy gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= dandelion gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= blue_orchid gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= allium gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= azure_bluet gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= poppy gm4_sm_flowers
