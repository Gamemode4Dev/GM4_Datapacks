# tracks thrown splash bottles of lightning with a line of markers
# @s = Splash Bottle of Lightning
# run from tick

summon marker ^ ^ ^.03 {CustomName:'{"text":"gm4_liab_potion_tracker"}',Tags:["gm4_liab_potion_tracker"]}
tag @s add gm4_liab_potion_tracker

schedule function gm4_lightning_in_a_bottle:potion_tracker/check_splash 1t
