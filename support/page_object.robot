*** Settings ***
Library             SeleniumLibrary
Library             BuiltIn
Library             XML

*** Variables ***
${USERNAME}                   standard_user
${SENHA}                      secret_sauce
${FNOME}                      Gabriel
${LNOME}                      Batista
${CEP}                        01234567
${BROWSER}                    chrome

${URL}                        https://www.saucedemo.com/
${TITULO}                     //div[@class='login_logo'][contains(.,'Swag Labs')]
${CAMPO_USERNAME}             //input[@name='user-name']
${CAMPO_SENHA}                //input[@type='password']
${BOTAO_LOGIN}                //input[@type='submit']
${BOTAO_CHECK}                //button[@data-test='checkout']
${BOTAO_CONT}                 //input[@type='submit']
${BOTAO_FIM}                  //button[@data-test='finish']

${REQUIRED_USERNAME}          //h3[@data-test='error'][contains(.,'Epic sadface: Username is required')]
${REQUIRED_PASSWORD}          //h3[@data-test='error'][contains(.,'Epic sadface: Password is required')]
${REQUIRED_USER_PASS}         //h3[@data-test='error'][contains(.,'Epic sadface: Username and password do not match any user in this service')]
${TITULO_PRODUTO}             //span[@class='title'][contains(.,'Products')]

${CONTAINER}                  //select[@class='product_sort_container']
${NOME_AZ}                    Name (A to Z)
${NOME_ZA}                    Name (Z to A)
${PRECO_BAIXO_ALTO}           Price (low to high)
${PRECO_ALTO_BAIXO}           Price (low to high)

${ADD_1}                      //button[@data-test='add-to-cart-sauce-labs-backpack']
${ADD_2}                      //button[@data-test='add-to-cart-sauce-labs-bike-light']
${DEL_1}                      //button[@data-test='remove-sauce-labs-backpack']
${DEL_2}                      //button[@data-test='remove-sauce-labs-bike-light']

${DELCAR_1}                   //button[@data-test='remove-sauce-labs-bike-light']
${DELCAR_2}                   //button[@data-test='remove-sauce-labs-backpack']

${CAR}                        //a[@class='shopping_cart_link']
${CAR_0}                      //a[contains(@class,'link')]
${CAR_1}                      //span[contains(.,'1')]
${CAR_2}                      //span[contains(.,'2')]
${CAR_X}                      //div[@class='cart_item']

@{LISTA}                      //div[contains(@class,'cart_list')]
${CAMPO_NOME1}                //input[contains(@placeholder,'First Name')]
${CAMPO_NOME2}                //input[contains(@placeholder,'Last Name')]
${CAMPO_CEP}                  //input[contains(@placeholder,'Zip/Postal Code')]

${PAYMENT}                    //div[@class='summary_info_label'][contains(.,'Payment Information')]
${SHIPPING}                   //div[@class='summary_info_label'][contains(.,'Shipping Information')]
${PRINCE}                     //div[@class='summary_info_label'][contains(.,'Price Total')]

${LOCALIZADOR_PRECO1}         //div[@class='inventory_item_price'][contains(.,'$29.99')]
${LOCALIZADOR_PRECO2}         //div[@class='inventory_item_price'][contains(.,'$9.99')]
${LOCALIZADOR_IMPOSTO}        //div[@class='summary_tax_label'][contains(.,'Tax: $3.20')]
${VALOR}                      //div[@class='summary_info_label summary_total_label'][contains(.,'Total:')]
${VALOR_1}  ${EMPTY}
${VALOR_2}  ${EMPTY}
${TAXA}  ${EMPTY}
${VALOR_TOTAL}  ${EMPTY}

${FINISH}                     //button[@name='finish']
${PEDIDO}                     //h2[@class='complete-header'][contains(.,'Thank you for your order!')]