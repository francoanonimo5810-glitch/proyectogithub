EstadoDerota = Class {__includes = Estado}
function EstadoDerota:init()
    
end
function EstadoDerota:ingresar()
    
end
function EstadoDerota:salir()
    
end
function EstadoDerota:update(dt)
    
end
function EstadoDerota:draw()
    love.graphics.setColor(1,1,0)
    love.graphics.printf('game over', 0,64, ventana.ancho  ,'center')
    love.graphics.printf('te atrapo el gato',0, 100, ventana.ancho  , 'center')
end 