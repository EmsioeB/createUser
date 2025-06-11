*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       https://elearning.baohiemtasco.vn/web#action=menu&cids=1
${BROWSER}   chrome
${USERNAME}  0397560142
${PASSWORD}  010101

*** Test Cases ***
Đăng Nhập Tự Động Tasco
    Open Browser    ${URL}    chrome
    Maximize Browser Window

    Wait Until Element Is Visible    xpath=//a[contains(., 'Tasco Insurance')]    5s
    Click Element    xpath=//a[contains(., 'Tasco Insurance')]

    Wait Until Element Is Visible    xpath=//input[@id='username']    3s
    Input Text    xpath=//input[@id='username']    ${USERNAME}
    Input Text    xpath=//input[@id='password']    ${PASSWORD}

    Click Button    xpath=//input[@id='kc-login']
    Sleep    5s
Click vào cài đặt
    # B1: Click vào icon "Cài đặt"
    Click Element    xpath=//a[.//div[text()='Cài đặt']]
    Sleep    2s

    # B2: Click "Người dùng & Công ty" -> "Người dùng"
    Click Element    xpath=//button[.//span[text()='Người dùng & Công ty']]
    Sleep    2s

    # B3: Click "Người dùng"
    Click Element    xpath=//a[normalize-space()='Người dùng']
    Sleep    2s

    # B4: Click nút "Mới"
    Click Element    xpath=(//button[contains(@class, 'o_list_button_add') and normalize-space()='Mới'])[last()]

    Sleep    2s

    # B5: Nhập thông tin người dùng
    Input Text    xpath=//input[@id='name_0']    Bùi Giang Linh
    Input Text    xpath=//input[@id='login_0']    0969835042
    Sleep         2s

    Click Element    xpath=//a[@name='preferences']
    Sleep    2s

    Click element    xpath=//input[@id='branch_ids_0']
#    Log to console    Thành công
    Input Text     xpath=//input[@id='branch_ids_0']    Chi nhánh Hà Nội 1
    Sleep    2s
    Click Element    xpath=//ul[contains(@class, 'ui-autocomplete')]//a[normalize-space(.)='Chi nhánh Hà Nội 1']
    Sleep    1s




#
#    # B6: Click nút "Lưu"
#    Click Button    xpath=//button[contains(text(), 'Lưu')]
#    Sleep    2s
#
#    # Optional: kiểm tra xem tạo thành công
#    Page Should Contain    Nguyễn Văn A

    Close Browser
