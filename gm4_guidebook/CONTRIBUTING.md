# Contributing to the Guidebook
Guidebook sections can be easily added with a custom file. These JSON files are read by beet and the specific datapack contents are automatically generated. Guidebook pages can be locked initially, and players can unlock said pages by completing certain advancement criteria. This behavior is also automatically generated from the custom guidebook file.

## Custom Guidebook File
To add a guidebook entry, create a file in the `guidebook` folder, similar to how functions are added to the `functions` folder. For example, the Standard Liquids guidebook pages are found under `gm4_liquid_tanks/data/gm4_standard_liquids/guidebook/standard_liquids.json`. These files will be referred to as "guidebook files" or "guidebook JSONs."

### Guidebook File Contents
Guidebook files are JSON files. Below is a description of each field.
- `id`: The id of the module. Should be in `snake_case` and NOT contain a namespace (`gm4_`). This is used to alphabetically sort the table of contents
- `name`: The name of the module. Should be in `Title Case`. This is what displays in the table of contents and unlock advancement chat message.
- `module_type`: The type of module. `module`, `base`, or `expansion`. This is used to display expansions under their base in the table of contents.
- `load_check`: Optional. The `id` of the module that this expansion is packaged under. This is used for `load.status` checks. For example Standard Liquids is packaged with Liquid Tanks, so the `standard_liquids` guidebook file will have `liquid_tanks` in this field.
- `base_module`: Optional. The `id` of the base module. This is used to display expansions under their base in the table of contents.
- `description`: Optional. The description shown in the unlock advancement chat message. Defaults to the website description in `beet.yaml`.
- `wiki_link`: Optional. The link to the wiki page for this module. Defaults to the wiki link in `beet.yaml`.
- `icon`: The advancement icon shown in the unlock advancment toast. Follows the same format as the `icon` field in advancement files.
- `criteria`: The advancement criteria used to unlock pages. Follows the same format as the `criteria` field in advancement files. Each criterion should be named with a short description of what it is detecting. Unlike advancement files, these criteria aren't checked by default; instead each `section` must explicitly specify which criteria applies to each section unlock using `requirements` which is similar to advancement files.
- `sections`: A list of the page sections that get unlocked. See below for section contents.

### Guidebook Sections
Each section is a JSON dictionary. Below is a description of each field.
- `name`: The name of the section. Should give a short description of what the page(s) explain. This is used to name the advancements.
- `enable`: A **list** of `load.status` scores to check. This is used to display different page contents based on if other module are installed. For example, boots of ostara mentions that they can prevent desire lines only if desire lines is also installed and enabled. This should come in pairs in which the contents of a single page changes based on if another module is or isn't installed. *Adding* extra pages that only exist if a module is installed is not supported.
  - `id`: The scoreboard holder (fake player) to check the score. This should be the full name of the fake player, including the `gm4_` namespace (if it's a GM4 module check)
  - `load`: A non-positive number indicates an unset score. Otherwise it only checks if a score is set to 1 or more. Convention is to use `-1` for a module that isn't enabled and `1` for a module that is enable.
- `requirements`: A list of list of `criteria` (from above). Follows the same format as the `requirements` field in advancment files. This is used to unlock the pages in this section once the advancement criteria are completed. If left as an empty list, the page will be unlocked by default.
- `prerequisites`: A list of guidebook section `name`s that must be unlocked before this section can be unlocked. Used to gate specific info behind other required info. For example, Zauber Cauldrons potion recipe can only be granted after creating a zauber cauldron. Can be empty.
- `grants`: A list of guidebook section `name`s that will be unlocked when this section is unlocked. Used to grant specific info if the expected sequence is skipped. For example if a player obtains a zauber crystal before obtaining the criteria to display the recipe, they will unlock the page with the recipe for a zauber crystal. Can be empty.
- `pages`: A list of text components. Follows the same format as tellraw JSON. Some shortcuts have been added to make writing pages easier.
  - `{"insert": "title"}`: This will insert the `name` of the module (from above) into the page. It will be underlined and add a newline.
  - `{"insert": "recipe"}`: This will insert a recipe display consisting of a 3x3 input and a single output. The recipe is pulled from a `gm4_recipe` file (see below).

### GM4 Recipes
Recipes can be defined with a custom JSON file in the `gm4_recipes` folder (similar to the `functions` folder). This custom recipe file is similar to vanilla recipes, but supports nbt inputs and outputs, along with being able to call functions as the result instead of just a loot table. Below is a description of each field in the JSON dictionary.
- `input`: JSON dictionary of the input
  - `type`: `shaped` or `shapeless`
  - `recipe`: Only for `shaped`. List of up to 3 strings consisting of up to 3 keys each, similar to normal recipe files.
  - `ingredients`: Only for `shapeless`. List of `ingredients`. Similar to normal recipe files, but supports the `guidebook` info as seen in the `values` below. Can also be a list of JSON dictionaries for recipes that support alternative items. (The guidebook will display the first item in the list).
  - `key`: JSON dictionary mapping keys to items (`"key": "value"`). key must be a char and value must be either a JSON dictionaries (described below, starting with `item`) or a list of JSON dictionaries.
    - `CHAR`: the key character matching the `recipe` and JSON value defining the key. Can also be a list of JSON dictionaries for recipes that support alternative items. (The guidebook will display the first item in the list).
      - `item`: The minecraft item id.
      - `tag`: The minecraft item tag. `item` and `tag` should be used exclusively.
      - `nbt`: Optional. Specific NBT to check along with the item id.
      - `guidebook`: Specific nbt for the guidebook display to show (e.g. player heads with custom names and textures)
        - `type`: `loot_table`
        - `name`: The `loot_table` path. Format is the same as if you'd call `loot give @s loot ...`, so `namespace:subfolder/file.json`
- `output`: JSON dictionary of the output
  - `type`: Optional. `normal`, `special`, or `replace`. Defaults to `normal`
  - `result`: Optional. Only applies if `type` is `normal` or `replace`. If `type` is `normal`, a JSON dictionary for the resulting output item. 
    - `type`: `loot_table` or `item`
    - `name`: The id of the `item` or the `loot_table` path.
    - `count`: Optional. The number of items resulting from a single craft. Defaults to `1`.
  - `result`: Optional. Only applies if `type` is `normal` or `replace`. If `type` is `replace`, a list of up to 3 strings consisting of up to 3 keys each, similar to normal recipe files.
  - `key`: Optional. Only applies if `type` is `replace`. Same format as the `key` in `input`, except `count` can be added to specify the number of the item resulting from a single craft (defaults to 1).
  - `function`: Optional. Only applies if `type` is `special`. Function to run when input recipe is found.
  - `guidebook`: Optional. If this field exists, the item shown in the guidebook will be shown based on this field. Otherwise the `result` is used to display the item. The guidebook does not support displaying of `special` or `replace` outputs, so this field should be used to overwrite the display.
    - `type`: `loot_table` or `item`
    - `name`: The id of `item` or the `loot_table` path.
    - `count`: Optional. The number of items resulting from a single craft. Defaults to `1`
