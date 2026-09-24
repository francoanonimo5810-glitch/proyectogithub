EstadoDerota = Class {__includes = Estado}
function EstadoDerota:init()
    
end
function EstadoDerota:ingresar()
    if musica then 
    musica:stop()
end 
if det_derota then 
det_derota:stop()
det_derota:play()
end
end
function EstadoDerota:salir()
    musica:play()
   
end
function EstadoDerota:update(dt)
    
end
function EstadoDerota:draw()
    love.graphics.setColor(1,1,0)
    love.graphics.printf('game over', 0,64, ventana.ancho  ,'center')
    love.graphics.printf('te atrapo el gato',0, 100, ventana.ancho  , 'center')
end 