-- Title: Aissignment #4 (Animating Images)
-- Name: Liam Csiffary
-- Course: ICS2O/3C
-- This program is my first platformer, you will be able to move and jump

-- removes status bar
display.setStatusBar(display.HiddenStatusBar)

--sound vars
local explosionSoundChannel
local explosionSound = audio.loadSound( "Sounds/explosion.mp3" )

-- global variable
local scrollSpeed = 2

-- set background
local backgroundImage = display.newImageRect("Images/Background.jpg", 2048, 1536)

-- displays mushroom man
local mushroomMan = display.newImageRect("Images/MushroomMan.png", 200, 200) 

-- display obstacle
local star = display.newImageRect("Images/asteroid.png", 200, 200)
local star2 = display.newImageRect("Images/asteroid.png", 200, 200)

-- set position of star
star.x = 0
star.y = 0
star2.x = 1024
star2.y = 740

-- set the position of mushroom man
mushroomMan.x = 500
mushroomMan.y = 500

-- function: MoveMushroom
-- input: this function accepts an event listener
-- output: none
-- Description: allows the Man to move with the arrow keys
local function MoveMushroom(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedMushroomMan == false) then
			alreadyTouchedMushroomMan = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedMushroomMan == true) ) then
		mushroomMan.x = touch.x
		mushroomMan.y = touch.y
	end

	if (touch.phase == "ended") then
	alreadyTouchedMushroomMan = false
	end
end

local function MoveAsteroid(event)
	star.x = star.x + scrollSpeed
	star.y = star.y + scrollSpeed

	star.alpha = star.alpha - .0009

	star:scale(.998,.998)
end


local function ExplodingAsteroid(touch)
	if  (touch.phase == "began") then
		explosionSoundChannel = audio.play(explosionSound)
		star2.alpha = 0
	end
end

local function MoveAsteroid2(event)
	star2.x = star2.x - scrollSpeed
	star2.y = star2.y - scrollSpeed

	star2.alpha = star.alpha - .0009

	star2:scale(.998,.998)
end

Runtime:addEventListener("enterFrame", MoveAsteroid)
Runtime:addEventListener("enterFrame", MoveAsteroid2)

-- add the respective listeners to each object
Runtime:addEventListener("touch", MoveMushroom)