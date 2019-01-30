VAR maxHull = 100
VAR hull = 100
VAR food = 10
VAR fuel = 10
VAR people = 100
VAR morale = 80
VAR valuables = 500
VAR scanningBase = 20
VAR scanningAtmosphere = 0
VAR scanningTemperature = 0
VAR scanningSurface = 0
VAR scanningResources = 0
VAR scanningRadiation = 0
VAR pADensity = 0
VAR pAComp = 0
VAR pTempMin = 0
VAR pTempMax = 0
VAR pSurface = 0
VAR pResources = 0
VAR pRadiation = 0
VAR score = 0
VAR randTemp = 0
-> start


=== function generate_planet

~pADensity = RANDOM(0, 8)
~pAComp = RANDOM(0, 10)
~pTempMin = RANDOM(0, 600 - 10)
~pTempMax = pTempMin + RANDOM(0, 200)
~pSurface = RANDOM(0, 10)
~pResources = RANDOM(0, 10)
~pRadiation = RANDOM(0, 10)

=== function scan_planet(x)
~scanningAtmosphere = RANDOM(scanningBase + x, 120)
~scanningTemperature = RANDOM(scanningBase + x, 120)
~scanningSurface = RANDOM(scanningBase + x, 120)
~scanningResources = RANDOM(scanningBase + x, 120)
~scanningRadiation = RANDOM(scanningBase + x, 120)
{-scanningAtmosphere > 100: 
    ~scanningAtmosphere = 100
}
{-scanningTemperature > 100: 
    ~scanningTemperature = 100
}
{-scanningSurface > 100: 
    ~scanningSurface = 100
}
{-scanningResources > 100: 
    ~scanningResources = 100
}
{-scanningRadiation > 100: 
    ~scanningRadiation = 100
}

Scanner Confidence: Atmosphere {scanningAtmosphere}%, Temperature {scanningTemperature}%, Surface {scanningSurface}%, Resources{scanningResources}%, Radiation {scanningRadiation}%

~ temp description = ""
~ temp aDensity = pADensity
{ - scanningAtmosphere < RANDOM(0, 100):
~aDensity = pADensity + RANDOM(-2, 2)
}
{aDensity:
    - 0: 
        ~description = "almost non-existent"
    - 1:
        ~description = "very thin"
    - 2:
        ~description = "very thin"
    - 3:
        ~description = "thin"
    - 4:
        ~description = "thin"
    - 5:
        ~description = "thick"
    - 6:
        ~description = "thick"
    - 7:
        ~description = "moderately dense"
    - 8:
        ~description = "moderately dense"
    - else:
        ~description = "perfectly dense"
}

The Planet's atmosphere is {description} with <>
~ temp aComp = pAComp
{ - scanningAtmosphere < RANDOM(0, 100):
~aComp = pAComp + RANDOM(-2, 2)
}
{aComp:
    - 0: 
        ~description = "extremely acidic fumes"
    - 1:
        ~description = "acidic fumes"
    - 2:
        ~description = "toxic gas"
    - 3:
        ~description = "toxic gas"
    - 4:
        ~description = "poisonous gas"
    - 5:
        ~description = "poisonous gas"
    - 6:
        ~description = "nitrogen-rich material"
    - 7:
        ~description = "nitrogen-rich material"
    - 8:
        ~description = "carbon-rich gasses"
    - 9:
        ~description = "carbon-rich gasses"
    - else:
        ~description = "oxygen-rich gas"
}

{description}. Temperatures ranges from <>

~ temp aTempMin = pTempMin
{ - scanningTemperature < RANDOM(0, 100):
~aTempMin = pTempMin + RANDOM(-100, 100) - 273
}

{aTempMin}C to <>

~ temp aTempMax = pTempMax
{ - scanningTemperature < RANDOM(0, 100):
~aTempMax = pTempMax + RANDOM(-100, 100) - 273
}

{aTempMax}C. The surface is <>

~ temp aSurface = pSurface
{ - scanningSurface < RANDOM(0, 100):
~aSurface = pSurface + RANDOM(-2, 2)
}
{aSurface:
    - 0: 
        ~description = "covered with acidic waste"
    - 1:
        ~description = "covered with acidic waste"
    - 2:
        ~description = "exclusively liquid"
    - 3:
        ~description = "exclusively liquid"
    - 4:
        ~description = "inhospitable"
    - 5:
        ~description = "inhospitable"
    - 6:
        ~description = "dotted with clusters of life"
    - 7:
        ~description = "dotted with clusters of life"
    - 8:
        ~description = "covered with alien plantlife"
    - 9:
        ~description = "covered in alien plantlife"
    - else:
        ~description = "lush with alien wildlife"
}

{aComp}, with <>

~ temp aResource = pResources
{ - scanningResources < RANDOM(0, 100):
~aResource = pResources + RANDOM(-2, 2)
}
{aResource:
    - 0: 
        ~description = "barren of metallic resources."
    - 1:
        ~description = "barren of metallic resources."
    - 2:
        ~description = "few mineral resources."
    - 3:
        ~description = "few mineral resources."
    - 4:
        ~description = "some mineral resources."
    - 5:
        ~description = "many mineral resources."
    - 6:
        ~description = "a few essential resources."
    - 7:
        ~description = "essential resource deposits."
    - 8:
        ~description = "essential resource deposits easily accessible."
    - 9:
        ~description = "essential resource deposits easily accessible."
    - else:
        ~description = "large essential resource deposits scattered liberally across the surface."
}

{description} <>

~ temp aRadiation = pRadiation
{ - scanningRadiation < RANDOM(0, 100):
~aRadiation = pRadiation + RANDOM(-2, 2)
}
{aRadiation:
    - 0: 
        ~description = "Incredibly Radioactive."
    - 1:
        ~description = "Radioactive Quagmire."
    - 2:
        ~description = "Radioactive Quagmire."
    - 3:
        ~description = "Radioactive."
    - 4:
        ~description = "Radioactive."
    - 5:
        ~description = "Moderately Radioactive."
    - 6:
        ~description = "Moderately Radioavtive."
    - 7:
        ~description = "Mildly Radioactive"
    - 8:
        ~description = "Mildly Radioactive"
    - 9:
        ~description = "Mild background radiation."
    - else:
        ~description = "No radiation."
}
{aComp}

=== function morales(x)
{
    - x < 20:
       ~ return "Abysmal"
    - x < 40:
        ~ return "Bad"
    - x < 60:
        ~ return "Mediocre"
    - x < 80:
        ~ return "Good"
    - x < 100:
        ~ return "Amazing"   
    -else:
        ~ return "Incredible"
}
 

=== function display_ship
Hull: {hull}/{maxHull}
Crew: {people}
Food: {food}
Fuel: {fuel}
Morale: {morales(morale)}
Wealth: {valuables}


=== start
The core worlds are layered with corporate enterprises, defense contractors, and private militaries. Most find themselves working in the bureaucracy to make a meager living and support their lifestyle.

How did you make your living?


+   [Researcher]
    ~scanningBase = scanningBase + 20
    -> start1
+   [Company Chairperson]
    ~valuables = valuables + 200
    -> start1
+   [Military Officer]
    ~maxHull = maxHull + 20
    ~hull = maxHull
    ->start1
+   [NEET]
    ->start1

=== start1
Eventually, you decided to gather as many people as you could through various petitions and advertisements to strike a new settlement on the frontier worlds. 

What drove you to make this decision?

+   Law
    ~valuables = valuables + 200
    -> start2
+   Persecution
    ~morale = morale + 20
    -> start2
+   War
    ~people = people + 20
    -> start2

=== start2
With droves of people signing up for an adventure, you're going to need some way to hold and transport them.

Which ship do you purchase?

+   Used Explorer
    ~valuables = valuables + 100
    ~fuel = fuel + 5
    ~maxHull = maxHull - 20
    ~hull = maxHull
    ->turn_pass
+   Expensive Colony Ship
    ~valuables = valuables - 500
    ~fuel = fuel + 10
    ~food = food + 10
    ->turn_pass
+   Military Vessel
    ~maxHull = maxHull + 20
    ~hull = maxHull
    ->turn_pass
+   Science Vessel
    ~scanningBase = scanningBase + 20
    ->turn_pass
+   Cargo Ship
    ~fuel = fuel + 5
    ->turn_pass

=== turn_pass
{- hull <= 0:
    ->nohull
    }
{- fuel <= 0:
    ->nofuel
    }
{- food <= 0:
    No food! Some people die of starvation.
    ~people = people - 10
}
{- people <= 0:
    ->nopeople
    }
{- morale <= 0:
    ->mutiny
    }

{display_ship()}

{!And so you set off, navigation set for the fring worlds, much of which is unmapped, providing great privacy for pirate and settler alike.}
~fuel = fuel - 1
~food = food - 1
~temp x = RANDOM(0, 100)
{ 
    - x < 5:
    -> stationstart
    - x < 12:
    -> shipwreck
    - x < 20:
    -> traderstart
    - x < 30:
    -> asteroids
    - x < 35:
    -> pirates
    - else:
    -> planetstart
    
}

===nofuel
You run out of fuel, you drift along, hoping someone stumbles upon you in these unexplored reaches of space. Of course, they won't
~score = TURNS_SINCE() + food + people + hull + (valuables / 10)
->endy

===nohull
Your ship has sustained too much damage, the electrical systems go down. Life support systems can't hold out for much longer, you glance out the window, wondering what could have been.
~score = TURNS_SINCE() + food + people + fuel + (valuables / 10)
-> endy

===nopeople
The last crew member has perished, with only you remaining at the helm, the ship can no longer be sustained, slowly but surely, systems start dying off, until the faint breeze of the life support systems cease.
~score = TURNS_SINCE() + food + fuel + hull + (valuables / 10)
-> endy

===pirates
A few anomalies on your radar go dark, your comms system comes alive with various threats on your life, an average day it seems.

+   {valuables > 100} Give the pirate your valuables
    ~valuables = 0
    ->turn_pass
+   Attempt to flee
    ~hull = hull - RANDOM(0, 10)
    ~fuel = fuel - 1
    -> turn_pass
+   Attempt to engage
    ~hull = hull - RANDOM(0, 20)
    ~fuel = fuel + RANDOM(0, 3)
    ~valuables = valuables + RANDOM(0, 200)
    ->turn_pass
    

===asteroids
Your route lands you right in the middle of a small asteroid field.
+   Move around the field (fuel)
    ~fuel = fuel - 1
    ->turn_pass
+   Try to navigate through (hull)
    ~hull = hull - RAND(0, 10)
    -> turn_pass
+   Wait for an opening (food)
    ~food = food - 1
    ->turn_pass

===shipwreck
Out the side of your eye you catch sight of a debris field, probably from some poor bastard who got waylayed by pirates, you could see if anything has been left behind, although, it might not be entirely safe yet.

+   Investigate
    ~ temp x = RANDOM(0, 100)
    {
        - x < 20:
        ->pirates
        - x < 40:
        You had a rocky path inward and didn't quite make it unscathed, however, you did manage to find something!
        ~ hull = hull - RANDOM(0, 10)
        ~ fuel = fuel + RANDOM(0, 2)
        ~ food = food + RANDOM(0, 3)
        ~ valuables = valuables + RANDOM(0, 200)
        -> turn_pass
        - x < 50:
        -> traderstart
        - x < 55:
        You had a rocky path inward and didn't quite make it unscathed. It appears like the area was picked clean.
        ~hull = hull - RANDOM(0, 10)
        ~morale = morale - 10
        ->turn_pass
        - x < 60:
        It appears like the area was picked clean.
        -> turn_pass
        - else:
        You find a small canister of goods.
        ~fuel = fuel + RANDOM(1, 3)
        ~food = food + RANDOM(1, 4)
        ~valuables = valuables + RANDOM(0, 200)
        ~morale = morale + 10
        ->turn_pass
    }
+   Leave
    -> turn_pass

=== stationstart
You find yourself in the shadow of a small mining station, you request permission to dock, and after a few seconds of bureaucracy, you manage to find your way to a spot.
-> station

=== station
+   Leave
    -> turn_pass
+  {valuables > 50} Repair 20 hull for 50 wealth
    ~hull = hull + 20
    {hull > maxHull:
        ~hull = maxHull
    }
    ~valuables = valuables - 50
    -> station
+  {valuables > 15} Buy 1 Food for 15 wealth
    ~food = food + 1
    ~valuables = valuables - 15
    -> station
+  {valuables > 60} Buy 5 Food for 60 wealth
    ~food  = food + 5
    ~valuables = valuables - 60
    -> station
+  {valuables > 120} Buy 10 Food for 120 wealth
    ~food  = food + 10
    ~valuables = valuables - 120
    -> station
+  {valuables > 25} Buy 1 Fuel for 25 wealth
    ~fuel  = fuel + 1
    ~valuables = valuables - 25
    -> station
+  {valuables > 110} Buy 5 Fuel for 110 wealth
    ~fuel  = fuel + 5
    ~valuables = valuables - 110
    -> station
+  {valuables > 199} Buy 10 Fuel for 200 wealth
    ~fuel  = fuel + 10
    ~valuables = valuables - 200
    -> station

=== traderstart
Your comms system clicks alive with the sound of a grizzled man, still groggy from FTL jumps, offers his wares for what he calls "a good price".
-> trader

=== trader
+   Attack
    After some light combat, you salvage the remains of the merchant
    ~hull = hull - RANDOM(0, 10)
    ~fuel = fuel + RANDOM(0, 5)
    ~food = food + RANDOM(0, 5)
    ~valuables = valuables + RANDOM(0, 500)
    ~morale = morale - 20
    ->turn_pass
+  {valuables > 25} Buy 1 Food for 25 wealth
    ~food = food + 1
    ~valuables = valuables - 25
    ->trader
+  {valuables > 100} Buy 5 Food for 100 wealth
    ~food  = food + 5
    ~valuables = valuables - 100
    -> trader
+  {valuables > 200} Buy 10 Food for 200 wealth
    ~food  = food + 10
    ~valuables = valuables - 200
    -> trader
+  {valuables > 30} Buy 1 Fuel for 30 wealth
    ~fuel  = fuel + 1
    ~valuables = valuables - 30
    ->trader
+  {valuables > 125} Buy 5 Fuel for 125 wealth
    ~fuel  = fuel + 5
    ~valuables = valuables - 125
    -> trader
+  {valuables > 250} Buy 10 Fuel for 250 wealth
    ~fuel  = fuel + 10
    ~valuables = valuables - 250
    -> trader
+   Leave
    ->turn_pass

=== planetstart
{display_ship()}
You happen across a planet. 
{generate_planet()}
->planet
=== planet
+ {fuel > 0}Scan (1 fuel)
    ~fuel = fuel - 1
    {scan_planet(0)}
    ->planet
+ {fuel > 1}Risk coming in closer for better scan results (2 fuel)
    ~temp x = RANDOM(0, 10)
    {-x < 3:
        You flew a little too close and took some scrapes
        ~hull = hull - 5
        {- hull <= 0:
        ->nohull
        }   
    }
    {scan_planet(20)}
    ->planet
+ Settle
    ->settle
+ Move on
    ->turn_pass


=== settle
~score = score + ((pADensity + 1) * (pAComp + 1)) * ((pResources + 1) * (pSurface + 1)) + hull + TURNS_SINCE() + people + morale + (valuables / 10) + fuel + food
-> endy

=== endy
Your score was {score}.
->END