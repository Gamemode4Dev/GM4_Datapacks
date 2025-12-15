
execute if data storage gm4_timelines:temp day{dev:true} run return 1

$execute unless data storage gm4_timelines:temp day{in_type:$(out_type)} run return 0

$execute unless data storage gm4_timelines:temp day{moon_phase:$(next_moon_phase)} run return 0

return 1
