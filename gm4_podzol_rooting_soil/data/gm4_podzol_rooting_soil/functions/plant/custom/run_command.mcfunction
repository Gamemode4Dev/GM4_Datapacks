# @s = none
# at world spawn
# called from gm4_podzol_rooting_soil:plant/custom/store_command

data modify block 29999998 1 7131 Command set from storage gm4_podzol_rooting_soil:backlog Commands[0]
data remove storage gm4_podzol_rooting_soil:backlog Commands[0]
data merge block 29999998 1 7131 {auto:0b}
data merge block 29999998 1 7131 {auto:1b}
data merge block 29999998 1 7131 {auto:0b}

execute if data storage gm4_podzol_rooting_soil:backlog Commands[-1] run schedule function gm4_podzol_rooting_soil:plant/custom/run_command 2t
