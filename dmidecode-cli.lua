local term = require "term"

-- cores utilizadas no script 
local cyan = "\27[0;36m" 
local red = "\27[1;31m"
local yellow = "\27[1;33m"

-- variáveis
local opcao = nil


while opcao ~= 0 do
    print (red.. [[
         ___        _    _                _          _ _         _   
        |   \ _ __ (_)__| |___ __ ___  __| |___   __| (_)___ _ _| |_ 
        | |) | '  \| / _` / -_) _/ _ \/ _` / -_) / _| | / -_) ' \  _|
        |___/|_|_|_|_\__,_\___\__\___/\__,_\___| \__|_|_\___|_||_\__|

    ]])

    print(yellow.."======================= MENU ===============================")
    print(red.. "1. Identificar slots PCI/AGP ")
    print(red.."2. identificar quantos slots de memória temos na máquina")
    print(red.."3. Identificar a service-tag")
    print(red.."4. Exibe o fabricante")
    print(red.."5. Modelo da máquina ")
    print(red.."6. Informações sobre o BIOS e o sistema")
    print(red.."7. Exibir dados/versão do processador")
    print(red.."8. Exibir o tipo DDR / Memória")
    print(red.."0. Sair")
    print(yellow.."============================================================")
    io.write(yellow.."Digite uma opção: ")
    opcao = tonumber(io.read())

    if opcao == 1 then
        os.execute("clear ")
        print(red.. ">> slots PCI/AGP") 
        print(yellow.."")
        print(yellow.."============================================================")
        os.execute("dmidecode -t slot | sed -rn '/(Slot)|(Designation)|(Type)|(Usage)|(ID)|(^$)/p'")
        print(yellow.."============================================================")
    elseif opcao == 2 then
        print("Opção 2 selecionada!")
        os.execute("clear ")
        print(red.. ">> slots de memória") 
        print(yellow.."")
        print(yellow.."============================================================")
        os.execute("dmidecode | sed -rn '/(^Memory Device$)/,/^$/ s/(^Memory Device$)|(^[[:blank:]]Size:)|(Form Factor:)|(^[[:blank:]]Locator:)|(^[[:blank:]]Type:)|(Speed:)|(^$)/&/pg'")
        print(yellow.."============================================================")
    elseif opcao == 3 then
        print("Opção 3 selecionada!")
        os.execute("clear ")
        print(red.. ">> service-tag") 
        print(yellow.."")
        print(yellow.."============================================================")
        os.execute("dmidecode -s chassis-serial-number")
        print(yellow.."============================================================")
    elseif opcao == 4 then
        print("Opção 4 selecionada!")
        os.execute("clear ")
        print(red.. ">> Exibe o fabricante") 
        print(yellow.."")
        print(yellow.."============================================================")
        os.execute("dmidecode -s bios-vendor")
        print(yellow.."============================================================")
    elseif opcao == 5 then
        print("Opção 5 selecionada!")
        os.execute("clear ")
        print(red.. ">> Modelo da máquina ") 
        print(yellow.."")
        print(yellow.."============================================================")
        os.execute("dmidecode -s system-product-name")
        print(yellow.."============================================================")
    elseif opcao == 6 then
        print("Opção 6 selecionada!")
        os.execute("clear ")
        print(red.. ">> Informações sobre o BIOS e o sistema, ") 
        print(yellow.."")
        print(yellow.."============================================================")
        os.execute("dmidecode -t 0,1")
        print(yellow.."============================================================")
    elseif opcao == 7 then
        print("Opção 7 selecionada!")
        os.execute("clear ")
        print(red.. ">> Exibir dados/versão do processador ") 
        print(yellow.."")
        print(yellow.."============================================================")
        os.execute("dmidecode -s processor-version")
        print(yellow.."============================================================")
    elseif opcao == 8 then
        print("Opção 8 selecionada!")
        os.execute("clear")
        print(red.. ">> Tipo de sua DDR / Memória")
        print(yellow.."")
        print(yellow.."============================================================")
        os.execute("dmidecode | grep DDR")
        print(yellow.."============================================================")
    elseif opcao == clear then
        os.execute("clear")
    elseif opcao == 0 then
        print("Saindo do programa...")
        os.execute("clear")
    else
        print("Opção inválida. Tente novamente.")
    end
end
