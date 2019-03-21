-- Title: Display Shapes
-- Name: Liam Csiffary
-- Course: ICS2O/3C
-- This program dosplays three shapes o the ipad of different colors and with borders, underneath each shape is the name of that shape

display.setStatusBar(display.HiddenStatusBar)

display.setDefault("background",0,0,0)

--create variables
local vertices = {0,100, 0,0, 100,100,}
local triangle
local newText

--display triangle
triangle = display.newPolygon(200, 300, vertices)

--change color of triangle
triangle:setFillColor(0,1,0)

--sets the width of the border
triangle.strokeWidth = 10

--set the color of the border
triangle:setStrokeColor(1,1,1)

-- display the text
newText = display.newText("Triangle", 225,450,nil,50)

-- change text color
newText:setTextColor(1,0,0)

-- make the triangle bigger
triangle:scale(1.7,1.7)
 
 -- make the variables
local pentagon
local verticesOfPentagon = {225,300, 280,250, 350,300, 335,350, 250,350,}
local newText2

--display pentagon
pentagon = display.newPolygon(500,200,verticesOfPentagon)

--set pentagons color
pentagon:setFillColor(1,1,0)

--set the width of the border
pentagon.strokeWidth = 10

--sets the color of the border
pentagon:setStrokeColor(0,0,1)

-- write text pentagon
newText2 = display.newText("Pentagon", 512, 350, nil, 50)

-- change text color
newText2:setTextColor(0,1,0)

-- make it bigger
pentagon:scale(1.7,1.7)

-- make the variables
local hexagon
local verticesOfHexagon = {50,0, 100,0, 150,50, 100,100, 50,100, 0,50,}
local newText3

--display hexagon
hexagon = display.newPolygon(800,300,verticesOfHexagon)

--change fill color
hexagon:setFillColor(0,1,1)

--set the width of the border
hexagon.strokeWidth=10

--set the stoke color
hexagon:setStrokeColor(1,0,0)

-- write "Hexagon"
newText3 = display.newText("Hexagon", 800, 450, nil, 50)

-- change text color
newText3:setTextColor(0,0.7,1)

-- make it bigger
hexagon:scale(1.7,1.7)

-- make variables
local septagon
local verticesOfSeptagon = {50,0, 100,0, 150,50, 100,100, 50,100, 0,50, 10,10,}
local newText4

--display hexagon
septagon = display.newPolygon(512,560,verticesOfSeptagon)

--change fill color
septagon:setFillColor(1,0,0)

--set the width of the border
septagon.strokeWidth=10

--set the stoke color
septagon:setStrokeColor(0,1,1)

-- make it bigger
septagon:scale(1.5,1.5)

-- write "Hexagon"
newText4 = display.newText("Septagon",512, 700, nil, 50)

-- change text color
newText4:setTextColor(1,1,1)