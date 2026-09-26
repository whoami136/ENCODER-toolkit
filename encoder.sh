#!/bin/bash
# ==================================================
# ALLENCODER TOOLKIT (Interactive Encoder with Loader)
# Creator: Nur {whoami136} (Adapted version)
# ==================================================

# ANSI Color Codes
B='\033[1;34m'
W='\033[1;37m'
BRIGHT_WHITE='\033[1;97m'
GREY='\033[90m'
ORANGE='\033[33m'
RESET='\033[0m'

banner() {
    clear
    echo -e "${GREY}"
    echo -e "        !\_________________________/!\\"
    echo -e "        !!                         !! \\"
    echo -e "        !!     Encoder Toolkit     !!  \\"
    echo -e "        !!                         !!   !"
    echo -e "        !!          Free           !!   !"
    echo -e "        !!                         !!   !"
    echo -e "        !!          #hugs          !!   !"
    echo -e "        !!                         !!   !"
    echo -e "        !!      By: whoami136      !!  /"
    echo -e "        !!_________________________!! /"
    echo -e "        !/_________________________\!/"
    echo -e "             __\_________________/__/!_"
    echo -e "            !_______________________!/"
    echo -e "${BRIGHT_WHITE}"
    echo -e "[---]        Encoder-Toolkit        [---]"
    echo -e "[---]   Created by: Nur {whoami136}   [---]"
    echo -e "[---]   Homepage: https://github.com/whoami136 [---]"
    echo -e "${RESET}"
}

banner

# =========================
# EDITOR INPUT
# =========================
echo -e "${B}══════════════════════════════"
echo -e "${W}     UNIVERSAL ENCODER ENGINE v12"
echo -e "${B}══════════════════════════════${RESET}"

echo -e "${W}[*] Opening nano input editor...${RESET}"

TMPFILE=$(mktemp)
nano "$TMPFILE"
INPUTS=$(cat "$TMPFILE")
rm -f "$TMPFILE"

if [[ -z "$INPUTS" ]]; then
    echo -e "${ORANGE}[!] No input provided. Exiting.${RESET}"
    exit 0
fi

echo -e "${W}[+] Input loaded successfully${RESET}"
echo -e "${GREY}----------------------------------${RESET}"

# =========================
# ENCODING FUNCTIONS
# =========================

encode_base64() { echo -n "$1" | base64; }
encode_base32() { echo -n "$1" | base32; }
encode_hex() { echo -n "$1" | xxd -p | tr -d '\n'; }
encode_url() { 
    python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.stdin.read()), end='')" <<< "$1"
}
encode_binary() {
    echo -n "$1" | xxd -b | awk '{for(i=2;i<=NF-1;i++) printf "%s ", $i; print ""}' | tr -d '\n'
}
encode_rot13() { echo "$1" | tr 'A-Za-z' 'N-ZA-Mn-za-m'; }
encode_md5() { echo -n "$1" | md5sum | awk '{print $1}'; }
encode_sha256() { echo -n "$1" | sha256sum | awk '{print $1}'; }

# =========================
# COOL LOADING ANIMATION FUNCTION
# =========================
show_loader() {
    local label="$1"
    local chars="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
    echo -ne "${W}[*] Computing ${label}... ${RESET}"
    for ((i=0; i<4; i++)); do
        for ((j=0; j<${#chars}; j++)); do
            local c="${chars:j:1}"
            echo -ne "\r${W}[*] Computing ${label}... ${ORANGE}$c${RESET}"
            sleep 0.02
        done
    done
    echo -ne "\r\033[K" # Clear line
}

# =========================
# PROCESS INPUT
# =========================

while IFS= read -r line; do
    [[ -z "$line" ]] && continue

    echo -e "${W}[INPUT]${RESET} $line"
    echo -e "${GREY}----------------------------------${RESET}"

    show_loader "BASE64"
    echo -e "[BASE64]  ${ORANGE}$(encode_base64 "$line")${RESET}"

    show_loader "BASE32"
    echo -e "[BASE32]  ${ORANGE}$(encode_base32 "$line")${RESET}"

    show_loader "HEX"
    echo -e "[HEX]     ${ORANGE}$(encode_hex "$line")${RESET}"

    show_loader "URL"
    echo -e "[URL]     ${ORANGE}$(encode_url "$line")${RESET}"

    show_loader "BINARY"
    echo -e "[BINARY]  ${ORANGE}$(encode_binary "$line")${RESET}"

    show_loader "ROT13"
    echo -e "[ROT13]   ${ORANGE}$(encode_rot13 "$line")${RESET}"

    show_loader "MD5"
    echo -e "[MD5]     ${ORANGE}$(encode_md5 "$line")${RESET}"

    show_loader "SHA256"
    echo -e "[SHA256]  ${ORANGE}$(encode_sha256 "$line")${RESET}"

    echo -e "${GREY}----------------------------------${RESET}"

done <<< "$INPUTS"

echo -e "${B}[+] ENCODING COMPLETE${RESET}"
