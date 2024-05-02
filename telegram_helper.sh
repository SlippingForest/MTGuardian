#!/bin/bash
SendTelegramMessage() {
    local message="${1}"
	rawurlencode "${message}";

    local encodedMessage=${REPLY}
    local arr=(${TG_CHAT_ID})

    for chatId in ${arr[@]}; do
        #echo Sending message to  ${chatId};
        /usr/bin/wget "https://api.telegram.org/bot${TG_API_TOKEN}/sendMessage?chat_id=${chatId}&text=${encodedMessage}" -o /dev/null -O /dev/null
    done
}
