local L = LibStub("AceLocale-3.0"):NewLocale("Big Wigs", "ptBR")
if not L then return end
-- Core.lua
L["%s has been defeated"] = "%s foi derrotado"

L.bosskill = "Chefe morto"
L.bosskill_desc = "Avisa quando um chefe for derrotado."
L.berserk = "Frênese"
L.berserk_desc = "Mostra um contador de quando o chefe entrará em frênese"
L.stages = "Estágios"
L.stages_desc = "Habilita funções relacionadas a vários estágios/fases do chefe, como proximidade, barras, etc."

L.already_registered = "|cffff0000ATENCAO:|r |cff00ff00%s|r (|cffffff00%s|r) ja existe este módulo BigWigs, isso normalmente significa que voce tem 2 cópias desse módulo em sua pasta de addons.O que pode ter sido porcausa de uma atualização mal sucedida, recomendo deletar as pastas do BigWigs e reinstalar."

-- Loader / Options.lua
L["You are running an official release of Big Wigs %s (revision %d)"] = "Você está usando uma versão oficial do BigWigs %s (revisão %d)"
L["You are running ALPHA RELEASE of Big Wigs %s (revision %d)"] = "Você está usando uma VERSÃO ALFA do Big Wigs %s (revisão %d)"
L["You are running a source checkout of Big Wigs %s directly from the repository."] = "Você esta usando uma versão do BigWigs %s diretamente do repositório."
L["There is a new release of Big Wigs available (/bwv). You can visit curse.com, wowinterface.com, wowace.com or use the Curse Updater to get the new release."] = "Existe uma nova versão do BigWigs disponivel(/bwv). Pode visitar curse.com, wowinterface.com, wowace.com ou usar o cliente do Curse para adquirila."
L["Your alpha version of Big Wigs is out of date (/bwv)."] = "Sua versão alfa do BigWigs esta desatualizada (/bwv)."

L.tooltipHint = "|cffeda55fClique|r para reiniciar todos os módulos. |cffeda55fAlt-Clique|r para desativálos. |cffeda55fClique-Direito|r para acessar as opções."
L["Active boss modules:"] = "Módulos de chefes ativos:"
L["All running modules have been reset."] = "Todos os módulos foram reiniciados."
L["All running modules have been disabled."] = "Todos os módulos foram desativados."

L["There are people in your group with older versions or without Big Wigs. You can get more details with /bwv."] = "Há pessoas no seu grupo com versões antigas do BigWigs. Digite /bwv para mais detalhes."
L["Up to date:"] = "Atualizado:"
L["Out of date:"] = "Desatualizado"
L["No Big Wigs 3.x:"] = "Sem Big Wigs 3.x:"

L["Waiting until combat ends to finish loading due to Blizzard combat restrictions."] = "Waiting until combat ends to finish loading due to Blizzard combat restrictions."
L["Combat has ended, Big Wigs has now finished loading."] = "Combat has ended, Big Wigs has now finished loading."
L["Due to Blizzard restrictions the config must first be opened out of combat, before it can be accessed in combat."] = "Due to Blizzard restrictions the config must first be opened out of combat, before it can be accessed in combat."

L["Please note that this zone requires the -[[|cFF436EEE%s|r]]- plugin for timers to be displayed."] = "Please note that this zone requires the -[[|cFF436EEE%s|r]]- plugin for timers to be displayed."

L.coreAddonDisabled = "O Big Wigs não pôde funcionar devidamente ja que o addon %s está desativado. Você pode ativálo no Painel de Controle de addons ou na tela de seleção de personagens."

-- Options.lua
L["Customize ..."] = "Personalizar..."
L["Profiles"] = "Perfis"
L.introduction = "Bem-vindo ao Big Wigs. Coloque os cintos e pegue um lanche enquanto desfruta do passeio. De maneira não-instrusa iremos lhe preparar para esses novos encontros de chefes."
L["Configure ..."] = "Configurar..."
L.configureDesc = "Fecha a janela de opções e deixa configurar as opções de como se ve as barras e mensagens.\nSe quer personalizar mais coisas, você pode expandir o Big Wigs no menu a esquerda e procurar a subsessão Personalizar..."
L["Sound"] = "Som"
L.soundDesc = "As mensagens podem chegar com um som. Para algumas pessoas fica mais fácil escutar, quando aprendem que tal som aparece com tal mensagem, ao envés de ler a mensagem. \n\n|cffff4411Mesmo quando desativado, o som de aviso de raid por padrão, será usado para avisar os outros jogadores. Este som, é diferente dos sons que usamos.|r"
L["Show Blizzard warnings"] = "Mostrar avisos da Blizzard"
L.blizzardDesc = "A Blizzard tem seus próprios sons e mensagens em alguns encontros. Em nossa opinião, eles são muito compridos e incompreenssiveis. Tentaremos simplificalos sem interferir no jogo e sem o que faz especificadamente.\n\n|cffff4411Quando desativado, os avisos Blizzard não serão mostrados no meio da tela, mas sim na janela de chat.|r"
L["Show addon warnings"] = "Mostrar avisos do addon"
L.addonwarningDesc = "Big Wigs e outros addons similares podem mostrar suas mensagens para o grupo pelo canal de raide. Estas mensagens são normalmente mostradas com três estrelas antes (***), essas são as que o BigWigs deve ou não bloquealas.\n\n|cffff4411Ativando esta opção poderá surgir muitos spams e não é recomendavel.|r"
L["Flash and shake"] = "Piscar e tremer"
L["Flash"] = "Piscar"
L["Shake"] = "Tremer"
L.fnsDesc = "Certas habilidades são muito importantes que necessitam sua atenção especial. Quando te afetam o Big Wigs pode fazer tremer e dar uma piscada na tela.\n\n|cffff4411Se está jogando com nameplates (marcas em cima das cabeças dos personagens) ativados, o tremor não será usado de acordo com as restrições da Blizzard, a tela então somente piscará|r"
L["Raid icons"] = "Icones de Raide"
L.raidiconDesc = "Alguns encontros usam os icones de raide para marcar jogadores que sao de interesse especial para seu grupo. Por exemplo os efeitos tipo 'bomba' e controlhe mental. Se estiver desativado, não marcará nada.\n\n|cffff4411Somente aplicará as marcas se for assistente ou lider!|r"
L["Whisper warnings"] = "Avisos de susurros"
L.whisperDesc = "Envia um susurro aos jogadores afetados com certas habilidades. Efeitos tipo 'bomba' e similares.\n\n|cffff4411Somente se aplicará se for assistente ou líder!|r"
L["Broadcast"] = "Anunciar"
L.broadcastDesc = "Anuncia todos as mensagens do Big Wigs no canal de alerta de raide. \n\n|cffff4411Somente se for asistente de raide, porem em grupo ira anunciar de qualquer maneira.|r"
L["Raid channel"] = "Canal de raide"
L["Use the raid channel instead of raid warning for broadcasting messages."] = "Usa o canal de raide para avisar e anunciar as mensagens."
L["Minimap icon"] = "Icone no minimapa"
L["Toggle show/hide of the minimap icon."] = "Alterna entre mostrar/ocultar o icone no minimapa."
L["Configure"] = "Configurar"
L["Test"] = "Testar"
L["Reset positions"] = "Reiniciar posições"
L["Colors"] = "Cores"
L["Select encounter"] = "Selecionar encontro"
L["List abilities in group chat"] = "Listar as habilidades no chat"
L["Block boss movies"] = "Bloquear cinemáticas de chefes"
L["After you've seen a boss movie once, Big Wigs will prevent it from playing again."] = "Depois de ver a cinematica do chefe uma vez, o Big Wigs evitará que volte a reproduzir."
L["Prevented boss movie '%d' from playing."] = "Cinemática do chefe '%d' bloqueada."
L["Ignore my role"] = "Ignorar minha função"
L.ignoreroleDesc = "|cffff4411Nao recomendado.|r Ativar esta opção mostrará todas as advertências sem ter em conta sua função, podendo criar spam em alguns chefes."
L["Pretend I'm using DBM"] = "Pretend I'm using DBM"
L.pretendDesc = "If a DBM user does a version check to see who's using DBM, they will see you on the list. Useful for guilds that force using DBM."
L["Create custom DBM bars"] = "Create custom DBM bars"
L.dbmBarDesc = "If a DBM user sends a pull timer or a custom 'pizza' bar, it will be shown in Big Wigs."

L["BAR"] = "Barras"
L["MESSAGE"] = "Mensagens"
L["ICON"] = "Icone"
L["WHISPER"] = "Susurro"
L["SAY"] = "Dizer"
L["FLASHSHAKE"] = "Piscar e tremer"
L["PING"] = "Ping"
L["EMPHASIZE"] = "Enfatizar"
L["MESSAGE_desc"] = "A maioria das habilidades dos encontros se apresentam com uma ou mais mensagens que o Big Wigs mostrará em sua tela. Se desativar esta opção, nenhuma mensagem ligada a isto, se não todos, serão mostrados."
L["BAR_desc"] = "As barras serão mostradas no momento apropiado. Se esta habilidade esta acompanhada por uma barra que quer ocultar, desative esta opção."
L["FLASHSHAKE_desc"] = "Algumas habilidades podem ser mais importantes que outras. Se quer que a tela de uma piscada e trema quando esta habilidade ocorrer, ative esta opção."
L["ICON_desc"] = "Big Wigs pode marcar personagens afetados por habilidades com um icone."
L["WHISPER_desc"] = "Alguns efeitos que são importantes, Big Wigs enviará um susurro a pessoa afetada."
L["SAY_desc"] = "As bolhas de chat são fáceis de se ver. Big Wigs usará uma mensagem para anunciar as pessoas ao redor sobre um efeito em você."
L["PING_desc"] = "As vezes as localizações podem ser importantes, Big Wigs piscará no minimapa para que as pessoas saibam onde está."
L["EMPHASIZE_desc"] = "Ativando isso SUPER ENFATIZARÁ qualquer mensagem ou barra associada com esta habilidade de encontro. As mensagens serão grandes, as barras piscarão e tremerão numa cor diferente, Será usado sons para contar quando a habilidade será eminente. Basicamente tera noticia dela. (:"
L["PROXIMITY"] = "Janela de aproximação"
L["PROXIMITY_desc"] = "Algumas habilidades requerem que você se espalhe, a janela de aproximação será ajustada especificadamente para essas habilidades, então você terá tempo de correr."
L["TANK"] = "Tank Only"
L["TANK_desc"] = "Some abilities are only important for tanks. If you want to see warnings for this ability regardless of your role, disable this option."
L["HEALER"] = "Healer Only"
L["HEALER_desc"] = "Some abilities are only important for healers. If you want to see warnings for this ability regardless of your role, disable this option."
L["TANK_HEALER"] = "Tank & Healer Only"
L["TANK_HEALER_desc"] = "Some abilities are only important for tanks and healers. If you want to see warnings for this ability regardless of your role, disable this option."
L["DISPEL_MAGIC"] = "Magic Dispeller Only"
L["DISPEL_MAGIC_desc"] = "If you want to see warnings for this ability even when you cannot dispel it, disable this option."
L["DISPEL_ENRAGE"] = "Enrage Dispeller Only "
L["DISPEL_ENRAGE_desc"] = "If you want to see warnings for this ability even when you cannot dispel it, disable this option."
L["Advanced options"] = "Opções avançadas"
L["<< Back"] = "<< Voltar"

L.tank = "Alertas somente de tanquers. "
L.healer = "Alertas somente de curadores. "
L.tankhealer = "Tank & Healer alerts only. "
L.dispeller = "Dispeller alerts only. "

L["About"] = "Sobre"
L["Main Developers"] = "Principais Devs."
L["Developers"] = "Desenvolvedores"
L["Maintainers"] = "Mantedores"
L["License"] = "Licença"
L["Website"] = "Website"
L["Contact"] = "Contato"
L["See license.txt in the main Big Wigs folder."] = "Veja license.txt na pasta principal do Big Wigs."
L["irc.freenode.net in the #wowace channel"] = "irc.freenode.net no canal #wowace"
L["Thanks to the following for all their help in various fields of development"] = "Agradecimentos as seguintes pessoas por sua ajuda em várias partes do desenvolvimento"

