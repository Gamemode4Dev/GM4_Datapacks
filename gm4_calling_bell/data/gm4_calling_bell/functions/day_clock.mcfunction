
# check day, daily
execute store result score $day gm4_calling_bell run time query day
schedule function gm4_calling_bell:day_clock 20s
