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
companyLogo2:scale(2.5, 2.5)

-- set the scroll speed
local scrollSpeed = 3

-- create local for rotation
local rotate = 0

--------------------------------------------------------------------
--                           FUNCTIONS
----------------------------------------------------------------------

local function AnimateCompanyLogo(event)
	-- add the scroll speed to the x co-ordinate of the logo
	companyLogo.x = companyLogo.x + scrollSpeed

	rotate = rotate + scrollSpeed

	companyLogo.rotation = rotate
end

local function PopUpLogo()
	companyLogo2.isVisible = true
end
--------------------------------------------------------------------------------
--							Timers
----------------------------------------------------------------------------------------------------------------------

timer.performWithDelay(6000, PopUpLogo)

-----------------------------------------------------------------------
--                         Event Listeners
---------------------------------------------------------------------------------
Runtime:addEventListener("enterFrame", AnimateCompanyLogo)