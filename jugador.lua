Class = require 'class'
Jugador = Class{} 

function Jugador:init(x,y)
    self.sprite = love.graphics.newImage("cartoon-dog.png")
    self.escala_x = 0.5
    self.escala_y = 0.5
    self.ancho = self.sprite:getWidth() * self.escala_x 
    self.alto = self.sprite:getHeight() * self.escala_y
    self.origen_x =  self.sprite:getWidth() / 2
    self.origen_y =  self.sprite:getHeight() / 2
    self.x = x 
    self.y = y 
    self.velocidad = 1000 
    self.sfx = sfx_ataque
end 
function Jugador:keypressed(key)
    if key == "space" or key == "z" then
       self.sfx:stop()
       self.sfx:play()
    end
end
function Jugador:update(dt)
    if love.keyboard.isDown("right") then 
    self.x = self.x + (self.velocidad*dt)
elseif love.keyboard.isDown("left") then
    self.x = self.x - (self.velocidad*dt)
elseif love.keyboard.isDown("down")  then
    self.y = self.y + (self.velocidad*dt)
elseif love.keyboard.isDown("up") then 
    self.y = self.y - (self.velocidad*dt)
end    
end 
function Jugador:getAABB()
    return {
        x = self.x - (self.ancho / 2),
        y = self.y - (self.alto / 2),
        ancho = self.ancho,
        alto = self.alto
    }
end
function Jugador:draw()
     love.graphics.draw(self.sprite,self.x,self.y,0,self.escala_x, self.escala_y,self.origen_x,self.origen_y)
    
end 
