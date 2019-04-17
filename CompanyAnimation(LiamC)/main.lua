-----------------------------------------------------------------------------------------
-- Title: Assignemt 6 Company Animation
-- Name : Liam Csiffary
--Course: ICS2O/3C
-- This Program is an animation for the companys logo.
-----------------------------------------------------------------------------------------

-- Your code here

display.setStatusBar(display.HiddenStatusBar)
display.setDefault("background", 0, 1, 1)
----------------------------------------------------------------
--                              Variables + Objectsd
-------------------------------------------------------------------
-- create company logo
local companyLogo = display.newImageRect("Images/CompanyLogoLiamC.@2x-Recovered.png", 100, 100)
companyLogo.x = 0
companyLogo.y = display.contentHeight/2

local companyLogo2 = display.newImageRect("Images/CompanyLogoLiamC.@2x-Recovered.png", 100, 100)
companyLogo2.isVisible = false
companyLogo2.x = display.contentWidth/2
companyLogo2.y = display.contentHeight/2
companyLogo2:scale(3.5, 3.5)

-- set the scroll speed
local scrollSpeed = 3

-- create local for rotation
local rotate = 0

local visible = 0

local scale = 1
--------------------------------------------------------------------
--                           FUNCTIONS
----------------------------------------------------------------------

local function AnimateCompanyLogo(event)
	-- add the scroll speed to the x co-ordinate of the logo
	companyLogo.x = companyLogo.x + scrollSpeed

	-- MAKES THE IMAGE rotate
	rotate = rotate + scrollSpeed

	-- makes it more and more visible as time goes on
	companyLogo.alpha = visible + .5

	-- makes the logo grow
	companyLogo:scale( scale, scale )

	-- makes thhe logo grow
	scale = scale + .00001

	-- makes the logo be increasingly more visible
	visible = visible + .002

	-- makes the logo rotate
	companyLogo.rotation = rotate
end

local function PopUpLogo()
	companyLogo2.isVisible = true
	companyLogo.isVisible = false
end
--------------------------------------------------------------------------------
--							Timers
----------------------------------------------------------------------------------------------------------------------

timer.performWithDelay(6000, PopUpLogo)

-----------------------------------------------------------------------
--                         Event Listeners
---------------------------------------------------------------------------------
Runtime:addEventListener("enterFrame", AnimateCompanyLogo)