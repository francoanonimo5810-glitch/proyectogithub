Class = require 'class'
Jugador = Class{} 

function Jugador:init(x,y,mundo)
    self.sprite = love.graphics.newImage("cartoon-dog.png")
    self.escala_x = 0.5
    self.escala_y = 0.5
    self.ancho = self.sprite:getWidth() * self.escala_x 
    self.alto = self.sprite:getHeight() * self.escala_y
    self.origen_x =  self.sprite:getWidth() / 2
    self.origen_y =  self.sprite:getHeight() / 2
    self.x = x 
    self.y = y 
    self.anterior_x = x
    self.anterior_y = y
    self.velocidad = 1000 
    self.sfx = sfx_ataque 
    self.mundo = mundo  
    if self.mundo then
       -- local top_left_x = self.x - (self.ancho / 2)
        --local top_left_y = self.y - (self.alto / 2)
        self.mundo:add(self, self.x, self.y, self.ancho, self.alto)
    end

end 
function Jugador:keypressed(key)
    if key == "space" or key == "z" then
       self.sfx:stop()
       self.sfx:play()
    end
end
function Jugador:update(dt)
    self.anterior_x = self.x 
    self.anterior_y = self.y 
if love.keyboard.isDown("right","d") then 
        self.x = self.x + (self.velocidad * dt)
    elseif love.keyboard.isDown("left","a") then
        self.x = self.x - (self.velocidad * dt)
    end
    if self.x < 0 then 
        self.x = 0 
    end
    if love.keyboard.isDown("down","s") then
        self.y = self.y + (self.velocidad * dt)
    elseif love.keyboard.isDown("up","w") then 
        self.y = self.y - (self.velocidad * dt)
    end
     if self.x < 0 then 
        self.x = 0 
    end
    if ventana.mapa_ancho and ventana.mapa_alto and ventana.ancho>  0 then 
    if self.y < 0 then 
        self.y = 0 
    elseif self.x > (ventana.mapa_ancho - self.ancho) then 
        self.x = ventana.mapa_ancho - self.ancho 
    end

    if self.y < 0 then 
        self.y = 0 
    
    elseif self.y > (ventana.mapa_alto - self.alto) then 
        self.y = ventana.mapa_alto - self.alto 
    end
end

    if self.mundo then
       -- local top_left_x = self.x - (self.ancho / 2)
       -- local top_left_y = self.y - (self.alto / 2)
        self.mundo:update(self, self.x, self.y, self.ancho, self.alto)
    end
    end

    
    --if love.keyboard.isDown("down") then
      --  self.y = self.y + (self.velocidad * dt)
    --elseif love.keyboard.isDown("up") then 
      --  self.y = self.y - (self.velocidad * dt)
  --  end
    

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
