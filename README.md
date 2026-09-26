# ENCODER-toolkit
An interactive, feature-rich Bash utility that launches a temporary text editor (nano), takes your input, and instantly encodes/hashes it across multiple formats with smooth terminal loading animations.
AllenCoder Toolkit (encoder.sh)
An interactive, feature-rich Bash utility designed for developers, penetration testers, and system administrators. It streamlines the process of encoding and hashing text by launching an integrated text editor (nano), capturing input, and processing it across multiple standard formats with smooth terminal loading animations and a styled ANSI interface.

🚀 Key Features
Interactive Nano Editor: Automatically generates a secure temporary file and opens nano for seamless multi-line text input or payload pasting.

Comprehensive Encoding Suite: Instantly converts input text into:

Base64 & Base32

Hexadecimal (via xxd)

URL Encoding (via Python's urllib.parse)

Binary string representation

ROT13 cipher substitution

Cryptographic Hashing: Computes secure message digests on the fly using MD5 and SHA256.

Sleek CLI Experience: Features custom ASCII banner art, color-coded status messages, and dynamic Braille spinner animations (⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏) during computation.

📋 System Requirements & Dependencies
To run encoder.sh successfully, your environment must meet the following prerequisites:

Operating System: Linux, macOS, or any POSIX-compliant Unix-like environment supporting Bash.

Shell: Bash (version 4.0+ recommended for advanced array/loop support).

Text Editor: nano (must be installed and available in your system PATH).
```bash
🚀 Installation
Clone the repository:

Bash
git@github.com:whoami136/ENCODER-toolkit.git
cd ENCODER-toolkit
Make the script executable:

Bash
chmod +x encoder.sh
💻 Usage

Run the toolkit directly from your terminal:

Bash
./encoder.sh
Core Utilities: Standard coreutils (mktemp, base64, base32, xxd, tr, awk, sed, grep, md5sum, sha256sum).

Python 3: Required specifically for robust URL encoding/decoding handling via urllib.parse.
