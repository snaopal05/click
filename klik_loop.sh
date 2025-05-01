#!/bin/bash

# 1. Install xdotool jika belum ada
if ! command -v xdotool &> /dev/null; then
  echo "[INFO] Menginstall xdotool..."
  sudo apt update
  sudo apt install -y xdotool
else
  echo "[INFO] xdotool sudah terpasang."
fi

# 2. Buat file skrip auto-clicker
cat << 'EOF' > klik_loop.sh
#!/bin/bash

# Daftar koordinat klik (X, Y)
coords=(
  "500 300"  # Titik 1
  "550 350"  # Titik 2
  "600 400"  # Titik 3
)

# Loop tanpa batas
while true; do
  for coord in "${coords[@]}"; do
    x=$(echo $coord | cut -d' ' -f1)
    y=$(echo $coord | cut -d' ' -f2)
    xdotool mousemove $x $y click 1
    sleep 0.5
  done
done
EOF

# 3. Kasih izin eksekusi
chmod +x klik_loop.sh

# 4. Jalankan skrip
echo "[INFO] Menjalankan klik_loop.sh (Tekan Ctrl+C untuk berhenti)"
./klik_loop.sh
