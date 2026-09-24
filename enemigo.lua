 Class = require 'class'

Enemigo = Class{}

function Enemigo:init(x, y, mundo)
    self.sprite = love.graphics.newImage("sleeping-cat.png")
    self.escala_x = 0.1
    self.escala_y = 0.1
    self.ancho = self.sprite:getWidth() * self.escala_x
    self.alto = self.sprite:getHeight() * self.escala_y   
    self.x = x 
    self.y = y 
    self.velocidad = 300
    self.mundo = mundo
if self.mundo then
        self.mundo:add(self, self.x, self.y, self.ancho, self.alto)
    end
end


function Enemigo:update(dt, objetivo)
    if not objetivo then return end

    local dist_x = math.abs(self.x - objetivo.x)
    local dist_y = math.abs(self.y - objetivo.y)

    -- Persecución horizontal o vertical
    if dist_x > dist_y then
        if dist_x > 5 then
            if self.x < objetivo.x then 
                self.x = self.x + (self.velocidad * dt)
            elseif self.x > objetivo.x then
                self.x = self.x - (self.velocidad * dt)
            end 
        end 
    else
        if dist_y > 5 then 
            if self.y < objetivo.y then 
                self.y = self.y + (self.velocidad * dt)
            elseif self.y > objetivo.y then
                self.y = self.y - (self.velocidad * dt)
            end 
        end
    end 
if self.mundo then
        self.mundo:update(self, self.x, self.y, self.ancho, self.alto)
    end  
 -- SINCRONIZAR SIEMPRE CON BUMP (Fuera de las condiciones de dirección)
    
end

function Enemigo:getAABB()
    return {
        x = self.x,
        y = self.y,
        ancho = self.ancho,
        alto = self.alto
    }
end

function Enemigo:draw()
    love.graphics.draw(self.sprite, self.x, self.y, 0, self.escala_x,self.escala_y)
end