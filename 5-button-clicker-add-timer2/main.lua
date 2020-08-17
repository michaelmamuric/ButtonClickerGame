-- Load - called when the game starts
function love.load()
    math.randomseed(os.time())
    
    -- Set Window Title
    love.window.setTitle("Button Clicker Game")

    -- Set circle attributes
    circle = {}
    circle.x = 200
    circle.y = 200
    circle.size = 50

    -- Variables
    score = 0
    timer = 10

    myFont = love.graphics.newFont(40)
end

--[[ Update - Called every frame the game is running
 Default is 60fps
 dt -> delta time]]
function love.update(dt)
    if timer > 0 then
        timer = timer - dt
    end

    if timer < 0 then
        timer = 0
    end
end

--[[ Draw - Similar to update, called every frame
 Used to draw graphics to screen
]]
function love.draw()
    love.graphics.setFont(myFont)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print('Score: '..score)
    love.graphics.print('Time: '..math.ceil(timer), 300, 0)

    -- set colour
    love.graphics.setColor(0, 255, 0)
    -- draw a circle
    love.graphics.circle("fill", circle.x, circle.y, circle.size)
end

--[[Overridding love.mousepressed
https://love2d.org/wiki/love.mousepressed]]
function love.mousepressed(x, y, button, istouch, presses)
    -- First, check if left mouse button was clicked
    if button == 1 then
        if calculateDistance(x, y, circle.x, circle.y) <= circle.size then
            -- We need to figure out if mouse is inside the circle
            -- Distance formula: https://www.purplemath.com/modules/distform.htm
            -- increase score
            score = score + 1
            -- generate new random position after circle has been clicked
            circle.x = math.random(circle.size, love.graphics.getWidth() - circle.size)
            circle.y = math.random(circle.size, love.graphics.getHeight() - circle.size)
        end
    end
end

-- Calculates distance between mouse and circle button
function calculateDistance(mouseX, mouseY, circleX, circleY)
    return math.sqrt((circleX - mouseX)^2 +(circleY - mouseY)^2)
end