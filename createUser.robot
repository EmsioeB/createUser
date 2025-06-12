*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       https://elearning.baohiemtasco.vn/web#action=menu&cids=1
${BROWSER}   chrome
${USERNAME}  0397560142
${PASSWORD}  010101
@{USER_LIST}


*** Test Cases ***
Tạo Nhiều Người Dùng
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Wait Until Element Is Visible    xpath=//a[contains(., 'Tasco Insurance')]    5s
    Click Element    xpath=//a[contains(., 'Tasco Insurance')]

    Wait Until Element Is Visible    xpath=//input[@id='username']    3s
    Input Text    xpath=//input[@id='username']    ${USERNAME}
    Input Text    xpath=//input[@id='password']    ${PASSWORD}
    Click Button    xpath=//input[@id='kc-login']
    Sleep    2s

    # Vào màn Người dùng
    Click Element    xpath=//a[.//div[text()='Cài đặt']]
    Sleep    2s
    Click Element    xpath=//button[.//span[text()='Người dùng & Công ty']]
    Sleep    2s
    Click Element    xpath=//a[normalize-space()='Người dùng']
    Sleep    2s

    # Vào form thêm người dùng đầu tiên
    Click Element    xpath=(//button[contains(@class, 'o_list_button_add') and normalize-space()='Mới'])[last()]
    Sleep    2s

    FOR    ${name}    ${phone}    ${branch}    IN    @{USER_LIST}
        Input Text    xpath=//input[@id='name_0']    ${name}
        Input Text    xpath=//input[@id='login_0']    ${phone}
        Sleep    1s

        Click Element    xpath=//a[@name='preferences']
        Sleep    1s
        Click Element    xpath=//input[@id='branch_ids_0']
        Input Text     xpath=//input[@id='branch_ids_0']    ${branch}
        Sleep    1s
        Click Element    xpath=(//ul[contains(@class, 'ui-autocomplete')]//a[normalize-space(.)='${branch}'])[1]
        Sleep    1s

        Click Element    xpath=//input[@id='branch_id_0']
        Input Text    xpath=//input[@id='branch_id_0']    ${branch}
        Sleep    1s
        Click Element    xpath=(//ul[contains(@class, 'ui-autocomplete')]//a[normalize-space(.)='${branch}'])[1]
        Sleep    1s

        Click Element    xpath=//a[@name='oauth']
        Sleep    1s
        Click Element    xpath=//input[@id='oauth_provider_id_0']
        Sleep    1s
        Click Element    xpath=//a[@role='option' and normalize-space()='KEYCLOAK']
        Sleep    1s

        # Lưu và tạo nhân viên
        Click Element    xpath=//button[@aria-label='Save manually']
        Sleep    2s
        Click Element    xpath=//button[@name='action_create_employee']
        Sleep    2s

        # Tạo tiếp người tiếp theo
        Click Element    xpath=(//button[contains(@class, 'o_form_button_create') and normalize-space()='Mới'])[last()]
        Sleep    3s
    END
    Close Browser
