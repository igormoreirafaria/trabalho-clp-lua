require "Cliente"
require "ItemVenda"
require "Totalizavel"

Venda = Totalizavel:new()

function Venda:new(data, itensVenda, cliente, numero)
    local obj = Totalizavel:new()
    setmetatable(obj, self)
    self.__index = self
    obj.numero = numero or 0
    obj.data = data or ""
    obj.itensVenda = itensVenda or ItemVenda:new()
    obj.cliente = cliente or Cliente:new()
    return obj
end

function Venda:total()              -- este método sobrescreve de Totalizavel
    soma = 0
    for i = 1, #self.itensVenda do
        soma = soma + self.itensVenda[i]:total()
    end
    return soma
end

function Venda:setCliente(cliente)
    self.cliente = cliente
end

function Venda:getCliente()
    return self.cliente
end

function Venda:setNumero(numero)
    self.numero = numero
end

function Venda:getNumero()
    return self.numero
end

function Venda:setItensVenda(ItensVenda)
    self.ItensVenda = ItensVenda
end

function Venda:getItensVenda()
    return self.ItensVenda
end

function Venda:setData(data)
    self.data = data
end

function Venda:getData()
    return self.data
end

function Venda:toString()
    return "Código: " .. self.numero .. ", Cliente: " .. self.cliente:getNome() .. ", Valor: R$" .. self:total()
end
