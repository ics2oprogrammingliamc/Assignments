-- Title: Assignment #5 (Math Quiz)
-- Name: Liam Csiffary
-- Course: ICS2O/3C
-- This program is a fun Math Quiz that test your knoledge with a limitted time

display.setStatusBar(display.HiddenStatusBar)
display.setDefault ("background", 0, 1, 0)
------------------------------------------------------------------------------------
-- VARIBALES
--------------------------------------------------------------------------------------------

-- vars for tuimers
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer
local gameTimer
local countdownTimer3

local lives = 3
local heart1
local heart2
local heart


local incorrectObject
local scoreObject
local score = 0


local questionObject
local correctObject
local numericFields
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject
local randomOperator
local rounder
local temp
local explosions
local gameOver

-- timer vars
local correctTimer
local incorrectTimer
local explosionTimer
local winTimer
local gameOverTimer

local winSound = audio.loadSound( "Sounds/musical001.mp3" )
local winSound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSound
local incorrectSound
local incorrectSound = audio.loadSound( "Sounds/wrongSound (2).mp3" )
local loseSound = audio.loadSound( "Sounds/aircraft008.mp3" )
local loseSound

-- clocks
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSoundClock
local incorrectSound = audio.loadSound( "Sounds/wrongSound.mp3" )
local incorrectSoundClock
local winSound = audio.loadSound( "Sounds/gong.mp3" )
local winSoundClock 
local loseSound = audio.loadSound( "Sounds/aircraft015.mp3" )
local loseSoundClock
-----------------------------------------------------------------------------
-- LOCAL FUNCTIONS
----------------------------------------------------------------------------

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1
	
	-- display the number of seconds left in the clock object
	clockText.text = "seconds left = " .. secondsLeft

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
	end

end

local function AskQuestion()
	-- generate a random number between 1-2
	randomOperator = math.random(1, 5)
	
	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then
-- generate 2 random numbers between 0-10 then add them
	randomNumber1 = math.random(0, 20)
	randomNumber2 = math.random(0, 20)

	-- calculate the correct answer
	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- otherwise do subtraction
	elseif (randomOperator == 2) then

			-- generate 2 random numbers between 0-10 then add them
		randomNumber1 = math.random(10, 20)
		randomNumber2 = math.random(0, 10)


		-- calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "


		elseif (randomOperator == 3) then
			-- generate 2 random numbers between 0-10 then add them
			randomNumber1 = math.random(0, 10)
			randomNumber2 = math.random(0, 10)
			-- calculate the answer
			correctAnswer = randomNumber1 * randomNumber2

			-- create question in text object
			questionObject.text = randomNumber1 .. " x " .. randomNumber2 .. " = "	


			
			elseif (randomOperator == 4) then
			-- generate 2 random numbers between 0-10 then add them
			randomNumber1 = math.random(0, 10)
			randomNumber2 = math.random(0, 10)
			-- calculate the answer

			correctAnswer = randomNumber1 / randomNumber2
		
			print( math.round( correctAnswer ) )
			correctAnswer = math.round( correctAnswer )

			-- create question in text object
			questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "

				elseif (randomOperator == 5) then
				-- generate 2 random numbers between 0-10 then add them
				randomNumber1 = math.random(1, 10)
				randomNumber2 = math.random(1, 2)
				-- calculate the answer
				correctAnswer = randomNumber1 ^ randomNumber2
				print(correctAnswer)
				-- create question in text object
				questionObject.text = randomNumber1 .. " ^ " .. randomNumber2 .. " = "	
	end
end

local function GameOver()
	explosions.isVisible = false
	gameOver.isVisible = true
	print("hi")
end

local function DeleteHearts()
	-- if no lives play sound and show losing image then cancel timer by making it invisible
	if (lives == 2) then
		heart3.isVisible = false
	elseif (lives == 1) then
		heart2.isVisible = false
		heart3.isVisible  =false
	elseif (lives <= 0) then
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = false
		numericField.isVisible = false
		questionObject.isVisible = false
		clockText.isVisible = false
		scoreObject.isVisible = false
		explosions.isVisible = true
		scoreObject.isVisible = false
		incorrectObject.isVisible = false
		correctObject.isVisible = false
		clockText.isVisible = false
		numericField.isVisible = false
		questionObject.isVisible = false
		incorrectSoundClock = audio.play(incorrectSound)
		timer.performWithDelay( 2000, GameOver )
		incorrectObject.isVisible = false
		gameOverTimer = timer.performWithDelay(2000, GameOver)	
	end
end

local function Win()
	if (score >= 1) then
		win.isVisible = true
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = false
		numericField.isVisible = false
		questionObject.isVisible = false
		clockText.isVisible = false
		scoreObject.isVisible = false
		explosions.isVisible = false
		incorrectObject.isVisible = false
		correctObject.isVisible = false
		winSound = audio.play(winSound)
		timer.performWithDelay(2000, EndSound)
	end
end

local function EndSound()
	winSoundClock = audio.play(winSound)
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function Hideincorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numbericFeild"
	if ( event.phase == "began" ) then

		--clear text feild
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set the user input to user's answer
		userAnswer = tonumber(event.target.text)
		event.target.text = ""
		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			-- reset total seconds left
			secondsLeft = totalSeconds
			-- give points for correct answer
			score = score + 1
			scoreObject.text = "score = " .. score .. ""
			correctSoundClock = audio.play(correctSound)

			-- set visibles and invisibles
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			correctTimer = timer.performWithDelay(2000, HideCorrect)

		elseif event.phase == "submitted" then
			if (userAnswer +- correctAnswer) then
				lives = lives - 1
				correctObject.isVisible = false
				incorrectObject.isVisible = true
				incorrectSoundClock = audio.play(incorrectSound)
				incorrectTimer = timer.performWithDelay(2000, Hideincorrect)

			end
		end
	end
end
	
local function Explosion()
	explosions.isVisible = false
end


------------------------------------------------------------------------------------------------------
--	TIMER
-----------------------------------------------------------------------------------------------------
-- function that calls timer
local function StartTimer()
	-- create countdown timer that loops infinetely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
	countDownTimer2 = timer.performWithDelay( 100, DeleteHearts, 0)
	countdownTimer3 = timer.performWithDelay( 100, Win, 0)
end

----------------------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------------------------------

-- displays a qu3estion and sets the color 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(1,0,0)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentHeight*2/3, display.contentWidth/2, nil, 50 )
correctObject:setTextColor(0,0,1)
correctObject.isVisible = false

-- create incorect object make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentHeight*2/3, display.contentWidth/2, nil, 50 )
incorrectObject:setTextColor(1,0,0)
incorrectObject.isVisible = false

--create numeric feild
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-- add the event listener fr the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

-- display hearts
heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

-- craete object explosion
explosions = display.newImageRect("Images/explosion.png", 500, 500)
explosions.x = display.contentWidth/2
explosions.y = display.contentHeight/2
explosions.isVisible = false

clockText = display.newText( "seconds left = " .. secondsLeft .. "", 200, 70, nil, 50 )
clockText:setTextColor(1, 0, 0)
scoreObject = display.newText("score = " .. score .. "", 200, 120, nil, 50 )
scoreObject:setTextColor(0, 1, 0)


gameOver = display.newImageRect("Images/GameOver.png", 512, 350)
gameOver.x = display.contentWidth/2
gameOver.y = display.contentHeight/2
gameOver.isVisible = false

-- create object gameOver
gameOver = display.newImageRect("Images/gameOver.png", 500, 500)
gameOver.x = display.contentWidth/2
gameOver.y = display.contentHeight/2
gameOver.isVisible = false

--create win object
win = display.newImageRect("Images/win.png", 500, 200)
win.x = display.contentWidth/2
win.y = display.contentHeight/2
win.isVisible = false

-- create clock text

-- show score
scoreObject = display.newText("score = " .. score .. "", display.contentHeight*2/7, display.contentWidth*1/9, nil, 50 )
------------------------- ------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------

StartTimer()
AskQuestion()