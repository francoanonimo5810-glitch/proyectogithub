MaquinaEstado = Class{__includes = Estado} 

function MaquinaEstado:init(estados)    
    self.base = {
       draw = function () end,
       update = function ()  end, 
       ingresar = function ()end,
       salir = function () end 
    }
    self.estados =  estados or {}
    self.actual = self.base 
end
function MaquinaEstado:cambiar(nombreEstado, parametrosiniciales)
    --assert(self.estados[nombreEstado])
    assert(self.estados[nombreEstado], "El estado '" .. tostring(nombreEstado) .. "' no existe.")
    self.actual:salir()
    self.actual =  self.estados[nombreEstado]()
    self.actual:ingresar(parametrosiniciales)
end
function MaquinaEstado:update(dt)
    self.actual:update(dt)
end
function MaquinaEstado:draw()
    self.actual:draw()
end 
function MaquinaEstado:keypressed(key, scancode, isrepeat)
    -- Llama a keypressed solo en el estado activo
    if self.actual and self.actual.keypressed then
        self.actual:keypressed(key, scancode, isrepeat)
    end
end