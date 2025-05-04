// Yume 2kki AutoSplitter made by KawaneRio and TwilightKiddy
// ver0.127d
state("RPG_RT")
{
    int  inventoryItemCount :       0x0A2BA0,   0x0c;
    bool isStartScreen :            0x04AB02D4, 0x504;

    int  posX :                     0xA2B7C,    0x14;
    int  posY :                     0xA2B7C,    0x18;
    int  MapID :                    0xA2BD0,    0x04;

    // int  switchArrayPointer :       0x49144E8;

    int  MenuThemeCount   :         0x38488,   0x460, 0x6A0;

    // int  DidTheIntroFinish   :      0x49144E8, 0x14;
}

startup
{
    settings.Add("inEffectsCategory", true, "★Effects★");

    var mapToEffect = new Dictionary<int, string> {
        {81,   "Bike"},
        {1313, "Bike"},
        {31,   "Boy"},
        {26,   "Chainsaw"},
        {72,   "Lantern"},
        {68,   "Fairy"},
        {253,  "Spacesuit"},
        {255,  "Glasses"},
        {15,   "Rainbow"},
        {170,  "Wolf"},
        {142,  "Eyeball Bomb"},
        {52,   "Telephone"},
        {153,  "Maiko"},
        {171,  "Penguin"},
        {167,  "Insect"},
        {175,  "Spring"},
        {239,  "Invisible"},
        {57,   "Plaster Cast"},
        {139,  "Stretch"},
        {2192, "Stretch"},
        {284,  "Haniwa"},
        {246,  "Cake"},
        {95,   "Twintails"},
        {295,  "Child"},
        {189,  "Gakuran"},
        {265,  "Trombone"},
        {3135, "Trombone"},
        {310,  "Tissue"},
        {3376, "Tissue"},
        {287,  "Red Riding Hood"},
        {2196, "Red Riding Hood"},
        {316,  "Polygon"},
        {3591, "Polygon"},
        {16,   "Marginal"},
        {357,  "Teru-Teru Bōzu"},
        {55,   "Bat"},
        {61,   "Drum"},
        {21,   "Grave"},
        {91,   "Railroad Crossing"},
        {504,  "Bunny Ears"},
        {1504, "Dice"},
    };

    vars.EffectByMap = mapToEffect;

    foreach (var effect in mapToEffect.Values.Distinct())
    {
        settings.Add(effect, true, "Split on ★" + effect + "★", "inEffectsCategory");
    }

    ///////////////////////////////////

    settings.Add("inMapCategory", false, "Maps");

    var mapIDToMapName = new Dictionary<int, string> {
        {4,   "Urotsuki's Room (Dream)"},
        //Add maps here
    };

    vars.MapNameByMapID = mapIDToMapName;

    foreach (var map in mapIDToMapName.Values.Distinct())
    {
        settings.Add(map, false, "Split upon entering " + map , "inMapCategory");
    }

    ///////////////////////////////////
    // Menu Theme Split
    settings.Add("inMenuThemesCategory", false, "Menu Themes");

    var mapToMenuTheme = new Dictionary<int, string> {
        {474, "6 & #7 (Bleak Future)"}, //2in1
        {531, "8 (Hidden Shoal)"},
        {512, "9 (Forest Pier)"},
        {565, "10 (Planetarium)"},
        {571, "11 (Industrial Maze)"},
        {581, "12 (Rose Church)"},
        {570, "13 (Bioluminescent Cavern)"},
        {562, "14 (Depths)"},
        {561, "15 (Underwater Base)"},
        {244, "16 (Grey Building)"},
        {624, "17 (Maple Shrine)"},
        {672, "18 (Pencil World)"},
        {12,  "19 (Chocolate World)"},
        {835, "20 (Blue Cactus Islands)"},
        {923, "21 (Stone Towers)"},
        {1524,"22 (Star Building)"},
        {1521,"23 (Blob Desert)"},
        {822, "24 (Cipher Keyboard)"},
        {979, "25 (Viridian Wetlands)"},
        {799, "26 (Polluted Swamp)"},
        {1004,"27 (Snowy Village)"},
        {958, "28 (Decrepit Dwellings)"},
        {1012,"29 (Verdant Promenade)"},
        {1256,"30 (Black Ink World)"},
        {1019,"31 (Forgotten Megalopolis)"},
        {1205,"32 (Tomb of Velleities)"},
        {1364,"33 (Ocular Spacecraft)"},
        {1045,"34 (Data Stream)"},
        {1148,"35 (Lavender Waters)"},
        {1306,"36 (Originator Garden)"},
        {1307,"37 (Fluorescent Halls)"},
        {1308,"38 (Ahogeko's House: Bloody Passage)"},
        {1048,"40 (Monochrome GB World(Drone Package))"},
        {1292,"41 (Smiley Signs World)"},
        {1301,"42 (Second Nexus: Niyatsuki's Bedroom)"},
        {1299,"42 (Lovesick World: Liar's House)"},
        {1303,"43 (Corrupted Love World)"},
        {1302,"44 (Pastel Chalk World)"},
        {1472,"45 (Luminous Lake: Dragon's Peak)"},
        {432, "46 (Monochrome GB World(Treasure Chest))"},
        {1660,"47 (Snowman World)"},
        {2069,"48 (Sunset Hill)"},
        {1450,"49 (Horror Maze)"},
        {1442,"50 (Blue Restaurant: Monochrome Path (Room 8))"},
        {1970,"51 (Domino Constructions: Flag Room)"},
        {2047,"52 (Glitch Hell)"},
        {2051,"53 (Sakura Forest)"},
        {2055,"54 (Sunset Savannah)"},
        {1605,"55 (Bishop Cathedral)"},
        {2219,"56 (Fish Person Shoal)"},
        {1617,"57 (Sixth Terminal)"},
        {2499,"58 (Colorless Rose Garden)"},
        {1777,"59 (Shadow Lady Estate)"},
        {1340,"60 (Flickering Keyhole Trail)"},
        {2509,"61 (Rainbow Snow Plateau)"},
        {3027,"62 & #63 (Pitch Black Plateau)"}, //2in1
        {3101,"64 (Pollution District: Funeral Room)"},
        {2871,"65 (Sweet Medical Utopia)"},
        {2458,"66 (Runic Ruins: Ice Path Puzzle)"},
        {2632,"67 (Rainy Sundial)"},
        {2896,"68 (Paraffin Embedding Ruins)"},
        {3184,"69 (Fragmented Station B)"},
        {2973,"70 (Snow Black)"},
        {3114,"71 (Turquoise Cityscape)"},
        {3120,"72 (Scattered Sky Fields)"},
        {3105,"73 (Megalith Grove: Overlook Balcony)"},
        {3110,"74 (English Thundershower)"},
        {3293,"75 (Crescent Tile World: Princess' Room)"},
        {2560,"76 (Burgundy Flats: Cliffside)"},
        {3094,"77 (Alto Radiowave Apartments)"},
        {2991,"78 (Dream Tropics: Dungeon)"},
        {2337,"79 (Black Dust Desert: Tent)"},
        {3325,"80 (City of Revival)"},
        {37,  "81 (Cave 404 (Stone World))"},
        {1015,"82 (Verdant Promenade: Antiquated Resthouse)"},
        {1606,"83 & #84 (Domino Maze)"},
        {2540,"85 & #86 & #87 (Quarter Flats)"},
        {3592,"88 (The Desktop)"},
        {364, "89 (Yellow Geometries)"},
        {62,  "90 (Neon Highway)"},
        {65,  "91 (Upper Highway: Bedroom)"},
        {640, "92 (Sushi Roll Swamp)"},
        {588, "93 (Spirit Capital)"},
        {3034,"94 (Twisted Cone World)"},
        {2267,"95 (Retro Cartridge Game)"},
        {2567,"96 (Bleeding Sorrows)"},
        {3219,"97 (ASCII Symbol Zone)"},
        {94,  "98 (Dizzy Spirals World)"},
        {2486,"99 (Radiant Waters: Aster's Tent)"},
        {2489,"100 (Glitched Digits: Emergency Exit)"},
        {2487,"101 (Calico Forest: Pencil House)"},
    };

    vars.MenuThemeByMap = mapToMenuTheme;
    vars.LastSplitMapID = -1;

    foreach (var menuTheme in mapToMenuTheme.Values)
    {
        settings.Add(menuTheme, true, "Split on MT #" + menuTheme, "inMenuThemesCategory");
    }

}


start
{
    return old.isStartScreen && !current.isStartScreen;
}


split
{
    // Effect split (skip the first 0→1)
    if (old.inventoryItemCount >= 1
        && current.inventoryItemCount > old.inventoryItemCount
        && vars.EffectByMap.TryGetValue(current.MapID, out string effectName)
        && settings[effectName])
    {
        return true;
    }

    // Map Split
    if (vars.MapNameByMapID.ContainsKey(current.MapID) && current.MapID != old.MapID)
    {
        return settings[vars.MapNameByMapID[current.MapID]];
    }

    // Menu Theme Split
    if (current.MenuThemeCount > old.MenuThemeCount
        && vars.MenuThemeByMap.TryGetValue(current.MapID, out string themeName)
        && settings[themeName])
    {
        // Special 2-in-1 Split for Bleak Future and Pitch Black Plateau
        if ((current.MapID == 474 || current.MapID == 3027) && current.MapID == vars.LastSplitMapID)
        {
            // already split in this map
            return false;
        }

        // record the last split map
        vars.LastSplitMapID = current.MapID;

        print("Menu Theme Split at " + current.MapID);
        return true;
    }

    // Split when entering Map ID 223 and standing at posX=6, posY=12
    if (current.MapID == 223 && old.posX != 6 && current.posX == 6 && current.posY == 12)
    {
        print("From the staircase I saw. A world left behind me.");
        return true;
    }
}


reset
{
    if (current.isStartScreen == true){
        vars.LastSplitMapID = -1;
        return true;
    }
}
