require "IControladora"
require "Cliente"

ControladoraCliente = IControladora:new()

function ControladoraCliente:new()
    obj = IControladora:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function ControladoraCliente:cadastrar(menu)
    Database:addCliente(Cliente:new(menu:inputCadastroEdicao()))
end

function ControladoraCliente:editar(menu)
    Database:editCliente(menu:inputCadastroEdicao())
end

function ControladoraCliente:remover(menu)
    Database:removeCliente(menu:inputRemover())
end

function ControladoraCliente:listar(menu)
    menu:listaItens(Database:getClientes())
end