// Yume 2kki AllEffectsED% AutoSplitter made by KawaneRio and TwilightKiddy
state("RPG_RT")
{
    int  inventoryItemCount :       0x0A2BA0,   0x0c;
    bool isStartScreen :            0x04AB02D4, 0x504;

    int  posX :                     0xA2B7C,    0x14;
    int  posY :                     0xA2B7C,    0x18;
    int  MapID :                    0xA2BD0,    0x04;
}

startup
{
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
        {310,  "Tissue"},
        {3376, "Tissue"},
        {287,  "Red Riding Hood"},
        {2196, "Red Riding Hood"},
        {316,  "Polygon"},
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
        settings.Add(effect, true, "Split on ★" + effect + "★");
    }
}


start
{
    return old.isStartScreen && !current.isStartScreen;
}


split
{
    // Effect split (skip the first 0→1)
    if (old.inventoryItemCount >= 1 && current.inventoryItemCount > old.inventoryItemCount)
    {
        var effectName = vars.EffectByMap[current.MapID];
        return settings[effectName];
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
    return current.isStartScreen;
}
